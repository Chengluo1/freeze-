package cn.edu.zjut.action;

import cn.edu.zjut.po.Photographer;
import cn.edu.zjut.service.IPhotographerService;
import cn.edu.zjut.service.PhotographerService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;

public class PhotographerAction extends ActionSupport {
    private Photographer photographer;
    private String account;
    @Autowired
    IPhotographerService photographerServ = null;
    public PhotographerAction() {
        System.out.println("PhotographerAction");
    }

    public void setPhotographerServ(IPhotographerService photographerServ) {
        System.out.println("setPhotographerServ");
        this.photographerServ = photographerServ;
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
            message="注册成功!";
            request.setAttribute("tipMessage",message);
            return "success";
        }else {
            message="注册失败，手机号已被注册过!";
            request.setAttribute("tipMessage",message);
            return "failed";
        }
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
    public String putPhotographer(){
        return this.photographerServ.putPhotographer(this.photographer) ? "myself" : "others";
    }
}
