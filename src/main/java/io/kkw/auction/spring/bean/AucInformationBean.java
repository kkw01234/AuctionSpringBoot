package io.kkw.auction.spring.bean;


import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity
@Table(name = "AUC_INFORMATION")
public class AucInformationBean {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "pid")
    private int pid;

    private String user_id;
    private  String title;
    private String pname;
    private String psubject;
    private String pcontent;
    private String picture;
    private Date register_date;
    private Date end_date;

}
