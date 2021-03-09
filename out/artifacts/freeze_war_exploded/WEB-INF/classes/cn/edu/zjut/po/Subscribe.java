package cn.edu.zjut.po;

import java.sql.Timestamp;

public class Subscribe {
    private int subscribeID;
    private String title;
    private String description;
    private Employer subscriber;
    private Photographer scriber;
    private Float money;
    private Timestamp time;
    private Integer status;

    public Subscribe() {
    }

    public Subscribe(int subscriberID) {
        this.setSubscribeID(this.subscribeID);
    }

    public int getSubscribeID() {
        return this.subscribeID;
    }

    public void setSubscribeID(int subscribeID) {
        this.subscribeID = subscribeID;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Employer getSubscriber() {
        return this.subscriber;
    }

    public void setSubscriber(Employer subscriber) {
        this.subscriber = subscriber;
    }

    public Photographer getScriber() {
        return this.scriber;
    }

    public void setScriber(Photographer scriber) {
        this.scriber = scriber;
    }

    public Float getMoney() {
        return this.money;
    }

    public void setMoney(Float money) {
        this.money = money;
    }

    public Timestamp getTime() {
        return this.time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public Integer getStatus() {
        return this.status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
