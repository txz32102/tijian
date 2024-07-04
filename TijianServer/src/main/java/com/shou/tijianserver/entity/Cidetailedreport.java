package com.shou.tijianserver.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 体检报告检查项明细表
 */
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cidetailedreport {
    private Integer cidrId;
    private String name;
    private String unit;
    private Double minrange;
    private Double maxrange;
    private String normalvalue;
    private String normalvaluestring;
    private Integer type;
    private String value;
    private Integer iserror;
    private Integer ciId;
    private Integer orderId;
}