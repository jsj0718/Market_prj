package com.kitri.market.admin.controller;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kitri.market.admin.pagination.Criteria;
import com.kitri.market.admin.pagination.PageMaker;
import com.kitri.market.admin.service.AdminService;
import com.kitri.market.admin.vo.AdminAnalysisVO;
import com.kitri.market.admin.vo.AdminBlacklistVO;

@Controller
@RequestMapping("/admin")
public class AdminController {

  @Autowired
  private AdminService adminservice;
	

	//-------관리자 페이지 차트분석란-------------
	@RequestMapping("/analysis")
	public String analysis(HttpSession session) {
	  String userid = (String)session.getAttribute("userid");
	  if(userid.equals("admin")) {
	    return "admin/analysis";
	  }else {
	  
	    return "redirect:/index";
	  }
	  
	}
	
//----------------gender---------
	@RequestMapping("/gender-graph")
	@ResponseBody
	public String genderAnalysis(HttpServletRequest req, AdminAnalysisVO avo) {
	
	  
	  List<AdminAnalysisVO> list = adminservice.searchUserGender();
    req.setAttribute("list", list);
    
    HashMap map = new HashMap();
    map.put("list", list);

    String json =null;
    try {
      json = new ObjectMapper().writeValueAsString(map);

    } catch (JsonProcessingException e) {
      e.printStackTrace();
    }
    return json;

	}
	//----------------age-----------
	@RequestMapping("/age-graph")
  @ResponseBody
  public String ageAnalysis(HttpServletRequest req, AdminAnalysisVO avo) {
    
    List<AdminAnalysisVO> list = adminservice.searchUserAge();
    req.setAttribute("list", list);
    
    HashMap map = new HashMap();
    map.put("list", list);

    String json =null;
    try {
      json = new ObjectMapper().writeValueAsString(map);

    } catch (JsonProcessingException e) {
      e.printStackTrace();
    }
    return json;
    
  
  }
	//------------------daily--------
	@RequestMapping("/daily-graph")
	@ResponseBody
	public String dailyAnalysis(HttpServletRequest req, AdminAnalysisVO avo) {
	  
	  List<AdminAnalysisVO> list = adminservice.searchDailyBoard();
	  req.setAttribute("list", list);
	  
	  HashMap map = new HashMap();
	  map.put("list", list);
	  
	  String json =null;
	  try {
	    json = new ObjectMapper().writeValueAsString(map);
	    
	  } catch (JsonProcessingException e) {
	    e.printStackTrace();
	  }
	  return json;
	  
	  
	}
	
//	------ 거래 완료된 유저의 게시물 수 ------
	@RequestMapping("/complete-graph")
	@ResponseBody
	public String completeBoardAnalysis(HttpServletRequest req, AdminAnalysisVO avo) {
	  
	  List<AdminAnalysisVO> list = adminservice.searchCompleteBoard();
	  req.setAttribute("list", list);
	  
	  HashMap map = new HashMap();
	  map.put("list", list);
	  
	  String json =null;
	  try {
	    json = new ObjectMapper().writeValueAsString(map);
	    
	  } catch (JsonProcessingException e) {
	    e.printStackTrace();
	  }
	  return json;
	  
	  
	}
//	------  카테고리 인기유저의 게시물 수 -----
	@RequestMapping("/category-graph")
	@ResponseBody
	public String categoryBestAnalysis(HttpServletRequest req, AdminAnalysisVO avo) {
	  
	  List<AdminAnalysisVO> list = adminservice.searchBestCategory();
	  req.setAttribute("list", list);
	  
	  HashMap map = new HashMap();
	  map.put("list", list);
	  
	  String json =null;
	  try {
	    json = new ObjectMapper().writeValueAsString(map);
	    
	  } catch (JsonProcessingException e) {
	    e.printStackTrace();
	  }
	  return json;
	  
	  
	}
	//-----------------------------------레포트 페이지-----------------------------------------------------
	
	//페이징용 
	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public String getFiveListPage(HttpSession session, Model model,Criteria cri) {
	  String userid = (String)session.getAttribute("userid");
    if(userid.equals("admin")) {
     
      List<AdminBlacklistVO> list = adminservice.searchReportList(cri);
      model.addAttribute("list",list);
      
      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(cri);
      pageMaker.setTotalCount(adminservice.reportCount());
      model.addAttribute("pageMaker",pageMaker);
      
      return "admin/report";
    
    }else {
      return "redirect:/index";
    }
    
	}

	//레포트 삭제
	@RequestMapping("/delete-report")
	public String deleteReport(int reportid) {
	  int result = adminservice.deleteReport(reportid);
	  return "redirect:/admin/report";
	}
	//카테고리 추가
	@RequestMapping("/insert-category")
	public String insertCategory(String categoryname) {
	  int result = adminservice.insertCategory(categoryname);
	  return "redirect:/admin/report#categoryPage";
	}
	
	
	 //-----------------------------------블랙리스트 페이지-----------------------------------------------------
	
	//5회이상 리스트 페이징
	@RequestMapping(value = "/blacklist-red", method = RequestMethod.GET)
	public String fiveList(HttpSession session ,Model model, Criteria cri) {
	  String userid = (String)session.getAttribute("userid");
    if(userid.equals("admin")) {
      
      List<AdminBlacklistVO> flist = adminservice.searchFiveList(cri);
      model.addAttribute("flist",flist);
      
      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(cri);
      pageMaker.setTotalCount(adminservice.fiveCount());
      model.addAttribute("pageMaker",pageMaker);
      
      return "admin/blacklist";
     
    }else {
      return "redirect:/index";
    }
	  
	}
	//5회이상 유저 삭제
	@RequestMapping("/delete-five")
	public String deleteFive(String userid) {
	  int result = adminservice.fiveDelete(userid);
	  return "redirect:admin/blacklist-red?page=1";
	}
	
	
	
	//3회이상 리스트 페이징
	 @RequestMapping(value = "/blacklist-yellow", method = RequestMethod.GET)
	 public String threeList(HttpSession session, Model model, Criteria cri) {
	   String userid = (String)session.getAttribute("userid");
	  if(userid.equals("admin")) {
	  
	    List<AdminBlacklistVO> tlist = adminservice.searchThreeList(cri);
	    model.addAttribute("tlist",tlist);
	    
	    PageMaker pageMakerT = new PageMaker();
	    pageMakerT.setCri(cri);
	    pageMakerT.setTotalCount(adminservice.threeCount());
	    model.addAttribute("pageMakerT",pageMakerT);
	    
	    return "admin/blacklist";
	  
	  }else {
	    
	    return "redirect:/index";
	  }
    
	 }
	 //3회 이상 경고(업데이트)
	 @RequestMapping("/update-three")
	 public String updateThree(String userid) {
	   int result = adminservice.threeUpdate(userid);

	   return "redirect:/admin/blacklist-yellow?page=1";
	   
	 }
	 //유저 차트
	 @RequestMapping("/user-chart")
	 @ResponseBody
	 public String userChart(HttpServletRequest req, AdminBlacklistVO abvo) {
	   List<AdminBlacklistVO> list = adminservice.searchUserChart();
	    req.setAttribute("list", list);
	    
	    HashMap map = new HashMap();
	    map.put("list", list);
	    
	    String json =null;
	    try {
	      json = new ObjectMapper().writeValueAsString(map);
	      
	    } catch (JsonProcessingException e) {
	      e.printStackTrace();
	    }
	    return json;
	   
	 }
}
