package com.xingying.travel.service;

import com.xingying.travel.dao.FoodDao;

import com.xingying.travel.pojo.Food;

import com.xingying.travel.util.IdWorker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 食物服务层
 * 
 * @author Administrator
 *
 */
@Service
@Transactional
public class FoodService {

	@Autowired
	private FoodDao foodDao;
	
	@Autowired
	private IdWorker idWorker;

	@Autowired
	private RedisTemplate redisTemplate;

	/**
	 * 查询全部列表
	 * @return
	 */
	public List<Food> findAll() {
		return foodDao.findAll();
	}

	
	/**
	 * 条件查询+分页
	 * @param whereMap
	 * @param page
	 * @param size
	 * @return
	 */
	public Page<Food> findSearch(Map whereMap, int page, int size) {
		Specification<Food> specification = createSpecification(whereMap);
		PageRequest pageRequest =  PageRequest.of(page-1, size);
		return foodDao.findAll(specification, pageRequest);
	}

	
	/**
	 * 条件查询
	 * @param whereMap
	 * @return
	 */
	public List<Food> findSearch(Map whereMap) {
		Specification<Food> specification = createSpecification(whereMap);
		return foodDao.findAll(specification);
	}

	/**
	 * 根据ID查询实体
	 * @param id
	 * @return
	 */
	public Food findById(String id) {
		return foodDao.findById(id).get();
	}

	/**
	 * 增加
	 * @param food
	 */
	public void add(Food food) {
		food.setId( idWorker.nextId()+"" );

		//取到缓存中的文件url
		String fileurl = (String) redisTemplate.opsForValue().get("gallery");
		System.out.println(fileurl+"============");

		food.setImg("/images/"+fileurl);

		foodDao.save(food);
	}

	/**
	 * 修改
	 * @param food
	 */
	public void update(Food food) {
		foodDao.save(food);
	}

	/**
	 * 删除
	 * @param id
	 */
	public void deleteById(String id) {
		foodDao.deleteById(id);
	}

	/**
	 * 动态条件构建id,img,title,comment,infosource
	 * @param searchMap
	 * @return
	 */
	private Specification<Food> createSpecification(Map searchMap) {

		return new Specification<Food>() {

			@Override
			public Predicate toPredicate(Root<Food> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> predicateList = new ArrayList<Predicate>();
                // 
                if (searchMap.get("id")!=null && !"".equals(searchMap.get("id"))) {
                	predicateList.add(cb.like(root.get("id").as(String.class), "%"+(String)searchMap.get("id")+"%"));
                }
                // 图片
                if (searchMap.get("img")!=null && !"".equals(searchMap.get("img"))) {
                	predicateList.add(cb.like(root.get("img").as(String.class), "%"+(String)searchMap.get("img")+"%"));
                }
                // 标题
                if (searchMap.get("title")!=null && !"".equals(searchMap.get("title"))) {
                	predicateList.add(cb.like(root.get("title").as(String.class), "%"+(String)searchMap.get("title")+"%"));
                }
                // 内容
                if (searchMap.get("comment")!=null && !"".equals(searchMap.get("comment"))) {
                	predicateList.add(cb.like(root.get("comment").as(String.class), "%"+(String)searchMap.get("comment")+"%"));
                }
                // 城市国家
                if (searchMap.get("infosource")!=null && !"".equals(searchMap.get("infosource"))) {
                	predicateList.add(cb.like(root.get("infosource").as(String.class), "%"+(String)searchMap.get("infosource")+"%"));
                }
				
				return cb.and( predicateList.toArray(new Predicate[predicateList.size()]));

			}
		};

	}

}
