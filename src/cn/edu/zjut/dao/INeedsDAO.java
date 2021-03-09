package cn.edu.zjut.dao;

import cn.edu.zjut.po.Needs;

import java.util.List;

public interface INeedsDAO {
    List findByHql(String hql);
    Needs findById(int id);
    void update(Needs instance);

    void save(Needs var1);
    int find();
    void delete(Needs var1);
}
