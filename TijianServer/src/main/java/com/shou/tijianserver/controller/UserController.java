package com.shou.tijianserver.controller;

import com.shou.tijianserver.entity.User;
import com.shou.tijianserver.service.UserService;
import com.shou.tijianserver.vo.ResultVo;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @Date 2024/6/29 20:45
 * @Author Corday
 * @Email abc@qq.com
 */
@RestController
@RequestMapping("/user")
public class UserController {
    @Resource
    private UserService userService;

    /**
     * 已做了全局跨域配置
     * http://localhost:9080/user/login
     * 用户登录
     * @return
     */
    @RequestMapping("/login")
    public ResultVo login(String userId, String password) {
        ResultVo vo = userService.login(userId, password);
        return vo;
    }

    /**
     * 注册
     * http://localhost:9080/user/register
     * @param user
     * @return
     */
    @PostMapping("/register")
    public ResultVo reg(User user) {
        ResultVo vo = userService.register(user);
        return vo;
    }

    /**
     * 判断用户Id是否已注册
     * @param userId
     * @return
     */
    @RequestMapping("/judge")
    public  ResultVo judge(String userId){
        ResultVo vo = userService.judgeUserId(userId);
        return vo;
    }
}
