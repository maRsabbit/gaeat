package com.project.vo;

public class DatVo {
	
	private String user_comment;
	private String nickname;
	private String profile;
	private int comment_no;
	private int chef_no;
	private int recipe_no;
	private String email;
	
	
	public String getUser_comment() {
		return user_comment;
	}
	public void setUser_comment(String user_comment) {
		this.user_comment = user_comment;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public int getChef_no() {
		return chef_no;
	}
	public void setChef_no(int chef_no) {
		this.chef_no = chef_no;
	}
	public int getRecipe_no() {
		return recipe_no;
	}
	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	public DatVo() {
		
	}
	public DatVo(String user_comment, String nickname, String profile, int comment_no, int chef_no, int recipe_no,
			String email) {
		
		this.user_comment = user_comment;
		this.nickname = nickname;
		this.profile = profile;
		this.comment_no = comment_no;
		this.chef_no = chef_no;
		this.recipe_no = recipe_no;
		this.email = email;
	}
	@Override
	public String toString() {
		return "DatVo [user_comment=" + user_comment + ", nickname=" + nickname + ", profile=" + profile
				+ ", comment_no=" + comment_no + ", chef_no=" + chef_no + ", recipe_no=" + recipe_no + ", email="
				+ email + "]";
	}
	
	
	
	
	
}
