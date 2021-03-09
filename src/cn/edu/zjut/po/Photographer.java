package cn.edu.zjut.po;

import cn.edu.zjut.annotation.check;

import java.util.HashSet;
import java.util.Set;

public class Photographer {
    private String photographerId;
    private String account;
    private String name;
  //  @check(notNull=true)
    private String password;
    private String IDNumber;
   // @check(notNull=true)
    private String phone;
    private String email;
    private Boolean sex;
    private String region;
    private String wechat;
    private String qq;
    private Integer score;
    private String profilePhoto;
    private String introduction;
    private Integer fans;
    private Integer praise;
    private String certificate;
    private String status;
    private String profound;
    private String introduce;
    private String title;
    private String prize;
    private String message;
    private Integer status1;
    private Integer money1;
    private Integer visits;
    private Set examples_own = new HashSet(0);
    private Set examples_star = new HashSet(0);
    private Set photographer_follow = new HashSet(0);
    private Set orderrs = new HashSet(0);
    private Set needs = new HashSet(0);
    private Set subscribe = new HashSet(0);

    public Photographer() {
    }

    public Photographer(String photographerId) {
        this.setPhotographerId(photographerId);
    }

    public Photographer(String photographerId, String account, String name, String password, String IDNumber, String phone, String email, Boolean sex, String region, String wechat, String qq, Integer score, String profilePhoto, String hmpgbkg, String introduction, Integer fans, Integer praise, Set examples_own, Set examples_star, Set photographer_follow, Set orderrs, Set<Needs> needs, String certificate, Set subscribe, String status, String profound, String introduce, String prize, String message, Integer status1, Integer money1, Integer visits, String title) {
        this.setPhotographerId(photographerId);
        this.setAccount(account);
        this.setName(name);
        this.setPassword(password);
        this.setIDNumber(IDNumber);
        this.setPhone(phone);
        this.setEmail(email);
        this.setSex(sex);
        this.setRegion(region);
        this.setWechat(wechat);
        this.setQq(qq);
        this.setScore(score);
        this.setProfilePhoto(profilePhoto);
        this.setIntroduction(introduction);
        this.setFans(fans);
        this.setPraise(praise);
        this.setExamples_star(examples_star);
        this.setPhotographer_follow(photographer_follow);
        this.setOrderrs(orderrs);
        this.setNeeds(needs);
        this.setStatus(status);
        this.setMessage(message);
        this.setStatus1(status1);
        this.setMoney1(money1);
        this.setVisits(visits);
        this.setTitle(title);
        this.setSubscribe(subscribe);
    }

    public String getPhotographerId() {
        return this.photographerId;
    }

    public void setPhotographerId(String photographerId) {
        this.photographerId = photographerId;
    }

    public String getAccount() {
        return this.account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getIDNumber() {
        return this.IDNumber;
    }

    public void setIDNumber(String iDNumber) {
        this.IDNumber = iDNumber;
    }

    public String getPhone() {
        return this.phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Boolean getSex() {
        return this.sex;
    }

    public void setSex(Boolean sex) {
        this.sex = sex;
    }

    public String getRegion() {
        return this.region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getWechat() {
        return this.wechat;
    }

    public void setWechat(String wechat) {
        this.wechat = wechat;
    }

    public String getQq() {
        return this.qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public Integer getScore() {
        return this.score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public String getProfilePhoto() {
        return this.profilePhoto;
    }

    public void setProfilePhoto(String profilePhoto) {
        this.profilePhoto = profilePhoto;
    }

    public String getIntroduction() {
        return this.introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public Integer getFans() {
        return this.fans;
    }

    public void setFans(Integer fans) {
        this.fans = fans;
    }

    public Integer getPraise() {
        return this.praise;
    }

    public void setPraise(Integer praise) {
        this.praise = praise;
    }

    public String getCertificate() {
        return this.certificate;
    }

    public void setCertificate(String certificate) {
        this.certificate = certificate;
    }

    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getProfound() {
        return this.profound;
    }

    public void setProfound(String profound) {
        this.profound = profound;
    }

    public String getIntroduce() {
        return this.introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPrize() {
        return this.prize;
    }

    public void setPrize(String prize) {
        this.prize = prize;
    }

    public String getMessage() {
        return this.message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Integer getStatus1() {
        return this.status1;
    }

    public void setStatus1(Integer status1) {
        this.status1 = status1;
    }

    public Integer getMoney1() {
        return this.money1;
    }

    public void setMoney1(Integer money1) {
        this.money1 = money1;
    }

    public Integer getVisits() {
        return this.visits;
    }

    public void setVisits(Integer visits) {
        this.visits = visits;
    }

    public Set getExamples_own() {
        return this.examples_own;
    }

    public void setExamples_own(Set examples_own) {
        this.examples_own = examples_own;
    }

    public Set getExamples_star() {
        return this.examples_star;
    }

    public void setExamples_star(Set examples_star) {
        this.examples_star = examples_star;
    }

    public Set getPhotographer_follow() {
        return this.photographer_follow;
    }

    public void setPhotographer_follow(Set photographer_follow) {
        this.photographer_follow = photographer_follow;
    }

    public Set getOrderrs() {
        return this.orderrs;
    }

    public void setOrderrs(Set orderrs) {
        this.orderrs = orderrs;
    }

    public Set getNeeds() {
        return this.needs;
    }

    public void setNeeds(Set needs) {
        this.needs = needs;
    }

    public Set getSubscribe() {
        return this.subscribe;
    }

    public void setSubscribe(Set subscribe) {
        this.subscribe = subscribe;
    }
}
