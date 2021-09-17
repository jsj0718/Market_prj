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
    public List<ChatMessageVO> chatdialog(@RequestParam int roomId, HttpSession session) {
        String userId = (String) session.getAttribute("userid");
        List<ChatMessageVO> cmList = cmservice.searchChatDialog(roomId, userId);
        
        return cmList;
    }
    
    // 채팅 하기
    @RequestMapping(value="/chatdialog/{roomid}", method=RequestMethod.POST)
    @ResponseBody
    public List<ChatMessageVO> registChatDialog(@PathVariable("roomid") int roomId, @RequestBody ChatMessageVO vo, HttpSession session) {
        String userId = (String) session.getAttribute("userid");
        
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
        
        List<ChatMessageVO> cmList = cmservice.searchChatDialog(cmvo.getRoomId(), userId);
        
        
        return cmList;
    }

    // 읽음 메시지 처리
    @RequestMapping(value="/refresh", method=RequestMethod.POST)
    @ResponseBody
    public void refresh(HttpSession session, int roomId) {
        String id = (String) session.getAttribute("userid");
        cmservice.changeReadMsg(id, roomId);
        return;
    }
    
    // 채팅방 나가기
    @RequestMapping(value="/exit/{roomId}", method=RequestMethod.POST)
    @ResponseBody
    public void exit(HttpSession session, @PathVariable int roomId, @RequestParam String person) {
        String id = (String) session.getAttribute("userid");
        cmservice.exitChat(id, roomId, person);
        return;
    }
}
