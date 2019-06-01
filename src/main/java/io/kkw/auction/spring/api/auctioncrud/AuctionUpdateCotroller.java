package io.kkw.auction.spring.api.auctioncrud;

import io.kkw.auction.spring.service.AuctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("/modify_auction")
public class AuctionUpdateCotroller {

    @Autowired
    AuctionService auctionService;










    @RequestMapping("/modify_auction_page/{id}")
    public String modifyAuctionPage(Model model, @PathVariable("id")int id){

        return null;
    }

    @RequestMapping
    public String modifyAction(HttpServletRequest request){

        return null;
    }

}
