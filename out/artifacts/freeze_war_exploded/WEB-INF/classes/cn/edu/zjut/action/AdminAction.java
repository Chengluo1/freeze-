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
    @Autowired
    private IAdminService adminService = null;
    private String userId;

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
            String message = "注销成功!";
            request.setAttribute("tipMessage",message);
            return "success";
        }else {
            String message="注销失败!";
            request.setAttribute("tipMessage",message);
            return "failed";
        }

    }
}
