package io.kkw.auction.spring.api;


import com.sun.org.apache.regexp.internal.RE;
import io.kkw.auction.spring.bean.AucNote;
import io.kkw.auction.spring.bean.AucUser;
import io.kkw.auction.spring.bean.UserBean;
import io.kkw.auction.spring.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/note")
public class NoteController {

    @Autowired
    NoteService noteService;
    //받은 쪽지
    @ResponseBody
    @RequestMapping("/receivelist")
    public ResponseEntity<Object> receiveList(@SessionAttribute("user") UserBean userBean){
        if(!(userBean instanceof AucUser))
            return new ResponseEntity<Object>(HttpStatus.BAD_REQUEST);
        AucUser aucUser = (AucUser) userBean;
        List<AucNote> aucNotes = noteService.receiveAllMessage(aucUser.getId());
        return new ResponseEntity<>(aucNotes, HttpStatus.OK);
    }
    //보낸 쪽지 전체
    @ResponseBody
    @RequestMapping("/sendlist")
    public ResponseEntity<Object> sendList(@SessionAttribute("user") UserBean userBean){
        if(!(userBean instanceof AucUser))
            return new ResponseEntity<Object>(HttpStatus.BAD_REQUEST);
        AucUser aucUser = (AucUser) userBean;
        List<AucNote> aucNotes = noteService.sendAllMessage(aucUser.getId());
        return new ResponseEntity<>(aucNotes, HttpStatus.OK);
    }

    //각자 쪽지
    @ResponseBody
    @RequestMapping("/{id}")
    public ResponseEntity<Object> readNote(@PathVariable int id, @SessionAttribute("user") UserBean userBean){
        if(!(userBean instanceof AucUser))
            return new ResponseEntity<Object>(HttpStatus.BAD_REQUEST);
        AucUser aucUser = (AucUser) userBean;

        AucNote aucNote = noteService.readNote(id);
        return new ResponseEntity<>(aucNote,HttpStatus.OK);
    }
    //검색을 하면 아이디 있는지 없는지 확인

    //쪽지 보내기
    @ResponseBody
    @RequestMapping("/send")
    public ResponseEntity<Object> sendNote(@SessionAttribute("user")UserBean userBean,
                                           @RequestParam("receive_id")String receiveId,
                                           @RequestParam("content") String content){

        if(!(userBean instanceof AucUser))
            return new ResponseEntity<Object>(HttpStatus.BAD_REQUEST);
        AucUser user = (AucUser) userBean;
        AucNote note = new AucNote();
        Date today = new Date();
        note.setReceiveId(receiveId);
        note.setSendId(user.getId());
        note.setDataSend(today);
        note.setContent(content);
        boolean result = noteService.sendNote(note);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    //쪽지 삭제
    @ResponseBody
    @RequestMapping("/delete/{id}")
    public ResponseEntity<Object> deleteNote(@SessionAttribute("user")UserBean userBean,
                                             @PathVariable int id,
                                             @RequestParam("sendorReceive") String sendorReceive){
        if(!(userBean instanceof AucUser))
            return new ResponseEntity<Object>(HttpStatus.BAD_REQUEST);
        AucUser user = (AucUser) userBean;
        try{
            noteService.deleteNote(id, user.getId(), sendorReceive.equals("send"));
            return new ResponseEntity<>(true,HttpStatus.OK);
        }catch(Exception e){
            e.printStackTrace();
            return new ResponseEntity<Object>(false, HttpStatus.BAD_REQUEST);
        }
    }
}
