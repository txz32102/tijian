package com.shou.tijianserver.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 体检套餐信息表
 */
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Setmeal {
    private Integer smId;

    private String name;

    private Integer type;

    private Integer price;
}