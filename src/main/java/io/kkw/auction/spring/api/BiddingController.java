package io.kkw.auction.spring.api;

import io.kkw.auction.spring.bean.AucUser;
import io.kkw.auction.spring.service.AuctionService;
import io.kkw.auction.spring.service.BiddingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/bidding")
public class BiddingController {


    @Autowired
    AuctionService auctionService;

    @Autowired
    BiddingService biddingService;



    @RequestMapping("/{id}")
    public @ResponseBody
    ResponseEntity<Object> bidding(@PathVariable("id") long product_id, @RequestParam int price/*, @SessionAttribute("user") AucUser aucUser*/){
        //ID
        //금액

        //작성중
        boolean result = biddingService.bidding(product_id, "1", price);

        return new ResponseEntity<Object>(result, HttpStatus.OK);
    }
}
