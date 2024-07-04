package com.shou.tijianserver.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 检查项明细表
 */
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Checkitemdetailed {
    private Integer cdId;

    private String name;

    private String unit;

    private Double minrange;

    private Double maxrange;

    private String normalvalue;

    private String normalvaluestring;

    private Integer type;

    private Integer ciId;

    private String remarks;

}