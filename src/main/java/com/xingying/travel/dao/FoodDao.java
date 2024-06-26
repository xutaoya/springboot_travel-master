package com.xingying.travel.dao;

import com.xingying.travel.pojo.Food;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * 数据访问接口
 * @author Administrator
 *
 */
public interface FoodDao extends JpaRepository<Food,String>,JpaSpecificationExecutor<Food>{
	
}
