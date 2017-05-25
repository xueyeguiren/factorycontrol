package com.bodawb.factorycontrol.jijia.controller;

import com.alibaba.fastjson.JSON;
import com.bodawb.factorycontrol.jijia.pojo.User;
import com.bodawb.factorycontrol.jijia.service.RegisterAndLoginI;
import com.bodawb.factorycontrol.jijia.util.PrintUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by root on 5/24/17.
 */
@Controller
@RequestMapping("/user")
public class UserController {
    private RegisterAndLoginI registerAndLoginI;

    public RegisterAndLoginI getRegisterAndLoginI() {
        return registerAndLoginI;
    }
@Autowired
    public void setRegisterAndLoginI(RegisterAndLoginI registerAndLoginI) {
        this.registerAndLoginI = registerAndLoginI;
    }

    /**
     * 用户登录
     *
     * @return
     */
    @RequestMapping(value = "/login")
    public String login(User user, HttpServletRequest request, HttpServletResponse response) {
        //从前台后获取email和密码,放入user对象中
        String email = request.getParameter("username");
        String password = request.getParameter("password");
        try {
            user.setEmail(email);
            user.setPassword(password);
            PrintUtil.test("user.login: user", JSON.toJSONString(user));
            Subject subject = SecurityUtils.getSubject();
            if (subject.isAuthenticated()) {
                PrintUtil.test("user.login", "已登录");
                return "index";
            }
            // 身份验证
            UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(user.getEmail(), user.getPassword());
            PrintUtil.test("usernamePasswordToken", JSON.toJSONString(usernamePasswordToken));

            PrintUtil.test("将登录", "");
            subject.login(usernamePasswordToken);
            PrintUtil.test("已登录", "");
            final User authUserInfo = registerAndLoginI.getUserByEmail(user.getEmail());

        } catch (AuthenticationException e) {
            // 身份验证失败
            PrintUtil.test("user.login", "身份验证失败");
            PrintUtil.test("Fail-code",e);
            e.printStackTrace();
            return "fail";
        }
        return "index";
    }
    /**
     * 登陆页面
     */
    @RequestMapping("/log")
    public String log(){
        return "login";
    }
}
