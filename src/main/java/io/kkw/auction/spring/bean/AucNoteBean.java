package io.kkw.auction.spring.bean;


import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Data
@Entity
@Table(name="AUC_NOTE")
public class AucNoteBean {
    @Id
    @Column(name = "sendid")
    private String send_id;
    @Id
    @Column(name = "recievieid")
    private String receive_id;

    private String content;

    private Date condate;
}
