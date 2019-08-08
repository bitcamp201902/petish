package com.community.petish.mypage.mapper;

import java.util.ArrayList;

import com.community.petish.mypage.dto.response.Criteria;
import com.community.petish.mypage.dto.response.MyWritingsDTO;
import com.community.petish.mypage.dto.response.Writings_CommentedDTO;
import com.community.petish.mypage.dto.response.Writings_LikedDTO;

public interface DefaultMapper {
	//내가 작성한 글
//	public ArrayList<MyWritingsDTO> getMyWritings(long user_id);
	
	//내가 작성한 글+페이징
	public ArrayList<MyWritingsDTO> getMyWritingsWithPaging(Criteria cri);
	//내가 작성한 글 전체 갯수 가져오기
	public int getWritingsCnt(Long user_id);
	
	//내가 댓글 단 글
//	public ArrayList<Writings_CommentedDTO> getCommented(long user_id);
	//내가 댓글 단 글+페이징
	public ArrayList<Writings_CommentedDTO> getCommentedWithPaging(Criteria cri);
	//내가 댓글 단 글 전체 갯수 가져오기
	public int getCommentedCnt(Long user_id);
	
	//내가 좋아요 한 글 
//	public ArrayList<Writings_LikedDTO> getLiked(long user_id);
	//내가 좋아요 한 글+페이징
	public ArrayList<Writings_LikedDTO> getLikedWithPaging(Criteria cri);
	public int getLikedCnt(Long user_id);
	
}
