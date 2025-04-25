package zsc.j2e.service;

import zsc.j2e.entity.StudentInfo;
import zsc.j2e.entity.StudentInfoCustom;

import java.util.List;

//学籍信息服务层接口
public interface StudentInfoService {

    List<StudentInfo> findAll();

    StudentInfoCustom findById(Integer id);

    void updateById(StudentInfoCustom studentInfoCustom);

    void checkEmail(String email);

    StudentInfo findByEmail(String email);
}

