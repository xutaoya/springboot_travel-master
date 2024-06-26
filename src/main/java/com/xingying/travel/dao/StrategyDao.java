package com.xingying.travel.dao;

import com.xingying.travel.pojo.Scenic;
import com.xingying.travel.pojo.Strategy;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

/**
 * 数据访问接口
 * @author Administrator
 *
 */
public interface StrategyDao extends JpaRepository<Strategy,String>,JpaSpecificationExecutor<Strategy>{


    List<Strategy> findBypublisherLike(String name);


}
