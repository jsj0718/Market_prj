package com.kitri.market.post.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kitri.market.chat.service.ChatRoomService;
import com.kitri.market.chat.vo.ChatRoomVO;
import com.kitri.market.post.service.PostDetailService;
import com.kitri.market.post.vo.PostDetailImgVO;
import com.kitri.market.post.vo.PostDetailReportVO;
import com.kitri.market.post.vo.PostDetailVO;

@Controller
@RequestMapping("/post")
public class Post {
	
	@Autowired
	private PostDetailService postDetailService;

	@Autowired
	private ChatRoomService crservice;
	
	/* 글 작성화면 */
	@RequestMapping("")
    public String post() {
		
		
		
        return "post/posting";
    }

	/* 글 작성 */
	@RequestMapping("/write")
    public String write(PostDetailImgVO pdivo,PostDetailVO pdvo,MultipartFile uploadfile, HttpServletRequest req, HttpSession session) {
		
		// 회원가입을 누르면 실행
		String uploadPath = req.getRealPath("uploadfolder");
//	    String uploadPath = "C:\\Java\\Spring_prj\\market\\src\\main\\webapp\\uploadfolder";
		// 사진 이름이 들어옴 savename
		String saveName = uploadfile.getOriginalFilename();
		// 업로드 파일 경로 uploadfolder 인데 market에는 저장아님 , 아파치톰캣 저장
		String uploadUniquePath = uploadPath+File.separator;
		//초기 값
		boolean uploadConfirm = false;
		String path="";
		
		try {
			
			// 디버그로 보면 패스에 uploaduniquepath 들어와 있음
			File idFile = new File(uploadUniquePath);
			
			// 경로에 폴더가 존재 하는지 확인
			// 폴더가 없으면 (!) 폴더 생성
			if(!idFile.exists()) {
				idFile.mkdir();
			}
			
			// 경로잡기 uploadPath+"/"+savename
			File saveFile = new File(idFile, saveName); 
			
			// transferTo로 원하는 위치에 저장
			uploadfile.transferTo(saveFile);
			// true 저장 됬으면
			uploadConfirm = true;
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
			uploadConfirm = false;
		} catch (IOException e) {
			e.printStackTrace();
			uploadConfirm = false;
		}
		
		// 여기로 옴
		if(uploadConfirm) {
			// 이미지 set
			pdivo.setImg(File.separator+"upload"+File.separator+saveName);
		}
		//완료 체크
		boolean registCheckFlag = postDetailService.registPosting(pdvo,pdivo);
				
		if(registCheckFlag) {
			//메인으로 가기
			path = "redirect:/index";
		}
		else {
			path = "redirect:/post";
		}
		
        return path;
    }
	
	
	/* 상세보기 페이지 */
	@RequestMapping(value="/postDetail", method=RequestMethod.GET)
    public String postDetail(Model model, int boardid) {
		
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
		
		int boardid = 4;
		
		PostDetailVO pdvo = postDetailService.selectPostDetail(boardid);
		PostDetailReportVO pdrvo = postDetailService.selectReport(boardid);
		
		model.addAttribute("post",pdvo);
		model.addAttribute("report",pdrvo);
		
		
        return "post/postDetail";
    }

	/* 게시글 수정 */
	@RequestMapping("/postModify")
    public String postModify(PostDetailImgVO pdivo,PostDetailVO pdvo,MultipartFile uploadfile, HttpServletRequest req, HttpSession session) {
		// 회원가입을 누르면 실행
		String uploadPath = req.getRealPath("uploadfolder");
//	    String uploadPath = "C:\\Java\\Spring_prj\\market\\src\\main\\webapp\\uploadfolder";
		// 사진 이름이 들어옴 savename
		String saveName = uploadfile.getOriginalFilename();
		// 업로드 파일 경로 uploadfolder 인데 market에는 저장아님 , 아파치톰캣 저장
		String uploadUniquePath = uploadPath+File.separator;
		//초기 값
		boolean uploadConfirm = false;
		String path="";
		
		try {
			
			// 디버그로 보면 패스에 uploaduniquepath 들어와 있음
			File idFile = new File(uploadUniquePath);
			
			// 경로에 폴더가 존재 하는지 확인
			// 폴더가 없으면 (!) 폴더 생성
			if(!idFile.exists()) {
				idFile.mkdir();
			}
			
			// 경로잡기 uploadPath+"/"+savename
			File saveFile = new File(idFile, saveName); 
			
			// transferTo로 원하는 위치에 저장
			uploadfile.transferTo(saveFile);
			// true 저장 됬으면
			uploadConfirm = true;
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
			uploadConfirm = false;
		} catch (IOException e) {
			e.printStackTrace();
			uploadConfirm = false;
		}
		
		// 여기로 옴
		if(uploadConfirm) {
			// 이미지 set
			pdivo.setImg(File.separator+"upload"+File.separator+saveName);
		}
		//완료 체크
		boolean registCheckFlag = postDetailService.registPosting(pdvo,pdivo);
				
		if(registCheckFlag) {
			//메인으로 가기
			path = "redirect:/index";
		}
		else {
			path = "redirect:/post";
		}
		
        return path;
    }
	
	@RequestMapping("/buyerlist")
	@ResponseBody
	public List<ChatRoomVO> buyerList(int boardid) {
	  List<ChatRoomVO> crlist = crservice.searchBuyerList(boardid);
	  
	  return crlist;
	}
	
	@RequestMapping("choice-buyer")
	@ResponseBody
	public int choiceBuyer(@RequestParam int boardid, @RequestParam String sender) {
	  return postDetailService.updateBuyer(boardid, sender);
	}
	
	
}
