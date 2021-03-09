package cn.edu.zjut.service;

import cn.edu.zjut.dao.IAppriseDAO;
import cn.edu.zjut.dao.IEmployerDAO;
import cn.edu.zjut.dao.IPhotographerDAO;
import cn.edu.zjut.po.Apprise;
import cn.edu.zjut.po.Employer;
import cn.edu.zjut.po.Photographer;
import com.opensymphony.xwork2.ActionContext;

import java.util.List;
import java.util.Map;

public class AppriseService implements IAppriseService {
    private Map<String, Object> request;
    private Map<String, Object> session;
    private IAppriseDAO appriseDAO = null;
    private IPhotographerDAO photographerDAO = null;
    private IEmployerDAO employerDAO = null;

    public void setPhotographerDAO(IPhotographerDAO photographerDAO) {
        this.photographerDAO = photographerDAO;
    }

    public void setEmployerDAO(IEmployerDAO employerDAO) {
        this.employerDAO = employerDAO;
    }

    public void setAppriseDAO(IAppriseDAO appriseDAO) {
        this.appriseDAO = appriseDAO;
    }
    public AppriseService() {
    }
    public boolean apprise(Apprise appr, String employerId, String photographerId) {
        try {
            ActionContext ctx = ActionContext.getContext();
            this.request = (Map)ctx.get("request");
            this.session = ctx.getSession();
            Employer e = this.employerDAO.findById(employerId);
            Photographer d = this.photographerDAO.findById(photographerId);
            appr.setPhotographer(d);
            System.out.println(d);
            appr.setEmployer(e);
            this.appriseDAO.save(appr);
            this.request.put("tip", "评价成功");
            return true;
        } catch (Exception var7) {
            var7.printStackTrace();
            return false;
        }
    }

    public boolean getApprises(String photographerId) {
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        this.session = ctx.getSession();
        List<Apprise> a = this.appriseDAO.getByPhotographerId(photographerId);
        this.request.put("list", a);
        System.out.println(a);
        return true;
    }
}
