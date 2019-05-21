package io.kkw.auction.spring.bean;


import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Entity
@Table(name = "AUC_INFORMATION")
public class AucInterestBean {

    @Id
    private String user_id;

    private String interest;
}
