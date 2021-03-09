package cn.edu.zjut.dao;

import cn.edu.zjut.po.Employer;
import cn.edu.zjut.po.Photographer;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;

import java.util.List;

public class AdminDAO extends BaseHibernateDAO implements IAdminDAO{
    private Log log = LogFactory.getLog(AdminDAO.class);

    public AdminDAO() {
    }

    public List findByhql(String hql) {
        this.log.debug("find instance");

        try {
            Query queryObject = this.getSession().createQuery(hql);
            return queryObject.list();
        } catch (RuntimeException var3) {
            this.log.error("find failed", var3);
            System.out.println("err");
            throw var3;
        }
    }
    public void delete(Photographer photographer){
        this.log.debug("deleting photographer instance.");
        try {
            this.getSession().delete(photographer);
        }catch (RuntimeException var3){
            throw var3;
        }
    }

    public void delete(Employer employer) {
        this.log.debug("deleting employer instance.");
        try {
            this.getSession().delete(employer);
        }catch (RuntimeException var3){
            throw var3;
        }
    }
    public Employer findEmp(String hql){
        this.log.debug("finding employer instance");
        try {
            Query query = this.getSession().createQuery(hql);
            if (query.list()!=null){
                List list = query.list();
                Employer employer = (Employer) list.get(0);
                return employer;
            }else {
                return null;
            }

        }catch (RuntimeException var5){
            throw var5;
        }
    }
    public Photographer findPho(String hql){
        this.log.debug("finding photographer instance");
        try {
            Query query = this.getSession().createQuery(hql);
            if (query.list()!=null){
                List list = query.list();
                Photographer photographer = (Photographer) list.get(0);
                return photographer;
            }else {
                return null;
            }
        }catch(RuntimeException var5){
            throw var5;
        }
    }

}
