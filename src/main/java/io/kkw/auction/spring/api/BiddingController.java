package io.kkw.auction.spring.api;

import io.kkw.auction.spring.bean.AucProduct;
import io.kkw.auction.spring.bean.AucProgress;
import io.kkw.auction.spring.bean.AucUser;
import io.kkw.auction.spring.bean.UserBean;
import io.kkw.auction.spring.service.AuctionService;
import io.kkw.auction.spring.service.BiddingService;
import org.apache.taglibs.standard.extra.spath.ASCII_UCodeESC_CharStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
@RequestMapping("/bidding")
public class BiddingController {


    @Autowired
    AuctionService auctionService;

    @Autowired
    BiddingService biddingService;


    //경매 참여
    @RequestMapping("/{id}")
    public @ResponseBody
    ResponseEntity<Object> bidding(@PathVariable("id") long product_id, @RequestParam("price") int price, @SessionAttribute("user") UserBean userBean){
        //ID
        //금액
        //시간검증
        Date today = new Date();
        if(!(userBean instanceof AucUser))
            return new ResponseEntity<>(false, HttpStatus.BAD_REQUEST);
        AucProduct product = auctionService.findInfo(product_id);
        boolean result = false;
        if(product.getStartdate().before(today) && product.getEnddate().after(today)){
            result = biddingService.bidding(product_id, ((AucUser) userBean).getId(), price); //트리거 필요
        }

        return new ResponseEntity<>(result, HttpStatus.OK);
    }
}
