package io.kkw.auction.spring.dao;

import io.kkw.auction.spring.bean.AucUser;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

//여기서 쿼리문 처리 하면 됩니다.
public interface UserRepository extends CrudRepository<AucUser, String> {

    List<AucUser> findAll();

    List<AucUser> findByPassword(String password);

    List<AucUser> findByEmail(String email);

    // List<AucUser> findByAddress(String address);

    List<AucUser> findByPhone(String phone);

    List<AucUser> findByAccount(String account);

    // @Query("SELECT * FROM auc_user") d이렇게 쿼리문 작성하면됩니다.
    // List<AucUser> findAllBy();

    AucUser findByIdAndPassword(String id, String Password);
}
