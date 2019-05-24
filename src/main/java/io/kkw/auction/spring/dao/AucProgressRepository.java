package io.kkw.auction.spring.dao;

import io.kkw.auction.spring.bean.AucProgressBean;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface AucProgressRepository extends CrudRepository<AucProgressBean,Long> {

    Optional<AucProgressBean> findByPid(long pid);
}
