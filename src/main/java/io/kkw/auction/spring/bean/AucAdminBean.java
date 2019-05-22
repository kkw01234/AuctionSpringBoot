package io.kkw.auction.spring.bean;


import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Data
@Entity
@Table(name="AUC_ADMIN")
public class AucAdminBean implements Serializable, UserBean {

    @Id
    private String id;

    private String password;

    public AucAdminBean(){

    }

    public AucAdminBean(String id, String password){
        this.id = id;
        this.password = password;
    }

}
