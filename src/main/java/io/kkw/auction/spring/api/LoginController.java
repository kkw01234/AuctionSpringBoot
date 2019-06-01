package io.kkw.auction.spring.api;

import io.kkw.auction.spring.bean.AucUser;
import io.kkw.auction.spring.bean.UserBean;
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
    //로그인
    @RequestMapping("/login")
    @PostMapping
    @GetMapping
    public @ResponseBody
    String login(HttpServletRequest request, Model model){
        String id = request.getParameter("id");
        String password = request.getParameter("password");

        UserBean userBean = userService.getLogin(id,password);
        AucUser aucUser = (AucUser)userBean;

        HttpSession session = request.getSession();
        session.setAttribute("user",userBean);

        if(userBean == null){
            model.addAttribute("user", null);
        }else {
            model.addAttribute("userid", aucUser.getId());
            model.addAttribute("password", aucUser.getPassword());
            System.out.println("로그인 성공");
            return "success";
        }
        return "redirect:/";
    }

    //로그아웃
    @RequestMapping("/logout")
    public String logout_page(HttpServletRequest request){
        HttpSession httpSession = request.getSession();
        httpSession.invalidate();
        System.out.println("로그아웃 성공");
        return "redirect:/";
    }

}
