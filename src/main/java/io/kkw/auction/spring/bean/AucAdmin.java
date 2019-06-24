package io.kkw.auction.spring.bean;


import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Data
@Entity
@Table(name="AUC_ADMIN")
public class AucAdmin extends UserBean implements Serializable {

    @Id
    @Column(name="id")
    private String id;
    @Column(name="password")
    private String password;

    public AucAdmin(){

    }

    public AucAdmin(String id, String password){
        this.setId(id);
        this.setPassword(password);
    }

}
