//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package cn.edu.zjut.tool;

import cn.edu.zjut.dao.IWebdataDAO;
import cn.edu.zjut.po.Webdata;
import java.sql.Timestamp;
import java.util.Date;
import java.util.TimerTask;
import javax.servlet.ServletContext;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class UpdateDataTask extends TimerTask {
    private IWebdataDAO webdataDAO = null;

    public UpdateDataTask() {
    }

    public void setWebdataDAO(IWebdataDAO webdataDAO) {
        System.out.println("try to use webdataDAO");
        this.webdataDAO = webdataDAO;
    }

    public void run() {
        WebApplicationContext webApplicationContext = ContextLoader.getCurrentWebApplicationContext();
        ServletContext servletContext = webApplicationContext.getServletContext();
        ApplicationContext ac1 = WebApplicationContextUtils.getRequiredWebApplicationContext(servletContext);
        this.webdataDAO = (IWebdataDAO)ac1.getBean("webdataDAO");
        Webdata wd = new Webdata();
        Date date = new Date();
        Timestamp nousedate = (Timestamp)(new Date(date.getTime()));
        wd.setDate(nousedate);
        wd.setVisit((Integer)servletContext.getAttribute("visit"));
        wd.setPhotographernum((Integer)servletContext.getAttribute("designernum"));
        wd.setEmployernum((Integer)servletContext.getAttribute("employernum"));
        wd.setExamplenum((Integer)servletContext.getAttribute("examplenum"));
        wd.setOrdernum((Integer)servletContext.getAttribute("ordernum"));
        this.webdataDAO.save(wd);
    }
}
