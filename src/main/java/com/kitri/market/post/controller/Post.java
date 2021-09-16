package com.kitri.market.post.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kitri.market.post.service.PostDetailService;
import com.kitri.market.post.vo.PostDetailImgVO;
import com.kitri.market.post.vo.PostDetailReportVO;
import com.kitri.market.post.vo.PostDetailVO;

@Controller
@RequestMapping("/post")
public class Post {
	
	@Autowired
	private PostDetailService postDetailService;

	/* 글 작성화면 */
	@RequestMapping("")
    public String post() {
        return "post/posting";
    }

	/* 글 작성 */
	@RequestMapping("/write")
    public String write() {
        return "redirect:/";
    }

	/* int boardid */
	@RequestMapping("/postDetail")
    public String postDetail(Model model) {
		
		//test
		int boardid = 4;
		
		PostDetailVO pdvo = postDetailService.selectPostDetail(boardid);
		PostDetailReportVO pdrvo = postDetailService.selectReport(boardid);
		List<PostDetailImgVO> pdList = postDetailService.getImgBoardList(boardid);
		
		System.out.println("post pdvo : " + pdvo);
		System.out.println("userimg prdvo : " + pdrvo);
		
		model.addAttribute("post",pdvo);
		model.addAttribute("report",pdrvo);
		model.addAttribute("pdList", pdList);
		
		
        return "post/postDetail";
    }
	
	@RequestMapping("/userReport")
    public String postReport(Model model) {
		
		//test
		String USERID = "jisoo";
		
		
		//test
		int boardid = 4;
		
		PostDetailVO pdvo = postDetailService.selectPostDetail(boardid);
		PostDetailReportVO pdrvo = postDetailService.selectReport(boardid);
		
		model.addAttribute("post",pdvo);
		model.addAttribute("report",pdrvo);
		
		
        return "post/postDetail";
    }
	
	@RequestMapping("/postModify")
    public String postModify() {
        return "post/postModify";
    }
	
	
}
