package com.xingying.travel.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 */
@Configuration
public class MyConfig implements WebMvcConfigurer {

    @Autowired
    private InterceptorConfig interceptorConfig;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
    }


    // 这个方法用来注册拦截器，我们自己写好地拦截器需要通过这里添加注册才能生效
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(interceptorConfig)
                .addPathPatterns("/admin/**") // 拦截 /admin/** 下的所有请求
                .excludePathPatterns("/admin/login") //排除 /admin/login 路径
                .excludePathPatterns("/admin/adminlogin");// 排除 /admin/adminlogin 路径
    }

    /**
     * 视图控制器
     * @param registry
     */
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/").setViewName("forward:/dist/view");

        registry.addViewController("/admin").setViewName("forward:/admin/adminlogin");

        registry.setOrder(Ordered.HIGHEST_PRECEDENCE);//设置视图控制器的顺序为最高优先级
    }
}
