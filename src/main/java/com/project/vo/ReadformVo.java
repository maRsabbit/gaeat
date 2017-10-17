package com.project.vo;

public class ReadformVo {
	
	private int recipe_no;
	private int chef_no;
	private String introduction;
	private String recipe_title;
	private String cooking_level;
	private String cooking_time;
	private String content;
	private String reg_date;
	private int oreder_no;
	private String food_img;
	private String text_content;
	private String img_content;
	private String material_name;
	private String amount;
	
	
	public int getChef_no() {
		return chef_no;
	}
	public void setChef_no(int chef_no) {
		this.chef_no = chef_no;
	}
	public String getFood_img() {
		return food_img;
	}
	public void setFood_img(String food_img) {
		this.food_img = food_img;
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
	public String getRecipe_title() {
		return recipe_title;
	}
	public void setRecipe_title(String recipe_title) {
		this.recipe_title = recipe_title;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getOreder_no() {
		return oreder_no;
	}
	public void setOreder_no(int oreder_no) {
		this.oreder_no = oreder_no;
	}
	public String getText_content() {
		return text_content;
	}
	public void setText_content(String text_content) {
		this.text_content = text_content;
	}
	public String getImg_content() {
		return img_content;
	}
	public void setImg_content(String img_content) {
		this.img_content = img_content;
	}
	public String getMaterial_name() {
		return material_name;
	}
	public void setMaterial_name(String material_name) {
		this.material_name = material_name;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	
	
	public ReadformVo() {
		
	}
	
	public ReadformVo(int recipe_no, String introduction, String recipe_title, String cooking_level,
			String cooking_time, String content, String reg_date, int oreder_no, String text_content,
			String img_content, String material_name, String amount) {
		
		this.recipe_no = recipe_no;
		this.introduction = introduction;
		this.recipe_title = recipe_title;
		this.cooking_level = cooking_level;
		this.cooking_time = cooking_time;
		this.content = content;
		this.reg_date = reg_date;
		this.oreder_no = oreder_no;
		this.text_content = text_content;
		this.img_content = img_content;
		this.material_name = material_name;
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "ReadformVo [recipe_no=" + recipe_no + ", introduction=" + introduction + ", recipe_title="
				+ recipe_title + ", cooking_level=" + cooking_level + ", cooking_time=" + cooking_time + ", content="
				+ content + ", reg_date=" + reg_date + ", oreder_no=" + oreder_no + ", food_img=" + food_img
				+ ", text_content=" + text_content + ", img_content=" + img_content + ", material_name=" + material_name
				+ ", amount=" + amount + "]";
	}
	
	
	
	
	
	
	

}
