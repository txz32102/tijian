package com.shou.tijianserver.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 体检报告检查项信息表
 */
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cireport {
    private Integer cirId;

    private Integer ciId;

    private String ciname;

    private Integer orderId;

}