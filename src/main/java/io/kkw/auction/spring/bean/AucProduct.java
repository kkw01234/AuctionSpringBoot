package io.kkw.auction.spring.bean;


import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
@Entity
@Table(name = "AUC_INFORMATION")
public class AucProduct implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private long id;

    private String user_id;
    private  String title;
    private String pname;
    private String psubject;
    private String pcontent;
    private String picture;

    @Column(name="start_date", nullable = true)
    private Date start_date;
    @Column(name="end_date", nullable = true)
    private Date end_date;

    /*
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "aucUserBean_id", nullable = true)
    private AucUser aucUserBean;
    */

    @OneToMany(cascade =CascadeType.ALL, mappedBy = "aucProduct",fetch = FetchType.LAZY, targetEntity = AucProgress.class)
    private List<AucProgress> aucProgresses;

    @OneToMany(cascade =CascadeType.ALL, mappedBy = "aucProduct",fetch = FetchType.LAZY, targetEntity = AucProgress.class)
    private List<AucComplete> aucCompletes;
    /*
    @OneToOne
    @JoinColumn(name = "aucProgress_pid", referencedColumnName = "pid")
    private AucProgress aucProgress;
    */
    public AucProduct(){

    }
    public AucProduct(String user_id, String title, String pname, String psubject, String pcontent, String picture, Date startdate, Date enddate){
        this.user_id = user_id;
        this.title = title;
        this.pname = pname;
        this.psubject = psubject;
        this.pcontent = pcontent;
        this.picture = picture;
        this.start_date = startdate;
        this.end_date = enddate;
    }


}
