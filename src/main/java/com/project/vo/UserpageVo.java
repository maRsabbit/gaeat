package com.project.vo;

public class UserpageVo {
	
	private int chef_no;
	private int recipe_no;
	private String name;
	private String nickname;
	private String self_intro;
	private String recipebook_name;
	private int recipebook_no;
	private String recipe_title;
	private String introduction;
	private String profile;
	private int like_count;
	private int subscription_count;
	private int recipebook_count;
	private int following_count;
	private int followed_count;
	private int following_no;
	private int followed_no;
	private String reg_date;
	public UserpageVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserpageVo(int chef_no, int recipe_no, String name, String nickname, String self_intro,
			String recipebook_name, int recipebook_no, String recipe_title, String introduction, int like_count,
			int subscription_count, int recipebook_count, int following_count, int followed_count, int following_no,
			int followed_no, String reg_date) {
		super();
		this.chef_no = chef_no;
		this.recipe_no = recipe_no;
		this.name = name;
		this.nickname = nickname;
		this.self_intro = self_intro;
		this.recipebook_name = recipebook_name;
		this.recipebook_no = recipebook_no;
		this.recipe_title = recipe_title;
		this.introduction = introduction;
		this.like_count = like_count;
		this.subscription_count = subscription_count;
		this.recipebook_count = recipebook_count;
		this.following_count = following_count;
		this.followed_count = followed_count;
		this.following_no = following_no;
		this.followed_no = followed_no;
		this.reg_date = reg_date;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getSelf_intro() {
		return self_intro;
	}
	public void setSelf_intro(String self_intro) {
		this.self_intro = self_intro;
	}
	public String getRecipebook_name() {
		return recipebook_name;
	}
	public void setRecipebook_name(String recipebook_name) {
		this.recipebook_name = recipebook_name;
	}
	public int getRecipebook_no() {
		return recipebook_no;
	}
	public void setRecipebook_no(int recipebook_no) {
		this.recipebook_no = recipebook_no;
	}
	public String getRecipe_title() {
		return recipe_title;
	}
	public void setRecipe_title(String recipe_title) {
		this.recipe_title = recipe_title;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public int getSubscription_count() {
		return subscription_count;
	}
	public void setSubscription_count(int subscription_count) {
		this.subscription_count = subscription_count;
	}
	public int getRecipebook_count() {
		return recipebook_count;
	}
	public void setRecipebook_count(int recipebook_count) {
		this.recipebook_count = recipebook_count;
	}
	public int getFollowing_count() {
		return following_count;
	}
	public void setFollowing_count(int following_count) {
		this.following_count = following_count;
	}
	public int getFollowed_count() {
		return followed_count;
	}
	public void setFollowed_count(int followed_count) {
		this.followed_count = followed_count;
	}
	public int getFollowing_no() {
		return following_no;
	}
	public void setFollowing_no(int following_no) {
		this.following_no = following_no;
	}
	public int getFollowed_no() {
		return followed_no;
	}
	public void setFollowed_no(int followed_no) {
		this.followed_no = followed_no;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "UserpageVo [chef_no=" + chef_no + ", recipe_no=" + recipe_no + ", name=" + name + ", nickname="
				+ nickname + ", self_intro=" + self_intro + ", recipebook_name=" + recipebook_name + ", recipebook_no="
				+ recipebook_no + ", recipe_title=" + recipe_title + ", introduction=" + introduction + ", like_count="
				+ like_count + ", subscription_count=" + subscription_count + ", recipebook_count=" + recipebook_count
				+ ", following_count=" + following_count + ", followed_count=" + followed_count + ", following_no="
				+ following_no + ", followed_no=" + followed_no + ", reg_date=" + reg_date + ", getChef_no()="
				+ getChef_no() + ", getRecipe_no()=" + getRecipe_no() + ", getName()=" + getName() + ", getNickname()="
				+ getNickname() + ", getSelf_intro()=" + getSelf_intro() + ", getRecipebook_name()="
				+ getRecipebook_name() + ", getRecipebook_no()=" + getRecipebook_no() + ", getRecipe_title()="
				+ getRecipe_title() + ", getIntroduction()=" + getIntroduction() + ", getLike_count()="
				+ getLike_count() + ", getSubscription_count()=" + getSubscription_count() + ", getRecipebook_count()="
				+ getRecipebook_count() + ", getFollowing_count()=" + getFollowing_count() + ", getFollowed_count()="
				+ getFollowed_count() + ", getFollowing_no()=" + getFollowing_no() + ", getFollowed_no()="
				+ getFollowed_no() + ", getReg_date()=" + getReg_date() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
}
