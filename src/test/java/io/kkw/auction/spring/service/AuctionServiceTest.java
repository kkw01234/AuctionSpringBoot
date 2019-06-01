package io.kkw.auction.spring.service;

import io.kkw.auction.spring.bean.AucProduct;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;
import java.util.List;

import static org.junit.Assert.assertEquals;

@RunWith(SpringRunner.class)
@SpringBootTest
public class AuctionServiceTest {
    @Autowired
    AuctionService auctionService;

    @Test
    public void Test1(){

      auctionService.addAuction("1","id2"
                ,"test","consodfsfe","01234","twetewtew",new Date(),new Date());


    }

    @Test
    public void Test2(){
        //Optional<AucComplete> beanOptional = aucCompleteRepository.findByAuc_id(1);
        //assertEquals( 1,beanOptional.get().getAuc_id());
        System.out.println();
    }


    @Test
    public void Test3(){
        List<AucProduct> infos = auctionService.findMyAuction("1");
        Assert.assertNotNull(infos);
    }

    @Test
    public void Test4(){
        List<AucProduct> infos = auctionService.findAllProgress();
        Assert.assertNotNull(infos);
    }

    @Test
    public void Test5(){
        auctionService.findComplete(1);
    }


}
