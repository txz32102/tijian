package com.shou.tijianserver.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 总检结论(结果)信息表
 */
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Overallresult {
    private Integer orId;

    private String title;

    private String content;

    private Integer orderId;
}