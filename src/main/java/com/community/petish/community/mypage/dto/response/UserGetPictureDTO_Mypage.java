<<<<<<< HEAD:src/main/java/com/community/petish/community/mypage/dto/response/response/UserGetPictureDTO_Mypage.java
package com.community.petish.mypage.dto.response;
=======
package com.community.petish.community.mypage.dto.response;
>>>>>>> fda4f2d15939573444b0292410cb1859f5983d84:src/main/java/com/community/petish/community/mypage/dto/response/UserGetPictureDTO_Mypage.java

import lombok.Data;

@Data
public class UserGetPictureDTO_Mypage {
	//프로필사진 이름
	private String picture;
	
	//유저 id
	private Long id;
	
	//업로드 경로
	private String uploadPath;
	
	//이미지여부
	private boolean isEmpty;
}
