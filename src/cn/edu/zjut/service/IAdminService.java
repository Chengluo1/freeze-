package cn.edu.zjut.service;

import cn.edu.zjut.po.Photographer;

import java.util.List;

public interface IAdminService {
    boolean logout1(String userId,String phone);
    //    ����֤
    List display1();
    //    ����֤
    List display2();
    //    ���ʦ����
    void view(Photographer photographer);
    boolean Authen(Photographer photographer);
    List display();
    boolean recommendE(String exampleID);
    boolean recommendP(Photographer photographer);
}
