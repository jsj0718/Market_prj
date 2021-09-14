package com.kitri.market.chat.dao;

import java.util.List;

import com.kitri.market.chat.vo.ChatMessageVO;

public interface ChatMessageDAO {
    public List<ChatMessageVO> selectChatDialog(int roomId);
    public int insertChatDialog(ChatMessageVO cmvo);
    public List<ChatMessageVO> selectRecentChatDialog(String id);
    public int selectNotReadMsgCount(String id, int roomId);
    public int updateReadMsg(String id, int roomId);
}
