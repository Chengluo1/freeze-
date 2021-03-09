package cn.edu.zjut.dao;

import cn.edu.zjut.po.Employer;
import cn.edu.zjut.po.Example;
import java.util.List;

public interface IExampleDAO {
    Example findbyId(String id);
    void update(Example instance);

    List findByHql(String var1);
    void save(Example var1);
    void delete(Example var1);
    void merge(Example var1);
    Example findById1(Integer id);
}
