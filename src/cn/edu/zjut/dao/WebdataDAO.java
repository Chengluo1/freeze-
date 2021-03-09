package cn.edu.zjut.dao;

import cn.edu.zjut.po.Webdata;
import java.util.List;
import org.hibernate.Query;

public class WebdataDAO extends BaseHibernateDAO implements IWebdataDAO {
    public WebdataDAO() {
    }

    public List findByHql(String hql) {
        try {
            System.out.println("hql=" + hql);
            Query queryObject = this.getSession().createQuery(hql);
            System.out.println("get!!!");
            queryObject.setMaxResults(5);
            return queryObject.list();
        } catch (RuntimeException var4) {
            throw var4;
        }
    }

    public Webdata findById(int id) {
        try {
            Webdata e = (Webdata)this.getSession().get(Webdata.class, id);
            return e;
        } catch (RuntimeException var4) {
            throw var4;
        }
    }

    public void save(Webdata instance) {
        try {
            this.getSession().save(instance);
        } catch (RuntimeException var3) {
            throw var3;
        }
    }
}
