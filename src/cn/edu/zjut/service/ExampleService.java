package cn.edu.zjut.service;

import cn.edu.zjut.dao.*;
import cn.edu.zjut.po.*;
import com.opensymphony.xwork2.ActionContext;

import java.sql.Timestamp;
import java.util.*;

public class ExampleService implements IExampleService {
    private List examples = new ArrayList();
    private Photographer photographer = null;
    private ExamplePanorama examplePanorama = null;
    private List sortedexamples = new ArrayList();
    private Map<String, Object> request;
    private Map<String, Object> session;
    private IPhotographerDAO photographerDAO = null;
    private IExampleDAO exampleDAO = null;
    private IExamplePanoramaDAO examplePanoramaDAO = null;
    private IEmployerDAO employerDAO = null;
    private ICommentsDAO commentsDAO = null;
    private Comments comments;
    public IExamplePanoramaDAO getExamplePanoramaDAO() {
        return examplePanoramaDAO;
    }

    public void setExamplePanoramaDAO(IExamplePanoramaDAO examplePanoramaDAO) {
        this.examplePanoramaDAO = examplePanoramaDAO;
    }

    public List getExamples() { return examples; }
    public void setExamples(List examples) { this.examples = examples;   }
    public Photographer getPhotographer() { return photographer; }
    public void setPhotographer(Photographer photographer) {       this.photographer = photographer;  }
    public List getSortedexamples() { return sortedexamples; }
    public void setSortedexamples(List sortedexamples) { this.sortedexamples = sortedexamples;  }
    public IPhotographerDAO getPhotographerDAO() { return photographerDAO; }
    public IExampleDAO getExampleDAO() {   return exampleDAO; }
    public IEmployerDAO getEmployerDAO() {    return employerDAO; }
    public ICommentsDAO getCommentsDAO() {  return commentsDAO;    }
    public void setCommentsDAO(ICommentsDAO commentsDAO) {this.commentsDAO = commentsDAO; }
    public void setExampleDAO(IExampleDAO exampleDAO) {
        this.exampleDAO = exampleDAO;
    }
    public void setEmployerDAO(IEmployerDAO employerDAO) { this.employerDAO = employerDAO;}
    public void setPhotographerDAO(IPhotographerDAO photographerDAO) {
        this.photographerDAO = photographerDAO;
    }

    public boolean recommend3(String exampleId){
        ActionContext ctx = ActionContext.getContext();
        this.session = ctx.getSession();
        this.request = (Map)ctx.get("request");
        Photographer photographer = (Photographer)this.session.get("photographer");
        Set examples = photographer.getExamples_own();
        Iterator it = examples.iterator();
        while (it.hasNext()){
            Example ex = (Example) it.next();
            if (Integer.parseInt(exampleId) == ex.getExampleId()){
                examples.remove(ex);
            }
        }
        Example example = this.exampleDAO.findbyId(exampleId);
        example.setStatus(1);
        examples.add(example);
        photographer.setExamples_own(examples);
        try {
            this.exampleDAO.update(example);
            this.photographerDAO.update(photographer);
            this.session.put("photographer",photographer);
            this.request.put("tip","申请成功");
            System.out.println("-----------------------申请成功！");
            return true;
        }catch (Exception var5){
            this.request.put("tip","申请失败");
            var5.printStackTrace();
            return false;
        }
    }

    public List searchInFramedes(String condition) {
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        String hql = "from Example as ex where ex.description like '%" + condition + "%'";
        this.examples = this.exampleDAO.findByHql(hql);
        this.request.put("examples", this.examples);
        return this.examples;
    }

    public void putExample(Example example) {
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        System.out.println(222);
        System.out.println(example.getExampleId());
        example = this.exampleDAO.findById1(example.getExampleId());
        System.out.println(3333);
        this.request.put("example", example);
        System.out.println("案例"+example.getExampleId()+"详情");

        photographer = this.photographerDAO.findById(example.getPhotographerId());
        this.request.put("photographer", photographer);
        System.out.println("摄影师"+photographer.getAccount());

        examplePanorama =this.examplePanoramaDAO.findById(example.getExampleId());
        this.request.put("examplePanorama", examplePanorama);

        new HashSet();
        Set<DisplayCom> displayComs = new HashSet(0);
        Set<Comments> commentss = example.getComments();
        Iterator<Comments> it = commentss.iterator();
        new Photographer();
        new Employer();

        while(it.hasNext()) {
            DisplayCom displayCom = new DisplayCom();
            Comments comment = (Comments)it.next();
            displayCom.setCommentsID(comment.getCommentsId());
            if (comment.getStatus()!=null){
                displayCom.setStatus(comment.getStatus());
            }
            String str = comment.getReviewer();//得到评论的账号id
            if (str.charAt(0) == '0') { //arAt() 方法可返回指定位置的字符
                System.out.println("评论的摄影师id为："+str);
                Photographer photographer = this.photographerDAO.findById(str);
                displayCom.setProfilePhoto(photographer.getProfilePhoto());
                displayCom.setAccount(photographer.getAccount());
                displayCom.setContent(comment.getContent());
                displayCom.setTime(comment.getTime());
                displayComs.add(displayCom);
            }
            if (str.charAt(0) == '1'){
                System.out.println("评论的用户账号id为："+str);
                Employer employer = this.employerDAO.findById(str);
                displayCom.setProfilePhoto(employer.getProfilePhoto());
                displayCom.setAccount(employer.getAccount());
                displayCom.setContent(comment.getContent());
                displayCom.setTime(comment.getTime());
                displayCom.setCommentsID(comment.getCommentsId());
                displayComs.add(displayCom);
            }
        }

        this.request.put("displayComs", displayComs);
    }

