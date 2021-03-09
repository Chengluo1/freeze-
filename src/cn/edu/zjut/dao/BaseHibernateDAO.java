package cn.edu.zjut.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;


public class BaseHibernateDAO {
    private SessionFactory sessionFactory;

    public BaseHibernateDAO() {
    }

    public Session getSession() {
        return this.sessionFactory.getCurrentSession();
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

}
