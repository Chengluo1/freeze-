package cn.edu.zjut.intercepter;

import cn.edu.zjut.po.Admin;
import cn.edu.zjut.po.Photographer;
import cn.edu.zjut.po.Employer;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import java.util.Map;

public class AuthorityInterceptor extends AbstractInterceptor {
    public AuthorityInterceptor() {
    }

    public String intercept(ActionInvocation invocation) throws Exception {
        System.out.println("Authority Interceptor executed!");
        ActionContext ctx = invocation.getInvocationContext();
        Map session = ctx.getSession();
        Photographer user = (Photographer)session.get("photographer");
        Employer e = (Employer)session.get("employer");
        Admin a = (Admin)session.get("admin");
        if (user == null && e == null && a == null) {
            ctx.put("tip", "You have not logged in yet, please enter your username and password to log in to the system");
            return "login";
        } else {
            return invocation.invoke();
        }
    }
}