package io.kkw.auction.spring.api.auctioncrud;

import com.google.gson.Gson;
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
    public ResponseEntity<Object> checkAuthorize(@SessionAttribute("user") UserBean user, @PathVariable int id) {
        AucAdmin aucAdmin = null;
        if (user instanceof AucAdmin) {
            aucAdmin = (AucAdmin) user;
        } else {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        boolean bool = auctionService.checkAuthorize(id, aucAdmin.getId());
        if (bool) {
            return new ResponseEntity<>(HttpStatus.OK);
        }
        return null;
    }

    //관리자 허가 취소
    @RequestMapping("/cancleauthorized/{id}")
    public ResponseEntity<Object> cancelAuthorize(@SessionAttribute("user") UserBean user, @PathVariable int id) {
        AucAdmin aucAdmin = null;
        if (user instanceof AucAdmin) {
            aucAdmin = (AucAdmin) user;
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        boolean result = auctionService.cancelAuthorize(id, aucAdmin.getId());
        if (result) {
            return new ResponseEntity<>(HttpStatus.OK);
        } else
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    //개인이 올린 것을 수정하기
    @ResponseBody
    @RequestMapping()
    public String modifyAuctionPage(@SessionAttribute("user") UserBean userBean,
                                    @RequestParam("id") long id,
                                    HttpServletRequest request,
                                    @RequestParam("price") long price) {


        if (!(userBean instanceof AucUser)) {
            return null;
        }
        AucUser aucUser = (AucUser) userBean;
        String title = request.getParameter("title");
        String psubject = request.getParameter("psubject");
        String pcontent = request.getParameter("pcontent");
        String start_date_string = request.getParameter("startdate");
        String end_date_string = request.getParameter("enddate");
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date start_date = null;
        Date end_date = null;
        try {
            start_date = format.parse(start_date_string.replace("T", " "));
            end_date = format.parse(end_date_string.replace("T", " "));
            AucProduct aucProduct = auctionService.modifyAuction(id, aucUser.getId(), title, psubject, pcontent, null, start_date, end_date, price);
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
        return "success";
    }

    //개인이 올린 것을 수정하기
    @ResponseBody
    @RequestMapping("/newImage")
    public String modifyAuctionPage(@SessionAttribute("user") UserBean userBean,
                                    @RequestParam("id") long id,
                                    HttpServletRequest request,
                                    @RequestPart MultipartFile sourceFile,
                                    @RequestParam("price") long price) {


        if (!(userBean instanceof AucUser)) {
            return null;
        }
        AucUser aucUser = (AucUser) userBean;
        String title = request.getParameter("title");
        String psubject = request.getParameter("psubject");
        String pcontent = request.getParameter("pcontent");

        String picture = null;
        picture = AuctionCreateController.uploadImage(sourceFile);

        String start_date_string = request.getParameter("startdate");
        String end_date_string = request.getParameter("enddate");
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date start_date = null;
        Date end_date = null;
        try {
            start_date = format.parse(start_date_string.replace("T", " "));
            end_date = format.parse(end_date_string.replace("T", " "));
            AucProduct aucProduct = auctionService.modifyAuction(id, aucUser.getId(), title, psubject, pcontent, picture, start_date, end_date, price);
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
        return "success";
    }

    //수정 페이지
    @RequestMapping("/{id}")
    public String modifyAction(@PathVariable int id, Model model) {
        AucProduct aucProduct = auctionService.findInfo(id);
        model.addAttribute("product", new Gson().toJson(aucProduct));
        return "modify_auction_page";
    }


}
