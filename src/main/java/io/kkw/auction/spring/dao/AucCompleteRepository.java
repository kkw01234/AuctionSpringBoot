package io.kkw.auction.spring.dao;

import io.kkw.auction.spring.bean.AucComplete;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface AucCompleteRepository extends CrudRepository<AucComplete, Long> {

    Optional<AucComplete> findByAucid(long id);
}
