package io.kkw.auction.spring.api.auctioncrud;


import io.kkw.auction.spring.bean.AucUser;
import io.kkw.auction.spring.service.AuctionService;
import net.bytebuddy.utility.RandomString;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/create_auction")
public class AuctionCreateController {


    @Autowired
    AuctionService auctionService;

    //경매정보 업로드
    @ResponseBody
    @RequestMapping("/new") //AJAX 할지 말지 결정해주세여
    public String uploadAction(HttpServletRequest request, @RequestPart MultipartFile sourceFile) {
        AucUser user = (AucUser) request.getSession().getAttribute("user");
        String title = request.getParameter("title");
        String psubject = request.getParameter("subject");
        String pcontent = request.getParameter("content");
        String picture = uploadImage(sourceFile);
        String start_date_string = request.getParameter("start_date");
        String end_date_string = request.getParameter("end_date");
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date start_date = null;
        Date end_date = null;
        long price = Long.parseLong(request.getParameter("price"));
        try {
            start_date = format.parse(start_date_string.replace("T", " "));
            end_date = format.parse(end_date_string.replace("T", " "));
        } catch (Exception e) {
            e.printStackTrace();
        }

        //AucProduct aucProduct = new AucProduct(user.getId(), title,pname,psubject,pcontent,picture,end_date);
        Boolean result = auctionService.addAuction(user.getId(), title, psubject, pcontent, picture, start_date, end_date, price);
        return (result)?"success":"fail";
    }


    //insert(Create) page
    // 경매 올릴 수 있는사이트
    @RequestMapping
    public String uploadAuction_page() {

        return "upload_auction_page";
    }

    //이미지 업로드 코드
    public static String uploadImage(MultipartFile sourceFile){
        String sourceFileName = sourceFile.getOriginalFilename();
        String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase();

        File destinationFile;
        String destinationFileName;
        String fileurl = "C:/img/";
        do{
            SimpleDateFormat format = new SimpleDateFormat(("yyyyMMddHHmmss"));
            String today =format.format(System.currentTimeMillis());
            destinationFileName = today+ RandomString.make(10)+"."+sourceFileNameExtension;
            destinationFile = new File(fileurl+destinationFileName);
        }while(destinationFile.exists());

        destinationFile.getParentFile().mkdirs();
        try {
            sourceFile.transferTo(destinationFile);
        }catch (Exception e){
            e.printStackTrace();
        }

        return destinationFileName; //데이터베이스에는 이름만 저장
    }

}


