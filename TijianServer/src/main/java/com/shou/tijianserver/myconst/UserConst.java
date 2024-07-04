package com.shou.tijianserver.myconst;

/**
 * @Date 2024/6/29 18:32
 * @Author Corday
 * 用户管理常量声明
 * 早期枚举类：建议不用，占空间，性能低
 */
public class UserConst {
    //代表curd成功与失败返回码
   public final static int CODEOK=1000;
   public final static int CODENO=1001;
   //返回提示消息
   public final static String UPDATEOK="更新成功";
   public final static String UPDATENO="更新失败";
   public final static String USERERROR="用户号或密码有误";
   public final static String USERLOGIN="登录成功";
   public final static String USEREXISTS="用户号已存在";
   public final static String USERNOTEXISTS="用户号不存在";
   public final static String REGOK="注册成功";
   public final static String REGNO="注册失败";
}
