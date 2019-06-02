package io.kkw.auction.spring.service;


import io.kkw.auction.spring.bean.AucUser;
import io.kkw.auction.spring.bean.UserBean;
import io.kkw.auction.spring.dao.AdminRepository;
import io.kkw.auction.spring.dao.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

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


    public AucUser addUser(AucUser aucUser){
        return userRepository.save(aucUser);
    }
    public boolean hasEmail(String email){
        List<AucUser> Users = userRepository.findByEmail(email);

        if(Users != null && Users.size() >0){
            return true;
        }else
            return false;
    }

    public boolean stopUser(String userId){
        try {
            Optional<AucUser> aucUser = userRepository.findById(userId);
            AucUser user = aucUser.get();
            Date time = new Date();
            user.setStopdate(time);
            userRepository.save(user);
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
        return true;

    }
    public boolean releaseUser(String userId){
        try {
            Optional<AucUser> aucUser = userRepository.findById(userId);
            AucUser user = aucUser.get();
            user.setStopdate(null);
            userRepository.save(user);
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
        return true;

    }

    public List<AucUser> findAll(){
        List<AucUser> aucUsers = userRepository.findAll();
        return aucUsers;
    }
}
