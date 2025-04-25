package zsc.j2e.service;

import zsc.j2e.entity.Role;

//Role权限表接口
public interface RoleService {

    Role findByid(Integer id) throws Exception;

}
