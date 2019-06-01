package io.kkw.auction.spring.api.auctioncrud;

import io.kkw.auction.spring.bean.*;
import io.kkw.auction.spring.service.AuctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("/modify_auction")
public class AuctionUpdateCotroller {

    @Autowired
    AuctionService auctionService;

    //관리자가 허가 하기
    @RequestMapping("/checkauthorize/{id}")
    @ResponseBody
    public ResponseEntity<Object> checkAuthorize(@SessionAttribute("user") UserBean user, @PathVariable int id){
        AucAdmin aucAdmin = null;
        if (user instanceof  AucAdmin) {
            aucAdmin = (AucAdmin) user;
        }else{
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        boolean bool = auctionService.checkAuthorize(id, aucAdmin.getId());
        if(bool){
            return new ResponseEntity<>(HttpStatus.OK);
        }
        return null;
    }

    //관리자 허가 취소
    @RequestMapping("/cancelahthorize/{id}")
    public ResponseEntity<Object> cancelAuthorize(@SessionAttribute("user") UserBean user, @PathVariable int id){
        AucAdmin aucAdmin = null;
        if (user instanceof  AucAdmin) {
            aucAdmin = (AucAdmin) user;
        }else{
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        boolean result = auctionService.cancelAuthorize(id, aucAdmin.getId());
        if(result) {
            return new ResponseEntity<>(HttpStatus.OK);
        }else
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    //개인이 올린 것을 수정하기
    @RequestMapping("/{id}")
    public String modifyAuctionPage(Model model,@SessionAttribute("user") UserBean userBean, @PathVariable("id")long id, HttpServletRequest request){
        String title = request.getParameter("title");
        String pname = request.getParameter("pname");
        String psubject = request.getParameter("psubject");
        String pcontent = request.getParameter("pcontent");
        String picture = null;
        String startdate = request.getParameter("startdate");
        String enddate = request.getParameter("enddate");
        //AucProduct aucProduct = auctionService.modifyAuction();
        return null;
    }

    //수정 페이지
    @RequestMapping
    public String modifyAction(HttpServletRequest request){

        return null;
    }

}
