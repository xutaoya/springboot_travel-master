package com.xingying.travel.pojo;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @Author: tz
 */
@Entity
@Table(name = "hotel_orders")
@Data
public class Hotel_orders implements Serializable {

    @Id

    private String id;//id


    private String scenicid;//商品id
    private String userid;//用户id
    private Integer qty;//数量
    private BigDecimal payment;//总支付金额
    private String status;//状态
    private java.util.Date paytime;//支付时间
    private String phone;//电话
    private String username;
    private String scenicname;
    private String begin;
    private String end;

}
