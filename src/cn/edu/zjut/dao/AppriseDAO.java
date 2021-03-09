package cn.edu.zjut.dao;

import cn.edu.zjut.po.Apprise;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;

import java.util.List;

public class AppriseDAO extends BaseHibernateDAO implements IAppriseDAO {
    private Log log = LogFactory.getLog(AppriseDAO.class);

    public List getByPhotographerId(String photographerId) {
        this.log.debug("");
        List list = null;
        try {
            String hql = "from Apprise where photographerID='"+ photographerId +"'";
            System.out.println(hql);
            Query queryObject = this.getSession().createQuery(hql);
            list = queryObject.list();
            return list;
        } catch (RuntimeException var5) {
            this.log.error("", var5);
            throw var5;
        }
    }
    public void save(Apprise appr) {
        this.log.debug("saving appr instance");

        try {
            this.getSession().save(appr);
            this.log.debug("save successfully!");
        } catch (RuntimeException var3) {
            this.log.error("save fail", var3);
            throw var3;
        }
    }
}
