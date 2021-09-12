package com.kitri.market.chat.dao;

import java.util.List;

import com.kitri.market.chat.vo.ChatRoomVO;

public interface ChatRoomDAO {
    public int selectChatRoom(ChatRoomVO crvo);
    public int insertChatRoom(ChatRoomVO crvo);
    public List<ChatRoomVO> selectChatRoomInfos(String id);
    public ChatRoomVO selectChatRoomInfo(int roomId);
    
}
