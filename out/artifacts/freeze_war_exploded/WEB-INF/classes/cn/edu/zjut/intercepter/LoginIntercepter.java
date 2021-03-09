package cn.edu.zjut.intercepter;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

public class LoginIntercepter extends AbstractInterceptor implements ApplicationContextAware {
    private static final long serialVersionUID = 7224871247223705569L;

    public LoginIntercepter() {
    }

    public String intercept(ActionInvocation ai) throws Exception {
        ActionContext actionContext = ai.getInvocationContext();
        Map<String, Object> session = actionContext.getSession();
        String userId = (String)session.get("userId");
        if (userId != null) {
            return ai.invoke();
        } else {
            HttpServletRequest request = (HttpServletRequest)actionContext.get("com.opensymphony.xwork2.dispatcher.HttpServletRequest");
            String queryString = request.getQueryString();
            if (queryString == null) {
                queryString = "";
            }

            String var10000 = request.getRequestURI();
            String realPath = var10000 + "?" + queryString;
            System.out.println(realPath + ":    realPath");
            session.put("realPath", realPath);
            return ai.invoke();
        }
    }

    public void setApplicationContext(ApplicationContext arg0) throws BeansException {
    }
}