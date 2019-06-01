package io.kkw.auction.spring.dao;

import io.kkw.auction.spring.bean.AucProduct;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.Date;
import java.util.List;

@Repository
public interface AucInformationRepository extends CrudRepository<AucProduct,Long> {

    ///프로시저 실행~~
    @Transactional
    @Procedure(procedureName = "UploadAuction")
    Boolean uploadAuction(@Param("user_id") String user_id, @Param("title")String title, @Param("name")String name
                        ,@Param("psubject") String psubject, @Param("pcontent") String pcontent, @Param("picture") String picture, @Param("start_date") Date start_date
                        ,@Param("end_date") Date end_date);


    //각자 사람마다
    //List<AucProduct> findByUser_id(String id);

    //@Query(value = "FROM AUC_INFORMATION i, AUC_PROGRESS p where i.pid = p.pid and i.pid = ?1")
    //번호당
    List<AucProduct> findByPid(long pid);

    //Start이전 데이터
    @Query("FROM AucProduct i WHERE i.startdate > :register_date")
    List<AucProduct> findAllByStartdateBefore(@Param("register_date") Date start_date);

    //Start 이후 End 이전데이터
    @Query("FROM AucProduct i WHERE i.startdate < :register_date and i.enddate > :end_date")
    List<AucProduct> findAllByStartdateAfterAndEnddateBefore(@Param("register_date") Date start_date, @Param("end_date") Date end_date);


}

