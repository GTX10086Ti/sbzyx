package zsc.j2e.service.impl;

import zsc.j2e.mapper.RoleMapper;
import zsc.j2e.entity.Role;
import zsc.j2e.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    public Role findByid(Integer id) throws Exception {
        return roleMapper.selectByPrimaryKey(id);
    }
}
