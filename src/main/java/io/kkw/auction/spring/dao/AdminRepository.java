package io.kkw.auction.spring.dao;

import io.kkw.auction.spring.bean.AucAdminBean;
import org.springframework.data.repository.CrudRepository;

public interface AdminRepository extends CrudRepository<AucAdminBean, String> {

    AucAdminBean findByIdAndPassword(String id, String password);
}
