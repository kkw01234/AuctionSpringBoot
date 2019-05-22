package io.kkw.auction.spring.api;


import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import io.kkw.auction.spring.bean.AucUserBean;
import io.kkw.auction.spring.bean.UserBean;
import io.kkw.auction.spring.service.UserService;
import jdk.nashorn.internal.parser.JSONParser;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;


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

        AucUserBean aucUserBean = new AucUserBean(id,password,email,address,phone,account);
        AucUserBean bean = userService.addUser(aucUserBean);

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
