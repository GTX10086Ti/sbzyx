package zsc.j2e.service;

import zsc.j2e.entity.Userlogin;

//用户登录服务层接口
public interface UserloginService {

    //根据名字查找用户
    Userlogin findByName(String name) throws Exception;

    //保存用户登录信息
    void save(Userlogin userlogin) throws Exception;

    //根据姓名删除
    void removeByName(String name) throws Exception;

    //根据用户名更新
    void updateByName(String name, Userlogin userlogin);

    void updateByEmail(String email) throws Exception;

}
