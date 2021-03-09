package cn.edu.zjut.service;

import cn.edu.zjut.po.Employer;
import java.io.File;

public interface IEmployerService {
    boolean registerEmp(Employer var1);
    public boolean putEmployer(Employer employer);
    public boolean update3(Employer employer, File uprofile, String uprofileFileName);
    boolean back();
    boolean showEmp();
}
