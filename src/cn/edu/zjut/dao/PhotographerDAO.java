package cn.edu.zjut.dao;

import cn.edu.zjut.po.Photographer;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.query.Query;
import java.util.List;

public class PhotographerDAO extends BaseHibernateDAO implements IPhotographerDAO {
    private Log log = LogFactory.getLog(PhotographerDAO.class);

    public PhotographerDAO() {
        System.out.println("PhotographerDAO");
    }

    public List findByHql(String hql) {
        this.log.debug("finding Designer instance by hql");

        try {
            Query queryObject = this.getSession().createQuery(hql);
            return queryObject.list();
        } catch (RuntimeException var4) {
            this.log.error("find by hql failed", var4);
            throw var4;
        }
    }

    public String findPho() {
        this.log.debug("finding maxId instance.");
        try {
            String maxValue = (String) this.getSession().createQuery("select max(photographerId) from Photographer").uniqueResult();
            return maxValue == null ? null : maxValue;
        } catch (RuntimeException var2) {
            this.log.error("find failed", var2);
            throw var2;
        }
    }

    public void save(Photographer var1) {
        this.log.debug("saving photographer instance.");
        try {
            this.getSession().save(var1);
            this.log.debug("save successful!");
        } catch (RuntimeException var3) {
            this.log.error("save failed");
            throw var3;
        }
    }

    public Object merge(Photographer instance) {
        this.log.debug("merging Designer instance");

        try {
            return this.getSession().merge(instance);
        } catch (RuntimeException var3) {
            this.log.error("merge failed", var3);
            throw var3;
        }
    }


    public Photographer findById(String id) {
        this.log.debug("finding photographer instance by photographerId");
        try {
            Photographer e = (Photographer)this.getSession().get(Photographer.class, id);
            this.log.debug("find successful");
            return e;
        } catch (RuntimeException var4) {
            this.log.error("find failed", var4);
            throw var4;
        }


    }

    public void delete(Photographer var1) {
        this.log.debug("delete photographer instance.");
        try {
            this.getSession().delete(var1);
            this.log.debug("delete successful!");
        } catch (RuntimeException var3) {
            this.log.error("delete failed");
            throw var3;
        }
    }

    public void update(Photographer instance){
        this.log.debug("updating Photographer instance");
        try {
            this.getSession().update(instance);
            System.out.println("status1 has changed!");
            this.log.debug("update success!");
        }catch (RuntimeException var3){
            this.log.error("update failed");
            throw var3;
        }
    }
}