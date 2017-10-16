package com.project.vo;

public class SocialUserVo {
	String Id;
	String name;
	String profile;
	String nickname;
	String userintro;
	String hatefood;
	String socialcheck;
	String type;
	String password;
	int chef_no;
	int authUser_no;
	
	
public int getAuthUser_no() {
		return authUser_no;
	}
	public void setAuthUser_no(int authUser_no) {
		this.authUser_no = authUser_no;
	}
public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
public int getChef_no() {
		return chef_no;
	}
	public void setChef_no(int chef_no) {
		this.chef_no = chef_no;
	}
public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
public String getSocialcheck() {
		return socialcheck;
	}
	public void setSocialcheck(String socialcheck) {
		this.socialcheck = socialcheck;
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
	public String getUserintro() {
			return userintro;
		}
		public void setUserintro(String userintro) {
			this.userintro = userintro;
		}
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getHatefood() {
		return hatefood;
	}
	public void setHatefood(String hatefood) {
		this.hatefood = hatefood;
	}
	@Override
	public String toString() {
		return "SocialUserVo [Id=" + Id + ", name=" + name + ", profile=" + profile + ", nickname=" + nickname
				+ ", userintro=" + userintro + ", hatefood=" + hatefood + ", socialcheck=" + socialcheck + ", type="
				+ type + ", password=" + password + ", chef_no=" + chef_no + ", authUser_no=" + authUser_no + "]";
	}
	




}