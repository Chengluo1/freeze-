package cn.edu.zjut.action;

import cn.edu.zjut.service.IWebdataService;
import java.util.List;

public class WebdataAction {
    private List datalist;
    private IWebdataService webdataService = null;

    public WebdataAction() {
    }

    public List getDatalist() {
        return this.datalist;
    }

    public void setDatalist(List datalist) {
        this.datalist = datalist;
    }

    public void setWebdataService(IWebdataService webdataService) {
        this.webdataService = webdataService;
    }

    public String showDataChart() {
        System.out.println("in action");
        this.datalist = this.webdataService.findAll();
        return "success";
    }
}