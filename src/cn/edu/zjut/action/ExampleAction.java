package cn.edu.zjut.action;

import cn.edu.zjut.po.Comments;
import cn.edu.zjut.po.Example;
import cn.edu.zjut.po.ExamplePanorama;
import cn.edu.zjut.po.Photographer;
import cn.edu.zjut.service.IPhotographerService;
import cn.edu.zjut.service.IExampleService;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import cn.edu.zjut.service.PhotographerService;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;

public class ExampleAction {
    private String condition;
    private List examples;
    private Photographer photographer;
    private Example example;
    private ExamplePanorama examplepanorama;
    private Comments comments;
    private String exampleId;
    private List<String> conditionList = new ArrayList();
    private String radio1;
    private String radio2;
    private int commentID;
    private String exampleID;//记录案例查评论
    public String getExampleID() {
        return exampleID;
    }

    public void setExampleID(String exampleID) {
        this.exampleID = exampleID;
    }

    public int getCommentID() {
        return commentID;
    }

    public void setCommentID(int commentID) {
        this.commentID = commentID;
    }

    @Autowired
    private IExampleService exampleServ = null;
    private IPhotographerService photographerServ = null;
    public ExampleAction() {
    }

    public IExampleService getExampleServ() {
        return this.exampleServ;
    }
    public void setExampleServ(IExampleService exampleServ) {
        System.out.println("SetexampleServ");
        this.exampleServ = exampleServ;
    }
    public IPhotographerService getPhotographerServ() { return photographerServ; }
    public void setPhotographerServ(IPhotographerService photographerServ) {
        System.out.println("setPhotographerServ");
        this.photographerServ = photographerServ;
    }
    public List<String> getConditionList() {return conditionList; }
    public void setConditionList(List<String> conditionList) {this.conditionList = conditionList;}
    public String getCondition() {
        return this.condition;
    }
    public void setCondition(String condition) {
        this.condition = condition;
    }
    public List getExamples() {
        return this.examples;
    }
    public void setExamples(List examples) {
        this.examples = examples;
    }
    public Example getExample() {
        return this.example;
    }
    public void setExample(Example example) {
        this.example = example;
    }
    public Comments getComments() {
        return this.comments;
    }
    public void setComments(Comments comments) {
        this.comments = comments;
    }
    public String getRadio1() { return this.radio1;}
    public void setRadio1(String radio1) { this.radio1 = radio1; }
    public String getRadio2() { return this.radio2;  }
    public void setRadio2(String radio2) {  this.radio2 = radio2; }
    public String getExampleId() {  return this.exampleId;    }
    public void setExampleId(String exampleId) {  this.exampleId = exampleId;   }
    public Photographer getPhotographer() {return photographer;  }
    public void setPhotographer(Photographer photographer) {  this.photographer = photographer;  }

    public ExamplePanorama getExamplepanorama() {
        return examplepanorama;
    }

    public void setExamplepanorama(ExamplePanorama examplepanorama) {
        this.examplepanorama = examplepanorama;
    }

    //查找所有案例
    public String findAllExample() {
        this.examples = this.exampleServ.findAll();
        return "success";
    }

    //放入案例
    public String putExample() {
        System.out.println(2222);
        this.exampleServ.putExample(this.example);
        System.out.println("put success");
        return "success";
    }

    //评论案例
    public String review() {
        return this.exampleServ.review(this.example, this.comments) ? "viewSuccess" : "viewFail";
    }

    //通过搜索框查找案例
    public String searchInFramedes() {
        this.examples = this.exampleServ.searchInFramedes(this.condition);
        return "success";
    }
    //为你推荐
    public String recommendyou(){
        this.examples = this.exampleServ.recommendyou();
        return "success";
    }
    //清除标准
    public String eliminate(){
        this.setRadio1(null);
        this.setRadio2(null);
        this.examples = this.exampleServ.findAll();
        return "success";
    }
    //通过筛选框中的元素查找案例
    public String searchInList() {
        System.out.println("in searchList");
        System.out.println("1:" + this.radio1 + "2:" + this.radio2);
        if (this.radio1 != null) {
            this.conditionList.add(this.radio1);
        } else {
            this.conditionList.add("");
        }

        if (this.radio2 != null) {
            this.conditionList.add(this.radio2);
        } else {
            this.conditionList.add("");
        }
        this.examples = this.exampleServ.searchInList(this.conditionList);
        return "success";
    }
    //点赞案例
    public String praise() throws IOException {
        System.out.println("exampleId:" + this.exampleId);
        int num = this.exampleServ.praise(this.exampleId);
        ServletActionContext.getResponse().getWriter().print(num);
        return null;
    }
    //收藏案例
    public String star() throws IOException {
        System.out.println("exampleId:" + this.exampleId);
        this.exampleServ.star(this.exampleId);
        return null;
    }

    public String unstar() throws IOException {
        System.out.println("in unstar action ");
        System.out.println("exampleId:" + this.exampleId);
        this.exampleServ.unstar(this.exampleId);
        return null;
    }

    public String unstarInList() throws IOException {
        System.out.println("in unstar action ");
        System.out.println("exampleId:" + this.exampleId);
        this.exampleServ.unstar(this.exampleId);
        return "success";
    }
    public String recommend3(){
        return this.exampleServ.recommend3(this.exampleId) ?"success" : "fail";
    }
    public String deleteComments(){
        System.out.println("++++++++++++++++++++000++++++++++++++");
        HttpServletRequest request = ServletActionContext.getRequest();
        System.out.println("commentID"+commentID);
        if (exampleServ.deleteComments(commentID)){
            String ID = this.example.getExampleId().toString();
            this.exampleServ.showComments(ID);
            System.out.println("!!!!!!!!!!!!!!!!!!!!");
            return "success";
        }else {
            System.out.println("   ??????????????????");

            return "failed";
        }
    }
    public String   showComments(){
        if (exampleServ.showComments(exampleID)){
            System.out.println("success!");
            return "success";
        }else {
            return "failed";
        }

    }
    public String allowComments(){
        System.out.println("++++++++++++++++++++000++++++++++++++");
        HttpServletRequest request = ServletActionContext.getRequest();
        System.out.println("commentID"+commentID);
        if (exampleServ.allowComments(commentID)){
            String ID = this.example.getExampleId().toString();
            this.exampleServ.showComments(ID);
            System.out.println("!!!!!!!!!!!!!!!!!!!!");
            return "success";
        }else {
            System.out.println("   ??????????????????");

            return "failed";
        }
    }

}
