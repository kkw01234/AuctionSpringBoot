package io.kkw.auction.spring.service;

import io.kkw.auction.spring.dao.AucInformationRepository;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;

@RunWith(SpringRunner.class)
@SpringBootTest
public class AucInformationTEst {
    @Autowired
    AuctionService auctionService;
    @Test
    public void Test(){

      auctionService.addAuction("1","id2"
                ,"test","consodfsfe","01234","twetewtew",new Date(),new Date());


    }

}
