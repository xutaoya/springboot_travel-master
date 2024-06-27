package com.xingying.travel.pojo;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
/**
 * 实体类
 * @author Administrator
 *
 */
@Entity
@Table(name="hotel")
@Data
public class Hotel implements Serializable{

	@Id
	private String id;//

	private String img;//图片
	private String name;//酒店名称
	private Double price;//价格
	private String miaoshu;//描述
	private Integer bed;//床数
	private Integer day;//天数
	private Integer star;//评论星
	private java.util.Date startdate;//入住时间
	private String addr;   //地址

}
