package io.kkw.auction.spring.bean;


import lombok.Data;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Data
@Entity

@IdClass(AucNoteId.class)
@Table(name="AUC_NOTE")
public class AucNote {

    @Id
    @Column(name = "sendid")
    private String sendId;
    @Id
    @Column(name = "recievieid")
    private String receiveId;

    private String content;

    private Date note_date;
}


