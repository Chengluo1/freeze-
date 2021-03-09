package cn.edu.zjut.dao;

import cn.edu.zjut.po.Employer;
import cn.edu.zjut.po.Photographer;
import org.hibernate.Session;

import java.util.List;

public interface IAdminDAO {
//    Session getSession();
    List findByhql(String var1);
    void delete(Photographer photographer);
    void delete(Employer employer);
    Employer findEmp(String hql);
    Photographer findPho(String hql);
}
