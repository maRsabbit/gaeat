package com.project.vo;

public class OrderAddVo {

	private int orderNo;
	private int recipeNo;
	private String textContent;
	private String textContentName;
	private String divName;
	private String formerDivName;

	public OrderAddVo() {

	}

	public OrderAddVo(String formerDivName) {

		this.formerDivName = formerDivName;

	}

	public String getTextContentName() {

		return textContentName;

	}

	public void setTextContentName(String textContentName) {

		this.textContentName = textContentName;

	}

	public int getRecipeNo() {

		return recipeNo;

	}

	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}

	public String getTextContent() {
		return textContent;
	}

	public void setTextContent(String textContent) {
		this.textContent = textContent;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public String getFormerDivName() {
		return formerDivName;
	}

	public void setFormerDivName(String formerDivName) {
		this.formerDivName = formerDivName;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getDivName() {
		return divName;
	}

	public void setDivName(String divName) {
		this.divName = divName;
	}

	@Override
	public String toString() {
		return "OrderAddVo [orderNo=" + orderNo + ", recipeNo=" + recipeNo + ", textContent=" + textContent
				+ ", divName=" + divName + ", formerDivName=" + formerDivName + "]";
	}

}
