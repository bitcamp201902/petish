package com.community.petish.community.user.dto.response;

import java.util.List;

import com.community.petish.community.user.domain.User;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class UserListResponse {

	private List<User> users;
	
	public UserListResponse(List<User> users) {
		this.users = users;
	}
	
}
