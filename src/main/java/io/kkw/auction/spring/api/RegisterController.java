package io.kkw.auction.spring.api;


import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import io.kkw.auction.spring.bean.AucUserBean;
import io.kkw.auction.spring.bean.UserBean;
import io.kkw.auction.spring.service.UserService;
import jdk.nashorn.internal.parser.JSONParser;
import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
        JsonParser jsonParser = new JsonParser();
        String str = request.getParameter("data");
        JsonObject object = (JsonObject)jsonParser.parse(str);

        UserBean userBean = userService.addUser(object);

        System.out.println("가입 완료");
        return "1";
    }
}
