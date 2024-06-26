package com.xingying.travel.pojo;

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
@Table(name="food")
public class Food implements Serializable{

	@Id
	private String id;//
	private String img;//图片
	private String title;//标题
	private String comment;//内容
	private String infosource;//来源

	public String getInfosource() {
		return infosource;
	}

	public void setInfosource(String infosource) {
		this.infosource = infosource;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public String getImg() {		
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}

	public String getTitle() {		
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public String getComment() {		
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}



	
}
