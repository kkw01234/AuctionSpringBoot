package io.kkw.auction.spring.service;

import io.kkw.auction.spring.bean.AucCompleteBean;
import io.kkw.auction.spring.dao.AucCompleteRepository;
import io.kkw.auction.spring.dao.AucInformationRepository;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;
import java.util.Optional;

import static org.junit.Assert.assertEquals;

@RunWith(SpringRunner.class)
@SpringBootTest
public class AuctionServiceTest {
    @Autowired
    AuctionService auctionService;
    @Autowired
    AucCompleteRepository aucCompleteRepository;

    @Test
    public void Test1(){

      auctionService.addAuction("1","id2"
                ,"test","consodfsfe","01234","twetewtew",new Date(),new Date());


    }

    @Test
    public void Test2(){
        Optional<AucCompleteBean> beanOptional = aucCompleteRepository.findByAuc_id(1);
        assertEquals( 1,beanOptional.get().getAuc_id());
    }


}
