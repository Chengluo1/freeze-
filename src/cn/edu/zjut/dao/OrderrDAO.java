package cn.edu.zjut.dao;

import cn.edu.zjut.po.Orderr;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class OrderrDAO extends BaseHibernateDAO implements IOrderrDAO{
    private Log log = LogFactory.getLog(OrderrDAO.class);

    public OrderrDAO() {
    }

    public Orderr findById(String id) {
        this.log.debug("finding Orderr instance by OrderrId");
        try {
            System.out.println(id);
            Orderr o = (Orderr)this.getSession().get(Orderr.class, id);
            this.log.debug("find successful");
            return o;
        } catch (RuntimeException var4) {
            this.log.error("find failed", var4);
            throw var4;
        }
    }

    public void update(Orderr order) {
        this.log.debug("updating order instance");
        try {
            this.getSession().update(order);
            this.log.debug("update successful");
        } catch (RuntimeException var3) {
            this.log.error("update failed", var3);
            throw var3;
        }
    }
    public void save(Orderr orderr) {
        this.log.debug("saving orderr instance");

        try {
            this.getSession().save(orderr);
            this.log.debug("save successfully!");
        } catch (RuntimeException var3) {
            this.log.error("save fail", var3);
            throw var3;
        }
    }
}
