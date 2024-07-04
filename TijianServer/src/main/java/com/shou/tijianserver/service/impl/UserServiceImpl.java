package com.shou.tijianserver.service.impl;

import com.shou.tijianserver.entity.User;
import com.shou.tijianserver.mapper.UserMapper;
import com.shou.tijianserver.myconst.UserConst;
import com.shou.tijianserver.service.UserService;
import com.shou.tijianserver.vo.ResultVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @Date 2024/6/29 20:22
 * @Author Corday
 * @Email abc@qq.com
 */
@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;

    /**
     * 登录
     * @param userId
     * @param password
     * @return
     */
    @Override
    public ResultVo login(String userId, String password) {
        User user = userMapper.selectUser(userId, password);
        ResultVo rs = null;
        if (user!= null) {//code,data,message
            rs = new ResultVo(UserConst.CODEOK,user,UserConst.USERLOGIN);
        } else {
            rs = new ResultVo(UserConst.CODENO, null, UserConst.USERERROR);
        }
        //返回vo
        return rs;

    }

    /**
     * 注册
     * @param user
     * @return
     */
    @Override
    public ResultVo register(User user) {
        int n = 0;
        //返回用户userId
        String temp = userMapper.selectUserId(user.getUserId());
        if (temp == null) {//用户不存执行添加
            n = userMapper.insertUser(user);
            if (n <= 0) {
                return new ResultVo(UserConst.CODENO, null, UserConst.UPDATENO);
            } else {
                return new ResultVo(UserConst.CODEOK, null, UserConst.UPDATEOK);
            }
        }
        //用户名已存返回值
        return new ResultVo(UserConst.CODENO, null, UserConst.USEREXISTS);
    }

    /**
     * 判断用户Id是否存在,便于前端直接判断
     * @param userId
     * @return
     */
    @Override
    public ResultVo judgeUserId(String userId) {
        //判断结果
        String temp = userMapper.selectUserId(userId);
        if(temp==null){//用户名不存在,前端可以注册
            return new ResultVo(UserConst.CODENO,null,UserConst.USERNOTEXISTS);
        }
        return new ResultVo(UserConst.CODEOK,null,UserConst.USEREXISTS);
    }
}
