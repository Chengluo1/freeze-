package cn.edu.zjut.service;

import cn.edu.zjut.po.Comments;
import cn.edu.zjut.po.Example;
import cn.edu.zjut.po.Photographer;

import java.util.List;

public interface IExampleService {
    boolean recommend3(String exampleId);

    void putExample(Example var1);
    boolean review(Example var1, Comments var2);

    List findAll();

    List searchInFrame(String var1);
    List searchInFramedes(String condition);
    List searchInList(List<String> var1);

    int praise(String var1);
    void star(String var1);
    void unstar(String var1);

    List recommendyou();//为你推荐

    boolean deleteComments(int commentID);
    boolean showComments(String exampleID);
    boolean allowComments(int commentID);
}
