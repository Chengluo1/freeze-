package cn.edu.zjut.service;

import cn.edu.zjut.po.Needs;

import java.util.List;

public interface INeedsService {
    List<Needs> findneeds(String city, int area, int money, int order);
    Needs getNeedsByID(int needsID);
    boolean SignUp(int needsID);
    boolean cancelSignUp(int needsID);
}
