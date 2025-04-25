package zsc.j2e.service.impl;

import zsc.j2e.mapper.CollegeMapper;
import zsc.j2e.entity.College;
import zsc.j2e.entity.CollegeExample;
import zsc.j2e.service.CollegeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CollegeServiceImpl implements CollegeService {

    @Autowired
    private CollegeMapper collegeMapper;



    @Cacheable(value = "collegeList",key = "methodName")
    public List<College> finAll() throws Exception {
        CollegeExample collegeExample = new CollegeExample();
        CollegeExample.Criteria criteria = collegeExample.createCriteria();

        criteria.andCollegeidIsNotNull();

        return collegeMapper.selectByExample(collegeExample);
    }
}
