package cn.edu.zjut.service;

import cn.edu.zjut.dao.*;
import cn.edu.zjut.po.Employer;
import cn.edu.zjut.po.Example;
import cn.edu.zjut.po.Photographer;
import com.opensymphony.xwork2.ActionContext;


import javax.jms.Session;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class AdminService implements IAdminService{
    IAdminDAO adminDAO = null;
    IPhotographerDAO photographerDAO = null;
    IExampleDAO exampleDAO = null;
    String exampleID;
    Photographer photographer;
    IEmployerDAO employerDAO =null;

    public IEmployerDAO getEmployerDAO() {
        return employerDAO;
    }

    public void setEmployerDAO(IEmployerDAO employerDAO) {
        this.employerDAO = employerDAO;
    }
    public Photographer getPhotographer() {
        return photographer;
    }

    public void setPhotographer(Photographer photographer) {
        this.photographer = photographer;
    }

    private Map<String, Object> request;
    private Map<String, Object> session;

    public String getExampleID() {
        return exampleID;
    }

    public void setExampleID(String exampleID) {
        this.exampleID = exampleID;
    }

    public void setAdminDAO(AdminDAO adminDAO) {
        this.adminDAO = adminDAO;
    }

    public void setPhotographerDAO(IPhotographerDAO photographerDAO) {
        this.photographerDAO = photographerDAO;
    }

    public void setAdminDAO(IAdminDAO adminDAO) {
        this.adminDAO = adminDAO;
    }

    public void setExampleDAO(IExampleDAO exampleDAO) {
        this.exampleDAO = exampleDAO;
    }


    public boolean logout1(String userId, String phone){
        String str = userId.substring(0, 1);
        System.out.println("str: "+str);

        if (str.equals("0")){
            System.out.println("try to delete photographer!");
            String hql1="from Photographer where photographerId='"+userId+"'and phone='"+phone+"'";
            try {
                System.out.println("userId:"+userId);
                Photographer photographer = adminDAO.findPho(hql1);
                System.out.println("phoid:"+photographer.getPhotographerId());
                adminDAO.delete(photographer);

                String hql = "from Photographer";
                List list = photographerDAO.findByHql(hql);
                if (!list.isEmpty()){
                    System.out.println("ÉãÓ°Ê¦ÕËºÅÁÐ±í²»Îª¿Õ£¡£¡£¡");
                }
                session.put("managerPhotographer",list);
                session.put("accountType",1);
                return true;
            }catch (RuntimeException var3){
                throw var3;
            }

        }else if (str.equals("1")){
            System.out.println("try to delete employer!");
            String hql2="from Employer where employerId='"+userId+"'and phone='"+phone+"'";
            try {
                Employer employer = adminDAO.findEmp(hql2);
                System.out.println("empid:"+employer.getEmployerId());
                adminDAO.delete(employer);
                String hql = "from Employer";
                List list = employerDAO.findByHql(hql);
                if (!list.isEmpty()){
                    System.out.println("¹ÍÖ÷ÕËºÅÁÐ±í²»Îª¿Õ£¡£¡£¡");
                }
                session.put("managerEmployer",list);
                session.put("accountType",2);
                return true;
            }catch (RuntimeException var3){
                throw var3;
            }
        }else {
            return false;
        }
    }
    public List display1(){
        ActionContext ctx = ActionContext.getContext();
        this.session = (Map)ctx.get("session");
        String state = "´ýÉóºË";
        String hql = "from Photographer where status='"+state+"'";
        List list = adminDAO.findByhql(hql);
        if (!list.isEmpty()){
            System.out.println("´ýÉóºËÁÐ±í²»Îª¿Õ£¡£¡£¡");
        }
        session.put("photographers",list);
        return list;
    }

    public List display2(){
        ActionContext ctx = ActionContext.getContext();
        this.session = (Map)ctx.get("session");
        String state = "ÒÑÉóºË";
        String hql = "from Photographer where status='"+state+"'";
        List list = adminDAO.findByhql(hql);
        session.put("photographerss",list);
        return list;
    }

    public void view(Photographer photographer){
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map) ctx.get("request");
        photographer = adminDAO.findbyId(photographer.getPhotographerId());
        this.request.put("photographer",photographer);
    }

    public boolean Authen(Photographer photographer){
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map) ctx.get("request");
        System.out.println("phoIDTest:"+photographer.getPhotographerId());
        Photographer photographer1 = adminDAO.findbyId(photographer.getPhotographerId());
        photographer1.setStatus("ÒÑÉóºË");
        photographer1.setTitle(photographer.getTitle());
        try {
            photographerDAO.update(photographer1);
            request.put("photographer",photographer1);
            this.display1();
            this.display2();
            return true;
        }catch (RuntimeException var3){
            throw var3;
        }
    }

    public List display(){
        ActionContext ctx = ActionContext.getContext();
        this.session = (Map)ctx.get("session");
        String hql = "from Photographer order by money1 desc";
        List list = adminDAO.findByhql(hql);
        this.session.put("Photographerss",list);
//        System.out.println("display session æµ‹è¯•: "+session.get("Photographerss"));
//        int k = list.size();
//        Photographer photographer;
//        for (int j = 0; j < k; j++) {
//            photographer = (Photographer) list.get(j);
//
//            int num = photographer.getExamples_own().size();
//            Set exas = photographer.getExamples_own();
//            Iterator it1 = exas.iterator();
//            while (it1.hasNext()){
//                System.out.println("éåŽ†æ¡ˆä¾‹ï¼?"+it1.next());
//            }
//        }
//        if (!list.isEmpty()){
//            System.out.println("list ä¸æ˜¯ç©ºçš„!!!");
//        }
        return list;
    }
    public boolean recommendE(String exampleID){
        System.out.println("recommendE here:"+exampleID);
        Example example = exampleDAO.findbyId(exampleID);
        example.setStatus(2);
        exampleDAO.update(example);
        display();//é‡ç½®ä¼šè¯ä½œç”¨åŸŸPhotographerss
        return true;
    }

    @Override
    public boolean recommendP(Photographer photographer) {
        Photographer photographer1 = photographerDAO.findById(photographer.getPhotographerId());
//        System.out.println("find p: "+photographer1.getPhotographerId());
        photographer1.setStatus1(2);
//        System.out.println("find p status: "+photographer1.getStatus());
        photographerDAO.update(photographer1);
        display();//é‡ç½®ä¼šè¯ä½œç”¨åŸŸPhotographerss
        return true;
    }
}
