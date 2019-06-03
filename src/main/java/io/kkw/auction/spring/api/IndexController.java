package io.kkw.auction.spring.api;


import io.kkw.auction.spring.bean.AucProgress;
import io.kkw.auction.spring.service.AuctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/")
public class IndexController {

    @Autowired
    AuctionService auctionService;

    @GetMapping
    @PostMapping
    public String index(Model model) {
        return "index";
    }
    public static boolean time=false;


    //시간 지난거 확인
    @PostMapping("/check")
    @ResponseBody
    public String time(){
        time = true;
        auctionService.findCheck();
        time = false;
        return null;
    }


}
