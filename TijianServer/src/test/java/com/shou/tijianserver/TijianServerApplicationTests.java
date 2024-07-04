package com.shou.tijianserver;

import com.shou.tijianserver.entity.User;
import com.shou.tijianserver.mapper.UserMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class TijianServerApplicationTests {
    @Autowired
    UserMapper userMapper;

    @Test//测试登录
    void login() {
        User user = userMapper.selectUser("10001", "1234");
        System.out.println("拿到：" + user);
    }
    @Test//测试注册
    void register(){

    }
}
