package io.kkw.auction.spring.api;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AuctionController {




    @RequestMapping("/auction_page")
    public String loadAuctionPage(){

        return "auction_page";
    }

    @RequestMapping("/tmp")
    public String readAuctionPage(){
        return "read_auction_page";
    }

    @RequestMapping("/tmp2")
    public String myPage(){
        return "my_page";
    }

}
