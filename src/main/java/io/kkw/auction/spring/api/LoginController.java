package io.kkw.auction.spring.api;

import io.kkw.auction.spring.bean.AucUserBean;
import io.kkw.auction.spring.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller

public class LoginController {

    @Autowired
    UserService userService;

    @RequestMapping("/login")
    @PostMapping
    @GetMapping
    public String login(HttpServletRequest request, Model model){
        String id = request.getParameter("id");
        String password = request.getParameter("password");

        AucUserBean aucUserBean = userService.getLogin(id,password);

        HttpSession session = request.getSession();
        session.setAttribute("user",aucUserBean);

        if(aucUserBean == null){
            model.addAttribute("user", null);
        }else
            model.addAttribute("userid",aucUserBean.getId());
            model.addAttribute("password", aucUserBean.getPassword());

        return "redirect:/";

    }

    @RequestMapping("/login_page")
    @PostMapping
    @GetMapping
    public String login_page(){
        return "login_page";
    }

}
