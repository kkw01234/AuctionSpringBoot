package io.kkw.auction.spring.api;


import io.kkw.auction.spring.bean.AucUser;
import io.kkw.auction.spring.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;


@Controller
public class RegisterController {


    @Autowired
    UserService userService;

    @RequestMapping("/register")
    @PostMapping
    @GetMapping
    public @ResponseBody
    String register(HttpServletRequest request){
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String account = request.getParameter("account");

        AucUser aucUser = new AucUser(id,password,email,address,phone,account);
        AucUser bean = userService.addUser(aucUser);
        request.getSession().setAttribute("user",bean);
        System.out.println("가입 완료");
        return "success";
    }

    @RequestMapping("/verify_email")
    @PostMapping
    @GetMapping
    public @ResponseBody
    String verify_email(@RequestParam("email") String email){

        if(userService.hasEmail(email)){
            return "1";
        }else
            return "0";

    }
}
