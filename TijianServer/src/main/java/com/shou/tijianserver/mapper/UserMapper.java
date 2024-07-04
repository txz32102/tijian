package com.shou.tijianserver.mapper;

import com.shou.tijianserver.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * @Date 2024/6/29 15:44
 * @Author Corday
 * @Email abc@qq.com
 */
@Mapper
public interface UserMapper {
    //1.查询用户,返回用户对象
    User selectUser(@Param("userId") String userId,@Param("password") String password);
    //2.添加用户前,判断用户Id是否存在
    @Select("select userId from user where userId=#{userId}")
    String selectUserId(String userId);
    //3.添加用户
    int insertUser(User user);
    //更新密码

}
