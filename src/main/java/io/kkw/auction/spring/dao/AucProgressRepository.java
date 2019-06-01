package io.kkw.auction.spring.dao;

import io.kkw.auction.spring.bean.AucProgress;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface AucProgressRepository extends CrudRepository<AucProgress,Long> {

    Optional<AucProgress> findByproductId(long productId);


}
