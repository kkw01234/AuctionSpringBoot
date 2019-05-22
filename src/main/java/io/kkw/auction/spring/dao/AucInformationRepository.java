package io.kkw.auction.spring.dao;

import io.kkw.auction.spring.bean.AucInformationBean;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.Date;

@Repository
public interface AucInformationRepository extends CrudRepository<AucInformationBean,Long> {

    ///프로시저 실행~~
    @Transactional
    @Procedure(procedureName = "UploadAuction")
    Boolean uploadAuction(@Param("user_id") String user_id, @Param("title")String title, @Param("name")String name
                        ,@Param("psubject") String psubject, @Param("pcontent") String pcontent, @Param("picture") String picture, @Param("start_date") Date start_date
                        ,@Param("end_date") Date end_date);
}

