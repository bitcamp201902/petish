package com.community.petish.community.mypet.comment.mapper;

import java.util.List;

import com.community.petish.community.mypet.comment.domain.MypetComment;
import com.community.petish.community.mypet.comment.dto.request.SaveMypetCommentParams;
import com.community.petish.community.mypet.comment.dto.request.UpdateMypetCommentParams;

public interface MypetCommentMapper {

	Long save(SaveMypetCommentParams saveMypetCommentParams);
	
	List<MypetComment> findAllByPostId(Long postId);

	MypetComment findByCommentId(Long commentId);

	void update(UpdateMypetCommentParams updateMypetCommentParams);

	void delete(Long postId);

	Long countLikeByCommentId(Long commentId);
	
	Long countDislikeByCommentId(Long commentId);
	
}
