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
@Table(name="admin")
@Data
public class Admin implements Serializable{
	@Id
	private String id;//
	private String name;//姓名
	private String password;//密码
}
