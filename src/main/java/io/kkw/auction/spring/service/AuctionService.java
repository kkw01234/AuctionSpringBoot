package io.kkw.auction.spring.service;


import io.kkw.auction.spring.bean.AucComplete;
import io.kkw.auction.spring.bean.AucInterest;
import io.kkw.auction.spring.bean.AucProduct;
import io.kkw.auction.spring.bean.AucProgress;
import io.kkw.auction.spring.dao.AucCompleteRepository;
import io.kkw.auction.spring.dao.AucProductRepository;
import io.kkw.auction.spring.dao.AucProgressRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

@Service
public class AuctionService {

    @Autowired
    AucProductRepository aucProductRepository;

    @Autowired
    AucProgressRepository aucProgressRepository;

    @Autowired
    AucCompleteRepository aucCompleteRepository;

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
        Optional<AucProgress> optional = aucProgressRepository.findByproductId(pid);
        return optional.orElse(null);
        //return null;
    }

    //경매정보 id를 이용해여 마감된 경매정보를 찾는 메소드
    public AucComplete findComplete(long auc_id){
        Optional<AucComplete> optional = aucCompleteRepository.findById(auc_id);
        return optional.orElse(null);
    }

    //유저가 올린 모든 정보를 가져오는 메소드
    public List<AucProduct> findMyAuction(String id){
        return aucProductRepository.findAllByUserid(id);
        //Join 걸어서 가져와야할듯
        //SELECT * FROM auc_information i, auc_progress p where i.id = p.pid and  i.user_id = :id
        //SELECT * FROM auc_information i, auc_complete c where i.id = c.auc_id (이거 바꿔야될듯 변수명 불일치) and  i.user_id = :id
        //return null;
    }

    //경매예정인 모든 정보를 가져오는 메소드
    public List<AucProduct> findAllPlan(){
        Date today = new Date();
        List<AucProduct> informations = aucProductRepository.findAllByStartdateBefore(today);
        return informations;
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

        return null;
    }


    //경매정보삭제 (단 경매 시작 이전에만 지울 수 있게 하는 프로시저, 트리거 작성)
    public boolean deleteAuction(long id){
        boolean result = false;
        return result;
    }

    //id = product_id , admin_id = admin_id
    // 허가 하기
    public boolean checkAuthorize(long id, String admin_id){
        Optional<AucProgress> aucProgressOptional = aucProgressRepository.findByproductId(id);
        AucProgress aucProgress = aucProgressOptional.get();
        try {
            aucProgress.setApproval(true);
            aucProgress.setAdmin_id(admin_id);
            aucProgressRepository.save(aucProgress);
            return true;
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
    //허가 취소하기
    public boolean cancelAuthorize(long id, String admin_id){
        Optional<AucProgress> aucProgressOptional = aucProgressRepository.findByproductId(id);
        AucProgress aucProgress = aucProgressOptional.get();
        try{
            aucProgress.setApproval(false);
            aucProgress.setAdmin_id("");
            aucProgressRepository.save(aucProgress);
            return true;
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
    //경매 정보 수정
    public AucProduct modifyAuction(long id, String user_id, String title,  String psubject, String pcontent, String picture, Date startdate, Date enddate){
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
            AucProduct result = aucProductRepository.save(aucProduct);
            return result;
        }catch(Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<AucProduct> unAuthorized(){
        List<AucProduct> aucProducts = aucProductRepository.approval(false);
        return aucProducts;
    }

    public List<AucProduct> authorized(){
        List<AucProduct> aucProducts = aucProductRepository.approval(true);
        return aucProducts;
    }

    public Iterable<AucProduct> findAll(){
        Iterable<AucProduct> aucProducts = aucProductRepository.findAll();
        return aucProducts;
    }

    public List<AucProduct> searchAuction(String search){
        List<AucProduct> aucProducts = aucProductRepository.searchAuction(search);
        return aucProducts;
    }

}
