package io.kkw.auction.spring.service;


import io.kkw.auction.spring.dao.AucNoteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoteService {
    @Autowired
    AucNoteRepository aucNoteRepository;


    // 받은 쪽지 전체 보기
    public void receiveAllMessage(){

    }

    //보낸 쪽지 전체 보기
    public void sendAllMessage(){

    }

    //각자 쪽지 보기
    public void readNote(){

    }

    //쪽지 보내기
    //쪽지 삭제 X
    //수정 X
}
