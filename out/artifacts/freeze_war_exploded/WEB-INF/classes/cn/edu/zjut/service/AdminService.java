package cn.edu.zjut.service;

import cn.edu.zjut.dao.AdminDAO;
import cn.edu.zjut.dao.IAdminDAO;
import cn.edu.zjut.po.Employer;
import cn.edu.zjut.po.Photographer;

public class AdminService implements IAdminService{
    IAdminDAO adminDAO = null;

    public void setAdminDAO(AdminDAO adminDAO) {
        this.adminDAO = adminDAO;
    }

    public boolean logout1(String userId, String phone){
        String str = userId.substring(0, 1);
        System.out.println("str: "+str);

        if (str.equals("0")){
            System.out.println("try to delete photographer!");
            String hql1="from Photographer where photographerId='"+userId+"'and phone='"+"'";
            try {
                Photographer photographer = adminDAO.findPho(hql1);
                System.out.println("phoid:"+photographer.getPhotographerId());
                adminDAO.delete(photographer);
                return true;
            }catch (RuntimeException var3){
                throw var3;
            }

        }else if (str.equals("1")){
            System.out.println("try to delete employer!");
            String hql2="from Employer where employerId='"+userId+"'and phone='"+phone+"'";
            try {
                Employer employer = adminDAO.findEmp(hql2);
                System.out.println("empid:"+employer.getEmployerId());
                adminDAO.delete(employer);
                return true;
            }catch (RuntimeException var3){
                throw var3;
            }
        }else {
            return false;
        }
    }
}
