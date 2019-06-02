package io.kkw.auction.spring.dao;

import io.kkw.auction.spring.bean.AucLog;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.Date;

public interface AucLogRepository extends CrudRepository<AucLog, Long> {

    @Query(nativeQuery = true, value = "INSERT INTO AUC_LOG VALUES(AUC_LOG_AUTO.NEXTVAL,?1,?2,?3,?4)")
    AucLog saveBidding(@Param("product_id") long product_id, @Param("user_id") String user_id, @Param("today") Date today, @Param("price") long price);
}
