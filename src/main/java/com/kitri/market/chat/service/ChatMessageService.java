package com.kitri.market.chat.service;

import java.util.List;

import com.kitri.market.chat.vo.ChatMessageVO;

public interface ChatMessageService {
    public List<ChatMessageVO> searchChatDialog(int roomId, String id);
    public int registChatDialog(ChatMessageVO cmvo);
    public List<ChatMessageVO> searchRecentChatDialog(String id);
    public int searchNotReadMsgCount(String id, int roomId);
    public int changeReadMsg(String id, int roomId);
    public int exitChat(String id, int roomId, String person);
}
