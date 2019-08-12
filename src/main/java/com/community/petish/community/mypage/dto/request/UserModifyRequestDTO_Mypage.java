package com.community.petish.community.mypage.dto.request;

import lombok.Data;

@Data
public class UserModifyRequestDTO_Mypage {
	Long id;
	String password;
	String nickname;
	String address;
	int concern_id;
	String gender;
}
