package io.kkw.auction.spring.api.auctioncrud;

import io.kkw.auction.spring.bean.*;
import io.kkw.auction.spring.service.AuctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import sun.java2d.pipe.SpanShapeRenderer;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;


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
    @ResponseBody
    @RequestMapping("/{id}")
    public String modifyAuctionPage(Model model, @SessionAttribute("user") UserBean userBean, @PathVariable("id")long id, HttpServletRequest request, @RequestParam("isNewImage") boolean isNewImage,@RequestPart MultipartFile sourceFile){


        if (!(userBean instanceof AucUser)){
            return null;
        }
        AucUser aucUser = (AucUser) userBean;
        String title = request.getParameter("title");
        String psubject = request.getParameter("psubject");
        String pcontent = request.getParameter("pcontent");
        String picture = null;
        if(isNewImage){
            picture = AuctionCreateController.uploadImage(sourceFile);
        }
        SimpleDateFormat format = new SimpleDateFormat(("yyyy-MM-dd HH:mm:ss"));
        Date startdate = new Date(request.getParameter("startdate"));
        Date enddate = new Date(request.getParameter("enddate"));
        AucProduct aucProduct = auctionService.modifyAuction(id, aucUser.getId(),title,psubject,pcontent,picture,startdate,enddate);
        return null;
    }

    //수정 페이지
    @RequestMapping
    public String modifyAction(HttpServletRequest request){

        return null;
    }


}
