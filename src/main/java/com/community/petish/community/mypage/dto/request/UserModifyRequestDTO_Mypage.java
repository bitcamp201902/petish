<<<<<<< HEAD:src/main/java/com/community/petish/community/mypage/dto/response/request/UserModifyRequestDTO_Mypage.java
package com.community.petish.mypage.dto.request;
=======
package com.community.petish.community.mypage.dto.request;
>>>>>>> fda4f2d15939573444b0292410cb1859f5983d84:src/main/java/com/community/petish/community/mypage/dto/request/UserModifyRequestDTO_Mypage.java

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
