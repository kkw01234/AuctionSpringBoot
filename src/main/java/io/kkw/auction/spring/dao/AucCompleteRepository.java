package io.kkw.auction.spring.dao;

import io.kkw.auction.spring.bean.AucCompleteBean;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface AucCompleteRepository extends CrudRepository<AucCompleteBean, Long> {

//    Optional<AucCompleteBean> findByAuc_id(long id);
}
