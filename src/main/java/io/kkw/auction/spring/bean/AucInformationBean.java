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
    @Column(name="register_date", nullable = true)
    private Date register_date;
    private Date end_date;

    public AucInformationBean(){

    }
    public AucInformationBean(String user_id,String title,String pname,String psubject,String pcontent,String picture, Date end_date){
        this.user_id = user_id;
        this.title = title;
        this.pname = pname;
        this.psubject = psubject;
        this.pcontent = pcontent;
        this.picture = picture;
        this.end_date = end_date;
    }

}
