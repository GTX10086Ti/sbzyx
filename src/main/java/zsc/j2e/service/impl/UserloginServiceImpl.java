package zsc.j2e.service.impl;

import cn.hutool.Hutool;
import cn.hutool.core.util.RandomUtil;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import zsc.j2e.mapper.StudentInfoMapper;
import zsc.j2e.mapper.UserloginMapper;
import zsc.j2e.entity.Userlogin;
import zsc.j2e.entity.UserloginExample;
import zsc.j2e.service.StudentInfoService;
import zsc.j2e.service.UserloginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserloginServiceImpl implements UserloginService {

    @Autowired
    private UserloginMapper userloginMapper;

    @Resource(name = "studentInfoServiceImpl")
    private StudentInfoService studentInfoService;

    @Autowired
    private JavaMailSender sender;


    public Userlogin findByName(String name) throws Exception {
        UserloginExample userloginExample = new UserloginExample();

        UserloginExample.Criteria criteria = userloginExample.createCriteria();
        criteria.andUsernameEqualTo(name);

        List<Userlogin> list = userloginMapper.selectByExample(userloginExample);

        return list.get(0);
    }



    public void save(Userlogin userlogin) throws Exception {
        userloginMapper.insert(userlogin);
    }

    public void removeByName(String name) throws Exception {
        UserloginExample userloginExample = new UserloginExample();

        UserloginExample.Criteria criteria = userloginExample.createCriteria();
        criteria.andUsernameEqualTo(name);

        userloginMapper.deleteByExample(userloginExample);
    }

    @Override
    public void updateByName(String name, Userlogin userlogin) {
        UserloginExample userloginExample = new UserloginExample();

        UserloginExample.Criteria criteria = userloginExample.createCriteria();
        criteria.andUsernameEqualTo(name);

        userloginMapper.updateByExample(userlogin, userloginExample);
    }

    @Override
    public void updateByEmail(String email) throws Exception {
        Integer userName = studentInfoService.findByEmail(email).getUserid();

        Userlogin userlogin = findByName(userName.toString());
        String newPass = RandomUtil.randomString(16);
        userlogin.setPassword(newPass);

        SimpleMailMessage message = new SimpleMailMessage();
        message.setSubject("教务系统密码重置");
        message.setText("用户名: "+userlogin.getUsername()+"\n新密码："+newPass+"\n请收到后尽快登陆教务系统修改密码");
        message.setTo(email);
        message.setFrom("sbzyx@qq.com");
        sender.send(message);

        updateByName(userlogin.getUsername(),userlogin);
    }

}
