package io.kkw.auction.spring.bean;


import lombok.Data;
import org.hibernate.annotations.CollectionId;
import org.springframework.stereotype.Controller;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Data
@Entity
@Table(name = "AUC_COMPLETE")
public class AucComplete implements Serializable {
    @Id
    private long id;
    @Column(name = "product_id")
    private long productId;
    @Column(name = "complete_price")
    private long completePrice;
    @Column(name = "tender_user_id")
    private String tenderUserId;
    @Column(name = "uid_check")
    private Date uidCheck;
    @Column(name ="tender_id_check")
    private Date tenderIdCheck;

    /*
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id", nullable = true,insertable = false,updatable = false)
    private AucProduct aucProduct;
*/
}
