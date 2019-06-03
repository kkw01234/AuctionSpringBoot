package io.kkw.auction.spring.api;


import com.google.gson.Gson;
import io.kkw.auction.spring.bean.AucAdmin;
import io.kkw.auction.spring.bean.AucUser;
import io.kkw.auction.spring.bean.UserBean;
import io.kkw.auction.spring.service.UserService;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    //모든 유저를 보여주는 테이블
    @ResponseBody
    @RequestMapping
    public List<AucUser> userList(){
        List<AucUser> aucUsers = userService.findAll(); //추후 원한느 데이터만 가져올수 있게 해야함
        return aucUsers;
    }

    //유저를 정지
    @ResponseBody
    @RequestMapping("/stop")
    public ResponseEntity<Object> stopUser(@RequestParam("userid") String userid, @SessionAttribute("user")UserBean userBean){

       if(userBean instanceof  AucAdmin){
           boolean result = userService.stopUser(userid);

           if(result)
               return new ResponseEntity<Object>(HttpStatus.OK);
           else
               return new ResponseEntity<Object>(HttpStatus.BAD_REQUEST);

       }else{
           return new ResponseEntity<Object>(HttpStatus.BAD_REQUEST);
       }

    }

    //유저 정지 해제
    @ResponseBody
    @RequestMapping("/release")
    public ResponseEntity<Object> releaseUser(@RequestParam("userid") String userid, @SessionAttribute("user")UserBean userBean){

        if(userBean instanceof  AucAdmin){
            boolean result = userService.releaseUser(userid);

            if(result)
                return new ResponseEntity<Object>(HttpStatus.OK);
            else
                return new ResponseEntity<Object>(HttpStatus.BAD_REQUEST);

        }else{
            return new ResponseEntity<Object>(HttpStatus.BAD_REQUEST);
        }

    }

    @RequestMapping("/mypage")
    public String myPage(@SessionAttribute("user")UserBean userBean, Model model){
            if(!(userBean instanceof AucUser)){
                return "/";
            }
            AucUser user2 = (AucUser) userBean;
            AucUser user = userService.findUser(user2.getId());
            user.setPassword("");
            model.addAttribute("user", new Gson().toJson(user));
            return "my_page";
    }

    @ResponseBody
    @RequestMapping("/mypage/update")
    public ResponseEntity<Object> UpdateMyPage( @SessionAttribute("user") UserBean userBean,
                                                @RequestParam("email") String email,
                                                @RequestParam("address") String address,
                                                @RequestParam("phone") String phone,
                                                @RequestParam("account") String account,
                                                HttpServletRequest request){

        if(!(userBean instanceof AucUser)){
            return new ResponseEntity<>(false, HttpStatus.BAD_REQUEST);
        }

        String id = ((AucUser) userBean).getId();
        AucUser findUser = userService.findUser(id);
        AucUser aucUser = null;
        aucUser = new AucUser(id,findUser.getPassword(),email,address,phone,account);


        AucUser bean = userService.addUser(aucUser);
        request.getSession().setAttribute("user",bean);
        return new ResponseEntity<>(true, HttpStatus.OK);
    }

    @RequestMapping("/mypage/updatepage")
    public String updatemyPage(){
        return "update_my_page";
    }

}
