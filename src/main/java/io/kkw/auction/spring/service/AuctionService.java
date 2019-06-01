package io.kkw.auction.spring.service;


import io.kkw.auction.spring.bean.AucComplete;
import io.kkw.auction.spring.bean.AucProduct;
import io.kkw.auction.spring.bean.AucProgress;
import io.kkw.auction.spring.dao.AucCompleteRepository;
import io.kkw.auction.spring.dao.AucInformationRepository;
import io.kkw.auction.spring.dao.AucProgressRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class AuctionService {

    @Autowired
    AucInformationRepository aucInformationRepository;

    @Autowired
    AucProgressRepository aucProgressRepository;

    @Autowired
    AucCompleteRepository aucCompleteRepository;

    public boolean addAuction(AucProduct bean){
        AucProduct a = aucInformationRepository.save(bean);
        if(a != null){
            return true;
        }else
            return false;
    }

    //프로시저 이용해서 AucProduct 과 AucProgress에 값들을 저장하는 메소드
    public boolean addAuction(String user_id, String title,String name, String psubject, String pcontent, String picture,Date start_date ,Date end_date){
           boolean result = aucInformationRepository.uploadAuction(user_id,title,name,psubject,pcontent,picture,start_date,end_date);
        return result;
    }
    //id를 이용하여 경매정보를 찾는 메소드
    public AucProduct findInfo(long id) {
        Optional<AucProduct> optional = aucInformationRepository.findById(id);
        //Optional 존재할 수도 있지만 안할 수도 있는 객체
        //null을 처리 해줄 필요가없음
        return optional.orElse(null); //무슨값을 넣을까
    }

    //경매정보 id를 이용하여 진행예정/진행중인 경매정보를 찾는 메소드
    public AucProgress findProgress(long pid){
        Optional<AucProgress> optional = aucProgressRepository.findByPid(pid);
        return optional.orElse(null);
        //return null;
    }

    //경매정보 id를 이용해여 마감된 경매정보를 찾는 메소드
    public AucComplete findComplete(long auc_id){
        Optional<AucComplete> optional = aucCompleteRepository.findByAucid(auc_id);
        return optional.orElse(null);
    }

    //유저가 올린 모든 정보를 가져오는 메소드
    public List<AucProduct> findMyAuction(int id){
        return aucInformationRepository.findByPid(id);
        //Join 걸어서 가져와야할듯
        //SELECT * FROM auc_information i, auc_progress p where i.id = p.pid and  i.user_id = :id
        //SELECT * FROM auc_information i, auc_complete c where i.id = c.auc_id (이거 바꿔야될듯 변수명 불일치) and  i.user_id = :id
        //근데 이러면 어떻게 매핑하지? 답 없는데...ㅋㅋㅋㅋㅋㅋㅋㅋㅋ Json Mapping 해야하나여
        //흐음
        //return null;
    }

    //경매예정인 모든 정보를 가져오는 메소드
    public List<AucProduct> findAllPlan(){
        Date today = new Date();
        List<AucProduct> informations = aucInformationRepository.findAllByStartdateBefore(today);
        return informations;
    }

    //경매중인 모든 정보를 가져오는 메소드
    public List<AucProduct> findAllProgress(){
        Date today = new Date();
        List<AucProduct> informations = aucInformationRepository.findAllByStartdateAfterAndEnddateBefore(today,today);
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



}
