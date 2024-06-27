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
@Table(name="user")
@Data
public class User implements Serializable{

	@Id
	private String id;//id


	
	private String name;//姓名
	private String password;//密码
	private String mobile;//电话
	private String email;//邮箱
	private String sex;//性别，男1，女0
	private Integer age;//年龄
	private String salt;//盐

}
