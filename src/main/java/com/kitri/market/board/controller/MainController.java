package com.kitri.market.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kitri.market.board.service.MainService;
import com.kitri.market.board.vo.MainVO;
import com.kitri.market.post.service.PostDetailService;
import com.kitri.market.post.vo.PostDetailImgVO;

@Controller
@RequestMapping("/index")
public class MainController {
    @Autowired
    private MainService mainService;
    
    @Autowired
    private PostDetailService pdservice;

    @RequestMapping("")
    public String main(HttpSession session, Model model) {
//        String userId = "jisoo";
        String userId = (String) session.getAttribute("userid");
        List<MainVO> mList = mainService.getUserAddress(userId);
        // model에 실린 값은 jsp에서 el태그로 활용하면 됨
        model.addAttribute("mList", mList);
        
        //로그인된 회원의 동네 게시글만 뜨도록
        List<MainVO> boardList = mainService.getBoard(userId);
        for (MainVO mvo : boardList) {
            List<PostDetailImgVO> imgList = pdservice.getImgBoardList(mvo.getBoardId());
            if (imgList != null) {
                PostDetailImgVO firstImgVO = imgList.get(0);
                mvo.setImg(firstImgVO.getImg());
            }
        }
        model.addAttribute("boardList", boardList);
        
        //카테고리 불러오기
        List<MainVO> categoryList = mainService.getCategory();
        model.addAttribute("categoryList", categoryList);
        
        return "main/index";
    }
    
    
    //내 동네 탭에서 동네 추가
    @RequestMapping("/address-regist")
    @ResponseBody
    public String addressRegist(String addresscode, HttpSession session) throws Exception{
        String userId = (String) session.getAttribute("userid");
        
        MainVO mvo = new MainVO();
        mvo.setUserId(userId);
        mvo.setAddressCode(addresscode);
        boolean registFlag = mainService.registUserAddress(mvo);
//        System.out.println("addresscode: "+ addresscode);
//        System.out.println("Flag: " + registFlag);
        
        return "redirect:/main/index";
    }
    
    //선택된 동네의 게시물만 불러오기 (AJAX통신)
    @RequestMapping("/address-select")
    @ResponseBody
    public List<MainVO> addressSelect(String addressName) {
        List<MainVO> boardAddressList = mainService.getBoardAddress(addressName);
        return boardAddressList;
    }
    
    //선택된 카테고리의 게시물만 불러오기 (AJAX통신)
    @RequestMapping("/category-select")
    @ResponseBody
    public List<MainVO> categorySelect(String categoryName) {
        List<MainVO> selectCategoryBoard = mainService.getCategoryBoard(categoryName);
        return selectCategoryBoard;
    }
    
    //검색결과(전체지역/Ajax통신)
    @RequestMapping("/search")
    @ResponseBody
    public List<MainVO> searchBoard(String inputSearch) {
        List<MainVO> searchBoardList = mainService.getSearchBoard(inputSearch);
        return searchBoardList;
    }
    
    
}
