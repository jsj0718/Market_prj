package com.kitri.market.chat.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kitri.market.chat.service.ChatMessageServiceImpl;
import com.kitri.market.chat.service.ChatRoomServiceImpl;
import com.kitri.market.chat.vo.ChatMessageVO;
import com.kitri.market.chat.vo.ChatRoomVO;

@Controller
@RequestMapping("/chatroom")
public class ChatMessageController {
    @Autowired
    private ChatMessageServiceImpl cmservice;
    
    @Autowired
    private ChatRoomServiceImpl crservice;
    
    // 채팅 기록 가져오기
    @RequestMapping(value="/chatdialog", method=RequestMethod.POST)
    @ResponseBody
    public List<ChatMessageVO> chatdialog(@RequestParam int roomId) {
        List<ChatMessageVO> cmList = cmservice.searchChatDialog(roomId);
        
        return cmList;
    }
    
    // 채팅 하기
    @RequestMapping(value="/chatdialog/{roomid}", method=RequestMethod.POST)
    @ResponseBody
    public List<ChatMessageVO> registChatDialog(@PathVariable("roomid") int roomId, @RequestBody ChatMessageVO vo, HttpSession session) {
        String userId = (String) session.getAttribute("id");
        
        ChatRoomVO crvo = crservice.searchChatRoomInfo(roomId);

        ChatMessageVO cmvo = new ChatMessageVO();
        cmvo.setRoomId(roomId);
        cmvo.setFromId(userId);
        cmvo.setChatContent(vo.getChatContent());
        if (crvo.getAuthor().equals(userId)) {
            cmvo.setToId(crvo.getSender());
        } else {
            cmvo.setToId(crvo.getAuthor());
        }
        
        cmservice.registChatDialog(cmvo);
        
        List<ChatMessageVO> cmList = cmservice.searchChatDialog(cmvo.getRoomId());
        
        
        return cmList;
    }
    
}
