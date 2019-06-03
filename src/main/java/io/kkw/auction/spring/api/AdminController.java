package io.kkw.auction.spring.api;


import io.kkw.auction.spring.bean.AucAdmin;
import io.kkw.auction.spring.bean.UserBean;
import org.springframework.http.RequestEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
@RequestMapping("/admin")
public class AdminController {


    @RequestMapping
    public String adminPage(@SessionAttribute("user") UserBean userBean){
        if(userBean instanceof AucAdmin){
            return "index";
        }
        return "admin_page";
    }

}
