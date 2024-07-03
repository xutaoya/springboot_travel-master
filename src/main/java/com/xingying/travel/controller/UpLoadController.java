package com.xingying.travel.controller;

import com.xingying.travel.common.Result;
import com.xingying.travel.common.StatusCode;
import com.xingying.travel.util.OSSUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.data.redis.core.RedisTemplate;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

/**
 * @Title: 上传图片控制器
 * @version: 1.0.0
 **/
@Controller
public class UpLoadController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private static final String RETURN_PATH="success";

    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private OSSUtil ossUtil;

    /**
     * 请求转发
     * @return
     */
    @RequestMapping("/upload")
    public String upload(){
        return "upload";
    }

    /**
     * 上传文件
     * @param file
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    public Result uploadimg(@RequestParam("file") MultipartFile file) {

        logger.info("文件上传开始");
        String fileName = file.getOriginalFilename();
        logger.info("上传的文件名: {}", fileName);

        if (file == null || fileName == null || fileName.trim().isEmpty()) {
            return new Result(false, StatusCode.ERROR, "文件为空，上传失败");
        }

        String dirPath = "D:" + File.separator + "javacode" + File.separator + "SpringBoot" + File.separator
                + "springboot_travel-master" + File.separator + "springboot_travel-master" + File.separator
                + "src" + File.separator + "main" + File.separator + "resources" + File.separator + "static"
                + File.separator + "images" + File.separator;
        File filePath = new File(dirPath);

        if (!filePath.exists()) {http://localhost:8080/dist/login
            filePath.mkdirs();
        }

        try {
            logger.info("正在保存文件到路径: {}", dirPath + fileName);
            file.transferTo(new File(dirPath + fileName));

            logger.info("正在将文件名保存到 Redis 中");
            redisTemplate.opsForValue().set("scenic", fileName, 1, TimeUnit.HOURS);
            redisTemplate.opsForValue().set("gallery", fileName, 1, TimeUnit.HOURS);
            redisTemplate.opsForValue().set("hotel", fileName, 1, TimeUnit.HOURS);
            redisTemplate.opsForValue().set("food", fileName, 1, TimeUnit.HOURS);
            redisTemplate.opsForValue().set("strategy", fileName, 1, TimeUnit.HOURS);

            logger.info("文件上传成功");
            return new Result(true, StatusCode.OK, "上传成功");
        } catch (IOException e) {
            logger.error("文件保存失败", e);
            return new Result(false, StatusCode.ERROR, "文件保存失败");
        } catch (Exception e) {
            logger.error("文件上传过程中出现异常", e);
            return new Result(false, StatusCode.ERROR, "文件上传失败");
        }
    }

}
