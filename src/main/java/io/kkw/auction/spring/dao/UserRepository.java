package io.kkw.auction.spring.dao;

import io.kkw.auction.spring.bean.AucUserBean;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

//여기서 쿼리문 처리 하면 됩니다.
public interface UserRepository extends CrudRepository<AucUserBean, String> {

    List<AucUserBean> findAll();

    List<AucUserBean> findByPassword(String password);

    List<AucUserBean> findByEmail(String email);

    // List<AucUserBean> findByAddress(String address);

    List<AucUserBean> findByPhone(String phone);

    List<AucUserBean> findByAccount(String account);

    // @Query("SELECT * FROM auc_user") d이렇게 쿼리문 작성하면됩니다.
    // List<AucUserBean> findAllBy();

    AucUserBean findByIdAndPassword(String id, String Password);
}
