package io.kkw.auction.spring.bean;


import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
@Entity
@Table(name = "AUC_PRODUCT")
public class AucProduct implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private long id;

    @Column(name="user_id", nullable = false)
    private String userid;
    private  String title;
    private String psubject;
    private String pcontent;
    private String picture;

    @Column(name="start_date", nullable = true)
    private Date startdate;
    @Column(name="end_date", nullable = true)
    private Date enddate;
    private long price;

    /*
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "aucUserBean_id", nullable = true)
    private AucUser aucUserBean;
    */
    /*
    @OneToMany(cascade =CascadeType.ALL, mappedBy = "aucProduct",fetch = FetchType.LAZY, targetEntity = AucProgress.class)
    private List<AucProgress> aucProgresses;

    @OneToMany(cascade =CascadeType.ALL, mappedBy = "aucProduct",fetch = FetchType.LAZY, targetEntity = AucProgress.class)
    private List<AucComplete> aucCompletes;
    */

    /*
    @OneToOne
    @JoinColumn(name = "aucProgress_pid", referencedColumnName = "pid")
    private AucProgress aucProgress;
    */
    public AucProduct(){

    }
    public AucProduct(String userid, String title, String psubject, String pcontent, String picture, Date startdate, Date enddate, long price){
        this.userid = userid;
        this.title = title;
        this.psubject = psubject;
        this.pcontent = pcontent;
        this.picture = picture;
        this.startdate = startdate;
        this.enddate = enddate;
        this.price = price;
    }


}
