package com.kitri.market.chat.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kitri.market.chat.service.ChatMessageServiceImpl;
import com.kitri.market.chat.service.ChatRoomServiceImpl;
import com.kitri.market.chat.vo.ChatMessageVO;

@Controller
public class ChatRoomController {
    
    @Autowired
    ChatRoomServiceImpl crservice;
    
    @Autowired
    ChatMessageServiceImpl cmservice;
    
    @RequestMapping("/test/{id}")
    public String test(HttpSession session, @PathVariable String id) {
        session.setAttribute("id", id);
        return "chat/test";
    }
    
//    @RequestMapping(value="/chatroom/{id}", method=RequestMethod.POST)
//    public String chatroomPost(HttpSession session, ChatRoomVO vo, Model model, @PathVariable String id) {
////        String id = (String) session.getAttribute("id");
//        
//        if (id == null || id.equals(vo.getAuthor())) {
//            return "redirect:test";
//        }
//        
//        vo.setSender(id);
//        
//        if (crservice.searchChatRoom(vo) == 0) {
//            crservice.registChatRoom(vo);
//        }
//        
//        List<ChatRoomVO> crvoList = crservice.searchChatRoomInfos(id);
//        model.addAttribute("chatrooms", crvoList);
//        
//        return "chat/chatroom";
//    }
    
    
    @RequestMapping(value="/chatroom", method=RequestMethod.GET)
    public String chatroomGet() {
        return "chat/chatroom";
    }
    
    // 채팅방 조회
    @RequestMapping(value="/chatroom", method=RequestMethod.POST)
    @ResponseBody
    public List<ChatMessageVO> chatroomPost(Model model, HttpSession session) {
        String id = (String) session.getAttribute("id");
        
        List<ChatMessageVO> cmvoList = cmservice.searchRecentChatDialog(id);
        for (ChatMessageVO cmvo : cmvoList) {
            int notReadMsgCount = cmservice.searchNotReadMsgCount(id, cmvo.getRoomId());
            cmvo.setNotReadMsgCount(notReadMsgCount);
        }
        
        return cmvoList;
    }
    
}
