package io.kkw.auction.spring.bean;


import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Data
@Entity
@Table(name = "AUC_LOG")
public class AucLog implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @Column(name = "product_id")
    private int productId;
    @Column(name = "user_id")
    private String userId;

    @Column(name = "log_date")
    private Date logDate;

    private long price;
}
