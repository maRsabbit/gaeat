package com.project.vo;

public class RecipeVo {
	private int rn; //rownum
	private int recipe_no;
	private String introduction;
	private int chef_no;
	private String recipe_title;
	private String food_name;
	private String reg_date;
	private String cooking_level;
	private String cooking_time;
	private int recipebook_no;
	private String cooking_method;
	private String cooking_type;
	private String food_img;
	private int like_count;
	private String nickname;
	private String material;
	private String tag;
	
	public RecipeVo() {}
	
	public RecipeVo(String cooking_level, String cooking_time, String cooking_method,
			String cooking_type) {
		super();
		this.cooking_level = cooking_level;
		this.cooking_time = cooking_time;
		this.cooking_method = cooking_method;
		this.cooking_type = cooking_type;
	}

	public RecipeVo(int recipe_no, String introduction, int chef_no, String recipe_title, String food_name,
			String reg_date, String cooking_level, String cooking_time, int recipebook_no, String cooking_method,
			String cooking_type, String food_img, int like_count, String nickname, String material) {
		super();
		this.recipe_no = recipe_no;
		this.introduction = introduction;
		this.chef_no = chef_no;
		this.recipe_title = recipe_title;
		this.food_name = food_name;
		this.reg_date = reg_date;
		this.cooking_level = cooking_level;
		this.cooking_time = cooking_time;
		this.recipebook_no = recipebook_no;
		this.cooking_method = cooking_method;
		this.cooking_type = cooking_type;
		this.food_img = food_img;
		this.like_count = like_count;
		this.nickname = nickname;
		this.material = material;
	}
	
	public RecipeVo(int recipe_no, String introduction, int chef_no, String recipe_title, String food_name,
			String reg_date, String cooking_level, String cooking_time, int recipebook_no, String cooking_method,
			String cooking_type, String food_img, int like_count, String nickname, String material, String tag) {
		super();
		this.recipe_no = recipe_no;
		this.introduction = introduction;
		this.chef_no = chef_no;
		this.recipe_title = recipe_title;
		this.food_name = food_name;
		this.reg_date = reg_date;
		this.cooking_level = cooking_level;
		this.cooking_time = cooking_time;
		this.recipebook_no = recipebook_no;
		this.cooking_method = cooking_method;
		this.cooking_type = cooking_type;
		this.food_img = food_img;
		this.like_count = like_count;
		this.nickname = nickname;
		this.material = material;
		this.tag = tag;
	}
	
	public RecipeVo(int rn, int recipe_no, String introduction, int chef_no, String recipe_title, String food_name,
			String reg_date, String cooking_level, String cooking_time, int recipebook_no, String cooking_method,
			String cooking_type, String food_img, int like_count, String nickname, String material, String tag) {
		super();
		this.rn = rn;
		this.recipe_no = recipe_no;
		this.introduction = introduction;
		this.chef_no = chef_no;
		this.recipe_title = recipe_title;
		this.food_name = food_name;
		this.reg_date = reg_date;
		this.cooking_level = cooking_level;
		this.cooking_time = cooking_time;
		this.recipebook_no = recipebook_no;
		this.cooking_method = cooking_method;
		this.cooking_type = cooking_type;
		this.food_img = food_img;
		this.like_count = like_count;
		this.nickname = nickname;
		this.material = material;
		this.tag = tag;
	}
	

	public int getRecipe_no() {
		return recipe_no;
	}


	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}


	public String getIntroduction() {
		return introduction;
	}


	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}


	public int getChef_no() {
		return chef_no;
	}


	public void setChef_no(int chef_no) {
		this.chef_no = chef_no;
	}


	public String getRecipe_title() {
		return recipe_title;
	}


	public void setRecipe_title(String recipe_title) {
		this.recipe_title = recipe_title;
	}


	public String getFood_name() {
		return food_name;
	}


	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}


	public String getReg_date() {
		return reg_date;
	}


	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}


	public String getCooking_level() {
		return cooking_level;
	}


	public void setCooking_level(String cooking_level) {
		this.cooking_level = cooking_level;
	}


	public String getCooking_time() {
		return cooking_time;
	}


	public void setCooking_time(String cooking_time) {
		this.cooking_time = cooking_time;
	}


	public int getRecipebook_no() {
		return recipebook_no;
	}


	public void setRecipebook_no(int recipebook_no) {
		this.recipebook_no = recipebook_no;
	}


	public String getCooking_method() {
		return cooking_method;
	}


	public void setCooking_method(String cooking_method) {
		this.cooking_method = cooking_method;
	}


	public String getCooking_type() {
		return cooking_type;
	}


	public void setCooking_type(String cooking_type) {
		this.cooking_type = cooking_type;
	}


	public String getFood_img() {
		return food_img;
	}


	public void setFood_img(String food_img) {
		this.food_img = food_img;
	}


	public int getLike_count() {
		return like_count;
	}


	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getMaterial() {
		return material;
	}


	public void setMaterial(String material) {
		this.material = material;
	}


	public String getTag() {
		return tag;
	}


	public void setTag(String tag) {
		this.tag = tag;
	}


	@Override
	public String toString() {
		return "RecipeVo [rn=" + rn + ", recipe_no=" + recipe_no + ", introduction=" + introduction + ", chef_no="
				+ chef_no + ", recipe_title=" + recipe_title + ", food_name=" + food_name + ", reg_date=" + reg_date
				+ ", cooking_level=" + cooking_level + ", cooking_time=" + cooking_time + ", recipebook_no="
				+ recipebook_no + ", cooking_method=" + cooking_method + ", cooking_type=" + cooking_type
				+ ", food_img=" + food_img + ", like_count=" + like_count + ", nickname=" + nickname + ", material="
				+ material + ", tag=" + tag + "]";
	}
	
}
