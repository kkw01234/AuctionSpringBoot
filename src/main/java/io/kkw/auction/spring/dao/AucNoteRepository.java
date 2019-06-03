package io.kkw.auction.spring.dao;

import io.kkw.auction.spring.bean.AucNote;

import io.kkw.auction.spring.bean.AucNoteId;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface AucNoteRepository extends CrudRepository<AucNote, AucNoteId> {

    //개인마다 받은 쪽지
    List<AucNote> findAllByReceiveId(String receiveId);
    //개인마다 보낸 쪽지
    List<AucNote> findAllBySendId(String sendId);
    //하나정보
}
