package com.kitri.market.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.market.chat.dao.ChatMessageDAO;
import com.kitri.market.chat.vo.ChatMessageVO;

@Service
public class ChatMessageServiceImpl implements ChatMessageService {

    @Autowired
    private ChatMessageDAO cmdao;
    
    @Override
    public List<ChatMessageVO> searchChatDialog(int roomId) {
        return cmdao.selectChatDialog(roomId);
    }

    @Override
    public int registChatDialog(ChatMessageVO cmvo) {
        return cmdao.insertChatDialog(cmvo);
    }
    
    @Override
    public List<ChatMessageVO> searchRecentChatDialog(String id) {
        return cmdao.selectRecentChatDialog(id);
    }
    
}
