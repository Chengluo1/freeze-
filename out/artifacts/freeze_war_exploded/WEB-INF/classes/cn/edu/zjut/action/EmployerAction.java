package cn.edu.zjut.action;

import cn.edu.zjut.po.Employer;
import cn.edu.zjut.service.EmployerService;
import cn.edu.zjut.service.IEmployerService;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;

public class EmployerAction {
    private Employer employer;
    private String repassword;
    @Autowired
    private IEmployerService employerServ = null;

    public String getRepassword() {
        return repassword;
    }

    public void setRepassword(String repassword) {
        this.repassword = repassword;
    }

    public Employer getEmployer() {
        return employer;
    }

    public void setEmployer(Employer employer) {
        this.employer = employer;
    }

    public IEmployerService getEmployerServ() {
        return employerServ;
    }

    public void setEmployerServ(EmployerService employerServ) {
        this.employerServ = employerServ;
    }

    public String register(){
        HttpServletRequest request = ServletActionContext.getRequest();
        String message;
        if (this.employerServ.registerEmp(this.employer)){
            message = "注册成功!";
            request.setAttribute("tipMessage",message);
            return "success";
        }else {
            message = "注册失败，手机号已被注册过!";
            request.setAttribute("tipMessage",message);
            return "fail";
        }
    }
}
