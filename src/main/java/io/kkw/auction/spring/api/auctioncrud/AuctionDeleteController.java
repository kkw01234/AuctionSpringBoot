package io.kkw.auction.spring.api.auctioncrud;


import io.kkw.auction.spring.service.AuctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/delete_auction")
public class AuctionDeleteController {

    @Autowired
    AuctionService auctionService;

    @RequestMapping("/{id}")
    public String deleteAuction(@PathVariable long id){
            return null;
    }

}