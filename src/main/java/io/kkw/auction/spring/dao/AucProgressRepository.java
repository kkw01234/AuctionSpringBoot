package io.kkw.auction.spring.dao;

import io.kkw.auction.spring.bean.AucProduct;
import io.kkw.auction.spring.bean.AucProgress;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

public interface AucProgressRepository extends CrudRepository<AucProgress,Long> {

    //@Query("FROM AucProgress p WHERE p.productId = :productId and p.approval = :approval")
    Optional<AucProgress> findByProductIdAndApproval(@Param("productId")long productId, @Param("approval")int approval);
    /*
    @Query("FROM AucProgress p WHERE p.approval = :approval")
    List<AucProgress> approval(@Param("approval") long approval);
    */
    @Transactional
    Long deleteByProductId(@Param("productId")long product_id);


}
