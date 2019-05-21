package io.kkw.auction.spring.bean;

import lombok.*;


import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Data
@Entity
@Table(name="AUC_USER")
public class AucUserBean implements Serializable, UserBean {

    @Id
    @Column(name="id")
    private String id;
    @Column(name="password")
    private String password;
    @Column(name = "email")
    private String email;
    @Column(name ="address")
    private String address;
    @Column(name = "phone")
    private String phone;
    @Column(name = "account")
    private String account;
    @Column(name = "authcode")
    private String authcode;
    @Column(name = "stopdate")
    private Date stopdate;

    public AucUserBean(){

    }
    public AucUserBean(String id,String password, String email, String address, String phone, String account){
        this.id =id;
        this.password=password;
        this.email=email;
        this.address =address;
        this.phone=phone;
        this.account=account;
        this.authcode="test";
        this.stopdate=null;



    }





}
