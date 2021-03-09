package cn.edu.zjut.service;

import cn.edu.zjut.po.Photographer;

public interface IPhotographerService {
    boolean login(Photographer pho);
    String test();
    boolean registerPho(Photographer pho);
    boolean searchByAccount(String account);
    boolean findAll();
    boolean findByPraise();
    boolean findByScore();
    boolean putPhotographer(Photographer photographer);
}
