package cn.edu.zjut.service;

import cn.edu.zjut.dao.IEmployerDAO;
import cn.edu.zjut.dao.IOrderrDAO;
import cn.edu.zjut.dao.IPhotographerDAO;
import cn.edu.zjut.dao.ISubscribeDAO;
import cn.edu.zjut.po.Employer;
import cn.edu.zjut.po.Orderr;
import cn.edu.zjut.po.Photographer;
import cn.edu.zjut.po.Subscribe;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.ServletActionContext;

import javax.servlet.ServletContext;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.Random;

public class OrderrService implements IOrderrService {
    private Map<String, Object> request;
    private Map<String, Object> session;
    private IOrderrDAO orderrDAO = null;
    private IPhotographerDAO photographerDAO = null;
    private IEmployerDAO employerDAO = null;
    private ISubscribeDAO subscribeDAO = null;

    public void setOrderrDAO(IOrderrDAO orderrDAO) {
        this.orderrDAO = orderrDAO;
    }

    public Map<String, Object> getRequest() {return request; }

    public void setRequest(Map<String, Object> request) { this.request = request; }

    public Map<String, Object> getSession() { return session;   }

    public void setSession(Map<String, Object> session) {this.session = session;}

    public IOrderrDAO getOrderrDAO() {      return orderrDAO; }

    public IPhotographerDAO getPhotographerDAO() {      return photographerDAO; }

    public IEmployerDAO getEmployerDAO() {     return employerDAO; }

    public ISubscribeDAO getSubscribeDAO() {    return subscribeDAO;  }

    public void setSubscribeDAO(ISubscribeDAO subscribeDAO) {
        this.subscribeDAO = subscribeDAO;
    }

    public void setEmployerDAO(IEmployerDAO employerDAO) {
        this.employerDAO = employerDAO;
    }

    public void setPhotographerDAO(IPhotographerDAO photographerDAO) {
        this.photographerDAO = photographerDAO;
    }

    public boolean changeOrderrSt(String orderrId, String state) {
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        System.out.println(state);
        Orderr orderr = this.orderrDAO.findById(orderrId);
        Subscribe subscribe = (Subscribe)this.session.get("subscribe");
        subscribe.setStatus(3);
        this.subscribeDAO.update(subscribe);
        this.request.put("subscribe", subscribe);
        Employer employer = this.employerDAO.findById(subscribe.getSubscriber().getEmployerId());
        this.session.put("employer", employer);
        Photographer photographer = this.photographerDAO.findById(subscribe.getScriber().getPhotographerId());
        this.session.put("photographer", photographer);
        orderr.setState(state);
        if (state.equals("完成")) {
            subscribe.setStatus(2);
            this.subscribeDAO.update(subscribe);
            this.request.put("subscribe", subscribe);
            orderr.setFinishTime(new Timestamp((new Date()).getTime()));
        }

        try {
            this.orderrDAO.update(orderr);
            this.request.put("orderr", orderr);
            return true;
        } catch (Exception var9) {
            var9.printStackTrace();
            return false;
        }
    }

    public Orderr getOrderrByID(String orderrId) {
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        System.out.println(orderrId);
        Orderr orderr = this.orderrDAO.findById(orderrId);
        System.out.println(orderr.getTitle());
        this.request.put("orderr", orderr);
        return orderr;
    }

    public boolean SubmitOrderr(Orderr orderr, Photographer photographer, Employer employer1) {
        ActionContext ctx = ActionContext.getContext();
        ServletContext servletContext = ServletActionContext.getServletContext();
        this.request = (Map)ctx.get("request");
        this.session = ctx.getSession();
        System.out.println("id:"+employer1.getEmployerId());
        Employer employer = this.employerDAO.findById(employer1.getEmployerId());
        photographer = this.photographerDAO.findById(photographer.getPhotographerId());

        String orderrId = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String newDate1 = sdf.format(new Date());
        String result = "";
        Random random = new Random();

        for(int i = 0; i < 3; ++i) {
            result = result + random.nextInt(10);
        }

        orderrId = newDate1 + result;
        Orderr order = new Orderr(orderrId,orderr.getTitle(),orderr.getDescription(),new Timestamp((new Date()).getTime()),orderr.getFinishTime(),orderr.getMoney(),"未付款",employer,photographer);
        try {
            this.orderrDAO.save(order);
            this.request.put("orderr", order);
            Subscribe subscribe = (Subscribe)this.session.get("subscribe");
            if (subscribe != null) {
                subscribe.setStatus(2);
                this.subscribeDAO.update(subscribe);
                this.request.put("photographer", photographer);
                System.out.println("test:"+photographer.getPhotographerId());
                photographer = this.photographerDAO.findById(photographer.getPhotographerId());
                this.session.put("photographer", photographer);
            }
            Integer count = (Integer)servletContext.getAttribute("ordernum");
            servletContext.setAttribute("ordernum", count + 1);
            return true;
        } catch (Exception var15) {
            var15.printStackTrace();
            return false;
        }
    }
    public Orderr app(String orderrId) {
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        this.session = (Map)ctx.get("session");
        System.out.println(orderrId);
        Orderr orderr = this.orderrDAO.findById(orderrId);
        System.out.println(orderr.getTitle());
        this.request.put("orderr", orderr);
        return orderr;
    }

    public boolean pay(String orderrId) {
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        this.session = (Map)ctx.get("session");
        try {
        Orderr orderr = this.orderrDAO.findById(orderrId);
        orderr.setState("已付款");
        this.orderrDAO.update(orderr);
        this.request.put("orderr", orderr);
        Employer e = this.employerDAO.findById(orderr.getEmployer().getEmployerId());
        this.session.put("employer", e);
        this.request.put("tip", "支付成功！将返回订单详情页...");
        return true;
        } catch (Exception var7) {
            var7.printStackTrace();
            this.request.put("tip", "支付失败！将返回订单详情页...");
            return false;
        }

    }
    public boolean refund(String orderrId) {
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        this.session = (Map)ctx.get("session");
        try {
            Orderr orderr = this.orderrDAO.findById(orderrId);
            orderr.setState("未付款");
            this.orderrDAO.update(orderr);
            this.request.put("orderr", orderr);
            Employer e = this.employerDAO.findById(orderr.getEmployer().getEmployerId());
            this.session.put("employer", e);
            this.request.put("tip", "申请退款成功！将返回订单详情页...");
            return true;
        } catch (Exception var7) {
            var7.printStackTrace();
            this.request.put("tip", "申请退款失败！将返回订单详情页...");
            return false;
        }
    }

    public boolean finish(String orderrId) {
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        this.session = (Map)ctx.get("session");
        Orderr orderr = this.orderrDAO.findById(orderrId);
        orderr.setState("已完成");
        this.orderrDAO.update(orderr);
        this.request.put("orderr", orderr);
        Employer e = this.employerDAO.findById(orderr.getEmployer().getEmployerId());
        this.session.put("employer", e);
        Photographer p = this.photographerDAO.findById(orderr.getPhotographer().getPhotographerId());
        this.session.put("photographer", p);
        this.request.put("tip", "订单交易成功！将返回订单详情页...");
        return true;
    }

}
