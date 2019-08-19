package com.community.petish.community.user.dto.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class SaveUserParams {

	private String username;
	private String password;
	private String nickname;
	private String address;
	private String gender;
	private String picture;
	private String concern;
	
}
