package cn.edu.zjut.dao;

import cn.edu.zjut.po.ExamplePanorama;

public interface IExamplePanoramaDAO {
    void save(ExamplePanorama instance);
    ExamplePanorama findById(Integer var1);
}
