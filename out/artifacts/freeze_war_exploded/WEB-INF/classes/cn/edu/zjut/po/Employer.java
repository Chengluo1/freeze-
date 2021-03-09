package cn.edu.zjut.po;

import java.util.HashSet;
import java.util.Set;

public class Employer {
    private String employerId;
    private String account;
    private String name;
    private String password;
    private String IDNumber;
    private String phone;
    private String email;
    private Boolean sex;
    private String region;
    private String wechat;
    private String qq;
    private String profilePhoto;
    private String hmpgbkg;
    private Set needs = new HashSet(0);
    private Set examples_star = new HashSet(0);
    private Set photographer_follow = new HashSet(0);
    private Set orderrs = new HashSet(0);
    private Set subscribe = new HashSet(0);

    public Employer() {
    }

    public Employer(String employerId) {
        this.setEmployerId(employerId);
    }

    public Employer(String employerId, String account, String name, String password, String IDNumber, String phone, String email, Boolean sex, String region, String wechat, String qq, String profilePhoto, String hmpgbkg, Set needs, Set examples_star, Set photographer_follow, Set orderrs, Set subscribe) {
        this.setEmployerId(employerId);
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
        this.setProfilePhoto(profilePhoto);
        this.setHmpgbkg(hmpgbkg);
        this.setNeeds(needs);
        this.setExamples_star(examples_star);
        this.setPhotographer_follow(photographer_follow);
        this.setOrderrs(orderrs);
        this.setSubscribe(subscribe);
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

    public String getIDNumber() {
        return this.IDNumber;
    }

    public void setIDNumber(String iDNumber) {
        this.IDNumber = iDNumber;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public String getProfilePhoto() {
        return this.profilePhoto;
    }

    public void setProfilePhoto(String profilePhoto) {
        this.profilePhoto = profilePhoto;
    }

    public String getHmpgbkg() {
        return this.hmpgbkg;
    }

    public void setHmpgbkg(String hmpgbkg) {
        this.hmpgbkg = hmpgbkg;
    }

    public Set getNeeds() {
        return this.needs;
    }

    public void setNeeds(Set needs) {
        this.needs = needs;
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

    public String getEmployerId() {
        return this.employerId;
    }

    public void setEmployerId(String employerId) {
        this.employerId = employerId;
    }

    public Set getSubscribe() {
        return this.subscribe;
    }

    public void setSubscribe(Set subscribe) {
        this.subscribe = subscribe;
    }
}
