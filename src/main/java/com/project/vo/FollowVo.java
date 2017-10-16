package com.project.vo;

public class FollowVo {
	
	private int followNo;
	private int chef_no;
	private int user_no;
	private String following_id;
	private String followed_id;
	
	public int getFollowNo() {
		return followNo;
	}
	public void setFollowNo(int followNo) {
		this.followNo = followNo;
	}
	public int getChef_no() {
		return chef_no;
	}
	public void setChef_no(int chef_no) {
		this.chef_no = chef_no;
	}
	public String getFollowing_id() {
		return following_id;
	}
	public void setFollowing_id(String following_id) {
		this.following_id = following_id;
	}
	public String getFollowed_id() {
		return followed_id;
	}
	public void setFollowed_id(String followed_id) {
		this.followed_id = followed_id;
	}
	
	
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	@Override
	public String toString() {
		return "FollowVo [followNo=" + followNo + ", chef_no=" + chef_no + ", user_no=" + user_no + ", following_id="
				+ following_id + ", followed_id=" + followed_id + "]";
	}
	
	

}
