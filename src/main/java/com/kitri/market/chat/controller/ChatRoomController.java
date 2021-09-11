package com.kitri.market.chat.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kitri.market.chat.service.ChatRoomServiceImpl;
import com.kitri.market.chat.vo.ChatRoomVO;

@Controller
public class ChatRoomController {
    
    @Autowired
    ChatRoomServiceImpl crservice;
    
    @RequestMapping("/test")
    public String test(HttpSession session) {
        session.setAttribute("id", "test");
        return "chat/test";
    }
    
    @RequestMapping("/chatroom")
    public String chatroom(HttpSession session, int boardId, String author) {
        ChatRoomVO crvo = new ChatRoomVO();
        crvo.setBoardId(boardId);
        crvo.setAuthor(author);
        crvo.setSender((String) session.getAttribute("id"));
        
        if (crservice.searchChatRoom(crvo) == 0) {
            crservice.registChatRoom(crvo);
        }
        
        return "chat/chatroom";
    }
}
