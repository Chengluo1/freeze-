package cn.edu.zjut.action;

import cn.edu.zjut.po.Subscribe;
import cn.edu.zjut.service.ISubscribeService;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;

public class SubscribeAction {
    private String employerId;
    private String photographerId;
    private Subscribe subscribe;
    private String subscribeID;
    @Autowired
    ISubscribeService subscribeServ = null;

    public SubscribeAction() {
    }

    public String getEmployerId() { return employerId;    }
    public void setEmployerId(String employerId) { this.employerId = employerId; }
    public String getPhotographerId() {      return photographerId; }
    public void setPhotographerId(String photographerId) {    this.photographerId = photographerId;  }
    public void setSubscribeID(String subscribeID) {
        this.subscribeID = subscribeID;
    }
    public String getSubscribeID() {
        return subscribeID;
    }
    public void setSubscribe(Subscribe subscribe) {
        this.subscribe = subscribe;
    }
    public Subscribe getSubscribe() {
        return subscribe;
    }
    public void setSubscribeServ(ISubscribeService subscribeServ) {
        this.subscribeServ = subscribeServ;
    }
    public ISubscribeService getSubscribeServ() {return subscribeServ; }

    public String putSubscribe(){
        this.subscribeServ.putSubscribe(this.subscribe);
        return "success";
    }
    public String cancelSub() {
        this.subscribeServ.cancelSub(this.subscribeID);
        return "success";
    }
    public String gotoGenerateOrder() {
        System.out.println(this.subscribe.getSubscribeID()+"*****************************");
        this.subscribeServ.putSubscribe(this.subscribe);
        return "success";
    }
    public String subscribe() {
        System.out.println("employerId" + this.employerId);
        System.out.println("photographerId" + this.photographerId);
        HttpServletRequest request = ServletActionContext.getRequest();
        String message;
        if (this.subscribeServ.subscribe(this.subscribe, this.employerId, this.photographerId)) {
            message = "预约成功!";
            request.setAttribute("tipMessage", message);
            return "success";
        } else {
            message = "预约失败!";
            request.setAttribute("tipMessage", message);
            return "fail";
        }
    }

    public String accept() {
        System.out.println("subscibeID" + this.subscribeID);
        this.subscribeServ.accept(this.subscribeID);
        return "success";
    }

    public String reject() {
        System.out.println("action收到的subsribeID：" + this.subscribeID);
        this.subscribeServ.reject(this.subscribe);
        return "success";
    }


}
