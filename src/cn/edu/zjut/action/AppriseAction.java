package cn.edu.zjut.action;

import cn.edu.zjut.po.Apprise;
import cn.edu.zjut.po.Photographer;
import cn.edu.zjut.service.IAppriseService;
import org.springframework.beans.factory.annotation.Autowired;

public class AppriseAction {
    private Apprise apprise;
    private String employerId;
    private String photographerId;
    @Autowired
    IAppriseService appriseServ = null;

    public AppriseAction() {
    }

    public void setApprise(Apprise apprise) {
        this.apprise = apprise;
    }

    public void setAppriseServ(IAppriseService appriseServ) {
        this.appriseServ = appriseServ;
    }


    public void setEmployerId(String employerId) {
        this.employerId = employerId;
    }

    public void setPhotographerId(String photographerId) {
        this.photographerId = photographerId;
    }

    public Apprise getApprise() {
        return apprise;
    }

    public String getPhotographerId() {
        return photographerId;
    }

    public String getEmployerId() {
        return employerId;
    }

    public String getApprises(){
        System.out.println("---------"+this.photographerId);
        return this.appriseServ.getApprises(this.photographerId) ? "success" : "false";
    }
    public String apprise() {
        return this.appriseServ.apprise(this.apprise, this.employerId, this.photographerId) ? "success" : "fail";
    }
}
