package com.shou.tijianserver.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
/**
 *检查项基本信息表
 */
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Checkitem {
    private Integer ciId;
    private String ciname;
    private String cicontent;
    private String meaning;
    private String remarks;
}