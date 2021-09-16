package com.kitri.market.chat.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kitri.market.chat.service.ChatRoomServiceImpl;
import com.kitri.market.chat.service.UserReportServiceImpl;
import com.kitri.market.chat.vo.ChatRoomVO;
import com.kitri.market.chat.vo.UserReportVO;

@Controller
public class UserReportController {
    @Autowired
    private UserReportServiceImpl urservice;
    
    @Autowired
    private ChatRoomServiceImpl crservice;
    
    @RequestMapping("/report")
    @ResponseBody
    @Transactional(rollbackFor = Exception.class)
    public int report(HttpSession session, @RequestParam("roomId") int roomId, @RequestParam("reportTitle") String reportTitle, @RequestParam String reportContent) {
        String userId = (String) session.getAttribute("id");
        String otherPerson = "";    // 상대방 유저 id
        // roomid로 게시글 번호, 상대방 유저 가져오기
        ChatRoomVO crvo = crservice.searchChatRoomInfo(roomId);

        int boardId = crvo.getBoardId();    // 게시글 번호
        if (userId.equals(crvo.getAuthor())) {
            otherPerson = crvo.getSender();
        } else if (userId.equals(crvo.getSender())){
            otherPerson = crvo.getAuthor();
        }

        // 해당 게시글과 상대방 정보로 신고 가능한지 조회
        UserReportVO urvo = new UserReportVO();
        urvo.setBoardId(boardId);   // 게시글 번호
        urvo.setReporter(userId);   // 신고자 (본인)
        urvo.setUserId(otherPerson);    // 신고 당하는 사람 (상대방)
        urvo.setReportTitle(reportTitle);
        urvo.setReportContent(reportContent);
        
        int possible = urservice.searchReportPossible(urvo);
        
        // 가능할 시 신고 리스트에 추가
        int result = 0;
        if (possible == 0) {
            result = urservice.insertReport(urvo);  // 성공은 1 이상, 실패는 0
        } else {
            result = -1;  // 이미 신고한 경우
        }
        
        // 신고당한 유저의 신고 횟수 누적시키기 (리스트 추가된 경우만)
        if (result > 0) {
//             누적까지 성공한 경우
            if (urservice.updateUserReportCnt(otherPerson) > 0) {
                result = 2;
            }
        }
        
        System.out.println(result);
        
        return result;
    }
}
