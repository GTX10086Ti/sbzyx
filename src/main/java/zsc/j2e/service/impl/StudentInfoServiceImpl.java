package zsc.j2e.service.impl;

import cn.hutool.core.util.RandomUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import zsc.j2e.mapper.StudentInfoMapper;
import zsc.j2e.mapper.StudentInfoMapperCustom;
import zsc.j2e.entity.*;
import zsc.j2e.service.StudentInfoService;

import java.util.List;
import java.util.concurrent.TimeUnit;

@Service
public class StudentInfoServiceImpl implements StudentInfoService {

    @Autowired
    private StudentInfoMapper studentInfoMapper;

    @Autowired
    private StudentInfoMapperCustom studentInfoMapperCustom;

    @Autowired
    private JavaMailSender sender;

    @Autowired
    RedisTemplate redisTemplate;

    @Override
    public List<StudentInfo> findAll() {
        StudentInfoExample studentInfoExample = new StudentInfoExample();
        studentInfoExample.createCriteria().andCollegeidIsNotNull();


        return studentInfoMapper.selectByExample(studentInfoExample);
    }

    @Override
    public StudentInfoCustom findById(Integer id) {

        return studentInfoMapperCustom.findById(id);
    }

    @Override
    public void updateById(StudentInfoCustom studentInfoCustom) {
        studentInfoMapper.updateByPrimaryKeySelective(studentInfoCustom);
    }

    @Override
    public void checkEmail(String email) {

        if (findByEmail(email) != null) {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setSubject("教务系统找回密码");
            String code = RandomUtil.randomNumbers(8);
            message.setText("验证码："+ code);
            message.setTo(email);
            message.setFrom("sbzyx@qq.com");
            sender.send(message);
            redisTemplate.opsForValue().set(email, code, 60, TimeUnit.SECONDS);
        }
    }

    @Override
    public StudentInfo findByEmail(String email) {
        StudentInfoExample studentInfoExample = new StudentInfoExample();
        studentInfoExample.createCriteria().andEmailEqualTo(email);
        System.out.println("++++++++++++++++++"+studentInfoMapper.selectByExample(studentInfoExample));
        return studentInfoMapper.selectByExample(studentInfoExample).get(0);
    }

}
