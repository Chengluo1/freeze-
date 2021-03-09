package cn.edu.zjut.service;

import cn.edu.zjut.dao.IWebdataDAO;
import com.opensymphony.xwork2.ActionContext;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class WebdataService implements IWebdataService {
    private IWebdataDAO webdataDAO = null;
    private List datalist = new ArrayList();
    private Map<String, Object> request;
    private Map<String, Object> session;

    public WebdataService() {
    }

    public void setWebdataDAO(IWebdataDAO webdataDAO) {
        this.webdataDAO = webdataDAO;
    }

    public List findAll() {
        System.out.println("in find webdata");
        ActionContext ctx = ActionContext.getContext();
        this.session = ctx.getSession();
        this.request = (Map)ctx.get("request");
        String hql = "from Webdata";
        this.datalist = this.webdataDAO.findByHql(hql);
        System.out.println("find webdata");
        this.request.put("datalist", this.datalist);
        return this.datalist;
    }
}