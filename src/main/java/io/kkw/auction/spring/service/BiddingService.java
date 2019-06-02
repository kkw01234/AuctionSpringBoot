package io.kkw.auction.spring.service;

import io.kkw.auction.spring.bean.AucLog;
import io.kkw.auction.spring.dao.AucLogRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class BiddingService {

    @Autowired
    AucLogRepository aucLogRepository;



    //경매 입찰
    public boolean bidding(long product_id, String user_id, long price){
        Date date = new Date();
        AucLog log = aucLogRepository.saveBidding(product_id, user_id, date, price);
        return false;
    }

}
