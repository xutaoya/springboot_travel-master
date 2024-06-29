package com.xingying.travel.pojo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CaptchaVO {
    //验证码id
    private  String captchaId;
    //验证码图片base64编码
    private  String captchaImage;

}
