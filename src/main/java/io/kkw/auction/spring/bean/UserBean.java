package io.kkw.auction.spring.bean;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Data
@Entity
public abstract class UserBean{

    @Id
    @Column(name="id")
    private String id;
    @Column(name="password")
    private String password;
}
