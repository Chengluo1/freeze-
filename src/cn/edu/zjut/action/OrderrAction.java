package cn.edu.zjut.action;

import cn.edu.zjut.po.Employer;
import cn.edu.zjut.po.Photographer;
import cn.edu.zjut.po.Orderr;
import cn.edu.zjut.po.Photographer;
import cn.edu.zjut.service.IOrderrService;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;

public class OrderrAction {
    @Autowired
    private IOrderrService orderrServ = null;
    private String orderrId;
    private String state;
    private Orderr orderr;
    private Photographer photographer;
    private Employer employer;

    public OrderrAction() {
    }

    public Photographer getPhotographer() {  return photographer;    }
    public void setPhotographer(Photographer photographer) { this.photographer = photographer; }
    public Employer getEmployer() {
        return this.employer;
    }
    public void setEmployer(Employer employer) {
        this.employer = employer;
    }
    public void setOrderrServ(IOrderrService orderrServ) {
        this.orderrServ = orderrServ;
    }
    public String getOrderrId() {
        return this.orderrId;
    }
    public void setOrderrId(String orderrId) {
        this.orderrId = orderrId;
    }
    public Orderr getOrderr() {
        return this.orderr;
    }
    public IOrderrService getOrderrServ() {
        return this.orderrServ;
    }
    public void setOrderr(Orderr orderr) {
        this.orderr = orderr;
    }
    public String getState() {
        return this.state;
    }
    public void setState(String state) {
        this.state = state;
    }
    public String changeOrderrSt() throws Exception {
        return this.orderrServ.changeOrderrSt(this.orderrId, this.state) ? "success" : "false";
    }
    public String getOrderrByID() {
        System.out.println(this.orderrId);
        this.orderr = this.orderrServ.getOrderrByID(this.orderrId);
        return "success";
    }
    public String SubmitOrderr() {
        return this.orderrServ.SubmitOrderr(this.orderr, this.photographer, this.employer) ? "success" : "false";
    }


    public String app() {
        System.out.println(this.orderrId);
        this.orderr = this.orderrServ.app(this.orderrId);
        return "success";
    }

    public String pay() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String message;
        if (this.orderrServ.pay(this.orderrId)) {
    /*        message = "支付成功！将返回订单详情页...";
            request.setAttribute("tip", message);*/
            return "success";
        } else {
/*            message = "发布失败!将返回订单详情页...";
            request.setAttribute("tip", message);*/
            return "fail";
        }
    }
    public String finish() {
        return this.orderrServ.finish(this.orderrId) ? "success" : "false";
    }
    public String refund() {
        return this.orderrServ.refund(this.orderrId) ? "success" : "false";
    }

}
