package io.kkw.auction.spring.bean;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Data
@Entity
@Table(name = "AUC_PROGRESS")
public class AucProgress implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @Column(name = "pid")
    private long pid;

    private Date app_date;

    private boolean admin_approval;

    private String admin_id;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "aucInformation_pid", nullable = true)
    private AucInformation aucInformation;


    public AucProgress(long id, long pid, Date app_date, boolean admin_approval, String admin_id){
        this.id =id;
        this.pid =pid;
        this.app_date = app_date;
        this.admin_approval =admin_approval;
        this.admin_id=admin_id;

    }
}
