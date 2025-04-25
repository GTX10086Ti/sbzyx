package zsc.j2e.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import zsc.j2e.entity.StudentInfo;
import zsc.j2e.entity.StudentInfoExample;

public interface StudentInfoMapper {
    long countByExample(StudentInfoExample example);

    int deleteByExample(StudentInfoExample example);

    int deleteByPrimaryKey(Integer userid);

    int insert(StudentInfo row);

    int insertSelective(StudentInfo row);

    List<StudentInfo> selectByExample(StudentInfoExample example);

    StudentInfo selectByPrimaryKey(Integer userid);

    int updateByExampleSelective(@Param("row") StudentInfo row, @Param("example") StudentInfoExample example);

    int updateByExample(@Param("row") StudentInfo row, @Param("example") StudentInfoExample example);

    int updateByPrimaryKeySelective(StudentInfo row);

    int updateByPrimaryKey(StudentInfo row);
}