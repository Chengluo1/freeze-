package cn.edu.zjut.dao;

import cn.edu.zjut.po.Subscribe;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class SubscribeDAO extends BaseHibernateDAO implements ISubscribeDAO  {
    private Log log = LogFactory.getLog(SubscribeDAO.class);

    public  SubscribeDAO(){}

    public Subscribe findById(int id){
        this.log.debug("finding Subscribe instance by subscribeID");
        try {
            Subscribe s = (Subscribe)this.getSession().get(Subscribe.class,id);
            this.log.debug("find successful");
            return s;
        }catch (RuntimeException var4){
            this.log.error("find failed");
            throw var4;
        }
    }

    public void save(Subscribe sub) {
        this.log.debug("saving sub instance");

        try {
            this.getSession().save(sub);
            this.log.debug("save successfully!");
        } catch (RuntimeException var3) {
            this.log.error("save fail", var3);
            throw var3;
        }
    }

    public int find() {
        this.log.debug("finding maxId instance");

        try {
            Integer maxValue = (Integer)this.getSession().createQuery("select max(subscribeID) from Subscribe ").uniqueResult();
            return maxValue == null ? 0 : maxValue;
        } catch (RuntimeException var2) {
            this.log.error("find failed", var2);
            System.out.println("err");
            throw var2;
        }
    }

    public void delete(Subscribe subscribe) {
        this.log.debug("saving sub instance");

        try {
            System.out.println("in subscribe delete");
            this.getSession().delete(subscribe);
            this.getSession().flush();
            this.log.debug("delete successfully!");
            System.out.println("delete success!");
        } catch (RuntimeException var3) {
            this.log.error("delete fail", var3);
            throw var3;
        }
    }

    public void update(Subscribe subscribe){
        this.log.debug("updating order instance");
        try {
            this.getSession().update(subscribe);
            this.log.debug("update successful");
        }catch (RuntimeException var3){
            this.log.error("update failed");
            throw var3;
        }
    }
}
