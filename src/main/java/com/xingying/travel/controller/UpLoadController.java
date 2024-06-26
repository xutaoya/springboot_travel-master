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
    @RequestMapping(value = "/uploadFile",method = RequestMethod.POST)
    public Result uploadimg(@RequestParam("file") MultipartFile file){

        logger.info("文件上传");
        String FileName = file.getOriginalFilename();
        System.out.println(FileName);
   try {
      if (file != null){
        if (!"".equals(FileName.trim())) {
            /*File newFile = new File(FileName);
            FileOutputStream outputStream = new FileOutputStream(newFile);
            outputStream.write(file.getBytes());
            outputStream.close();
            file.transferTo(newFile);*/

            String dirPath = "C:/Users/Administrator/Desktop/xingying_tourism_network/src/main/resources/static/images";
            File filePath = new File(dirPath);

            if(!filePath.exists()){filePath.mkdirs();}
            try {
                System.err.println("file");
                redisTemplate.opsForValue().set("scenic" , FileName, 1 , TimeUnit.HOURS);
                redisTemplate.opsForValue().set("gallery" , FileName, 1 , TimeUnit.HOURS);
                redisTemplate.opsForValue().set("hotel" , FileName, 1 , TimeUnit.HOURS);
                redisTemplate.opsForValue().set("food" , FileName, 1 , TimeUnit.HOURS);
                redisTemplate.opsForValue().set("strategy" , FileName, 1 , TimeUnit.HOURS);
                file.transferTo(new File(dirPath+FileName));
            } catch (Exception e) {e.printStackTrace();}
            // 上传到OSS
            //ossUtil.upLoad(newFile);
            }
         }
      }catch (Exception e){
       e.printStackTrace();
     }
          return new Result(true, StatusCode.OK,"上传成功");
   }
}
