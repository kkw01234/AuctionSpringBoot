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

    @Column(name = "product_id")
    private long productId;


    private int approval;

    @Column(name = "admin_id")
    private String adminId;

    /*
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id", nullable = false,insertable = false, updatable = false)
    private AucProduct aucProduct;
*/
    public AucProgress(){

    }

    public AucProgress(long id, long pid, int approval, String admin_id){
        this.id =id;
        this.productId =pid;
        this.approval =approval;
        this.adminId=admin_id;

    }
}
