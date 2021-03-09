package cn.edu.zjut.dao;

import cn.edu.zjut.po.ExamplePicture;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class ExamplePictureDAO extends BaseHibernateDAO implements IExamplePictureDAO {
    private Log log = LogFactory.getLog(ExamplePictureDAO.class);
    public ExamplePictureDAO() {
    }

    public void save(ExamplePicture instance) {
        this.log.debug("saving ExamplePicture instance");
        try {
            this.getSession().save(instance);
            this.log.debug("save successful");
        } catch (RuntimeException var3) {
            this.log.error("save failed", var3);
            throw var3;
        }
    }
}
