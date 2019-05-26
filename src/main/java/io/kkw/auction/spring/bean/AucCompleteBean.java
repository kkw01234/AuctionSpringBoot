package io.kkw.auction.spring.bean;


import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Data
@Entity
@Table(name = "AUC_COMPLETE")
public class AucCompleteBean implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    private long auc_id;
    private long complete_price;
    private String tender_user_id;
    private Date uid_check;
    private Date tender_id_check;
}
