package com.project.vo;

public class TagVo {
	private int rn;
	private int tag_no;
	private String tag_name;
	private int tag_count;
	
	public TagVo() {}
	
	public TagVo(int rn, int tag_no, String tag_name, int tag_count) {
		super();
		this.rn = rn;
		this.tag_no = tag_no;
		this.tag_name = tag_name;
		this.tag_count = tag_count;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public int getTag_count() {
		return tag_count;
	}
	public void setTag_count(int tag_count) {
		this.tag_count = tag_count;
	}
	public int getTag_no() {
		return tag_no;
	}
	public void setTag_no(int tag_no) {
		this.tag_no = tag_no;
	}
	public String getTag_name() {
		return tag_name;
	}
	public void setTag_name(String tag_name) {
		this.tag_name = tag_name;
	}
	
	@Override
	public String toString() {
		return "TagVo [tag_no=" + tag_no + ", tag_name=" + tag_name + "]";
	}
}
