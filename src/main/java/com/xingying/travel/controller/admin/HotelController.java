package com.xingying.travel.controller.admin;

import com.xingying.travel.common.PageResult;
import com.xingying.travel.common.Result;
import com.xingying.travel.common.StatusCode;
import com.xingying.travel.dao.HotelDao;
import com.xingying.travel.dao.ScenicDao;
import com.xingying.travel.pojo.Hotel;
import com.xingying.travel.pojo.Scenic;
import com.xingying.travel.service.HotelService;
import com.xingying.travel.service.ScenicService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.*;

/**
 * 控制器层
 * @author Administrator
 *
 */
@Controller
@CrossOrigin
@RequestMapping("/hotel")
public class HotelController {

	@Autowired
	private HotelService hotelService;

	@Autowired
	private ScenicService scenicService;
    @Autowired
    private HotelDao hotelDao;


	/**
	 * 查询全部数据
	 * @return
	 */
	@ResponseBody
	@RequestMapping(method= RequestMethod.GET)
	public Result findAll(){
		return new Result(true, StatusCode.OK,"查询成功",hotelService.findAll());
	}
	
	/**
	 * 根据ID查询
	 * @param id ID
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/{id}",method= RequestMethod.GET)
	public Result findById(@PathVariable String id){
		return new Result(true,StatusCode.OK,"查询成功",hotelService.findById(id));
	}


	/**
	 * 增加
	 * @param hotel
	 */
	@ResponseBody
	@RequestMapping(method=RequestMethod.POST)
	public Result add(@RequestBody Hotel hotel){
		hotelService.add(hotel);
		return new Result(true,StatusCode.OK,"增加成功");
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
		Page<Hotel> pageList = hotelService.findSearch(searchMap, page, size);
		return  new Result(true,StatusCode.OK,"查询成功",  new PageResult<Hotel>(pageList.getTotalElements(), pageList.getContent()) );
	}

	@RequestMapping("/search_attrs")
	public String search_attrs(Model model,@RequestParam(value = "start" ,defaultValue = "0")Integer start,
							   @RequestParam(value = "limit" ,defaultValue = "6")Integer limit,
							   @RequestParam String search_key){
		start=start<0?0:start;
		Sort sort=new Sort(Sort.Direction.DESC,"id");
		Pageable pageable=PageRequest.of(start,limit,sort);
		Specification specification=new Specification() {
			@Override
			public Predicate toPredicate(Root root, CriteriaQuery criteriaQuery, CriteriaBuilder criteriaBuilder) {
				List<Predicate> scenics=new ArrayList<>();
				if (StringUtils.isNotBlank(search_key)){
					scenics.add( criteriaBuilder.like(root.get("name"),"%"+search_key+"%"));
				}
				return criteriaBuilder.and(scenics.toArray(new Predicate[scenics.size()]));
			}
		};
		Page<Scenic> page=hotelDao.findAll(specification,pageable);

		model.addAttribute("attrs",page);
		model.addAttribute("number",page.getNumber());
		model.addAttribute("numberOfElements",page.getNumberOfElements());
		model.addAttribute("size",page.getSize());
		model.addAttribute("totalElements",page.getTotalElements());
		model.addAttribute("totalPages",page.getTotalPages());
		model.addAttribute("first",page.isFirst());
		model.addAttribute("last",page.isLast());
		return "page/hotels";
	}


	/**
	 * 修改
	 * @param hotel
	 */
	@ResponseBody
	@RequestMapping(value="/{id}",method= RequestMethod.PUT)
	public Result update(@RequestBody Hotel hotel, @PathVariable String id ){
		hotel.setId(id);
		hotelService.update(hotel);		
		return new Result(true,StatusCode.OK,"修改成功");
	}
	
	/**
	 * 删除
	 * @param id
	 */
	@ResponseBody
	@RequestMapping(value="/{id}",method= RequestMethod.DELETE)
	public Result delete(@PathVariable String id ){
		hotelService.deleteById(id);
		return new Result(true,StatusCode.OK,"删除成功");
	}

	/**
	 * 酒店列表跳转路径
	 * @return
	 */
	@RequestMapping(value = "/hotelList")
	public String hotelList(){
		return "admin/hotelmanage/hotelList";
	}

	@RequestMapping(value = "/hotelAdd")
	public String hotelAdd(){
		return "admin/hotelmanage/hotelAdd";
	}




	/**
	 * 查询单个酒店
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping("/oneAttr")
	public String One_attr(Model model, String id){
		System.out.println("id为:"+id);
		Hotel scenic=hotelService.findById(id);
		System.out.println(scenic.toString());
		model.addAttribute("oneAttr",scenic);
		//return "page/product::table_refresh";
		return "page/hotelDetail.html";
	}



	@RequestMapping("/local")
	public String localRefresh(Model model,String id) {
		System.out.println("id::====="+id);
		Hotel hotel=hotelService.findById(id);
			//	Sort sort=new Sort(Sort.Direction.DESC,"star");
			System.out.println("1111"+hotel.toString());
			List<Scenic> scenics=scenicService.findByCountryLike(hotel.getAddr());
			System.out.println("2222"+scenics.toString());
			Collections.sort(scenics, new Comparator<Scenic>() {
				@Override
				public int compare(Scenic o1, Scenic o2) {
					if (o1.getStart()<o2.getStart()){
						return 2;
					}
					if (o1.getStart().equals(o2.getStart()) ){
						return 1;
					}
					return -1;
				}
			});
			if (scenics.size()>=4){
				List newList=scenics.subList(0,3);
				model.addAttribute("scenics",newList);
			}else {
				model.addAttribute("scenics",scenics);
			}

		return "page/hotelDetail::table_refresh";
	}
}
