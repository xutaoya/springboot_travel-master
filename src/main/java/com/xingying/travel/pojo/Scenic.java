package com.xingying.travel.pojo;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
 * 实体类
 * @author Administrator
 *
 */
@Entity
@Table(name="scenic")
@Data
public class Scenic implements Serializable{

	@Id
	private String id;//id


	
	private String img;//景点图片
	private String name;//景点名称
	private Double price;//价格
	private String comment;//详情
	private Integer start;//评价
	private String contry;//国家地区
	private Integer stock;//库存
    private String miaoshu;//描述
	private Date  startdate; //出发时间

}
