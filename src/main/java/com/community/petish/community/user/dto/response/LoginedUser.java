package com.community.petish.community.user.dto.response;

import com.community.petish.community.user.domain.User;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class LoginedUser {
	
	private Long id;
	private String username;
	private String nickname;
	private String picture;

	public LoginedUser (User user) {
		this.id = user.getId();
		this.username = user.getUsername();
		this.nickname = user.getNickname();
		this.picture = user.getPicture();
	}
	
}
