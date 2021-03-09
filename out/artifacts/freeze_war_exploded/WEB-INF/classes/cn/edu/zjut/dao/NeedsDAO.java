package cn.edu.zjut.dao;

import cn.edu.zjut.po.Needs;
import cn.edu.zjut.po.Photographer;
import javafx.scene.control.TableRow;
import org.apache.commons.logging.LogFactory;
import org.apache.commons.logging.Log;
import org.hibernate.Query;


import java.util.List;

public class NeedsDAO extends BaseHibernateDAO implements INeedsDAO{
    private Log log = LogFactory.getLog(NeedsDAO.class);
    public NeedsDAO(){}

    public List findByHql(String hql){
        this.log.debug("finding Needs instance by hql");
        try {
            Query queryObject = this.getSession().createQuery(hql);
            return queryObject.list();
        }catch (RuntimeException var4){
            this.log.error("find by hql failed",var4);
            throw var4;
        }
    }

    public Needs findById(int id){
        this.log.debug("finding photographer instance by exampleId");
        try {
            Needs n = (Needs)this.getSession().get(Needs.class,id);
            this.log.debug("find successful");
            return n;
        }catch (RuntimeException var4){
            this.log.error("find failed",var4);
            throw var4;
        }
    }

    public void update(Needs instance){
        this.log.debug("updating Needs instance");
        try {
            this.getSession().update(instance);
            this.log.debug("update successful");
        }catch (RuntimeException var3){
            this.log.error("update failed",var3);
            throw var3;
        }
    }
}
