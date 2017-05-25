package com.bodawb.factorycontrol.jijia.controller;

import com.alibaba.fastjson.JSON;
import com.bodawb.factorycontrol.jijia.pojo.User;
import com.bodawb.factorycontrol.jijia.service.RegisterAndLoginI;
import com.bodawb.factorycontrol.jijia.service.RegisterAndLoginImpl;
import com.bodawb.factorycontrol.jijia.util.PrintUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by root on 5/22/17.
 */
@Controller
//@RequestMapping("/file")
public class FileController {
    private RegisterAndLoginI registerAndLoginI;

    public RegisterAndLoginI getRegisterAndLoginI() {
        return registerAndLoginI;
    }
@Autowired
    public void setRegisterAndLoginI(RegisterAndLoginI registerAndLoginI) {
        this.registerAndLoginI = registerAndLoginI;
    }

    @RequestMapping("/test")
    public String test(){
        User user=registerAndLoginI.getUserByEmail("894121196@qq.com");
        System.out.print("test------>"+ JSON.toJSONString(user));
        PrintUtil.printDiy("test","111");
        return "index";
    }
}
