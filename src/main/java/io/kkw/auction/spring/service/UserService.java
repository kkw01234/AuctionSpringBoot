package io.kkw.auction.spring.service;


import com.google.gson.JsonObject;
import io.kkw.auction.spring.bean.AucAdminBean;
import io.kkw.auction.spring.bean.AucUserBean;
import io.kkw.auction.spring.bean.UserBean;
import io.kkw.auction.spring.dao.AdminRepository;
import io.kkw.auction.spring.dao.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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


    public AucUserBean addUser(JsonObject object){
        String id = object.get("id").getAsString();
        String password = object.get("password").getAsString();
        String email = object.get("email").getAsString();
        String phone = object.get("phone").getAsString();
        String address = object.get("address").getAsString();
        String account = object.get("account").getAsString();
        AucUserBean aucUserBean = new AucUserBean(id,password,email,phone,address,account);
        return userRepository.save(aucUserBean);
    }

}
