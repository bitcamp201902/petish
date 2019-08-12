
package com.community.petish.community.mypage.dto.response;


import lombok.Data;

@Data
public class UserResponseDTO_Mypage {
	Long id;
	String username;
	String password;
	String nickname;
	String address;
	String picture;
	String join_date;
	Integer deleted;
	String gender;
	Integer concern_id;
}
