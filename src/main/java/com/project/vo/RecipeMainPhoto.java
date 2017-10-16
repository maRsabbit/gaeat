package com.project.vo;

public class RecipeMainPhoto {
	
	private int recipeNo;
	private String saveMainphotoName;
	
	public int getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}
	public String getSaveMainphotoName() {
		return saveMainphotoName;
	}
	public void setSaveMainphotoName(String saveMainphotoName) {
		this.saveMainphotoName = saveMainphotoName;
	}
	@Override
	public String toString() {
		return "RecipeMainPhoto [recipeNo=" + recipeNo + ", saveMainphotoName=" + saveMainphotoName + "]";
	}

}
