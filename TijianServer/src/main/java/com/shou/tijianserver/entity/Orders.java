package com.shou.tijianserver.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

/**
 * 体检预约订单表
 */
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Orders {
    private Integer orderId;

    private Date orderdate;

    private String userId;

    private Integer hpId;

    private Integer smId;

    private Integer state;
}