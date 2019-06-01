package io.kkw.auction.spring.dao;

import io.kkw.auction.spring.bean.AucComplete;
import org.springframework.data.repository.CrudRepository;

public interface AucCompleteRepository extends CrudRepository<AucComplete, Long> {

//    Optional<AucComplete> findByAuc_id(long id);
}
