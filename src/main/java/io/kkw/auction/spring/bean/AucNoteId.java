package io.kkw.auction.spring.bean;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Id;
import java.io.Serializable;

@Data
public class AucNoteId implements Serializable {

    @EqualsAndHashCode.Include
    @Id
    private String send_id;

    @EqualsAndHashCode.Include
    @Id
    private String receive_id;
}