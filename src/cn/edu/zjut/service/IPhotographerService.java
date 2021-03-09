package cn.edu.zjut.service;

import cn.edu.zjut.po.Example;
import cn.edu.zjut.po.Photographer;

import java.io.File;

public interface IPhotographerService {
    boolean login(Photographer pho);
    String test();
    boolean registerPho(Photographer pho);
    boolean searchByAccount(String account);
    boolean findAll();
    boolean findByPraise();
    boolean findByScore();
    boolean findByYou();
    boolean putPhotographer(Photographer photographer);
    boolean judgeIdentity();
    boolean update(Photographer photographer, File profile, String profileFileName);
    String copyfile(String path, File file, String filename);
    boolean update2(Photographer photographer,File certificate,String certificateFileName);
    boolean recommend1(int money1);
    boolean upload(Example example, File[] upload, File[] upload2);
    boolean removeCase(Integer exampleId);
    boolean logout();
    boolean showPho();
}
