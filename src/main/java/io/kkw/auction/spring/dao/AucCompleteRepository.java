package io.kkw.auction.spring.dao;

import io.kkw.auction.spring.bean.AucComplete;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface AucCompleteRepository extends CrudRepository<AucComplete, Long> {

    Optional<AucComplete> findById(long id);

    @Query(value = "SELECT auc_complete_auto.nextval FROM dual", nativeQuery = true)
    long getNextVal();
}
