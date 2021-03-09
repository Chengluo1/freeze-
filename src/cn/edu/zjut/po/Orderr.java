package cn.edu.zjut.po;

import java.util.Date;

public class Orderr {
    private String orderrId;
    private String title;
    private String description;
    private Date beginTime;
    private Date finishTime;
    private Float money;
    private String state;
    private Employer employer;
    private Photographer photographer;

    public Orderr() {
    }

    public Orderr(String orderrId) {
        this.setOrderrId(orderrId);
    }

    public Orderr(String orderrId, String title, String description, Date beginTime, Date finishTime, Float money, String state, Employer employer, Photographer photographer) {
        this.orderrId = orderrId;
        this.title = title;
        this.description = description;
        this.beginTime = beginTime;
        this.finishTime = finishTime;
        this.money = money;
        this.state = state;
        this.employer = employer;
        this.photographer = photographer;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {  this.title = title; }



    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getBeginTime() {
        return this.beginTime;
    }

    public void setBeginTime(Date beginTime) {
        this.beginTime = beginTime;
    }

    public Date getFinishTime() {
        return this.finishTime;
    }

    public void setFinishTime(Date finishTime) {
        this.finishTime = finishTime;
    }

    public Float getMoney() {
        return this.money;
    }

    public void setMoney(Float money) {
        this.money = money;
    }

    public String getState() {
        return this.state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getOrderrId() {
        return this.orderrId;
    }

    public void setOrderrId(String orderrId) {
        this.orderrId = orderrId;
    }

    public Employer getEmployer() {
        return this.employer;
    }

    public void setEmployer(Employer employer) {
        this.employer = employer;
    }

    public Photographer getPhotographer() {
        return this.photographer;
    }

    public void setPhotographer(Photographer photographer) {
        this.photographer = photographer;
    }
}
