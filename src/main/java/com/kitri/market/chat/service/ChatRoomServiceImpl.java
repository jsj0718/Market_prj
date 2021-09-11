package com.kitri.market.chat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.market.chat.dao.ChatRoomDAO;
import com.kitri.market.chat.vo.ChatRoomVO;

@Service
public class ChatRoomServiceImpl implements ChatRoomService {
    @Autowired
    ChatRoomDAO crdao;
    
    @Override
    public int searchChatRoom(ChatRoomVO crvo) {
        return crdao.selectChatRoom(crvo);
    }

    @Override
    public int registChatRoom(ChatRoomVO crvo) {
        return crdao.insertChatRoom(crvo);
    }
    
}
