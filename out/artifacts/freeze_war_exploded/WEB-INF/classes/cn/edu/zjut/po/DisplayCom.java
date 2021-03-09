package cn.edu.zjut.po;

import java.sql.Timestamp;

public class DisplayCom {
    private String profilePhoto;
    private String account;
    private Timestamp time;
    private String content;

    public DisplayCom() {
    }

    public DisplayCom(String profilePhoto, String account, Timestamp time, String content) {
        this.setProfilePhoto(profilePhoto);
        this.setAccount(account);
        this.setTime(time);
        this.setContent(content);
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
