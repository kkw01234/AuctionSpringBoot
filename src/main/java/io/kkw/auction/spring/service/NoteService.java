package io.kkw.auction.spring.service;


import io.kkw.auction.spring.bean.AucNote;
import io.kkw.auction.spring.dao.AucNoteRepository;
import jdk.nashorn.internal.runtime.ListAdapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.NoResultException;
import javax.swing.text.html.Option;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class NoteService {
    @Autowired
    AucNoteRepository aucNoteRepository;


    // 받은 쪽지 전체 보기
    public List<AucNote> receiveAllMessage(String receiveId){
        List<AucNote> aucNotes = aucNoteRepository.findAllByReceiveIdAndRecvDel(receiveId,false);
        return aucNotes;
    }

    //보낸 쪽지 전체 보기
    public List<AucNote> sendAllMessage(String sendId){
        List<AucNote> aucNotes = aucNoteRepository.findAllBySendIdAndSentDel(sendId, false);
        return aucNotes;
        //sent_del
    }

    //각자 쪽지 보기
    public AucNote readNote(long id){
        Optional<AucNote> aucNote = aucNoteRepository.findById(id);
        if (aucNote.orElseThrow(() -> new NoResultException("NOT FOUND")).getDataRead() == null){
                AucNote note = aucNote.get();
                note.setDataRead(new Date());
                note.setRecvRead(true);
                aucNote =Optional.of(aucNoteRepository.save(note));
        }
        return aucNote.orElse(null);
    }

    //쪽지 보내기
    public boolean sendNote(String sendId, String receiveId,Date today, String content){
        AucNote aucNote = new AucNote();
        aucNote.setSendId(sendId);
        aucNote.setReceiveId(receiveId);
        aucNote.setDataSend(today);
        aucNote.setContent(content);

        long nextval = aucNoteRepository.getNextVal();
        aucNote.setId(nextval);
        try {
            AucNote aucNote1 = aucNoteRepository.save(aucNote);
            return true;
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
    //쪽지 삭제
    public void deleteNote(long id, String user_id, boolean sendOrReceive){
        if(sendOrReceive){//true : send , false receive
            Optional<AucNote> send = aucNoteRepository.findBySendIdAndId(user_id, id);

            if(send.orElseThrow(() -> new NoResultException("NOT FOUND")).isRecvRead()){
                aucNoteRepository.delete(send.get());
            }else{
                AucNote note = send.get();
                note.setSentDel(true);
                aucNoteRepository.save(note);
            }
        }else{
            Optional<AucNote> send = aucNoteRepository.findByReceiveIdAndId(user_id,id);
            if(send.orElseThrow(() -> new NoResultException("NOT FOUND")).isSentDel()){
                aucNoteRepository.delete(send.get());
            }else{
                AucNote note = send.get();
                note.setRecvDel(true);
                aucNoteRepository.save(note);
            }
        }
    }
    //수정 후 recv_del, sent_del 두개
    //수정 X
}
