package com.xingying.travel.common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * &#064;Title:  控制器类返回结果
 * &#064;version:  1.0.0
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Result {

    private boolean flag; //是否成功
    private Integer code; //返回码
    private String msg; //返回信息
    private Object data; //返回数据

    public Result(boolean flag, Integer code, String msg) {
        this.flag = flag;
        this.code = code;
        this.msg = msg;
    }

}
