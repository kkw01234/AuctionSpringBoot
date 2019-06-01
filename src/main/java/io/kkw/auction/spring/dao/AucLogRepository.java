package io.kkw.auction.spring.dao;

import io.kkw.auction.spring.bean.AucLog;
import org.springframework.data.repository.CrudRepository;

public interface AucLogRepository extends CrudRepository<AucLog, Long> {
}
