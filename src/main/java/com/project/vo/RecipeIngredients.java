package com.project.vo;

public class RecipeIngredients {
	
	private int recipeNo;
	private int materialNo;
	private String materialName;
	private String amount;
	
	public int getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}
	
	public int getMaterialNo() {
		return materialNo;
	}
	public void setMaterialNo(int materialNo) {
		this.materialNo = materialNo;
	}
	public String getMaterialName() {
		return materialName;
	}
	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	
	@Override
	public String toString() {
		return "RecipeIngredients [recipeNo=" + recipeNo + ", materialNo=" + materialNo + ", materialName="
				+ materialName + ", amount=" + amount + "]";
	}
	
	

}
