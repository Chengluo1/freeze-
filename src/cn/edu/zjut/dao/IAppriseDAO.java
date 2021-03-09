package cn.edu.zjut.dao;

import cn.edu.zjut.po.Apprise;

import java.util.List;

public interface IAppriseDAO {
    List getByPhotographerId(String photographerId);
    void save(Apprise var1);
}
