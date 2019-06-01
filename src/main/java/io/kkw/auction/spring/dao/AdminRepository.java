package io.kkw.auction.spring.dao;

import io.kkw.auction.spring.bean.AucAdmin;
import org.springframework.data.repository.CrudRepository;

public interface AdminRepository extends CrudRepository<AucAdmin, String> {

    AucAdmin findByIdAndPassword(String id, String password);
}
