package com.kitri.market.chat.service;

import com.kitri.market.chat.vo.ChatRoomVO;

public interface ChatRoomService {
    public int searchChatRoom(ChatRoomVO crvo);
    public int registChatRoom(ChatRoomVO crvo);
}
