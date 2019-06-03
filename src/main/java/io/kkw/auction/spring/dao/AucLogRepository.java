package io.kkw.auction.spring.dao;

import io.kkw.auction.spring.bean.AucLog;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.util.Date;
import java.util.Optional;

public interface AucLogRepository extends CrudRepository<AucLog, Long> {

    @Transactional
    @Procedure(procedureName = "insertBidding")
    void saveBidding(@Param("product_id") long product_id, @Param("user_id") String user_id, @Param("price") long price);


    @Query(nativeQuery = true , value = "SELECT * FROM AUC_LOG WHERE product_id = :product_id ORDER BY price")
    Optional<AucLog> findByProductIdOrderByPrice(@Param("product_id") long product_id);


}
