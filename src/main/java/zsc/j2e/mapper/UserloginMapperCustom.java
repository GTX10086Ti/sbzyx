package zsc.j2e.mapper;

import zsc.j2e.entity.UserloginCustom;

//登录拓展类
public interface UserloginMapperCustom {

    UserloginCustom findOneByName(String name) throws Exception;

}
