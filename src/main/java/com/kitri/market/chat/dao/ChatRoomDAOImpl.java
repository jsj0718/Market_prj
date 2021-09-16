package com.kitri.market.chat.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kitri.market.chat.vo.ChatRoomVO;

@Repository
public class ChatRoomDAOImpl implements ChatRoomDAO {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public int selectChatRoom(ChatRoomVO crvo) {
        return sqlSession.selectOne("chat_room.selectChatRoom", crvo);
    }
    
    @Override
    public int selectRoomId(ChatRoomVO crvo) {
        return sqlSession.selectOne("chat_room.selectRoomId", crvo);
    }

    @Override
    public ChatRoomVO selectChatRoomInfo(int roomId) {
        return sqlSession.selectOne("chat_room.selectChatRoomInfo", roomId);
    }

    @Override
    public int insertChatRoom(ChatRoomVO crvo) {
        return sqlSession.insert("chat_room.insertChatRoom", crvo);
    }

    @Override
    public List<ChatRoomVO> selectChatRoomInfos(String id) {
        return sqlSession.selectList("chat_room.selectChatRoomInfos", id);
    }

    @Override
    public List<ChatRoomVO> selectBuyerList(int boardId) {
        return sqlSession.selectList("chat_room.selectBuyerList", boardId);
    }

    @Override
    public String selectOtherPersonImg(String id) {
        return sqlSession.selectOne("chat_room.selectOtherPersonImg", id);
    }

    @Override
    public String selectBoardTitle(int roomId) {
        return sqlSession.selectOne("chat_room.selectBoardTitle", roomId);
    }
    
    
}
