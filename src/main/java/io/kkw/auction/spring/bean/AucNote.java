package io.kkw.auction.spring.bean;


import lombok.Data;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Data
@Entity
@Table(name="AUC_NOTE")
public class AucNote {

    @Id
    long id;

    @Column(name = "send_id")
    private String sendId;

    @Column(name = "receive_id")
    private String receiveId;

    private String content;
    @Column(name = "data_send")
    private Date dataSend;
    @Column(name = "data_read")
    private Date dataRead;
    @Column(name = "recv_read")
    private boolean recvRead;
    @Column(name = "recv_del")
    private boolean recvDel;
    @Column(name = "sent_del")
    private boolean sentDel;
}


