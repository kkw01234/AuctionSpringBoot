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
    /*
    @Query("FROM AucProduct i WHERE i.startdate > :start_date")
    List<AucProduct> findAllByStartdateBefore(@Param("start_date") Date start_date);
    */
    @Query(nativeQuery = true, value = "SELECT * FROM Auc_Product i, Auc_Progress p WHERE i.id=p.product_id and i.start_date > :start_date and approval= 1")
    List<AucProduct> findAllByStartdateBefore(@Param("start_date") Date start_date);


    //Start 이후 End 이전데이터
    @Query(nativeQuery = true, value = "SELECT * FROM Auc_Product i, Auc_Progress p WHERE  i.id=p.product_id and  i.start_date <= :start_date and i.end_date > :end_date and approval= 1")
    List<AucProduct> findAllByStartdateAfterAndEnddateBefore(@Param("start_date") Date start_date, @Param("end_date") Date end_date);

    //마무리된 경매
    @Query(nativeQuery = true, value = "SELECT * FROM Auc_Product i, Auc_Complete p WHERE  i.id=p.product_id")
    List<AucProduct> findAllByAucComplete();

    //허가받지않 경매
    @Query(nativeQuery = true, value = "SELECT * FROM Auc_Product i, Auc_Progress p WHERE  i.id=p.product_id and approval = :approval")
    List<AucProduct> findAllByAuthorize(@Param("approval")int approval);




    //전체 검색 (관리자용)
    @Query(nativeQuery = true, value = "SELECT * FROM Auc_Product i WHERE i.title LIKE %:search%")
    List<AucProduct> searchAuction(@Param("search") String search);
    //경매 이전 검색
    @Query(nativeQuery = true, value = "SELECT * FROM Auc_Product i, Auc_Progress p Where i.id = p.product_id and approval = 1 and i.start_date > :today and i.title LIKE %:search% ")
    List<AucProduct> findAllByAucPlanAndSearch(@Param("search") String search, @Param("today") Date today);
    //경매 중 검색
    @Query(nativeQuery = true, value = "SELECT * FROM Auc_Product i, Auc_Progress p Where i.id = p.product_id and approval = 1 and i.start_date < :today and i.end_date > :today and i.title LIKE %:search% ")
    List<AucProduct> findAllByAucProgressAndSearch(@Param("search") String search, @Param("today") Date today);
    //경매 이후 검색
    @Query(nativeQuery = true, value = "SELECT * FROM Auc_Product i, Auc_Complete p Where i.id = p.product_id and i.title LIKE %:search% ")
    List<AucProduct> findAllByAucCompleteAndSearch(@Param("search") String search);


    @Transactional
    @Procedure(procedureName = "deleteAuction")
    long deleteAuction(@Param("product_id") long product_id, @Param("user_id") String user_id);
}

