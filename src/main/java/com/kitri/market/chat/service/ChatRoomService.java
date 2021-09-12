package com.kitri.market.chat.service;

import java.util.List;

import com.kitri.market.chat.vo.ChatRoomVO;

public interface ChatRoomService {
    public int searchChatRoom(ChatRoomVO crvo);
    public int registChatRoom(ChatRoomVO crvo);
    public List<ChatRoomVO> searchChatRoomInfos(String id);
    public ChatRoomVO searchChatRoomInfo(int roomId);
}
