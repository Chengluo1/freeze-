package cn.edu.zjut.po;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Needs {
    private Integer needsId;
    private String title;
    private String description;
    private String style;
    private Timestamp time1;
    private Date time2;
    private Date time3;
    private Float money;
    private Integer enrollment;
    private Employer employer;
    private Set photographers = new HashSet(0);
    private String city;
    private Integer area;

    public Needs() {
    }

    public Needs(Integer needsId) {
        this.setNeedsId(needsId);
    }

    public Needs(Integer needsId, String title, String description, String style, Timestamp time1, Date time2, Date time3, Float money, Integer enrollment, Employer employer, Set photographers, String city, int area) {
        this.needsId = needsId;
        this.title = title;
        this.description = description;
        this.style = style;
        this.time1 = time1;
        this.time2 = time2;
        this.time3 = time3;
        this.money = money;
        this.enrollment = enrollment;
        this.employer = employer;
        this.photographers = photographers;
        this.city = city;
        this.area = area;
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

    public String getStyle() {
        return this.style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public Timestamp getTime1() {
        return this.time1;
    }

    public void setTime1(Timestamp time1) {
        this.time1 = time1;
    }

    public Date getTime2() {
        return this.time2;
    }

    public void setTime2(Date time2) {
        this.time2 = time2;
    }

    public Date getTime3() {
        return this.time3;
    }

    public void setTime3(Date time3) {
        this.time3 = time3;
    }

    public Float getMoney() {
        return this.money;
    }

    public void setMoney(Float money) {
        this.money = money;
    }

    public Integer getEnrollment() {
        return this.enrollment;
    }

    public void setEnrollment(Integer enrollment) {
        this.enrollment = enrollment;
    }

    public Employer getEmployer() {
        return this.employer;
    }

    public void setEmployer(Employer employer) {
        this.employer = employer;
    }

    public Set getPhotographers() {
        return this.photographers;
    }

    public void setPhotographers(Set photographers) {
        this.photographers = photographers;
    }

    public Integer getNeedsId() {
        return this.needsId;
    }

    public void setNeedsId(Integer needsId) {
        this.needsId = needsId;
    }

    public String getCity() {
        return this.city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public Integer getArea() {
        return this.area;
    }

    public void setArea(Integer area) {
        this.area = area;
    }
}