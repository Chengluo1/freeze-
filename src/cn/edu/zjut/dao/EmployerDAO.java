package cn.edu.zjut.dao;

import cn.edu.zjut.po.Employer;
import cn.edu.zjut.po.Photographer;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.query.Query;
import java.util.List;

public class EmployerDAO extends BaseHibernateDAO implements IEmployerDAO {
    private Log log = LogFactory.getLog(EmployerDAO.class);

    public EmployerDAO() {
    }

    public List findByHql(String hql) {
        this.log.debug("finding Employer instance by hql");
        try {
            Query queryObject = this.getSession().createQuery(hql);
            return queryObject.list();
        } catch (RuntimeException var4) {
            this.log.error("find by hql failed", var4);
            throw var4;
        }
    }

    //找到最大id值
    public String findEmp(){
        this.log.debug("finding maxId instance");
        try {
            String maxValue = (String) this.getSession().createQuery("select max(employerId) from Employer").uniqueResult();
            return maxValue == null?null:maxValue;
        }catch (RuntimeException var2){
            this.log.error("find failed",var2);
            System.out.println("err");
            throw  var2;
        }
    }
    //注册
    public void save(Employer employer){
        this.log.debug("saving Employer instance");
        try {
            this.getSession().save(employer);
            this.log.debug("save successful");
        }catch (RuntimeException var3){
            this.log.error("save failed",var3);
            throw var3;
        }
    }
    //通过id找用户信息
    public Employer findById(String id) {
        this.log.debug("finding Employer instance by employerId");
        try {
            Employer e = (Employer) this.getSession().get(Employer.class, id);
            this.log.debug("find successful");
            return e;
        } catch (RuntimeException var4) {
            this.log.error("find failed", var4);
            throw var4;
        }
    }
    //更新用户信息
    public void update(Employer instance) {
        this.log.debug("updating Employer instance");

        try {
            this.getSession().update(instance);
            this.log.debug("update successful");
        } catch (RuntimeException var3) {
            this.log.error("update failed", var3);
            throw var3;
        }
    }
    //删除用户信息
    public void delete(Employer employer){
        this.log.debug("deleting Employer instance");
        try {
            this.getSession().delete(employer);
            this.log.debug("delete successful");
        }catch (RuntimeException var3){
            this.log.error("delete failed",var3);
            throw var3;
        }
    }

}
