package cn.edu.zjut.dao;

import cn.edu.zjut.po.Employer;
import cn.edu.zjut.po.Example;
import cn.edu.zjut.po.Photographer;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.query.Query;

import java.util.List;

public class ExampleDAO extends BaseHibernateDAO implements IExampleDAO{
    private Log log = LogFactory.getLog(ExampleDAO.class);

    public List findByHql(String hql) {
        this.log.debug("finding Example instance by hql");

        try {
            Query queryObject = this.getSession().createQuery(hql);
            return queryObject.list();
        } catch (RuntimeException var4) {
            this.log.error("find by hql failed", var4);
            throw var4;
        }
    }

    public Example findbyId(String id){
        this.log.debug("finding Example instance.");
        try {
            System.out.println("try to find by id:"+id);
            int Id = Integer.parseInt(id);
            System.out.println("id --1: "+Id);
            Example example = (Example) this.getSession().get(Example.class,Id);
            System.out.println("id: "+Id);
            System.out.println("ExampleDAO: "+example.getExampleId());
            this.log.debug("find successfully!");
            return example;
        }catch (RuntimeException var4){
            throw var4;
        }
    }
    public Example findById1(Integer id) {
        this.log.debug("finding Example instance by exampleId");
        List list = null;

        try {
            String hql = "from Example";
            Query queryObject = this.getSession().createQuery(hql);
            list = queryObject.list();
            if (queryObject.list() != null) {
                System.out.println("aaaaaaa");

                for(int i = 0; i < list.size(); ++i) {
                    Example e = (Example)list.get(i);
                    if (e.getExampleId() == id) {
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
    public void save(Example instance) {
        this.log.debug("saving Example instance");

        try {
            this.getSession().save(instance);
            this.log.debug("save successful");
        } catch (RuntimeException var3) {
            this.log.error("save failed", var3);
            throw var3;
        }
    }
    public void update(Example instance){
        this.log.debug("update example instance");
        try {
            this.getSession().update(instance);
            this.log.debug("update success!");
        }catch (RuntimeException var3){
            this.log.error("update failed!");
        }
    }
    public void delete(Example instance) {
        this.log.debug("deleting Example instance");

        try {
            this.getSession().delete(instance);
            this.log.debug("delete successful");
        } catch (RuntimeException var3) {
            this.log.error("delete failed", var3);
            throw var3;
        }
    }
    public void merge(Example instance) {
        this.log.debug("deleting Example instance");

        try {
            this.getSession().merge(instance);
            this.log.debug("delete successful");
        } catch (RuntimeException var3) {
            this.log.error("delete failed", var3);
            throw var3;

        }}
}
