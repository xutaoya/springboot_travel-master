package com.xingying.travel.pojo;

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

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getLine() {
		return line;
	}

	public void setLine(String line) {
		this.line = line;
	}



	public String getTool() {
		return tool;
	}

	public void setTool(String tool) {
		this.tool = tool;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}


	@Override
	public String toString() {
		return "Strategy{" +
				"id='" + id + '\'' +
				", img='" + img + '\'' +
				", name='" + name + '\'' +
				", line='" + line + '\'' +
				", destination=" + destination +
				", tool='" + tool + '\'' +
				", startdate=" + startdate +
				", publisher='" + publisher + '\'' +
				'}';
	}
}
