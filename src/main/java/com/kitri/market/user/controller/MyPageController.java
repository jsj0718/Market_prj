package com.kitri.market.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kitri.market.board.service.MainService;
import com.kitri.market.board.vo.MainVO;
import com.kitri.market.user.service.MyPageService;
import com.kitri.market.user.vo.MyPageVO;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
    @Autowired
    private MyPageService mypageService;
    
    @RequestMapping("")
    public String main(Model model) {
        String userId = "jisoo";
        
        return "user";
    }
    
    //판매중인 내역
    @RequestMapping("/sell")
    @ResponseBody
    public List<MyPageVO> selling() {
        String userId = "jisoo";
        List<MyPageVO> sellList = mypageService.getSellList(userId);
        System.out.println("sellList::" + sellList);
        return sellList;
    }
    
    //판매완료 내역
    @RequestMapping("/soldout")
    @ResponseBody
    public List<MyPageVO> soldout() {
        String userId = "jisoo";
        List<MyPageVO> soldoutList = mypageService.getSoldoutList(userId);
        return soldoutList;
    }
    
    //구매내역
    @RequestMapping("/buy")
    @ResponseBody
    public List<MyPageVO> buy() {
        String userId = "jisoo";
        List<MyPageVO> buyList = mypageService.getBuyList(userId);
        return buyList;
    }
    
    
    //나의 동네 리스트 
    @RequestMapping("/address-list")
    @ResponseBody
    public List<MyPageVO> addressList(String userId){
      List<MyPageVO> list = mypageService.searchMyAddress(userId);
      return list;
    }
    
    //나의 동네 삭제
    @RequestMapping("/delete-address")
    public String deleteAddress(MyPageVO mvo) {
      int result = mypageService.deleteAddress(mvo);
      return "redirect:/mypage";
    }
    
    @RequestMapping("/user-info")
    public String userInfo(Model model, String userId) {
      userId = "jisoo";
      List<MyPageVO> list = mypageService.searchMyInfo(userId);
//      System.out.println(list);
      model.addAttribute("list",list);
      return "userInfo";
    }
    

    //회원 수정
    @RequestMapping("/update-info")
    public String updateInfo(MyPageVO mvo) {
     
      int result = mypageService.updateMyInfo(mvo);
//      System.out.println(result);
      return "redirect:/mypage/user-info";
      
    }
    //회원 탈퇴 
    @RequestMapping("/delete-info")
    public String deleteInfo(String userId) {
      userId = "jisoo";
      int result = mypageService.deleteMyInfo(userId);
//      System.out.println(result);
      return "redirect:/mypage/user-info";
    }
    
    

}
