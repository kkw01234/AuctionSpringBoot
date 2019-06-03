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

    private String user_id;

    private Date log_date;

    private long price;
}
