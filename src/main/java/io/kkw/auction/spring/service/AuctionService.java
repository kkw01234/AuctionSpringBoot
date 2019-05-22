package io.kkw.auction.spring.service;


import io.kkw.auction.spring.bean.AucInformationBean;
import io.kkw.auction.spring.dao.AucInformationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class AuctionService {

    @Autowired
    AucInformationRepository aucInformationRepository;

    public boolean addAuction(AucInformationBean bean){
        AucInformationBean a = aucInformationRepository.save(bean);
        if(a != null){
            return true;
        }else
            return false;
    }

    public boolean addAuction(String user_id, String title,String name, String psubject, String pcontent, String picture,Date start_date ,Date end_date){
           aucInformationRepository.uploadAuction(user_id,title,name,psubject,pcontent,picture,start_date,end_date);
        return false;
    }
}
