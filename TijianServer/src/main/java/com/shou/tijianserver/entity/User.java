package com.shou.tijianserver.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

/**
 * 用户基本信息表
 * Ctrl+Alt+L：自动排版
 * @Date 2024/6/29 15:31
 * @Author Corday
 * @Email abc@qq.com
 */
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private String userId;
    private String password;
    private String realName;
    private int gender;
    private String identityCard;
    private Date birthday;
    private int userType;
}
