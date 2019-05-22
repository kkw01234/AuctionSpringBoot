package io.kkw.auction.spring.api.auctioncrud;

import io.kkw.auction.spring.bean.*;
import io.kkw.auction.spring.service.AuctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/read_auction_page")
public class AuctionReadController {

    @Autowired
    AuctionService auctionService;


    @RequestMapping("/{id}") //한개씩
    public String readAuctionInfo_page(Model model, HttpServletRequest request, @PathVariable long id){
        AucInformationBean informationBean = auctionService.findInfo(id);
        if(informationBean.getEnd_date().after(new Date())){
            AucCompleteBean aucCompleteBean = auctionService.findComplete(id);
            model.addAttribute("CompleteBean", aucCompleteBean);
        }else {
            AucProgressBean progressBean = auctionService.findProgress(id);
            model.addAttribute("progressBean", progressBean);
        }
        model.addAttribute("informationBean",informationBean);
        return "read_action_page";
    }

    @RequestMapping("/myauction") //내가 올린 경매 확인
    public String readmyauction(HttpServletRequest request){
        HttpSession httpSession = request.getSession();
        UserBean userBean = (UserBean)httpSession.getAttribute("user");
        try{
            AucUserBean aucUserBean =(AucUserBean) userBean;
            //List<AucInformationBean> beans = auctionService.findMyAuction(aucUserBean.getId());




        }catch(ClassCastException e){
            e.printStackTrace(); //Admin이 접속했을 때 막아버림
        }
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
