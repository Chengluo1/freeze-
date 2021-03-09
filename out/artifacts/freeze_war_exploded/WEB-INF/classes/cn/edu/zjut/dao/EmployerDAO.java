package cn.edu.zjut.dao;

import cn.edu.zjut.po.Employer;
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
