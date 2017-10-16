package com.project.vo;

public class RecipeBookListVo {
	
	private int chefNo;
	private String recipebookName;
	private int recipebookNo;
	
	public RecipeBookListVo() {
		
	}

	public String getRecipebookName() {
		return recipebookName;
	}

	public void setRecipebookName(String recipebookName) {
		this.recipebookName = recipebookName;
	}

	public int getChefNo() {
		return chefNo;
	}

	public void setChefNo(int chefNo) {
		this.chefNo = chefNo;
	}

	public int getRecipebookNo() {
		return recipebookNo;
	}

	public void setRecipebookNo(int recipebookNo) {
		this.recipebookNo = recipebookNo;
	}

	@Override
	public String toString() {
		return "RecipeBookListVo [chefNo=" + chefNo + ", recipebookName=" + recipebookName + ", recipebookNo="
				+ recipebookNo + "]";
	}
	
	

}
