package io.kkw.auction.spring.service;


import com.google.gson.JsonObject;
import io.kkw.auction.spring.bean.AucAdminBean;
import io.kkw.auction.spring.bean.AucUserBean;
import io.kkw.auction.spring.bean.UserBean;
import io.kkw.auction.spring.dao.AdminRepository;
import io.kkw.auction.spring.dao.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    UserRepository userRepository;
    @Autowired
    AdminRepository adminRepository;

    public UserBean getLogin(String id, String password) {
        UserBean userBean = null;
        userBean = userRepository.findByIdAndPassword(id, password);
        if(userBean == null){
            userBean = adminRepository.findByIdAndPassword(id, password);
        }
        return userBean;
    }


    public AucUserBean addUser(AucUserBean aucUserBean){
        return userRepository.save(aucUserBean);
    }
    public boolean hasEmail(String email){
        List<AucUserBean> Users = userRepository.findByEmail(email);

        if(Users != null && Users.size() >0){
            return true;
        }else
            return false;
    }
}
