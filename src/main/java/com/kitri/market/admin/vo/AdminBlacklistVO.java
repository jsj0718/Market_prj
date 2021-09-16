package com.kitri.market.admin.vo;

public class AdminBlacklistVO {

  private int reportid; //report의 reportid
  private String userid; //report테이블의 userid
  private String report_title;  //report의 타이틀
  private String report_content;

  private int boardid;  //board테이블의 id
  private String title; //board테이블의 title
  private int count;
  private int report;
  private String flag;
  private String userf;
  
  private String categoryname;
  


  public String getCategoryname() {
    return categoryname;
  }
  public void setCategoryname(String categoryname) {
    this.categoryname = categoryname;
  }
  public String getUserf() {
    return userf;
  }
  public void setUserf(String userf) {
    this.userf = userf;
  }
  public String getFlag() {
    return flag;
  }
  public void setFlag(String flag) {
    this.flag = flag;
  }
  public int getReport() {
    return report;
  }
  public void setReport(int report) {
    this.report = report;
  }
  public int getReportid() {
    return reportid;
  }
  public void setReportid(int reportid) {
    this.reportid = reportid;
  }
  public String getUserid() {
    return userid;
  }
  public void setUserid(String userid) {
    this.userid = userid;
  }
  public String getReport_title() {
    return report_title;
  }
  public void setReport_title(String report_title) {
    this.report_title = report_title;
  }
  public String getReport_content() {
    return report_content;
  }
  public void setReport_content(String report_content) {
    this.report_content = report_content;
  }
  public int getBoardid() {
    return boardid;
  }
  public void setBoardid(int boardid) {
    this.boardid = boardid;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public int getCount() {
    return count;
  }
  public void setCount(int count) {
    this.count = count;
  }
 

  
  
  
}
