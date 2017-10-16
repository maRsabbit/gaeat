package com.project.vo;

public class PrintInfo {
	
	private String contentDivName;
	private String divName;
	private int orderNo;
	private String location;
	
	public PrintInfo(){
		
	}

	
	
	public String getLocation() {
		return location;
	}



	public void setLocation(String location) {
		this.location = location;
	}



	public String getContentDivName() {
		return contentDivName;
	}

	public void setContentDivName(String contentDivName) {
		this.contentDivName = contentDivName;
	}

	public String getDivName() {
		return divName;
	}

	public void setDivName(String divName) {
		this.divName = divName;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	@Override
	public String toString() {
		return "PrintInfo [contentDivName=" + contentDivName + ", divName=" + divName + ", orderNo=" + orderNo
				+ ", location=" + location + "]";
	}
	
}
