package com.project.vo;

public class SubscriptionVo {
	
	private int recipebook_no;
	private int authUser_no;
	public int getRecipebook_no() {
		return recipebook_no;
	}
	public void setRecipebook_no(int recipebook_no) {
		this.recipebook_no = recipebook_no;
	}
	public int getAuthUser_no() {
		return authUser_no;
	}
	public void setAuthUser_no(int authUser_no) {
		this.authUser_no = authUser_no;
	}
	@Override
	public String toString() {
		return "SubscriptionVo [recipebook_no=" + recipebook_no + ", authUser_no=" + authUser_no + "]";
	}

}
