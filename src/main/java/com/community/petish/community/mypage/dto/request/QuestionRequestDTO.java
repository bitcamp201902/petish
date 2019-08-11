<<<<<<< HEAD:src/main/java/com/community/petish/community/mypage/dto/response/request/QuestionRequestDTO.java
package com.community.petish.mypage.dto.request;
=======
package com.community.petish.community.mypage.dto.request;
>>>>>>> fda4f2d15939573444b0292410cb1859f5983d84:src/main/java/com/community/petish/community/mypage/dto/request/QuestionRequestDTO.java

import org.springframework.stereotype.Component;

import lombok.Data;

//사용자에게 전달받은 question을 db에 저장하기 위한 DTO

@Data
public class QuestionRequestDTO {

	// 문의 제목
	private String title;

	// 문의 내용
	private String content;

	// 유저식별자
	private Long user_id;

	// 문의카테고리 식별자
	private int category_id;
	
	private Long  id;
	
}
