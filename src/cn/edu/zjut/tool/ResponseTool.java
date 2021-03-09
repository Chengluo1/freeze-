//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package cn.edu.zjut.tool;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;

public class ResponseTool {
    public ResponseTool() {
    }

    public static void write(HttpServletResponse response, Object o) throws Exception {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println(o.toString());
        out.flush();
        out.close();
    }
}
