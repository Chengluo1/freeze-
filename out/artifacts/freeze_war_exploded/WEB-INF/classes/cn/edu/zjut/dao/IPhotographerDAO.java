package cn.edu.zjut.dao;

import cn.edu.zjut.po.Employer;
import cn.edu.zjut.po.Photographer;
import org.hibernate.Session;

import java.util.List;

public interface IPhotographerDAO {
//    Session getSession();
    List findByHql(String var1);
    String findPho();
    void save(Photographer var1);

    Photographer findById(String id);

    void delete(Photographer var1);

}
