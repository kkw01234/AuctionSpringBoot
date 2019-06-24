package io.kkw.auction.spring.api.auctioncrud;


import io.kkw.auction.spring.bean.AucUser;
import io.kkw.auction.spring.bean.UserBean;
import io.kkw.auction.spring.service.AuctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
@RequestMapping("/delete_auction")
public class AuctionDeleteController {

    @Autowired
    AuctionService auctionService;


    //등록 취소
    @RequestMapping("/{id}")
    public ResponseEntity<Object> deleteAuction(@PathVariable long id, @SessionAttribute("user") UserBean userBean){
        //이건 프로시저로 갑시다.
        //product랑 progress
        //DELETE FROM  WHERE
        AucUser aucUser=null;
        if (userBean instanceof AucUser)
            return auctionService.deleteAuction(id,"kkw01234");
        else return new ResponseEntity<Object>("false", HttpStatus.BAD_REQUEST);



    }
}
