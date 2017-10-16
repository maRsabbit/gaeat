package com.project.vo;

public class RecipeContent {
	
	private int recipeNo;
	private int orderNo;
	private String textContent;
	private String imgContext;
	
	
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	
	public String getTextContent() {
		return textContent;
	}
	public void setTextContent(String textContent) {
		this.textContent = textContent;
	}
	public String getImgContext() {
		return imgContext;
	}
	public void setImgContext(String imgContext) {
		this.imgContext = imgContext;
	}
	
	public int getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}
	
	@Override
	public String toString() {
		return "RecipeContent [recipeNo=" + recipeNo + ", orderNo=" + orderNo + ", textContent=" + textContent
				+ ", imgContext=" + imgContext + "]";
	}

	
	
}
