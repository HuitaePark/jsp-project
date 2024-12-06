package com.heetae.jspproject.bodyinfo;

public class BodyInfoDTO {
	private String memberid;
	private String height;
	private String weight;
	private String gender;
	private String BMI;
	private String age;
	
	
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBMI() {
		return BMI;
	}
	public void setBMI(String bMI) {
		BMI = bMI;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	
}
