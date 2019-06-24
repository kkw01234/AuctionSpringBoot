package io.kkw.auction.spring.api;


import io.kkw.auction.spring.bean.AucProgress;
import io.kkw.auction.spring.service.AuctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.ResourceBundle;

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

    public static Date date = null;


    //시간 지난거 확인
    @RequestMapping("/check")
    @ResponseBody
    public ResponseEntity<Object> time(){
        Date now = new Date();
        if (date == null || now.getTime() - date.getTime() >= 30000) {
            System.out.println("Check Start");
            long start = System.currentTimeMillis();
            auctionService.findCheck();
            long end = System.currentTimeMillis();
            date = now;
            System.out.println("Check End"+(end-start)/1000.0);
            return new ResponseEntity<>(true,HttpStatus.OK);
        }else
            return new ResponseEntity<>(false, HttpStatus.OK);

    }


}
