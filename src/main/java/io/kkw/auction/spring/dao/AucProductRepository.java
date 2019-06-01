package io.kkw.auction.spring.dao;

import io.kkw.auction.spring.bean.AucProduct;
import org.apache.taglibs.standard.extra.spath.ASCII_UCodeESC_CharStream;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.Date;
import java.util.List;

@Repository
public interface AucProductRepository extends CrudRepository<AucProduct,Long> {

    ///프로시저 실행~~
    @Transactional
    @Procedure(procedureName = "UploadAuction")
    void uploadAuction(@Param("user_id") String user_id, @Param("title")String title
                        ,@Param("psubject") String psubject, @Param("pcontent") String pcontent, @Param("picture") String picture, @Param("start_date") Date start_date
                        ,@Param("end_date") Date end_date, @Param("price") long price);


    //각자 사람마다
    List<AucProduct> findAllByUserid(String userid);

    //@Query(value = "FROM AUC_INFORMATION i, AUC_PROGRESS p where i.pid = p.pid and i.pid = ?1")


    //Start이전 데이터
    @Query("FROM AucProduct i WHERE i.startdate > :start_date")
    List<AucProduct> findAllByStartdateBefore(@Param("start_date") Date start_date);

    //Start 이후 End 이전데이터
    @Query("FROM AucProduct i WHERE i.startdate < :start_date and i.enddate > :start_date")
    List<AucProduct> findAllByStartdateAfterAndEnddateBefore(@Param("start_date") Date start_date, @Param("start_date") Date end_date);

    @Query("FROM AucProduct i, AucProgress p WHERE i.id=p.productId and p.approval = :approval")
    List<AucProduct> approval(@Param("approval") boolean approval);

    @Query("FROM AucProduct i WHERE i.title like %:search%")
    List<AucProduct> searchAuction(@Param("search") String search);


}

