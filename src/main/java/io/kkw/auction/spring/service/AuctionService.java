package io.kkw.auction.spring.service;


import io.kkw.auction.spring.bean.*;
import io.kkw.auction.spring.dao.*;
import javassist.NotFoundException;
import jdk.nashorn.internal.runtime.ListAdapter;
import org.omg.Messaging.SYNC_WITH_TRANSPORT;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class AuctionService {

    @Autowired
    AucProductRepository aucProductRepository;

    @Autowired
    AucProgressRepository aucProgressRepository;

    @Autowired
    AucCompleteRepository aucCompleteRepository;

    @Autowired
    AucLogRepository aucLogRepository;

    @Autowired
    NoteService noteService;

    public boolean addAuction(AucProduct bean){
        AucProduct a = aucProductRepository.save(bean);
        if(a != null){
            return true;
        }else
            return false;
    }

    //프로시저 이용해서 AucProduct 과 AucProgress에 값들을 저장하는 메소드
    public boolean addAuction(String user_id, String title, String psubject, String pcontent, String picture,Date start_date ,Date end_date, long price){
        try {
            aucProductRepository.uploadAuction(user_id, title, psubject, pcontent, picture, start_date, end_date, price);
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }
    //id를 이용하여 경매정보를 찾는 메소드
    public AucProduct findInfo(long id) {
        Optional<AucProduct> optional = aucProductRepository.findById(id);
        //Optional 존재할 수도 있지만 안할 수도 있는 객체
        //null을 처리 해줄 필요가없음
        return optional.orElse(null); //무슨값을 넣을까
    }

    //경매정보 id를 이용하여 진행예정/진행중인 경매정보를 찾는 메소드
    public AucProgress findProgress(long pid){
        Optional<AucProgress> optional = aucProgressRepository.findByProductIdAndApproval(pid,1);
        return optional.orElse(null);
        //return null;
    }

    //경매정보 id를 이용해여 마감된 경매정보를 찾는 메소드
    public AucComplete findComplete(long auc_id){
        Optional<AucComplete> optional = aucCompleteRepository.findByProductId(auc_id);
        return optional.orElse(null);
    }

    //유저가 올린 모든 정보를 가져오는 메소드
    public List<AucProduct> findMyAuction(String id){
        List<AucProduct> products = aucProductRepository.findMyProgressAuction(id);
        //System.out.println(products.get(0).getAucProgress());
        List<AucProduct> products1 = aucProductRepository.findMyCompleteAuction(id);
        products.addAll(products1);
        return products;
        //Join 걸어서 가져와야할듯
        //SELECT * FROM auc_information i, auc_progress p where i.id = p.pid and  i.user_id = :id
        //SELECT * FROM auc_information i, auc_complete c where i.id = c.auc_id (이거 바꿔야될듯 변수명 불일치) and  i.user_id = :id
        //return null;
    }

    //경매예정인 모든 정보를 가져오는 메소드
    public List<AucProduct> findAllPlan(){
        /*
        Date today = new Date();
        List<AucProduct> informations = aucProductRepository.findAllByStartdateBefore(today);
        List<AucProduct> products = new ArrayList<>();
        for(AucProduct aucProduct : informations) {
            System.out.println(aucProduct.getId());
            Optional<AucProgress> progress = aucProgressRepository.findByProductIdAndApproval(aucProduct.getId(),1);
            if(progress.isPresent())
                products.add(aucProduct);
        }
         */
        Date today = new Date();
        List<AucProduct> products = aucProductRepository.findAllByStartdateBefore(today);
        return products;
    }

    //경매중인 모든 정보를 가져오는 메소드
    public List<AucProduct> findAllProgress(){
        Date today = new Date();
        List<AucProduct> informations = aucProductRepository.findAllByStartdateAfterAndEnddateBefore(today,today);
        return informations;

    }

    //경매 마감된 모든 정보를 가져오는 메소드
    public List<AucProduct> findAllComplete(){
        //여기는 finish칸
        //List<AucProduct> aucProducts = aucProductRepository;
        List<AucProduct> aucProducts = aucProductRepository.findAllByAucComplete();

        return aucProducts;
    }


    //경매정보삭제 (단 경매 시작 이전에만 지울 수 있게 하는 함수, 트리거 작성)
    public ResponseEntity<Object> deleteAuction(long product_id, String user_id){
        try {
            aucProgressRepository.removeByProductId(product_id);
            aucProductRepository.deleteById(product_id);
        }catch(Exception e){
            e.printStackTrace();
            return new ResponseEntity<Object>("false",HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<Object>("true",HttpStatus.BAD_REQUEST);
    }

    //id = product_id , admin_id = admin_id
    // 허가 하기
    public boolean checkAuthorize(long id, String admin_id){
        Optional<AucProgress> aucProgressOptional = aucProgressRepository.findByProductIdAndApproval(id,0);
        AucProgress aucProgress = aucProgressOptional.get();
        try {
            aucProgress.setApproval(1);
            aucProgress.setAdminId(admin_id);
            aucProgressRepository.save(aucProgress);
            return true;
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
    //허가 취소하기
    public boolean cancelAuthorize(long id, String admin_id){
        Optional<AucProgress> aucProgressOptional = aucProgressRepository.findByProductIdAndApproval(id,1);
        AucProgress aucProgress = aucProgressOptional.get();
        try{
            aucProgress.setApproval(0);
            aucProgress.setAdminId(null);
            aucProgressRepository.save(aucProgress);
            return true;
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
    //경매 정보 수정
    public AucProduct modifyAuction(long id, String user_id, String title,  String psubject, String pcontent, String picture, Date startdate, Date enddate, long price){
        Optional<AucProduct> product = aucProductRepository.findById(id);
        try{
            AucProduct aucProduct = product.get();
            aucProduct.setTitle(title);
            aucProduct.setPsubject(psubject);
            aucProduct.setPcontent(pcontent);
            if(picture != null)
                aucProduct.setPicture(picture);
            aucProduct.setStartdate(startdate);
            aucProduct.setEnddate(enddate);
            aucProduct.setPrice(price);
            AucProduct result = aucProductRepository.save(aucProduct);
            return result;
        }catch(Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    //허가X
    public List<AucProduct> unAuthorized(){
        List<AucProduct> aucProducts = aucProductRepository.findAllByAuthorize(0);
        return aucProducts;
    }
    //허가 O
    public List<AucProduct> authorized(){
        List<AucProduct> aucProducts = aucProductRepository.findAllByAuthorize(1);
        return aucProducts;
    }
    //모든 것
    public Iterable<AucProduct> findAll(){
        Iterable<AucProduct> aucProducts = aucProductRepository.findAll();
        return aucProducts;
    }
    //모든 거 검색
    public List<AucProduct> searchAuction(String search){
        List<AucProduct> aucProducts = aucProductRepository.searchAuction(search);
        return aucProducts;
    }
    //경매 이전 검색
    public List<AucProduct> findAllPlanAndSearch(String search){
        List<AucProduct> aucProducts = aucProductRepository.findAllByAucPlanAndSearch(search, new Date());
        return aucProducts;
    }
    //경매중 검색
    public List<AucProduct> findAllProgressAndSearch(String search){
        List<AucProduct> aucProducts = aucProductRepository.findAllByAucProgressAndSearch(search, new Date());
        return aucProducts;
    }
    //경매 후 검색
    public List<AucProduct> findAllCompleteAndSearch(String search){
        List<AucProduct> aucProducts = aucProductRepository.findAllByAucCompleteAndSearch(search);
        return aucProducts;
    }

    public void findCheck(){

        Iterable<AucProduct> aucProducts = aucProductRepository.findAll();
        Iterator<AucProduct> iterator = aucProducts.iterator();
        while(iterator.hasNext()){
            Date today = new Date();
            AucProduct aucProduct = iterator.next();
            Optional<AucComplete> aucComplete = aucCompleteRepository.findByProductId(aucProduct.getId());

            if(aucComplete.orElse(null) == null && aucProduct.getEnddate().before(today)){
                    System.out.println(aucProduct.getId());
                    aucProgressRepository.removeByProductId(aucProduct.getId());
                    List<AucLog> aucLogOptional = aucLogRepository.findByProductIdOrderByPrice(aucProduct.getId());
                    long nextVal = aucCompleteRepository.getNextVal();
                    if(aucLogOptional.size() != 0){
                        AucLog aucLog = aucLogOptional.get(0);
                        AucComplete complete = new AucComplete();
                        complete.setId(nextVal);
                        complete.setProductId(aucProduct.getId());
                        complete.setCompletePrice(aucLog.getPrice());
                        complete.setTenderUserId(aucLog.getUserId());
                        aucCompleteRepository.save(complete);
                        noteService.sendNote(aucProduct.getUserid(),aucLog.getUserId(),today,content(aucProduct.getTitle(),aucProduct.getId(),0));
                        noteService.sendNote(aucLog.getUserId(),aucProduct.getUserid(),today,content(aucProduct.getTitle(),aucProduct.getId(),0));
                    }else{
                        AucComplete complete = new AucComplete();
                        complete.setId(nextVal);
                        complete.setProductId(aucProduct.getId());
                        complete.setCompletePrice(0);
                        aucCompleteRepository.save(complete);
                        noteService.sendNote(aucProduct.getUserid(),aucProduct.getUserid(),today,content(aucProduct.getTitle(),aucProduct.getId(),1));

                    }


                    System.out.println(nextVal);



            }
        }
    }

    public void check(int whatCheck, AucProduct aucProduct){
        Date date = new Date();
        AucComplete complete =aucCompleteRepository.findByProductId(aucProduct.getId()).orElseThrow(()->new ClassCastException("Not Found"));
        if(whatCheck == 1) {
            complete.setTenderIdCheck(date);
            noteService.sendNote(aucProduct.getUserid(),complete.getTenderUserId(),date,content(aucProduct.getTitle(),aucProduct.getId(),2));
        }else if(whatCheck == 2) {
            complete.setUidCheck(date);
            noteService.sendNote(aucProduct.getUserid(),complete.getTenderUserId(),date,content(aucProduct.getTitle(),aucProduct.getId(),3));
        }
        aucCompleteRepository.save(complete);
    }

    public String content(String title, long product_id, int finish){
        String str = "";
        if(finish == 0) {
            str = "물건이 낙찰 되었습니다. <br> 경매 이름 : " + title + "<br>"
                    + "<a href=http://localhost:8080/read_auction/" + product_id+">확인하러가기</a>";
        }else if(finish == 1){
            str = "경매가 유찰되었습니다. <br> 경매 이름 : " + title + "<br>"
                    + "<a href=http://localhost:8080/read_auction/" + product_id+">확인하러가기</a>";
        }else if(finish == 2){
            str = "결제가 완료 되었습니다. 계좌에서 출금 됩니다.<br> 경매 이름 : " + title + "<br>"
                    + "<a href=http://localhost:8080/read_auction/" + product_id+">확인하러가기</a>";
        }else if(finish == 3){
            str = "낙찰자가 결제를 했습니다. 계좌로 입급 됩니다. 경매 이름 : " + title + "<br>"
                    + "<a href=http://localhost:8080/read_auction/" + product_id+">확인하러가기</a>";
        }
        return str;
    }


}
