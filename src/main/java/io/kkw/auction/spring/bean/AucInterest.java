package io.kkw.auction.spring.bean;


import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Data
@Entity
@Table(name = "AUC_INFORMATION")
public class AucInterest implements Serializable {

    @Id
    private String user_id;

    private String interest;
}
