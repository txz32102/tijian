package com.shou.tijianserver.service;

import com.shou.tijianserver.entity.User;
import com.shou.tijianserver.vo.ResultVo;

/**
 * @Date 2024/6/29 20:21
 * @Author Corday
 * @Email abc@qq.com
 */
public interface UserService {
    //登录
    ResultVo login(String userId, String password);
    //注册
    ResultVo register(User user);
    //注册前判断用户Id是否存在
    ResultVo judgeUserId(String userId);

}