    public boolean review(Example example, Comments comments) {
        System.out.println("评论模块");
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        this.session = (Map)ctx.get("session");
        //判断评论的是摄影师还是用户
        if (this.session.get("photographer") != null) {
            Photographer photographer = (Photographer)this.session.get("photographer");
            comments.setReviewer(photographer.getPhotographerId());
        } else {
            Employer employer = (Employer)this.session.get("employer");
            comments.setReviewer(employer.getEmployerId());
        }
        try {
            comments.setTime(new Timestamp((new Date()).getTime()));
            example = this.exampleDAO.findById1(example.getExampleId());
            example.getComments().add(comments);
            example.setVisits(example.getVisits() + 1);
            this.exampleDAO.update(example);
            this.request.put("example", example);
            photographer = this.photographerDAO.findById(example.getPhotographerId());
            this.request.put("photographer", photographer);
            System.out.println("摄影师"+photographer.getAccount());

           examplePanorama =this.examplePanoramaDAO.findById(example.getExampleId());
            this.request.put("examplePanorama", examplePanorama);

            new HashSet();
            Set<DisplayCom> displayComs = new HashSet(0);
            Set<Comments> commentss = example.getComments();
            Iterator<Comments> it = commentss.iterator();
            new Photographer();
            new Employer();

            while(it.hasNext()) {
                DisplayCom displayCom = new DisplayCom();
                Comments comment = (Comments)it.next();
                String str = comment.getReviewer();
                if (str.charAt(0) == '0') {
                    Photographer photographer = this.photographerDAO.findById(str);
                    displayCom.setProfilePhoto(photographer.getProfilePhoto());
                    displayCom.setAccount(photographer.getAccount());
                    displayCom.setContent(comment.getContent());
                    displayCom.setTime(comment.getTime());
                    displayComs.add(displayCom);
                } else {
                    Employer employer = this.employerDAO.findById(str);
                    displayCom.setProfilePhoto(employer.getProfilePhoto());
                    displayCom.setAccount(employer.getAccount());
                    displayCom.setContent(comment.getContent());
                    displayCom.setTime(comment.getTime());
                    displayComs.add(displayCom);
                }
            }

            this.request.put("displayComs", displayComs);
            return true;
        } catch (Exception var12) {
            var12.printStackTrace();
            return false;
        }
    }

    public List findAll() {
        ActionContext ctx = ActionContext.getContext();
        this.session = ctx.getSession();
        this.request = (Map)ctx.get("request");
        String hql = "from Example";
        this.examples = this.exampleDAO.findByHql(hql);
        this.request.put("examples", this.examples);
        return this.examples;
    }

    public List searchInFrame(String condition) {
        ActionContext ctx = ActionContext.getContext();
        this.session = ctx.getSession();
        this.request = (Map)ctx.get("request");
        String hql = "from Example as ex where ex.name like '%" + condition + "%'";
        String hql2 = "from Example as ex where ex.name like '%" + condition + "%' order by ex.praise";
        System.out.println(hql);
        this.examples = this.exampleDAO.findByHql(hql);
        this.sortedexamples = this.exampleDAO.findByHql(hql2);
        this.request.put("examples", this.examples);
        this.request.put("sortedexamples", this.sortedexamples);
        return this.examples;
    }

    public List searchInList(List<String> list) {
        ActionContext ctx = ActionContext.getContext();
        this.session = ctx.getSession();
        this.request = (Map)ctx.get("request");
        System.out.println("1"+(String)list.get(0)+"2"+(String)list.get(1));
        /* int var20000;
       if( ((String)list.get(0)).equals("内景")){
            var20000=1;
        }else var20000=2;*/
        String var10000 = (String)list.get(1);
        String var20000 = (String)list.get(0);
        System.out.println("1"+var20000+"2"+var10000);
        String hql = "from Example as ex where ex.style like '%" + var10000 + "%' and ex.area like '%" + var20000 + "%'";
        var10000 = (String)list.get(1);
        String hql2 = "from Example as ex where ex.style like '%" + var10000 + "%' and ex.area like '%" + var20000 + "%' order by ex.praise";
        this.examples = this.exampleDAO.findByHql(hql);
        this.sortedexamples = this.exampleDAO.findByHql(hql2);
        System.out.println("sortedexamples:" + this.sortedexamples.size());
        this.request.put("examples", this.examples);
        this.request.put("sortedexamples", this.sortedexamples);
        return this.examples;
    }

