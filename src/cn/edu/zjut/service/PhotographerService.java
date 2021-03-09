package cn.edu.zjut.service;

import cn.edu.zjut.dao.*;
import cn.edu.zjut.po.*;
import com.opensymphony.xwork2.ActionContext;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class PhotographerService implements IPhotographerService{
    private IPhotographerDAO photographerDAO = null;
    private IAdminDAO adminDAO = null;
    private IEmployerDAO employerDAO = null;
    private IExamplePanoramaDAO examplePanoramaDAO = null;
    private IExamplePictureDAO examplePictureDAO = null;
    private IExampleDAO exampleDAO = null;
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

    public void setExamplePanoramaDAO(IExamplePanoramaDAO examplePanoramaDAO) {
        this.examplePanoramaDAO = examplePanoramaDAO;
    }

    public void setExamplePictureDAO(IExamplePictureDAO examplePictureDAO) {
        this.examplePictureDAO = examplePictureDAO;
    }

    public void setExampleDAO(IExampleDAO exampleDAO) {
        this.exampleDAO = exampleDAO;
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
                String b = "0"+a.toString();
                System.out.println("b:"+b);
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

    public boolean findByYou(){
        ActionContext ctx = ActionContext.getContext();
        String hql = "from cn.edu.zjut.po.Photographer p where p.status1 = 2";
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

    public boolean judgeIdentity(){
        ActionContext ctx = ActionContext.getContext();
        this.session = (Map)ctx.get("session");
        return this.session.get("photographer") != null;
    }

    public boolean update(Photographer photographer, File profile,String profileFileName){
        ServletContext servletContext = ServletActionContext.getServletContext();
        ActionContext ctx = ActionContext.getContext();
        this.session = (Map) ctx.get("session");
        this.request = (Map) ctx.get("request");
        if (profile != null){
            String save = servletContext.getRealPath("photographer/photographer/profilephoto/");
            save = this.copyfile(save,profile,profileFileName);
            photographer.setProfilePhoto(profileFileName);
            System.out.println("-------------"+save);
        }
        Photographer p = (Photographer)this.session.get("photographer");
        p.setAccount(photographer.getAccount());
        p.setPassword(photographer.getPassword());
        p.setProfilePhoto(photographer.getProfilePhoto());
        p.setName(photographer.getName());
        p.setIDNumber(photographer.getIDNumber());
        p.setSex(photographer.getSex());
        p.setRegion(photographer.getRegion());
        p.setPhone(photographer.getPhone());
        p.setEmail(photographer.getEmail());
        p.setQq(photographer.getQq());
        p.setWechat(photographer.getWechat());
        p.setIntroduction(photographer.getIntroduction());
        try {
            this.photographerDAO.update(p);
            this.request.put("tip","修改成功");
            this.session.put("photographer",photographer);
            return true;
        }catch (Exception var8){
            this.request.put("tip", "修改失败");
            var8.printStackTrace();
            return false;
        }
    }

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
        path = path + "\\" + filename;
        return path;
    }

    public boolean update2(Photographer photographer,File certificate,String certificateFileName){
        ServletContext servletContext = ServletActionContext.getServletContext();
        ActionContext ctx = ActionContext.getContext();
        this.session = (Map)ctx.getSession();
        this.request = (Map)ctx.get("request");
        if (certificate != null){
            String save2 = servletContext.getRealPath("photographer/photographer/certificate/");
            save2 = this.copyfile(save2,certificate,certificateFileName);
            photographer.setCertificate(certificateFileName);
            photographer.setStatus("待审核");
        }
        Photographer p = (Photographer)this.session.get("photographer");
        p.setPrize(photographer.getPrize());
        p.setCertificate(photographer.getCertificate());
        p.setStatus(photographer.getStatus());
        try {
            this.photographerDAO.update(p);
            this.request.put("tip","申请已提交，请耐心等待");
            System.out.println("-----------------------申请已提交，请耐心等待");
            this.session.put("photographer",p);
            return true;
        }catch (Exception var8){
            this.request.put("tip","申请失败");
            var8.printStackTrace();
            return false;
        }
    }

    public boolean recommend1(int money1){
        ActionContext ctx = ActionContext.getContext();
        this.session = ctx.getSession();
        this.request = (Map)ctx.get("request");
        Photographer photographer = (Photographer) this.session.get("photographer");
        photographer.setStatus1(1);
        photographer.setMoney1(money1);
        try {
            this.photographerDAO.update(photographer);
            this.request.put("tip","您已申请推优!");
            this.session.put("photographer",photographer);
            return true;
        }catch (Exception var5){
            this.request.put("tip","");
            var5.printStackTrace();
            return false;
        }
    }
    //上传案例图片保存在out文件夹，读取案例图片又从web文件夹下取
    public boolean upload(Example example,File[] upload,File[] upload2){
        ServletContext servletContext = ServletActionContext.getServletContext();
        try {
            Photographer photographer = (Photographer)this.session.get("photographer");
            String path = servletContext.getResource("file").getPath();
            System.out.println(path+"-------------------------");
            String var10001 = photographer.getPhotographerId();
            String pathOfPanoramas = path + "/" + var10001 + "/" + example.getName() + "/panoramas/";
               //     servletContext.getRealPath("/file/" + var10001 + "/" + example.getName() + "/panoramas/");
            System.out.println("pathOfPanoramas--------------"+pathOfPanoramas);
            var10001 = photographer.getPhotographerId();
            String pathOfPictures = path + "/" + var10001 + "/" + example.getName() + "/pictures/";
               //     servletContext.getRealPath("/file/" + var10001 + "/" + example.getName() + "/pictures/");
            System.out.println("pathOfPictures---------------"+pathOfPictures);
            File fileOfPanoramas = new File(pathOfPanoramas);
            File fileOfPictures = new File(pathOfPictures);
            if (!fileOfPanoramas.exists()){
                fileOfPanoramas.mkdirs();
                System.out.println("-----------创文件");
            }
            if (!fileOfPictures.exists()){
                fileOfPictures.mkdirs();
            }
            int i;
            String var10002;
            for (i=0; i<upload.length;++i){
                upload[i].renameTo(new File(fileOfPanoramas,(i)+".jpg"));
                var10002 = photographer.getPhotographerId();
                ExamplePanorama panorama = new ExamplePanorama("file/" + var10002 + "/" + example.getName() + "/panoramas/" + Integer.toString(i) + ".jpg");
                this.examplePanoramaDAO.save(panorama);
                example.getPanoramas().add(panorama);
            }
            for (i=0;i<upload2.length;++i){
                upload2[i].renameTo(new File(fileOfPictures, Integer.toString(i) + ".jpg"));
                var10002 = photographer.getPhotographerId();
                ExamplePicture picture = new ExamplePicture("file/" + var10002 + "/" + example.getName() + "/pictures/" + Integer.toString(i) + ".jpg");
                this.examplePictureDAO.save(picture);
                example.getPictures().add(picture);
            }
            example.setPraise(0);
            example.setVisits(0);
            example.setTime(new Timestamp((new Date()).getTime()));
            photographer.getExamples_own().add(example);
            this.photographerDAO.update(photographer);
        /*    Photographer photographer_old = (Photographer)this.session.get("photographer");
            Photographer photographer_new = this.photographerDAO.findById(photographer_old.getPhotographerId());*/
            this.session.put("photographer",photographer);
            Integer count = (Integer)servletContext.getAttribute("examplenum");
            servletContext.setAttribute("examplenum", count + 1);
            return true;
        }catch (Exception var13){
            var13.printStackTrace();
            return false;
        }
    }

    public boolean removeCase(Integer exampleId) {
        Example example = this.exampleDAO.findById1(exampleId);
        this.exampleDAO.delete(example);
        ActionContext ctx = ActionContext.getContext();
        this.session = (Map)ctx.get("session");
        Photographer photographer_old = (Photographer) this.session.get("photographer");
        Photographer photographer_new = this.photographerDAO.findById(photographer_old.getPhotographerId());
        this.session.put("photographer", photographer_new);
        return true;
    }

    public boolean logout() {
        ActionContext ctx = ActionContext.getContext();
        this.session = (Map)ctx.get("session");
        this.session.clear();
        return true;
    }

    public boolean showPho(){
        ActionContext ctx = ActionContext.getContext();
        this.session = (Map)ctx.get("session");
        String hql = "from Photographer";
        List list = photographerDAO.findByHql(hql);
        if (!list.isEmpty()){
            System.out.println("摄影师账号列表不为空！！！");
        }
        session.put("managerPhotographer",list);
        session.put("accountType",1);
        return true;
    }

}
