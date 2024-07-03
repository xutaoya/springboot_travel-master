package com.xingying.travel.controller.admin;

import com.xingying.travel.common.PageResult;
import com.xingying.travel.common.Result;
import com.xingying.travel.common.StatusCode;
import com.xingying.travel.pojo.Food;
import com.xingying.travel.service.FoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;


/**
 * 控制器层
 * @author Administrator
 *
 */
@Controller
@CrossOrigin
@RequestMapping("/food")
public class FoodController {

	@Autowired
	private FoodService foodService;
	
	
	/**
	 * 查询全部数据
	 * @return
	 */
	@ResponseBody
	@RequestMapping(method= RequestMethod.GET)
	public Result findAll(){
		return new Result(true, StatusCode.OK,"查询成功",foodService.findAll());
	}
	
	/**
	 * 根据ID查询
	 * @param id ID
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/{id}",method= RequestMethod.GET)
	public Result findById(@PathVariable String id){
		return new Result(true,StatusCode.OK,"查询成功",foodService.findById(id));
	}


	/**
	 * 分页+多条件查询
	 * @param searchMap 查询条件封装
	 * @param page 页码
	 * @param size 页大小
	 * @return 分页结果
	 */
	@ResponseBody
	@RequestMapping(value="/search/{page}/{size}",method=RequestMethod.POST)
	public Result findSearch(@RequestBody Map searchMap , @PathVariable int page, @PathVariable int size){
		Page<Food> pageList = foodService.findSearch(searchMap, page, size);
		return  new Result(true,StatusCode.OK,"查询成功",  new PageResult<Food>(pageList.getTotalElements(), pageList.getContent()) );
	}

	/**
     * 根据条件查询
     * @param searchMap
     * @return
     */
	@ResponseBody
    @RequestMapping(value="/search",method = RequestMethod.POST)
    public Result findSearch( @RequestBody Map searchMap){
        return new Result(true,StatusCode.OK,"查询成功",foodService.findSearch(searchMap));
    }
	
	/**
	 * 增加
	 * @param food
	 */
	@ResponseBody
	@RequestMapping(method=RequestMethod.POST)
	public Result add(@RequestBody Food food  ){
		foodService.add(food);
		return new Result(true,StatusCode.OK,"增加成功");
	}
	
	/**
	 * 修改
	 * @param food
	 */
	@ResponseBody
	@RequestMapping(value="/{id}",method= RequestMethod.PUT)
	public Result update(@RequestBody Food food, @PathVariable String id ){
		food.setId(id);
		foodService.update(food);
		return new Result(true,StatusCode.OK,"修改成功");
	}
	
	/**
	 * 删除
	 * @param id
	 */
	@ResponseBody
	@RequestMapping(value="/delete/{id}",method= RequestMethod.DELETE)
	public Result delete(@PathVariable String id ){
		foodService.deleteById(id);
		return new Result(true,StatusCode.OK,"删除成功");
	}

	/**
	 * 批量删除
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/batchDelete", method = RequestMethod.POST)
	public Result batchDelete(@RequestBody Map<String, List<String>> request) {
		List<String> ids = request.get("ids");
		System.out.println(ids);
		try {
			for (String id : ids) {
				foodService.deleteById(id);
			}
			return new Result(true, StatusCode.OK, "删除成功");
		} catch (Exception e) {
			return new Result(false, StatusCode.ERROR, "删除失败");
		}
	}

	/**
	 * 跳转页面
	 * @return
	 */
	@RequestMapping(value = "/foodList")
	public String galleryList(){
		return "admin/foodmanage/foodList";
	}

	/**
	 * 添加照片
	 * @return
	 */
	@RequestMapping(value = "/foodAdd")
	public String galleryAdd(){
		return "admin/foodmanage/foodAdd";
	}
}
