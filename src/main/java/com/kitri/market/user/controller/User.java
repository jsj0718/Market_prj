package com.kitri.market.user.controller;

import java.io.File;
import java.io.IOException;
//import java.util.UUID;
//import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.multipart.MultipartRequest;

import com.kitri.market.user.service.NaverUserService;
import com.kitri.market.user.service.UserService;
import com.kitri.market.user.vo.UserVO;
//import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.kitri.market.user.vo.NaverUserVO;

@Controller
@RequestMapping("/login")
public class User {
	
//	private static final String UPLOAD_PATH = "C:\\java_study\\spring-workspace\\Market_prj\\src\\main\\webapp\\uploadfolder";
	
	@Autowired
	private NaverUserService NaverUserService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/signin")
	public String signin() {
		return "login/signin";
	}
	
	@RequestMapping("/signincheck")
	@ResponseBody
	public boolean signincheck(UserVO uvo, HttpSession session) {
		boolean signinFlag = userService.signinCheckUser(uvo);
		
		if(signinFlag) {
			session.setAttribute("userid", uvo.getUserid());
		}
		
		return signinFlag;
	}
	
	@RequestMapping("/signup")
	public String signup() {
		return "login/signup";
	}
	
	@RequestMapping("/idcheck")
	@ResponseBody
	public boolean idCheck(String userid) {
		
		boolean idCheckFlag = userService.idCheck(userid);
		
		return idCheckFlag;
	}
	
	@RequestMapping("/signup-regist")
	public String signupRegist(UserVO uvo, HttpSession session) {
		uvo.setImg((String) session.getAttribute("filePath"));
		boolean registCheckFlag = userService.registUser(uvo);
		String path = "";
		
		if(registCheckFlag) {
			path = "redirect:/login/signin";
			
		} else {
			path = "redirect:/login/signup";
		}
		
		return path;
		
	}
	

	@RequestMapping("/img-regist")
	public String fileupload(MultipartFile uploadfile, String content, HttpServletRequest req, HttpSession session) {
		
		String uploadPath = req.getRealPath("uploadfolder");
		String saveName = uploadfile.getOriginalFilename();
		String uploadUniquePath = uploadPath+File.separator;		
		
		boolean uploadConfirm = false;
		boolean registFlag = false;
		String path;
		
		try {
		
			File idFile = new File(uploadUniquePath);
			
			if(!idFile.exists()) {
				idFile.mkdir();
			}
		
			File saveFile = new File(idFile, saveName); // 경로잡기 uploadPath+"/"+savename
		
			uploadfile.transferTo(saveFile);
			uploadConfirm = true;
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
			uploadConfirm = false;
		} catch (IOException e) {
			e.printStackTrace();
			uploadConfirm = false;
		}
		
		// 가입 확인 ok
		String insertImgPath = "";
		if(uploadConfirm) {
			// 세션에 파일 정보 저장
			insertImgPath = File.separator+"upload"+File.separator+saveName;
			session.setAttribute("filePath", insertImgPath);
		}
		 
		if (registFlag) {
			path = "redirect:/login/signup";
		} else {
			path = "redirect:/login/signup";

		}
		 
		
		return path;
		
	}
	
	@RequestMapping("/naverlogin")
	public String naverlogin() {
		return "login/naverlogin";
	}
	
	@RequestMapping("/naverlogincheck")
	@ResponseBody
	public NaverUserVO naverLoginCheck(@RequestBody NaverUserVO nuvo, HttpSession session) {
//		System.out.println(nuvo.getEmail());
//		System.out.println(nuvo.getName());
//		System.out.println(nuvo.getBirthday());
//		System.out.println(nuvo.getMobile());
		
		// 이미 등록이 되있는지 조회
		// 등록이 안되있으면 등록 후 로그인 / 되어있으면 등록없이 로그인
		NaverUserVO vo = NaverUserService.registNaverUser(nuvo);
		session.setAttribute("userid", vo.getEmail());
		
//		System.out.println(email);
//		System.out.println(name);
		
		return vo;
		
	}
	
}
