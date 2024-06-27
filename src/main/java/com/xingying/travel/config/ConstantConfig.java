package com.xingying.travel.config;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

/**
 * @Title: OSS常量配置
 * @version: 1.0.0
 **/
@Component
@Configuration
@Data
public class ConstantConfig {

    @Value("${aliyun.oss.endpoint}")
    private String endpoint;

    @Value("${aliyun.oss.bucketname}")
    private String bucketname;

    @Value("${aliyun.oss.keyid}")
    private String keyid;

    @Value("${aliyun.oss.keysecret}")
    private String keysecret;

    @Value("${aliyun.oss.filehost}")
    private String filehost;

}
