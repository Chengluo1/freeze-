package cn.edu.zjut.service;

import cn.edu.zjut.po.Photographer;

import java.util.List;

public interface IAdminService {
    boolean logout1(String userId,String phone);
    //    待认证
    List display1();
    //    已认证
    List display2();
    //    设计师详情
    void view(Photographer photographer);
    boolean Authen(Photographer photographer);
    List display();
    boolean recommendE(String exampleID);
    boolean recommendP(Photographer photographer);
}
