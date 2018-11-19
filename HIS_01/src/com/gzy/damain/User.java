package com.gzy.damain;

public class User {
	private String username;
	private String userpassword;
	private String uid;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpassword() {
		return userpassword;
	}
	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	@Override
	public String toString() {
		return "User [username=" + username + ", userpassword=" + userpassword + ", uid=" + uid + "]";
	}
}
