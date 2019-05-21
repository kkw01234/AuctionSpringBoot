package io.kkw.auction.spring.api;


import io.kkw.auction.spring.bean.AucUserBean;
import io.kkw.auction.spring.service.UserService;
import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;


@Controller
public class RegisterController {


    @Autowired
    UserService userService;

    @RequestMapping("/register")
    @PostMapping
    @GetMapping
    public String register(HttpServletRequest request){
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String account = request.getParameter("account");


        AucUserBean aucUserBean = new AucUserBean(id,password,email,address,phone,account);
        AucUserBean bean = userService.addUser(aucUserBean);
        return "redirect:/";
    }

    //회원가입창 띄우기
    @RequestMapping("/register_page")
    public String register_page(){
        return "register_page";
    }
}
