package com.shou.tijianserver.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 医院信息表
 */
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Hospital {
    private Integer hpId;

    private String name;

    private String telephone;

    private String businesshours;

    private String deadline;

    private String rule;

    private Integer state;

    private String picture;

}