package cn.edu.zjut.service;

import cn.edu.zjut.po.Subscribe;

public interface ISubscribeService {
    void putSubscribe(Subscribe subscribe);
    void cancelSub(String subscribeID);

    boolean subscribe(Subscribe var1, String var2, String var3);

    void accept(String var1);

    void reject(Subscribe var1);

}
