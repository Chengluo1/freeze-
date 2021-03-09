package cn.edu.zjut.action;

import cn.edu.zjut.po.Needs;
import cn.edu.zjut.po.Orderr;
import cn.edu.zjut.po.Photographer;
import cn.edu.zjut.service.INeedsService;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;

public class NeedsAction {
    Needs need;
    private List needs1;
    @Autowired
    private INeedsService needsServ = null;
    private String city;
    private int area = 0;
    private int money = 0;
    private int order = 1;
    private Needs needs;
    private int needsId;
    private Photographer photographer;
    private String photographerId;
    private Orderr orderr;
    private List signupList;

    public void setNeedsServ(INeedsService needsServ) {
        this.needsServ = needsServ;
    }

    public String findneeds(){
        this.needs1 = this.needsServ.findneeds(this.city, this.area, this.money, this.order);
        return this.needs1 != null ? "findneedssuccess" : "login";
    }

    public String getNeedsByID(){
        this.needs = this.needsServ.getNeedsByID(this.needsId);
        System.out.println("----------------------------"+needs.getNeedsId());
        return "success";
    }

    public void setArea(int area) {
        this.area = area;
    }

    public int getArea() {
        return area;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCity() {
        return city;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    public int getMoney() {
        return money;
    }

    public void setOrder(int order) {
        this.order = order;
    }

    public int getOrder() {
        return order;
    }

    public void setOrderr(Orderr orderr) {
        this.orderr = orderr;
    }

    public Orderr getOrderr() {
        return orderr;
    }

    public void setNeed(Needs need) {
        this.need = need;
    }

    public Needs getNeed() {
        return need;
    }

    public void setNeeds(Needs needs) {
        this.needs = needs;
    }

    public Needs getNeeds() {
        return needs;
    }

    public void setNeeds1(List needs1) {
        this.needs1 = needs1;
    }

    public List getNeeds1() {
        return needs1;
    }

    public void setNeedsId(int needsId) {
        this.needsId = needsId;
    }

    public int getNeedsId() {
        return needsId;
    }

    public void setPhotographer(Photographer photographer) {
        this.photographer = photographer;
    }

    public Photographer getPhotographer() {
        return photographer;
    }

    public void setPhotographerId(String photographerId) {
        this.photographerId = photographerId;
    }

    public String getPhotographerId() {
        return photographerId;
    }

    public void setSignupList(List signupList) {
        this.signupList = signupList;
    }

    public List getSignupList() {
        return signupList;
    }

    public String SignUp() throws Exception{
        JSONObject result = new JSONObject();
        if (this.needsServ.SignUp(this.needsId)){
            System.out.println("--------------------…Í«Î¿≤");
            result.put("success","true");
            return "success";
        }else {
            result.put("false","true");
            HttpServletResponse response = ServletActionContext.getResponse();
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.println(result.toString());
            out.flush();
            out.close();
            return null;
        }
    }

    public String cancelSignUp() throws Exception{
        JSONObject result = new JSONObject();
        if (this.needsServ.cancelSignUp(this.needsId)){
            result.put("success",true);
            return "success";
        }else {
            result.put("false",true);
            HttpServletResponse response = ServletActionContext.getResponse();
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.println(result.toString());
            out.flush();
            out.close();
            return null;
        }
    }
}
