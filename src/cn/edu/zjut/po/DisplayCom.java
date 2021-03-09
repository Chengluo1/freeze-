package cn.edu.zjut.po;

import java.sql.Timestamp;

public class DisplayCom {
    private String profilePhoto;
    private String account;
    private Timestamp time;
    private String content;
    private int CommentsID;
    private int status;

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public DisplayCom() {
    }

    public DisplayCom(String profilePhoto, String account, Timestamp time, String content, int commentsID, int status) {
        this.profilePhoto = profilePhoto;
        this.account = account;
        this.time = time;
        this.content = content;
        CommentsID = commentsID;
        this.status = status;
    }

    public int getCommentsID() {
        return CommentsID;
    }

    public void setCommentsID(int commentsID) {
        CommentsID = commentsID;
    }

    public String getProfilePhoto() {
        return this.profilePhoto;
    }

    public void setProfilePhoto(String profilePhoto) {
        this.profilePhoto = profilePhoto;
    }

    public String getAccount() {
        return this.account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public Timestamp getTime() {
        return this.time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
