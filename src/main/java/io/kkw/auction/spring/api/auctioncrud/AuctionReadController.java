package io.kkw.auction.spring.api.auctioncrud;

import com.google.gson.Gson;
import io.kkw.auction.spring.bean.*;
import io.kkw.auction.spring.service.AuctionService;
import io.kkw.auction.spring.service.BiddingService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/read_auction")
public class AuctionReadController {

    @Autowired
    AuctionService auctionService;

    @Autowired
    BiddingService biddingService;


    @RequestMapping("/{id}") //한개씩
    public String readAuctionInfo_page(Model model, HttpServletRequest request, @PathVariable long id) throws IOException {
        AucProduct aucProduct = auctionService.findInfo(id);
        if(aucProduct.getEnddate().after(new Date())){
            AucComplete aucComplete = auctionService.findComplete(id);
            model.addAttribute("CompleteBean", aucComplete);
        }else {
            AucProgress progressBean = auctionService.findProgress(id);
            model.addAttribute("progressBean", progressBean);
        }
        Gson gson = new Gson();
        model.addAttribute("informationBean",gson.toJson(aucProduct));
        return "read_auction_page";
    }

    @ResponseBody
    @RequestMapping("/myauction") //내가 올린 경매 확인
    public ResponseEntity<Object> readMyAuction(HttpServletRequest request){
        HttpSession httpSession = request.getSession();
        UserBean userBean = (UserBean)httpSession.getAttribute("user");
        try{
            AucUser aucUser =(AucUser) userBean;
            List<AucProduct> beans = auctionService.findMyAuction(aucUser.getId());
            return new ResponseEntity<>(beans,HttpStatus.OK);
        }catch(ClassCastException e){
            e.printStackTrace(); //Admin이 접속했을 때 막아버림
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }

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
    @ResponseBody
    @RequestMapping("/progress")
    public  List<AucProduct>  readProgress(Model model){
        List<AucProduct> aucProducts = auctionService.findAllProgress();

        return aucProducts;
    }
    //완료된 정보
    @ResponseBody
    @RequestMapping("/complete")
    public  List<AucProduct> readComplete(Model model){
        List<AucProduct> aucProducts = auctionService.findAllComplete();

        return aucProducts;
    }

    //허가받지않은 정보
    @ResponseBody
    @RequestMapping("/unauthorized")
    public List<AucProduct> readUnauthorized(Model model){
        List<AucProduct> aucProducts = auctionService.unAuthorized();

        return aucProducts;
    }

    //허가받은 정보
    @ResponseBody
    @RequestMapping("/authorized")
    public List<AucProduct> readAuthorized(Model model){
        List<AucProduct> aucProducts = auctionService.authorized();

        return aucProducts;

    }

    @ResponseBody
    @RequestMapping("/search")
    public List<AucProduct> searchAuction(@RequestParam("search") String search){
        List<AucProduct> aucProducts = auctionService.searchAuction(search);
        return aucProducts;
    }
    //이미지 확인
    @ResponseBody
    @GetMapping(
            value = "/load/{id}",
            produces =  MediaType.IMAGE_JPEG_VALUE
    )
    public ResponseEntity<byte[]> loadImage(@PathVariable("id") long product_id) throws Exception{
        InputStream in = null;
        ResponseEntity<byte[]> entity = null;
        AucProduct aucProduct = auctionService.findInfo(product_id);
        try{
            in = new FileInputStream("C:/img/"+aucProduct.getPicture());
            entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);
        }catch(Exception e){
            e.printStackTrace();
            entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
        }finally{
            in.close();
        }

        return entity;
    }

    //진행 예정+검색
    @ResponseBody
    @RequestMapping("/plan/search")
    public List<AucProduct> readPlanAndSearch(@RequestParam("search") String search){
        List<AucProduct> aucProducts = auctionService.findAllPlanAndSearch(search);

        return aucProducts;

    }

    //진행 중 + 검색
    @ResponseBody
    @RequestMapping("/progress/search")
    public  List<AucProduct>  readProgressAndSearch(@RequestParam("search") String search){
        List<AucProduct> aucProducts = auctionService.findAllProgressAndSearch(search);

        return aucProducts;
    }
    //완료된 정보 + 검색
    @ResponseBody
    @RequestMapping("/complete/search")
    public  List<AucProduct> readCompleteAndSearch(@RequestParam("search") String search){
        List<AucProduct> aucProducts = auctionService.findAllCompleteAndSearch(search);

        return aucProducts;
    }
    //값 확인
    @ResponseBody
    @RequestMapping("/price/{id}")
    public long currentPrice(@PathVariable int id){
        long current = biddingService.currentbidding(id);
        return current;
    }


    @ResponseBody
    @RequestMapping("/check/{id}")
    public ResponseEntity<Object> check(@PathVariable int id, @SessionAttribute("user")UserBean userBean){
        if(!(userBean instanceof AucUser)){
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        AucProduct aucProduct =auctionService.findInfo(id);
        AucComplete aucComplete = auctionService.findComplete(id);
        AucUser user = (AucUser) userBean;
        if (user.getId().equals(aucComplete.getTenderUserId())) {
            //낙찰
            auctionService.check(1,aucProduct);
        }else if(user.getId().equals(aucProduct.getUserid())){
            auctionService.check(2,aucProduct);
            //등록
        }else
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        return new ResponseEntity<>(HttpStatus.OK);

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
