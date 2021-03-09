package cn.edu.zjut.service;

import cn.edu.zjut.po.Employer;
import cn.edu.zjut.po.Orderr;
import cn.edu.zjut.po.Photographer;

public interface IOrderrService {
    Orderr getOrderrByID(String orderrId);
    boolean finish(String orderrId);
    boolean changeOrderrSt(String var1, String var2);
    boolean SubmitOrderr(Orderr var1, Photographer var2, Employer var3);
    Orderr app(String var1);
    boolean pay(String var1);
    boolean refund(String var1);
}
