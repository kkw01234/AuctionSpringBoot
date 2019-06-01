package io.kkw.auction.spring.service;

import io.kkw.auction.spring.dao.AucLogRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BiddingService {

    @Autowired
    AucLogRepository aucLogRepository;



    //경매 입찰
    public boolean bidding(String user_id, long product_id, long price){

        return false;
    }

}
