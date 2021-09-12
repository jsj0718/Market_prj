package com.kitri.market.chat.vo;

public class ChatMessageVO {
    private int chatId;
    private int roomId;
    private String fromId;
    private String toId;
    private String chatContent;
    private String chatTime;
    
    public int getChatId() {
        return chatId;
    }
    public void setChatId(int chatId) {
        this.chatId = chatId;
    }
    public int getRoomId() {
        return roomId;
    }
    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }
    public String getFromId() {
        return fromId;
    }
    public void setFromId(String fromId) {
        this.fromId = fromId;
    }
    public String getToId() {
        return toId;
    }
    public void setToId(String toId) {
        this.toId = toId;
    }
    public String getChatContent() {
        return chatContent;
    }
    public void setChatContent(String chatContent) {
        this.chatContent = chatContent;
    }
    public String getChatTime() {
        return chatTime;
    }
    public void setChatTime(String chatTime) {
        this.chatTime = chatTime;
    }
    
    
}
