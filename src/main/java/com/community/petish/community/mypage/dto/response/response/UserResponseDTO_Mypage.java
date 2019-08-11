<<<<<<< HEAD:src/main/java/com/community/petish/community/mypage/dto/response/response/UserResponseDTO_Mypage.java
package com.community.petish.mypage.dto.response;
=======
package com.community.petish.community.mypage.dto.response;
>>>>>>> fda4f2d15939573444b0292410cb1859f5983d84:src/main/java/com/community/petish/community/mypage/dto/response/UserResponseDTO_Mypage.java

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
