package io.kkw.auction.spring.bean;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;


@Data
@Entity
@Table(name = "AUC_PROGRESS")
public class AucProgressBean {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    private int pid;

    private Date app_date;

    private boolean admin_approval;

    private String admin_id;
}
