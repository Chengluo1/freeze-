package cn.edu.zjut.action;

import cn.edu.zjut.po.Example;
import cn.edu.zjut.po.Photographer;
import cn.edu.zjut.service.IPhotographerService;
import cn.edu.zjut.service.PhotographerService;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.PrintWriter;

public class PhotographerAction extends ActionSupport {
    private Photographer photographer;
    private String account;
    private File[] upload;
    private File[] upload2;
    private Example example;
    private String photographerID;
    private int exampleId;
    @Autowired
    IPhotographerService photographerServ = null;
    private File profile;
    private String profileFileName;
    private File certificate;
    public String certificateFileName;
    private int money1;

    public void setExampleId(int exampleId) {
        this.exampleId = exampleId;
    }

    public int getExampleId() {
        return exampleId;
    }

    public void setExample(Example example) {
        this.example = example;
    }
    public void setUpload(File[] upload) {
        this.upload = upload;
    }
    public void setUpload2(File[] upload2) {
        this.upload2 = upload2;
    }
    public Example getExample() {
        return example;
    }
    public File[] getUpload() {
        return upload;
    }
    public File[] getUpload2() {
        return upload2;
    }
    public void setCertificate(File certificate) {
        this.certificate = certificate;
    }
    public void setCertificateFileName(String certificateFileName) {
        this.certificateFileName = certificateFileName;
    }
    public void setMoney1(int money1) {
        this.money1 = money1;
    }
    public File getCertificate() {
        return certificate;
    }
    public int getMoney1() {
        return money1;
    }
    public String getCertificateFileName() {
        return certificateFileName;
    }
    public void setPhotographer(Photographer photographer) {
        this.photographer=photographer;
    }
    public Photographer getPhotographer() {
        return photographer;
    }
    public void setAccount(String account) {
        this.account = account;
    }
    public String getAccount() {
        return account;
    }
    public void setProfile(File profile) {
        this.profile = profile;
    }
    public File getProfile() {
        return profile;
    }
    public void setProfileFileName(String profileFileName) {
        this.profileFileName = profileFileName;
    }
    public String getProfileFileName() {
        return profileFileName;
    }
    public String getPhotographerID() { return photographerID; }
    public void setPhotographerID(String photographerID) {   this.photographerID = photographerID;   }
    public IPhotographerService getPhotographerServ() {   return photographerServ;    }

    public PhotographerAction() {
        System.out.println("PhotographerAction");
    }
    public void setPhotographerServ(IPhotographerService photographerServ) {
        System.out.println("setPhotographerServ");
        this.photographerServ = photographerServ;
    }


    public String login(){
        System.out.println("---try to login---");
        System.out.println(photographer.getPhone());
        System.out.println(photographer.getPassword());
        System.out.println("---test1---");
        photographerServ.test();
        photographerServ.login(photographer);
        System.out.println("---test2---");
        String result = photographerServ.login(photographer) ? "loginSuccess" : "loginFail";
        System.out.println(result);
        return photographerServ.login(this.photographer) ? "loginSuccess" : "loginFail";
    }
    public String register(){
        HttpServletRequest request = ServletActionContext.getRequest();
        String message;
        if (this.photographerServ.registerPho(this.photographer)){
            message="registration success!!";
            request.setAttribute("tipMessage",message);
            return "success";
        }else {
            message="Registration failed, mobile phone number has been registered!";
            request.setAttribute("tipMessage",message);
            return "failed";
        }
    }

    public String gotoSubscribe() {
        System.out.println("photographerID:" + this.photographerID);
        Photographer photographer = new Photographer();
        photographer.setPhotographerId(this.photographerID);
        this.photographerServ.putPhotographer(photographer);
        return "success";
    }

    public String searchByAccount(){
        return this.photographerServ.searchByAccount(this.account) ? "accountSuccess" : "accountFail";
    }
    public String findAll(){
        return this.photographerServ.findAll() ? "success" : "false";
    }
    public String findByPraise() throws Exception{
        return this.photographerServ.findByPraise() ? "praiseSuccess" : "praiseFail";
    }
    public String findByScore() throws Exception {
        return this.photographerServ.findByScore() ? "scoreSuccess" : "scoreFail";
    }
    public String findByYou(){
        return this.photographerServ.findByYou() ? "youSuccess" : "youFail";
    }
    public String putPhotographer(){
        return this.photographerServ.putPhotographer(this.photographer) ? "myself" : "others";
    }
    public String judgeIdentity(){
        return this.photographerServ.judgeIdentity() ? "photographer" : "employer";
    }
    public String update(){
        return this.photographerServ.update(this.photographer,this.profile, this.profileFileName) ? "success" : "fail";
    }
    public String update2(){
        return this.photographerServ.update2(this.photographer,this.certificate,this.certificateFileName) ? "success" : "fail";
    }
    public String recommend1(){
        return this.photographerServ.recommend1(this.money1) ? "success" : "fail";
    }
    public String upload() throws Exception {
        return this.photographerServ.upload(this.example, this.upload, this.upload2) ? "uploadSucccess" : "uploadFail";
    }
    public String removeCase() throws Exception{
        System.out.println("start-------------------------");
        if (this.photographerServ.removeCase(this.exampleId)) {
            System.out.println("Success----------");
            return "success";
        } else {
            return null;
        }
    }
    public String logout(){
        photographerServ.logout();
        return "success";
    }
    public String showPho(){
        photographerServ.showPho();
        return "success";
    }
}
