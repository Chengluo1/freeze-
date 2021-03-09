package cn.edu.zjut.dao;

import cn.edu.zjut.po.Comments;
import java.util.List;

public interface ICommentsDAO {
    List findByHql(String var1);
    Comments findById(Integer var1);
    void save(Comments var1);
    void update(Comments var1);
    void delete(Comments var1);
}
