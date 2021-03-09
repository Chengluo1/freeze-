package cn.edu.zjut.dao;

import cn.edu.zjut.po.Orderr;

public interface IOrderrDAO {
    Orderr findById(String id);
    void update(Orderr order);
    void save(Orderr var1);
}
