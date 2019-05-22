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

@Data
class AucNoteId implements Serializable {
    private String send_id;

    private String receive_id;
}
