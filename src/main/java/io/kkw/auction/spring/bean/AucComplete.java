package io.kkw.auction.spring.bean;


import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Data
@Entity
@Table(name = "AUC_COMPLETE")
public class AucComplete implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @Column(name = "product_id")
    private long productId;
    private long complete_price;
    private String tender_user_id;
    private Date uid_check;
    private Date tender_id_check;

    /*
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id", nullable = true,insertable = false,updatable = false)
    private AucProduct aucProduct;
*/
}
