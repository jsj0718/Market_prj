package com.kitri.market.chat.dao;

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
        int result = sqlSession.selectOne("chat_room.selectChatRoom", crvo);
        System.out.println(result);
        return result;
    }

    @Override
    public int insertChatRoom(ChatRoomVO crvo) {
        return sqlSession.insert("chat_room.insertChatRoom", crvo);
    }
    
    
}
