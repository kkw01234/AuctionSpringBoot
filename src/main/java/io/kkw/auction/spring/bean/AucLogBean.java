package io.kkw.auction.spring.bean;


import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Data
@Entity
@Table(name = "AUC_LOG")
public class AucLogBean implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    private int progress_id;

    private String tender_user_id;

    private Date tender_date;

    private long tender_price;
}
