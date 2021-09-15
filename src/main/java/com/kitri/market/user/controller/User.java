package com.kitri.market.user.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kitri.market.user.service.NaverUserService;
import com.kitri.market.user.service.UserService;
import com.kitri.market.user.vo.UserVO;
import com.kitri.market.user.vo.NaverUserVO;

@Controller
@RequestMapping("/login") // market/login/signin
public class User {
	
	// 네이버 유저 서비스
	@Autowired
	private NaverUserService NaverUserService;
	
	@Autowired
	private UserService userService;
	
	// 로그인 페이지
	@RequestMapping("/signin")
	public String signin() {
		return "login/signin";
	}
	
	// 로그인 체크
	@RequestMapping("/signincheck")
	@ResponseBody
	public boolean signincheck(UserVO uvo, HttpSession session) {
		boolean signinFlag = userService.signinCheckUser(uvo);
		
		if(signinFlag) {
			session.setAttribute("userid", uvo.getUserid());
		}
		
		return signinFlag;
	}
	
	// 회원가입 페이지 이동
	@RequestMapping("/signup")
	public String signup() {
		return "login/signup";
	}
	
	// id 중복체크
	@RequestMapping("/idcheck")
	@ResponseBody
	public boolean idCheck(String userid) {
		
		boolean idCheckFlag = userService.idCheck(userid);
		
		return idCheckFlag;
	}
	
	// 회원가입 등록
	@RequestMapping("/signup-regist")
	public String signupRegist(UserVO uvo, HttpSession session) {
		
		// session으로 file경로 받음
		uvo.setImg((String) session.getAttribute("filePath"));
		boolean registCheckFlag = userService.registUser(uvo);
		String path = "";
		
		// 성공하면 로그인 페이지로
		if(registCheckFlag) {
			path = "redirect:/login/signin";
		
		// 실패하면 그대로 회원가입 페이지로
		} else {
			path = "redirect:/login/signup";
		}
		
		return path;
		
	}
	
//	@RequestMapping("/signup-regist")
//	public String signupAddrRegist(UserInfoVO uivo, HttpSession session) {
//		boolean registAddrCheck = userService.registAddr(uivo);
//		String path = "";
//		// 성공하면 로그인 페이지로
//				if(registAddrCheck) {
//					path = "redirect:/login/signin";
//				
//				// 실패하면 그대로 회원가입 페이지로
//				} else {
//					path = "redirect:/login/signup";
//				}
//				
//				return path;
//	}
	
	// 사진 맵핑
	@RequestMapping("/img-regist")
	public String fileupload(MultipartFile uploadfile, HttpServletRequest req, HttpSession session) {
		
		String uploadPath = req.getRealPath("uploadfolder");
		String saveName = uploadfile.getOriginalFilename();
		String uploadUniquePath = uploadPath+File.separator;		
		
		boolean uploadConfirm = false;
		boolean registFlag = false;
		String path;
		
		try {
		
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
			uploadConfirm = true;
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
			uploadConfirm = false;
		} catch (IOException e) {
			e.printStackTrace();
			uploadConfirm = false;
		}
		
		// 가입 확인
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
	
	// 네이버 로그인 맵핑
	@RequestMapping("/naverlogin")
	public String naverlogin() {
		return "login/naverlogin";
	}
	
	// 네이버 로그인 체크
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
