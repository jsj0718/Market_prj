package com.kitri.market.chat.service;

import java.util.List;

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
    public int searchRoomId(ChatRoomVO crvo) {
        return crdao.selectRoomId(crvo);
    }

    @Override
    public int registChatRoom(ChatRoomVO crvo) {
        return crdao.insertChatRoom(crvo);
    }

    @Override
    public ChatRoomVO searchChatRoomInfo(int roomId) {
        return crdao.selectChatRoomInfo(roomId);
    }

    @Override
    public List<ChatRoomVO> searchChatRoomInfos(String id) {
        return crdao.selectChatRoomInfos(id);
    }

    @Override
    public List<ChatRoomVO> searchBuyerList(int boardId) {
        return crdao.selectBuyerList(boardId);
    }

    @Override
    public String searchOtherPersonImg(String id) {
        return crdao.selectOtherPersonImg(id);
    }

    @Override
    public String searchBoardTitle(int roomId) {
        return crdao.selectBoardTitle(roomId);
    }
    
    

    
}
