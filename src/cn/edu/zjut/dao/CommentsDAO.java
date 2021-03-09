package cn.edu.zjut.dao;

import cn.edu.zjut.po.Comments;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;

public class CommentsDAO extends BaseHibernateDAO implements ICommentsDAO {
    private Log log = LogFactory.getLog(CommentsDAO.class);

    public CommentsDAO() {
    }

    public List findByHql(String hql) {
        this.log.debug("finding Comments instance by hql");

        try {
            Query queryObject = this.getSession().createQuery(hql);
            return queryObject.list();
        } catch (RuntimeException var4) {
            this.log.error("find by hql failed", var4);
            throw var4;
        }
    }

    public Comments findById(Integer id) {
        this.log.debug("finding Comments instance by CommentsId");

        try {
            Comments e = (Comments)this.getSession().get(Comments.class, id);
            this.log.debug("find successful");
            return e;
        } catch (RuntimeException var4) {
            System.out.println("find failed!");
            this.log.error("find failed", var4);
            throw var4;
        }
    }

    public void save(Comments instance) {
        this.log.debug("saving Comments instance");

        try {
            this.getSession().save(instance);
            this.log.debug("save successful");
        } catch (RuntimeException var3) {
            this.log.error("save failed", var3);
            throw var3;
        }
    }

    public void update(Comments instance) {
        this.log.debug("updating Comments instance");

        try {
            this.getSession().update(instance);
            this.log.debug("update successful");
        } catch (RuntimeException var3) {
            this.log.error("update failed", var3);
            throw var3;
        }
    }

    public void delete(Comments instance) {
        this.log.debug("deleting Comments instance");

        try {
            this.getSession().delete(instance);
            this.log.debug("delete successful");
        } catch (RuntimeException var3) {
            this.log.error("delete failed", var3);
            throw var3;
        }
    }
}
