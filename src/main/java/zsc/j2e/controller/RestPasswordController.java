package zsc.j2e.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ResponseBody;
import zsc.j2e.config.exception.CustomException;
import zsc.j2e.entity.EmailCode;
import zsc.j2e.entity.ResultCode;
import zsc.j2e.entity.Userlogin;
import zsc.j2e.service.StudentInfoService;
import zsc.j2e.service.UserloginService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import java.util.regex.Pattern;


@Controller
public class RestPasswordController {

    @Resource(name = "userloginServiceImpl")
    private UserloginService userloginService;

    @Resource(name = "studentInfoServiceImpl")
    private StudentInfoService studentInfoService;

    @Autowired
    RedisTemplate redisTemplate;

    // 本账户密码重置
    @RequestMapping(value = "/passwordRest", method = {RequestMethod.POST})
    public String passwordRest(String oldPassword, String password1) throws Exception {
        Subject subject = SecurityUtils.getSubject();
        String username = (String) subject.getPrincipal();

        Userlogin userlogin = userloginService.findByName(username);

        if (!oldPassword.equals(userlogin.getPassword())) {
            throw new CustomException("旧密码不正确");
        } else {
            if (password1.length() < 6) {
                throw new CustomException("密码长度不能少于6位");
            }
            System.out.println(Pattern.matches(".*[A-Z]+.*", password1));
            System.out.println(Pattern.matches(".*[a-z]+.*", password1));
            if (!Pattern.matches(".*[A-Z]+.*", password1) && !Pattern.matches(".*[a-z]+.*", password1)) {
                throw new CustomException("密码至少要包含一个大写和小写字母");
            }
            userlogin.setPassword(password1);
            userloginService.updateByName(username, userlogin);
        }

        return "redirect:/logout";
    }

    @RequestMapping("/forgetPassword/sendCode")
    @ResponseBody
    public ResultCode sendCode(String email) {
        if (email == null) {
            new ResultCode("正确请输入邮箱", 400);
        }
        if (redisTemplate.opsForValue().get(email) == null) {
            studentInfoService.checkEmail(email);
            return new ResultCode("验证码发送成功，请打开邮箱查看", 200);
        }
        return new ResultCode("验证码发送过于频繁，请90秒后尝试", 400);
    }


    @RequestMapping(value = "/forgetPassword/emailReset", method = {RequestMethod.POST})
    @ResponseBody
    public ResultCode emailReset(EmailCode emailCode) throws Exception {
        if (emailCode.getCode() == null || emailCode.getEmail() == null) {
            return new ResultCode("邮箱或验证码为空", 400);
        }
        if (emailCode.getCode().equals(redisTemplate.opsForValue().get(emailCode.getEmail()))) {
            userloginService.updateByEmail(emailCode.getEmail());
            return new ResultCode("密码修改重置成功，新密码已经发往邮箱！", 200);
        } else {
            return new ResultCode("验证码错误", 400);
        }
    }

}
