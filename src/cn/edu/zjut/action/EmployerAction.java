package cn.edu.zjut.action;

import cn.edu.zjut.po.Employer;
import cn.edu.zjut.service.EmployerService;
import cn.edu.zjut.service.IEmployerService;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

public class EmployerAction {
    private Employer employer;
    private String repassword;
    private File uprofile;
    public String uprofileFileName;
    @Autowired
    private IEmployerService employerServ = null;

    public String getRepassword() {
        return repassword;
    }

    public void setRepassword(String repassword) {
        this.repassword = repassword;
    }

    public File getUprofile() { return uprofile;   }

    public void setUprofile(File uprofile) {  this.uprofile = uprofile;   }

    public String getUprofileFileName() {    return uprofileFileName;   }

    public void setUprofileFileName(String uprofileFileName) { this.uprofileFileName = uprofileFileName;   }

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
    //获取雇主信息
    public String putEmployer() {
        return this.employerServ.putEmployer(this.employer) ? "myself" : "others";
    }
    //修改雇主个人资料
    public String update3() {
        System.out.println("in actoin employer.name" + this.employer.getName());
        System.out.println("uprofileFileName:   " + this.uprofileFileName);
        if (this.uprofile == null) {
            System.out.println("yes");
        }
        return this.employerServ.update3(this.employer, this.uprofile, this.uprofileFileName) ? "success" : "fail";
    }

    public String back() {
        return this.employerServ.back() ? "success" : "fail";
    }
    public String showEmp(){
        employerServ.showEmp();
        return "success";
    }
}
