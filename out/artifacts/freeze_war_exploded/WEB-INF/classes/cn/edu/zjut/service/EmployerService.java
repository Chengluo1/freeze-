package cn.edu.zjut.service;

import cn.edu.zjut.dao.EmployerDAO;
import cn.edu.zjut.dao.IEmployerDAO;
import cn.edu.zjut.po.Employer;

import java.util.Map;

public class EmployerService implements IEmployerService{
    IEmployerDAO employerDAO = null;
    private Map<String,Object> request;
    private Map<String,Object> session;

    public IEmployerDAO getEmployerDAO() {
        return employerDAO;
    }

    public void setEmployerDAO(IEmployerDAO employerDAO) {
        this.employerDAO = employerDAO;
    }

    //用户注册
    public boolean registerEmp(Employer var1){
        String phone = var1.getPhone();
        String hql1= "from Employer where phone='"+phone+"'";
        if (employerDAO.findByHql(hql1).isEmpty()){
            String id = employerDAO.findEmp();
            if (id == null){//编写id
                String a = "1000000001";
                var1.setEmployerId(a);
            }else {
                Integer a = Integer.parseInt(id)+1;
                String b = a.toString();
                var1.setEmployerId(b);
            }
            var1.setAccount(var1.getPhone());
//            var1.setHmpgbkg("");
//            var1.setProfilePhoto("");
            try {
                employerDAO.save(var1);
                return true;
            }catch (Exception var7){
                var7.printStackTrace();
                return false;
            }
        }else {
            return false;
        }
    }
}
