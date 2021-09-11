package com.kitri.market.chat.dao;

import com.kitri.market.chat.vo.ChatRoomVO;

public interface ChatRoomDAO {
    public int selectChatRoom(ChatRoomVO crvo);
    public int insertChatRoom(ChatRoomVO crvo);
    
    
}
