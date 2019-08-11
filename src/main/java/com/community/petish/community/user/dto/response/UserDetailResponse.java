package com.community.petish.community.user.dto.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class UserDetailResponse {

	private Long id;
	private String username;
	private String nickname;
	private String gender;
	private String profileImage;
	
}
