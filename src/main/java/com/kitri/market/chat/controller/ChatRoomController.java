package com.kitri.market.chat.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kitri.market.chat.service.ChatMessageServiceImpl;
import com.kitri.market.chat.service.ChatRoomServiceImpl;
import com.kitri.market.chat.vo.ChatMessageVO;
import com.kitri.market.chat.vo.ChatRoomVO;

@Controller
public class ChatRoomController {
    
    @Autowired
    ChatRoomServiceImpl crservice;
    
    @Autowired
    ChatMessageServiceImpl cmservice;
    
    @RequestMapping("/test/{id}")
    public String test(HttpSession session, @PathVariable String id) {
        session.setAttribute("userid", id);
        return "chat/test";
    }
    
    
    // 대화하기 할 때 채팅 페이지 조회
    @RequestMapping(value="/chatroom", method=RequestMethod.POST)
    public String createChatroom(HttpSession session, Model model, ChatRoomVO vo) {
        String id = (String) session.getAttribute("userid");
        
        
        if (id == null || id == "") {
            return "redirect:login/signin";
        }
        
        vo.setSender(id);
        
        if (crservice.searchChatRoom(vo) == 0) {
            crservice.registChatRoom(vo);
        }
        
        model.addAttribute("currRoomId", crservice.searchRoomId(vo));
        
        return "chat/chatroom";
    }
    
    
    @RequestMapping(value="/chatroom", method=RequestMethod.GET)
    public String chatroomGet(HttpSession session) {
        String id = (String) session.getAttribute("userid");
        
        if (id == null || id == "") {
            return "redirect:login/signin";
        }
        
        return "chat/chatroom";
    }
    
    // 채팅방 조회
    @RequestMapping(value="/chatroom-info", method=RequestMethod.POST)
    @ResponseBody
    public List<ChatMessageVO> chatroomPost(Model model, HttpSession session) {
        String id = (String) session.getAttribute("userid");
        
        List<ChatMessageVO> cmvoList = cmservice.searchRecentChatDialog(id);
        for (ChatMessageVO cmvo : cmvoList) {
            // 읽음 처리
            int notReadMsgCount = cmservice.searchNotReadMsgCount(id, cmvo.getRoomId());
            cmvo.setNotReadMsgCount(notReadMsgCount);
            
            // 상대방 이미지 넣기
            if (id.equals(cmvo.getFromId())) {
                cmvo.setOtherPersonImg(crservice.searchOtherPersonImg(cmvo.getToId()));
            } else if (id.equals(cmvo.getToId())) {
                cmvo.setOtherPersonImg(crservice.searchOtherPersonImg(cmvo.getFromId()));
            }
            
            // 게시판 제목 넣기
            cmvo.setBoardTitle(crservice.searchBoardTitle(cmvo.getRoomId()));
        }
        
        return cmvoList;
        
    }
    
    
}
