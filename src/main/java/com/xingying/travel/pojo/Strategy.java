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
@Table(name="strategy")
@Data
public class Strategy implements Serializable{

	@Id
	private String id;//id

	private String img;//图片
	private String name;//名称
	private String line;//线路名称
	private String destination;//目的地
	private String tool;//交通工具
	private Date  startdate; //出行时间
	private String publisher;//发布人

}
