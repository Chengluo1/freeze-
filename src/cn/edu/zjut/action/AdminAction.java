package cn.edu.zjut.action;

import cn.edu.zjut.po.Employer;
import cn.edu.zjut.po.Photographer;
import cn.edu.zjut.service.AdminService;
import cn.edu.zjut.service.EmployerService;
import cn.edu.zjut.service.IAdminService;
import cn.edu.zjut.service.PhotographerService;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;

public class AdminAction {
    private String phone;
    private Photographer photographer;
    @Autowired
    private IAdminService adminService = null;
    private String userId;
    private String exampleID;

    public String getPhone() {
        return phone;
    }

    public String getUserId() {
        return userId;
    }

    public Photographer getPhotographer() {
        return photographer;
    }

    public void setPhotographer(Photographer photographer) {
        this.photographer = photographer;
    }

    public void setExampleID(String exampleID) {
        this.exampleID = exampleID;
    }

    public String getExampleID() {
        return exampleID;
    }

    public IAdminService getAdminService() {
        return adminService;
    }

    public void setAdminService(IAdminService adminService) {
        this.adminService = adminService;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public AdminAction() {
    }
    public String logout1(){
        HttpServletRequest request = ServletActionContext.getRequest();
        if (adminService.logout1(this.userId,this.phone)){
            String message = "Logout successful!";
            request.setAttribute("tipMessage",message);
            return "success";
        }else {
            String message="Logout failed!";
            request.setAttribute("tipMessage",message);
            return "failed";
        }
    }

    public String display1() {
        adminService.display1();
        return "success";
    }
    public String display2() {
        adminService.display2();
        return "success";
    }
    public String view(){
        adminService.view(photographer);
        return "success";
    }
    public String Authen(){
        HttpServletRequest request = ServletActionContext.getRequest();
        System.out.println("action:"+photographer.getPhotographerId());
        if (adminService.Authen(photographer)){
            String message="Authentication is successful!";
            request.setAttribute("tipMessage",message);
            return "success";
        }else {
            String message="Authentication failed!";
            request.setAttribute("tipMessage",message);
            request.setAttribute("photographer",photographer);
            return "failed";
        }
    }
    public String display(){
        adminService.display();
        return "success";
    }
    public String recommendE(){
        HttpServletRequest request = ServletActionContext.getRequest();
        System.out.println("id:"+exampleID);
        if (adminService.recommendE(exampleID)){
            String message = "Promotion success!";
            request.setAttribute("tipMessage",message);
            return "success";
        }else {
            String message="Failed to promote!";
            request.setAttribute("tipMessage",message);
            return "failed";
        }

    }
    public String recommendP(){
        HttpServletRequest request = ServletActionContext.getRequest();
        if (adminService.recommendP(photographer)){
            String message = "Promotion success!";
            request.setAttribute("tipMessage",message);
            return "success";
        }else {
            String message="Failed to promote!";
            request.setAttribute("tipMessage",message);
            return "failed";
        }
    }
}
