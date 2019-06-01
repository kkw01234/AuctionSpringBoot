package io.kkw.auction.spring.api.auctioncrud;


import io.kkw.auction.spring.bean.AucUser;
import io.kkw.auction.spring.service.AuctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/create_auction")
public class AuctionCreateController {


    @Autowired
    AuctionService auctionService;

    // /upload_auction
    //Upload 하는 법
    @RequestMapping("/new") //AJAX 할지 말지 결정해주세여
    public String uploadAction(HttpServletRequest request) {
        AucUser user = (AucUser) request.getSession().getAttribute("user");
        String title = request.getParameter("title");
        String pname = request.getParameter("name");
        String psubject = request.getParameter("subject");
        String pcontent = request.getParameter("content");
        String picture = request.getParameter("picture");
        String start_date_string = request.getParameter("start_date");
        String end_date_string = request.getParameter("end_date");
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date start_date = null;
        Date end_date = null;
        try {
            start_date = format.parse(start_date_string);
            end_date = format.parse(end_date_string);
        } catch (Exception e) {
            e.printStackTrace();
        }

        //AucInformation aucInformation = new AucInformation(user.getId(), title,pname,psubject,pcontent,picture,end_date);
        Boolean result = auctionService.addAuction(user.getId(), title, pname, psubject, pcontent, picture, start_date, end_date);


        return null;
    }


    //insert(Create) page
    // 경매 올릴 수 있는사이트
    @RequestMapping
    public String uploadAuction_page() {
        return "upload_auction_page";
    }

}
