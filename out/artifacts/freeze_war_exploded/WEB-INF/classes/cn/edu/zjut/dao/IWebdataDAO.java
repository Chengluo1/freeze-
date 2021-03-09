package cn.edu.zjut.dao;

import cn.edu.zjut.po.Webdata;
import java.util.List;

public interface IWebdataDAO {
    List findByHql(String var1);

    Webdata findById(int var1);

    void save(Webdata var1);
}