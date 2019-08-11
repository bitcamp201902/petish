<<<<<<< HEAD:src/main/java/com/community/petish/community/mypage/dto/response/response/MyWritingsDTO.java
package com.community.petish.mypage.dto.response;
=======
package com.community.petish.community.mypage.dto.response;
>>>>>>> fda4f2d15939573444b0292410cb1859f5983d84:src/main/java/com/community/petish/community/mypage/dto/response/MyWritingsDTO.java

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

//내가 쓴 글
@Data
public class MyWritingsDTO {
	
	//게시판종류
	String boardType;
	
	//게시글번호
	Long id;
	
	//게시글제목
	String title;
	
	//작성일자
	@JsonFormat(pattern="yyyy/MM/dd")
	Date created_date;
	
	//조회수
	Integer view_count;
	
}