    public int praise(String exampleId) {
        Example example = this.exampleDAO.findById1(Integer.parseInt(exampleId));
        System.out.println("example.getPraise():" + example.getPraise());
        example.setPraise(example.getPraise() + 1);
        System.out.println("example.getPraise()222:" + example.getPraise());
        this.exampleDAO.update(example);
        System.out.println("ok");
        return example.getPraise();
    }

    public void star(String exampleId) {
        ActionContext ctx = ActionContext.getContext();
        this.session = (Map)ctx.get("session");
        Example example = this.exampleDAO.findById1(Integer.parseInt(exampleId));
        example.getEm_collecters().add((Employer)this.session.get("employer"));
        Employer tempemployer = (Employer)this.session.get("employer");
        this.exampleDAO.update(example);
        this.session.put("employer", this.employerDAO.findById(tempemployer.getEmployerId()));
    }

    public void unstar(String exampleId) {
        ActionContext ctx = ActionContext.getContext();
        this.session = (Map)ctx.get("session");
        Example example = this.exampleDAO.findById1(Integer.parseInt(exampleId));
        example.getEm_collecters().remove((Employer)this.session.get("employer"));
        Iterator it = example.getEm_collecters().iterator();

        Employer employertemp;
        while(it.hasNext()) {
            employertemp = (Employer)it.next();
            if (((Employer)this.session.get("employer")).getEmployerId().equals(employertemp.getEmployerId())) {
                System.out.println("find it:" + employertemp.getEmployerId());
                it.remove();
            }
        }

        employertemp = (Employer)this.session.get("employer");
        this.exampleDAO.update(example);
        this.session.put("employer", this.employerDAO.findById(employertemp.getEmployerId()));
    }

    public List recommendyou(){
        ActionContext ctx = ActionContext.getContext();
        this.session = ctx.getSession();
        this.request = (Map)ctx.get("request");
        String hql = "from Example as ex where ex.status=2";
        System.out.println(hql);
        this.examples = this.exampleDAO.findByHql(hql);
        this.request.put("examples", this.examples);
        this.request.put("sortedexamples", this.sortedexamples);
        return this.examples;
    }
    public boolean deleteComments(int commentID) {
        comments = commentsDAO.findById(commentID);
        if (comments!=null){
            System.out.println(comments.getCommentsId()+" "+comments.getContent());
            comments.setStatus(1);
            commentsDAO.update(comments);
            System.out.println("update success");
            return true;
        }else {
            return false;
        }

    }
    public boolean allowComments(int commentID){
        comments = commentsDAO.findById(commentID);
        if (comments!=null){
            System.out.println(comments.getCommentsId()+" "+comments.getContent());
            comments.setStatus(0);
            commentsDAO.update(comments);
            System.out.println("update success");
            return true;
        }else {
            return false;
        }
    }

    public boolean showComments(String exampleID){
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        Set<DisplayCom> displayComs = new HashSet(0);
        Example example = exampleDAO.findbyId(exampleID);
        Set<Comments> commentss = example.getComments();
        if (commentss.isEmpty()!=true){
            Iterator<Comments> it = commentss.iterator();
            while(it.hasNext()) {
                DisplayCom displayCom = new DisplayCom();
                Comments comment = (Comments)it.next();
                String str = comment.getReviewer();
                System.out.println("ctx:"+comment.getContent());
                displayCom.setCommentsID(comment.getCommentsId());
                if (comment.getStatus()!=null){
                    displayCom.setStatus(comment.getStatus());
                }
                if (str.charAt(0) == '0') {
                    Photographer photographer = this.photographerDAO.findById(str);
                    displayCom.setProfilePhoto(photographer.getProfilePhoto());
                    displayCom.setAccount(photographer.getAccount());
                    displayCom.setContent(comment.getContent());
                    displayCom.setTime(comment.getTime());
                    displayComs.add(displayCom);
                } else {
                    Employer employer = this.employerDAO.findById(str);
                    displayCom.setProfilePhoto(employer.getProfilePhoto());
                    displayCom.setAccount(employer.getAccount());
                    displayCom.setContent(comment.getContent());
                    displayCom.setTime(comment.getTime());
                    displayComs.add(displayCom);
                }
            }
            this.request.put("exampleID",exampleID);
            this.request.put("showComments", displayComs);
            return true;
        }else {
            String mes="this example has no comment!";
            this.request.put("tipMessage",mes);
            return false;
        }


    }


}
