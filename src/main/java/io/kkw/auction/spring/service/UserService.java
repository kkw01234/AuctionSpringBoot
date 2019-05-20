package io.kkw.auction.spring.service;


import io.kkw.auction.spring.bean.AucUserBean;
import io.kkw.auction.spring.dao.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    UserRepository userRepository;

    public AucUserBean getLogin(String id, String password){
        AucUserBean aucUserBean = userRepository.findByIdAndPassword(id,password);
        return aucUserBean;
    }

}
