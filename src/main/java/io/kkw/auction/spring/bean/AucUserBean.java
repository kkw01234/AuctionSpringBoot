package io.kkw.auction.spring.bean;

import lombok.*;


import javax.persistence.*;
import java.util.Date;

@Data
@Entity
@Table(name="AUC_USER")

public class AucUserBean {

    @Id
    @Column(name="id")
    private String id;
    @Column(name="password")
    private String password;
    @Column
    private String email;
//    @Column
//    private String address;
    @Column
    private String phone;
    @Column
    private String account;
    @Column
    private String authcode;
    @Column
    private Date stopdate;

    public AucUserBean(String id){

    }





}
