package io.kkw.auction.spring.api;


import io.kkw.auction.spring.bean.AucInformationBean;
import io.kkw.auction.spring.bean.AucInterestBean;
import io.kkw.auction.spring.bean.AucUserBean;
import io.kkw.auction.spring.bean.UserBean;
import io.kkw.auction.spring.service.AuctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class AuctionUploadController {

    @Autowired
    AuctionService auctionService;

    @RequestMapping("/upload_auction_page")
    public String uploadAuction_page(){
        return "upload_action_page";
    }

    @RequestMapping("/upload_action") //AJAX 할지 말지 결정해주세여
    public String uploadAction(HttpServletRequest request){
            AucUserBean user = (AucUserBean) request.getSession().getAttribute("user");
            String title = request.getParameter("title");
            String pname = request.getParameter("name");
            String psubject = request.getParameter("subject");
            String pcontent = request.getParameter("content");
            String picture = request.getParameter("picture");
            String end_date_string = request.getParameter("end_date");
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date end_date=null;
            try {
                end_date = format.parse(end_date_string);
            }catch(Exception e){
                e.printStackTrace();
            }
            /*
            AucInformationBean aucInformationBean = new AucInformationBean(user.getId(), title,pname,psubject,pcontent,picture,end_date);
            auctionService.addAuction(aucInformationBean);
           */

        return null;
    }

}
