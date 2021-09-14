package com.kitri.market.chat.vo;

public class UserReportVO {
    private int reportId;
    private String userId;
    private int boardId;
    private String reportTitle;
    private String reportContent;
    private String reporter;
    
    public int getReportId() {
        return reportId;
    }
    public void setReportId(int reportId) {
        this.reportId = reportId;
    }
    public String getUserId() {
        return userId;
    }
    public void setUserId(String userId) {
        this.userId = userId;
    }
    public int getBoardId() {
        return boardId;
    }
    public void setBoardId(int boardId) {
        this.boardId = boardId;
    }
    public String getReportTitle() {
        return reportTitle;
    }
    public void setReportTitle(String reportTitle) {
        this.reportTitle = reportTitle;
    }
    public String getReportContent() {
        return reportContent;
    }
    public void setReportContent(String reportContent) {
        this.reportContent = reportContent;
    }
    public String getReporter() {
        return reporter;
    }
    public void setReporter(String reporter) {
        this.reporter = reporter;
    }
    
    
}
