package com.shou.tijianserver.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


/**
 * 医生基本信息表
 */
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Doctor {
    private Integer docId;

    private String doccode;

    private String realname;

    private String password;

    private Integer gender;

    private Integer deptno;

}