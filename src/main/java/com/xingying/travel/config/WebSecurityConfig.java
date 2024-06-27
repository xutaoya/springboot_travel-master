package com.xingying.travel.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;

/**
 * &#064;Title:  安全配置
 * &#064;version:  1.0.0
 * 所有地址都可以匿名访问
 **/
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/**").permitAll()// 允许所有路径匿名访问
                .anyRequest().authenticated()// 其他请求需要认证
                .and().csrf().disable();// 禁用 CSRF
        http.headers().frameOptions().sameOrigin();// 允许同源的 iframe 被嵌套
    }

}
