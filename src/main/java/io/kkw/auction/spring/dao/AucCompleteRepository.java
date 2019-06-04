package io.kkw.auction.spring.dao;

import io.kkw.auction.spring.bean.AucComplete;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface AucCompleteRepository extends CrudRepository<AucComplete, Long> {

    Optional<AucComplete> findByProductId(long id);

    @Query(nativeQuery = true, value = "SELECT AUC_COMPLETE_AUTO.nextval FROM dual")
    long getNextVal();
}
