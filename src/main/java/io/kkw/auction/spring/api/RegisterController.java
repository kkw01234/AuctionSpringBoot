package io.kkw.auction.spring.api;


import io.kkw.auction.spring.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;

@Controller("/register")
public class RegisterController {


    @Autowired
    UserService userService;

    @GetMapping
    @PostMapping
    public String register(HttpServletRequest request){
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phome = request.getParameter("phone");
        String account = request.getParameter("account");
        return "redirect:/index";
    }
}
