package com.project.vo;

public class RecipePhotoVo {
	
	private String path;
	private int recipeNo;
	private int orderNo;
	
	
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public int getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	@Override
	public String toString() {
		return "RecipePhotoVo [path=" + path + ", recipeNo=" + recipeNo + ", orderNo=" + orderNo + "]";
	}
	
	
	
}
