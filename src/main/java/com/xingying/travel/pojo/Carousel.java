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
@Table(name="carousel")
@Data
public class Carousel implements Serializable{

	@Id
	private String id;//


	
	private String title;//标题
	private String comment;//内容
	private String scenictime;//时间

}
