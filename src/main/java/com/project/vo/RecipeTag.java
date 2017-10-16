package com.project.vo;

public class RecipeTag {
	
	private String tag;
	private int tagNo;
	private int recipeNo;
	private String sysdate;
	
	
	public int getTagNo() {
		return tagNo;
	}
	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public int getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}
	public String getSysdate() {
		return sysdate;
	}
	public void setSysdate(String sysdate) {
		this.sysdate = sysdate;
	}
	
	@Override
	public String toString() {
		return "RecipeTag [tag=" + tag + ", tagNo=" + tagNo + ", recipeNo=" + recipeNo + ", sysdate=" + sysdate + "]";
	}
	
	

}
