package io.kkw.auction.spring.service;

import io.kkw.auction.spring.bean.AucLog;
import io.kkw.auction.spring.bean.AucProduct;
import io.kkw.auction.spring.dao.AucLogRepository;
import io.kkw.auction.spring.dao.AucProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class BiddingService {

    @Autowired
    AucLogRepository aucLogRepository;
    @Autowired
    AucProductRepository aucProductRepository;


    //경매 입찰
    public boolean bidding(long product_id, String user_id, long price){
        try {
            aucLogRepository.saveBidding(product_id, user_id, price);
            return true;
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }

    //현재까지의 금액
    public long currentbidding(long product_id){
        Optional<AucProduct> aucProduct = aucProductRepository.findById(product_id);
        AucLog a = new AucLog();
        a.setPrice(aucProduct.get().getPrice());
        List<AucLog> aucLog = aucLogRepository.findByProductIdOrderByPrice(product_id);
        System.out.println(a.getPrice()+" "+aucLog.get(0).getPrice());
        return aucLog.get(0).getPrice();
    }

}


