package io.kkw.auction.spring.api;


import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/loginpage")
public class LoginPageController {



    @GetMapping
    @PostMapping
    public String loginpage(Model model){
        return "loginpage";
    }

}
