package io.kkw.auction.spring.bean;


import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
@Entity
@Table(name = "AUC_INFORMATION")
public class AucInformation implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "pid")
    private long pid;

    private String user_id;
    private  String title;
    private String pname;
    private String psubject;
    private String pcontent;
    private String picture;

    @Column(name="register_date", nullable = true)
    private Date startdate;
    @Column(name="end_date", nullable = true)
    private Date enddate;

    /*
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "aucUserBean_id", nullable = true)
    private AucUser aucUserBean;
    */

    @OneToMany(cascade =CascadeType.ALL, mappedBy = "aucInformation",fetch = FetchType.LAZY, targetEntity = AucProgress.class)
    private List<AucProgress> aucProgresses;

    @OneToMany(cascade =CascadeType.ALL, mappedBy = "aucInformation",fetch = FetchType.LAZY, targetEntity = AucProgress.class)
    private List<AucComplete> aucCompletes;
    /*
    @OneToOne
    @JoinColumn(name = "aucProgress_pid", referencedColumnName = "pid")
    private AucProgress aucProgress;
    */
    public AucInformation(){

    }
    public AucInformation(String user_id, String title, String pname, String psubject, String pcontent, String picture,Date startdate, Date enddate){
        this.user_id = user_id;
        this.title = title;
        this.pname = pname;
        this.psubject = psubject;
        this.pcontent = pcontent;
        this.picture = picture;
        this.startdate = startdate;
        this.enddate = enddate;
    }


}
