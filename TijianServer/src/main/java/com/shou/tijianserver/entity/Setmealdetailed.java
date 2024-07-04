package com.shou.tijianserver.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
/**
 *体检套餐项目明细表
 */
public class Setmealdetailed {
    private Integer sdId;
    private Integer smId;
    private Integer ciId;
}