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

    //관리자가 허가 하기
    @RequestMapping("/authorizecheck")
    public String checkAuthorize(){
        return null;
    }

    //관리자 허가 취소
    @RequestMapping("/cancelahthorize")
    public String cancelAuthorize(){
        return null;
    }
    //개인이 올린 것을 수정하기

    @RequestMapping("/modify_auction_page/{id}")
    public String modifyAuctionPage(Model model, @PathVariable("id")long id){

        return null;
    }

    //수정 페이지
    @RequestMapping
    public String modifyAction(HttpServletRequest request){

        return null;
    }

}
