package cn.edu.zjut.dao;

import cn.edu.zjut.po.Subscribe;

public interface ISubscribeDAO {
    Subscribe findById(int id);
    void update(Subscribe subscribe);

    void save(Subscribe var1);
    int find();
    void delete(Subscribe var1);
}
