package com.lq.mycode.common;
/**
 * 字段名和类型
 * @author l.q
 *
 */
public class Attribute {
	private String type;//字段类型
	private String name;//字段名
	private Integer size;//字段长度 用于数据库
	private String sqlType;//数据库用type
	private String sqlName;//数据库用name;
	private String comment;//备注
	private Boolean flag;//是否必须(1是2否)
	public Attribute(){}
	public Attribute(String name,String type,Integer size,String comment,Boolean flag){
		this.type = type;
		this.name = name;
		this.size = size;
		this.comment = comment;
		this.flag = flag;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
	}
	public String getSqlType() {
		return sqlType;
	}
	public void setSqlType(String sqlType) {
		this.sqlType = sqlType;
	}
	
	public String getSqlName() {
		return sqlName;
	}
	public void setSqlName(String sqlName) {
		this.sqlName = sqlName;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Boolean getFlag() {
		return flag;
	}
	public void setFlag(Boolean flag) {
		this.flag = flag;
	}
	
	
}
