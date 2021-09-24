package com.spring.bank.user.vo;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class MemberVO extends User {
	
	private String userID;
	
	
	// super는 부모클래스
	public MemberVO(String userName, String password, boolean key, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked, String userID,
			Collection<? extends GrantedAuthority> authority) {
		super(userName, password, key, accountNonExpired, credentialsNonExpired, accountNonLocked, authority);
		this.userID = userID;
	}


	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}
	
}
