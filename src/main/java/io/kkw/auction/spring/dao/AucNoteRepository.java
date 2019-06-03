package io.kkw.auction.spring.dao;

import io.kkw.auction.spring.bean.AucNote;

import io.kkw.auction.spring.bean.AucNoteId;
import io.kkw.auction.spring.bean.AucUser;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface AucNoteRepository extends CrudRepository<AucNote, Long> {

    //개인마다 받은 쪽지
    List<AucNote> findAllByReceiveIdAndRecvDel(String receiveId, boolean recvDel);
    //개인마다 보낸 쪽지
    List<AucNote> findAllBySendIdAndSentDel(String sendId, boolean sentDel);

    Optional<AucNote> findByReceiveIdAndId(String receiveId, long id);

    Optional<AucNote> findBySendIdAndId(String sendId, long id);

    @Query(value = "SELECT auc_note_auto.nextval FROM dual", nativeQuery = true)
    long getNextVal();
    //하나정보

}
