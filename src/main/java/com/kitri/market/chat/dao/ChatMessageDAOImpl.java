package com.kitri.market.chat.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kitri.market.chat.vo.ChatMessageVO;

@Repository
public class ChatMessageDAOImpl implements ChatMessageDAO {

    @Autowired
    private SqlSession sqlSession;
    
    // 채팅방의 채팅 내용 조회
    @Override
    public List<ChatMessageVO> selectChatDialog(int roomId) {
        return sqlSession.selectList("chat_message.selectChatDialog", roomId);
    }

    // 채팅방에 채팅 보내기 (입력하기)
    @Override
    public int insertChatDialog(ChatMessageVO cmvo) {
        return sqlSession.insert("chat_message.insertChatDialog", cmvo);
    }

    // 해당 채팅방에서 가장 최근 대화 조회
    @Override
    public List<ChatMessageVO> selectRecentChatDialog(String id) {
        return sqlSession.selectList("chat_message.selectRecentChatDialog", id);
    }
    
}
