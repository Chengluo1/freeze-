package cn.edu.zjut.service;

import cn.edu.zjut.dao.EmployerDAO;
import cn.edu.zjut.dao.IEmployerDAO;
import cn.edu.zjut.po.Employer;
import com.opensymphony.xwork2.ActionContext;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public class EmployerService implements IEmployerService{
    IEmployerDAO employerDAO = null;
    private Map<String,Object> request;
    private Map<String,Object> session;

    public IEmployerDAO getEmployerDAO() {
        return employerDAO;
    }

    public void setEmployerDAO(IEmployerDAO employerDAO) {
        this.employerDAO = employerDAO;
    }

    //用户注册
    public boolean registerEmp(Employer var1){
        String phone = var1.getPhone();
        String hql1= "from Employer where phone='"+phone+"'";
        if (employerDAO.findByHql(hql1).isEmpty()){
            String id = employerDAO.findEmp();
            if (id == null){//编写id
                String a = "1000000001";
                var1.setEmployerId(a);
            }else {
                Integer a = Integer.parseInt(id)+1;
                String b = a.toString();
                var1.setEmployerId(b);
            }
            var1.setAccount(var1.getPhone());
//            var1.setHmpgbkg("");
//            var1.setProfilePhoto("");
            try {
                employerDAO.save(var1);
                return true;
            }catch (Exception var7){
                var7.printStackTrace();
                return false;
            }
        }else {
            return false;
        }
    }
    //用户个人中心页
    //获取雇主信息
    public boolean putEmployer(Employer employer) {
        ActionContext ctx = ActionContext.getContext();
        this.session = (Map)ctx.get("session");
        this.request = (Map)ctx.get("request");
        System.out.println("id:"+employer.getEmployerId());
        if (this.session.get("employer") != null) {
            String id = ((Employer)this.session.get("employer")).getEmployerId();
            if (employer.getEmployerId().equals(id)) {
                return true;
            } else {
                employer = this.employerDAO.findById(employer.getEmployerId());
                this.session.put("employer1", employer);
                return false;
            }
        } else {
            employer = this.employerDAO.findById(employer.getEmployerId());
            this.session.put("employer1", employer);
            return false;
        }
    }

    public boolean back() {
        ActionContext ctx = ActionContext.getContext();
        this.session = (Map)ctx.get("session");
        Employer emp = this.employerDAO.findById("1222222222");
        this.session.put("employer", emp);
        this.session.put("id", "1222222222");
        return true;
    }

    //雇主修改信息
    public boolean update3(Employer employer, File uprofile, String uprofileFileName) {//uprofile 头像
        ServletContext servletContext = ServletActionContext.getServletContext();
        System.out.println("in service:" + uprofileFileName);
        ActionContext ctx = ActionContext.getContext();
        this.session = ctx.getSession();
        this.request = (Map)ctx.get("request");
        if (uprofile != null) {
            String save = servletContext.getRealPath("/photographer/employer/profilephoto/");
            this.copyfile(save, uprofile, uprofileFileName);
            employer.setProfilePhoto(uprofileFileName);
        }

        Employer emp = (Employer)this.session.get("employer");
        emp.setAccount(employer.getAccount());
        emp.setPassword(employer.getPassword());
        emp.setProfilePhoto(employer.getProfilePhoto());
        emp.setName(employer.getName());
        emp.setIDNumber(employer.getIDNumber());
        emp.setSex(employer.getSex());
        emp.setRegion(employer.getRegion());
        emp.setPhone(employer.getPhone());
        emp.setEmail(employer.getEmail());
        emp.setQq(employer.getQq());
        emp.setWechat(employer.getWechat());

        try {
            this.employerDAO.update(emp);
            this.request.put("tip", "修改成功");
            this.session.put("employer", employer);
            return true;
        } catch (Exception var8) {
            this.request.put("tip", "修改失败");
            var8.printStackTrace();
            return false;
        }
    }

    //打印路径
    public String copyfile(String path, File file, String filename) {
        File f = new File(path);
        if (!f.exists()) {
            f.mkdirs();
        }

        try {
            FileUtils.copyFile(file, new File(f, filename));
        } catch (IOException var6) {
            var6.printStackTrace();
        }

        System.out.println(path);
        path = path + filename;
        System.out.println(path);
        return path;
    }
    public boolean showEmp(){
        ActionContext ctx = ActionContext.getContext();
        this.session = (Map)ctx.get("session");
        String hql = "from Employer";
        List list = employerDAO.findByHql(hql);
        if (!list.isEmpty()){
            System.out.println("雇主账号列表不为空！！！");
        }
        session.put("managerEmployer",list);
        session.put("accountType",2);
        return true;
    }
}

