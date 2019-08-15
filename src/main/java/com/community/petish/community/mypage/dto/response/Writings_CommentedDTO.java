
package com.community.petish.community.mypage.dto.response;


import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

//내가 댓글 단 글 
@Data
public class Writings_CommentedDTO {

	//게시판종류
	String boardType;
	//게시글번호
	Long id;
	//작성자
	Long user_id;
	//닉네임
	String nickname;
	//게시글제목
	String title;
	//작성일자
	@JsonFormat(pattern="yyyy/MM/dd")
	Date created_date;
	//조회수
	Integer view_count;
	
	String board_table_address;
}
