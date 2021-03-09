package cn.edu.zjut.service;

import cn.edu.zjut.po.Apprise;

public interface IAppriseService {
    boolean getApprises(String photographerId);
    boolean apprise(Apprise var1, String var2, String var3);

}
