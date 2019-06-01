package io.kkw.auction.spring.api.auctioncrud;

import com.google.gson.Gson;
import io.kkw.auction.spring.bean.*;
import io.kkw.auction.spring.service.AuctionService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/read_auction")
public class AuctionReadController {

    @Autowired
    AuctionService auctionService;


    @RequestMapping("/{id}") //한개씩
    public String readAuctionInfo_page(Model model, HttpServletRequest request, @PathVariable long id) throws IOException {
        AucProduct aucProduct = auctionService.findInfo(id);
        InputStream in = getClass().getResourceAsStream(aucProduct.getPicture());
        aucProduct.setPicture("");
        if(aucProduct.getEnddate().after(new Date())){
            AucComplete aucComplete = auctionService.findComplete(id);
            model.addAttribute("CompleteBean", aucComplete);
        }else {
            AucProgress progressBean = auctionService.findProgress(id);
            model.addAttribute("progressBean", progressBean);
        }
        model.addAttribute("informationBean",aucProduct);
        model.addAttribute("picture", IOUtils.toByteArray(in));
        //Join 안하게 내가 짜놨네...
        return "read_action_page";
    }


    @RequestMapping("/read_my_auction") //내가 올린 경매 확인
    public String readMyAuction(HttpServletRequest request){
        HttpSession httpSession = request.getSession();
        UserBean userBean = (UserBean)httpSession.getAttribute("user");
        try{
            AucUser aucUser =(AucUser) userBean;
            //List<AucProduct> beans = auctionService.findMyAuction(aucUser.getId());




        }catch(ClassCastException e){
            e.printStackTrace(); //Admin이 접속했을 때 막아버림
        }
        return null;
    }

    //모두 보여주기
    @RequestMapping("/all")
    public String readAllAuction(Model model){
        Iterable<AucProduct> aucProducts = auctionService.findAll();
        model.addAttribute("auction_list", aucProducts);
        return "auction_page";
    }
    //진행 예정
    @ResponseBody
    @RequestMapping("/plan")
    public List<AucProduct> readPlan(){
        List<AucProduct> aucProducts = auctionService.findAllPlan();

        return aucProducts;

    }

    //진행 중
    @RequestMapping("/progress")
    public String readProgress(Model model){
        List<AucProduct> aucProducts = auctionService.findAllProgress();
        model.addAttribute("auction_list", aucProducts);
        return "auction_page";
    }
    //완료된 정보
    @RequestMapping("/complete")
    public String readComplete(Model model){
        List<AucProduct> aucProducts = auctionService.findAllComplete();
        model.addAttribute("auction_list", aucProducts);
        return "auction_page";
    }

    //허가받지않은 정보
    @RequestMapping("/unauthorized")
    public String readUnauthorized(Model model){
        List<AucProduct> aucProducts = auctionService.unAuthorized();
        model.addAttribute("auction_list", aucProducts);
        return "auction_page";
    }

    //허가받은 정보

    @RequestMapping("/authorized")
    public String readAuthorized(Model model){
        List<AucProduct> aucProducts = auctionService.authorized();
        model.addAttribute("auction_list", aucProducts);
        return "auction_page";

    }

    @ResponseBody
    @RequestMapping("/search")
    public ResponseEntity<Object> searchAuction(@RequestParam("search") String search){
        List<AucProduct> aucProducts = auctionService.searchAuction(search);
        return null;
    }


    //필요한 거

    /*
    1. 경매 예정
    2. 경매 진행중
    3. 경매 완료
    4. 허가받지 않은 경매 (관리자)
    5. 허기받은 경매 (관리자)
    6. 모든 경매 (관리자)


    로그부분은 따른 Controller에서
    근데 로그중 최고가는 여기서 띄워줘야하네(개인 마다)
    (가격을 써서낼껀지 누를때마다 얼마가 올라가는지)

     */
}
