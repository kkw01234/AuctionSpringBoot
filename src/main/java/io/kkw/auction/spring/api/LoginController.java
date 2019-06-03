package io.kkw.auction.spring.api;

import io.kkw.auction.spring.bean.AucAdmin;
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
        AucUser aucUser= null;
        AucAdmin aucAdmin = null;
        System.out.println(userBean instanceof AucUser);
        if (userBean instanceof AucUser) {
            aucUser = (AucUser) userBean;
            aucUser.setPassword("");
        }else if(userBean instanceof AucAdmin) {
            aucAdmin = (AucAdmin) userBean;
            aucAdmin.setPassword("");
        }
        else
            return "ERROR";

        HttpSession session = request.getSession();


        if(aucUser != null) { //User 일경우
            model.addAttribute("userid", aucUser.getId());
            session.setAttribute("user",aucUser);
            System.out.println("로그인 성공");
            return "success";
        }else{
            model.addAttribute("userId",aucAdmin.getId());
            session.setAttribute("user",aucAdmin);
            System.out.println("로그인 성공");
            return "success";
        }
        //관리자일경우

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
