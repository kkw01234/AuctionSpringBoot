package io.kkw.auction.spring.api;


import io.kkw.auction.spring.bean.AucAdmin;
import io.kkw.auction.spring.bean.AucUser;
import io.kkw.auction.spring.bean.UserBean;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
@RequestMapping("/user")
public class UserController {

    //모든 유저를 보여주는 테이블
    @RequestMapping
    public String Userlist(Model model){
        return "user";
    }

    //유저를 정지
    @ResponseBody
    @RequestMapping("/stop")
    public ResponseEntity<Object> stopUser(@RequestParam("userId") String userId, @SessionAttribute("user")UserBean userBean){
        if(userBean == null){
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        if(userBean instanceof AucUser)
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);


        AucAdmin admin = (AucAdmin) userBean;
        return null;


    }

}
