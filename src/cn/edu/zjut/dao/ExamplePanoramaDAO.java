package cn.edu.zjut.dao;

import cn.edu.zjut.po.Employer;
import cn.edu.zjut.po.Example;
import cn.edu.zjut.po.ExamplePanorama;
import cn.edu.zjut.po.ExamplePicture;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.query.Query;

import java.util.List;

public class ExamplePanoramaDAO extends BaseHibernateDAO implements IExamplePanoramaDAO {
    private Log log = LogFactory.getLog(ExamplePanoramaDAO.class);

    public ExamplePanoramaDAO() {

    }

    public void save(ExamplePanorama instance) {
        this.log.debug("saving ExamplePanorama instance");
        try {
            this.getSession().save(instance);
            this.log.debug("save successful");
        } catch (RuntimeException var3) {
            this.log.error("save failed", var3);
            throw var3;
        }
    }

   public ExamplePanorama findById(Integer id) {
        this.log.debug("finding ExamplePanorama instance by ExamplePanoramaId");
        List list = null;

        try {
            String hql = "from ExamplePanorama";
            Query queryObject = this.getSession().createQuery(hql);
            list = queryObject.list();
            if (queryObject.list() != null) {
                System.out.println("aaaaaaa");

                for(int i = 0; i < list.size(); ++i) {
                    ExamplePanorama e = (ExamplePanorama)list.get(i);
                    System.out.println("pan:"+e.getPanorama1());
                    System.out.println("pan:"+e.getExample());
                    System.out.println("e"+e.getExample().getExampleId());
                    if (e.getExample().getExampleId() == id) {
                        System.out.println("gkhjhilu");
                        return e;
                    }
                }
            }
            System.out.println("nuugdjasgdygak");
            return null;
        } catch (RuntimeException var7) {
            this.log.error("find failed", var7);
            throw var7;
        }
    }
}

