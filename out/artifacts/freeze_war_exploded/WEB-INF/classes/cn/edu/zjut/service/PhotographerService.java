package cn.edu.zjut.service;

import cn.edu.zjut.dao.IAdminDAO;
import cn.edu.zjut.dao.IEmployerDAO;
import cn.edu.zjut.dao.IPhotographerDAO;
import cn.edu.zjut.po.Admin;
import cn.edu.zjut.po.Employer;
import cn.edu.zjut.po.Example;
import cn.edu.zjut.po.Photographer;
import com.opensymphony.xwork2.ActionContext;
import org.omg.PortableServer.LIFESPAN_POLICY_ID;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class PhotographerService implements IPhotographerService{
    private IPhotographerDAO photographerDAO = null;
    private IAdminDAO adminDAO = null;
    private IEmployerDAO employerDAO = null;
    private Map <String,Object> session;
    private Map <String,Object> request;
    private List<Example> recommendExamples = new ArrayList();
    public String test(){
        return "test";
    }
    public void setPhotographerDAO(IPhotographerDAO photographerDAO) {
        System.out.println("setPhotographerDAO");
        this.photographerDAO = photographerDAO;
    }

    public void setAdminDAO(IAdminDAO adminDAO) {
        this.adminDAO = adminDAO;
    }

    public void setEmployerDAO(IEmployerDAO employerDAO) {
        this.employerDAO = employerDAO;
    }

    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    public void setRequest(Map<String, Object> request) {
        this.request = request;
    }

    public void setRecommendExamples(List<Example> recommendExamples) {
        this.recommendExamples = recommendExamples;
    }

    public boolean login(Photographer pho){
        System.out.println("------try to login Action----");
        String phone = pho.getPhone();
        String password = pho.getPassword();
        ActionContext ctx = ActionContext.getContext();
        this.session = (Map) ctx.get("session");
        this.request = (Map) ctx.get("request");
        String hql = "from Photographer where phone='" + phone + "' and password='"+password +"'";
        String hql1 = "from Employer where phone='" + phone + "' and password='"+password +"'";
        String hql2 = "from Admin where phone='" + phone + "' and password='"+password +"'";
        List list = this.photographerDAO.findByHql(hql);
        List list2 = this.employerDAO.findByHql(hql1);
        List list3 = this.adminDAO.findByhql(hql2);
        if (!list.isEmpty()){
            Photographer photographer = (Photographer) list.get(0);
            this.session.put("id",photographer.getPhotographerId());
            this.session.put("photographer",photographer);
            this.request.put("tip","登陆成功！");
            return true;
        }else if (!list2.isEmpty()){
            Employer employer = (Employer)list2.get(0);
            this.session.put("id", employer.getEmployerId());
            this.session.put("employer", employer);
            this.request.put("tip","登陆成功！");
//            System.out.println("in recommend:");
//            this.recommend(employer.getEmployerId());
//            this.session.put("recommendExamples", this.recommendExamples);
//            System.out.println("in recommend:" + this.recommendExamples.size());
            return true;
        }else if (!list3.isEmpty()){
            Admin admin = (Admin) list3.get(0);
            this.session.put("id",admin.getAdminId());
            this.session.put("admin",admin);
            this.request.put("tip","登陆成功！");
//            此处还有审核中相关
            return true;
        }else {
            return false;
        }
    }

    public boolean registerPho(Photographer pho){
        String phone = pho.getPhone();
        String hql1 = "from Photographer where phone ='"+phone+"'";
        if (photographerDAO.findByHql(hql1).isEmpty()){
            String id = photographerDAO.findPho();
            if (id == null){
                String a = "0000000001";
                pho.setPhotographerId(a);
            }else {
                Integer a = Integer.parseInt(id)+1;
                String b = a.toString();
                pho.setPhotographerId(b);
            }
            pho.setAccount(phone);
            pho.setIDNumber("");
            pho.setName("");

            try {
                photographerDAO.save(pho);
                return true;
            }catch (Exception var7){
                var7.printStackTrace();
                return false;
            }

        }else {
            return false;
        }
    }

    public boolean searchByAccount(String account){
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        String hql = "from Photographer as p where p.account like '%"+ account + "%'";
        List photographers = this.photographerDAO.findByHql(hql);
        this.request.put("photographers",photographers);
        return true;
    }

    public boolean findAll() {
        ActionContext ctx = ActionContext.getContext();
        String hql = "from cn.edu.zjut.po.Photographer";
        List photographers = this.photographerDAO.findByHql(hql);
        this.request = (Map)ctx.get("request");
        this.request.put("photographers",photographers);
        return true;
    }

    public boolean findByPraise(){
        ActionContext ctx = ActionContext.getContext();
        String hql = "from cn.edu.zjut.po.Photographer p where p.praise >=15";
        List photographers = this.photographerDAO.findByHql(hql);
        this.request = (Map)ctx.get("request");
        this.request.put("photographers",photographers);
        return true;
    }

    public boolean findByScore(){
        ActionContext ctx = ActionContext.getContext();
        String hql = "from cn.edu.zjut.po.Photographer p where p.score >=1";
        List photographers = this.photographerDAO.findByHql(hql);
        this.request = (Map)ctx.get("request");
        this.request.put("photographers",photographers);
        return true;
    }

    public boolean putPhotographer(Photographer photographer){
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        this.session = (Map)ctx.get("session");
        if(this.session.get("photographer")!=null){
            String id =((Photographer)this.session.get("photographer")).getPhotographerId();
            if (photographer.getPhotographerId().equals(id)){
                return true;
            }else {
                photographer = this.photographerDAO.findById(photographer.getPhotographerId());
                this.request.put("photographer",photographer);
                return false;
            }
        }else {
            photographer = this.photographerDAO.findById(photographer.getPhotographerId());
            this.request.put("photographer",photographer);
            return false;
        }
    }
}
