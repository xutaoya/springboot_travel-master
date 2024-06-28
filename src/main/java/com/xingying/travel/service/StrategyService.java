package com.xingying.travel.service;

import com.xingying.travel.dao.ScenicDao;
import com.xingying.travel.dao.StrategyDao;
import com.xingying.travel.pojo.Scenic;
import com.xingying.travel.pojo.Strategy;
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
import java.util.Optional;

/**
 * 攻略服务层
 * 
 * @author Administrator
 *
 */
@Service
@Transactional
public class StrategyService {

	@Autowired
	private StrategyDao strategyDao;
	
	@Autowired
	private IdWorker idWorker;

	@Autowired
	private RedisTemplate redisTemplate;


	/**
	 * 查询全部列表
	 * @return
	 */
	public List<Strategy> findAll() {
		return strategyDao.findAll();
	}


	/**
	 * 条件查询+分页
	 * @param whereMap
	 * @param page
	 * @param size
	 * @return
	 */
	public Page<Strategy> findSearch(Map whereMap, int page, int size) {
		Specification<Strategy> specification = createSpecification(whereMap);
		PageRequest pageRequest =  PageRequest.of(page-1, size);
		return strategyDao.findAll(specification, pageRequest);
	}


	
	/**
	 * 条件查询
	 * @param whereMap
	 * @return
	 */
	public List<Strategy> findSearch(Map whereMap) {
		Specification<Strategy> specification = createSpecification(whereMap);
		return strategyDao.findAll(specification);
	}



	/**
	 * 根据ID查询实体
	 * @param id
	 * @return
	 */
	public Optional<Strategy> findById(String id) {
		return strategyDao.findById(id);
	}

	/**
	 * 增加
	 * @param strategy
	 */
	public void add(Strategy strategy) {
		strategy.setId( idWorker.nextId()+"" );
		//取到缓存中的文件url
		String fileurl = (String) redisTemplate.opsForValue().get("strategy");

        strategy.setImg("/images/"+fileurl);
		strategyDao.save(strategy);
	}

	/**
	 * 修改
	 * @param strategy
	 */
	public void update(Strategy strategy) {
		strategyDao.save(strategy);
	}

	/**
	 * 删除
	 * @param id
	 */
	public void deleteById(String id) {
		strategyDao.deleteById(id);
	}

	/**
	 * 动态条件构建
	 * @param searchMap
	 * @return
	 */
	private Specification<Strategy> createSpecification(Map searchMap) {

		return new Specification<Strategy>() {

			@Override
			public Predicate toPredicate(Root<Strategy> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> predicateList = new ArrayList<Predicate>();
                // id
                if (searchMap.get("id")!=null && !"".equals(searchMap.get("id"))) {
                	predicateList.add(cb.like(root.get("id").as(String.class), "%"+(String)searchMap.get("id")+"%"));
                }
                // 图片
                if (searchMap.get("img")!=null && !"".equals(searchMap.get("img"))) {
                	predicateList.add(cb.like(root.get("img").as(String.class), "%"+(String)searchMap.get("img")+"%"));
                }
                // 名称
                if (searchMap.get("name")!=null && !"".equals(searchMap.get("name"))) {
                	predicateList.add(cb.like(root.get("name").as(String.class), "%"+(String)searchMap.get("name")+"%"));
                }
				
				return cb.and( predicateList.toArray(new Predicate[predicateList.size()]));

			}
		};

	}


	/**
	 * 根据城市发布人模糊查询
	 * @return
	 */
	public List<Strategy> findBypublisherLike(String publisher){
		return strategyDao.findBypublisherLike(publisher);
	}

}
