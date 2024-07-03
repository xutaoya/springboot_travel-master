package com.xingying.travel.controller.admin;

import com.xingying.travel.common.Result;
import com.xingying.travel.common.StatusCode;
import com.xingying.travel.pojo.Admin;
import com.xingying.travel.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/admin1")
public class RegisterController {
    @Autowired
    private AdminService adminService;
    /**
     * 管理员注册
     * @param name
     * @param admin
     * @return
     */

    @RequestMapping(value = "/adregister/{name}",method = RequestMethod.POST)
    public Result regist(@PathVariable String name, @RequestBody Admin admin){

        adminService.add(admin);
        return new Result(true, StatusCode.OK,"注册成功");
    }
}
