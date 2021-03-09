
package cn.edu.zjut.tool;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ConfigListener implements ServletContextListener {
    public ConfigListener() {
    }

    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("监听到容器启动！开启定时器......");
        ServletContext servletContext = sce.getServletContext();
        servletContext.setAttribute("visit", 0);
        servletContext.setAttribute("employernum", 0);
        servletContext.setAttribute("designernum", 0);
        servletContext.setAttribute("examplenum", 0);
        servletContext.setAttribute("ordernum", 0);
        List<String> iplist = new ArrayList();
        servletContext.setAttribute("iplist", iplist);
        new DayTimer();
    }

    public void contextDestroyed(ServletContextEvent sce) {
    }
}
