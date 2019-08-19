package com.community.petish.community.mypet.comment.service;

import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.community.petish.community.mypet.comment.domain.MypetComment;
import com.community.petish.community.mypet.comment.dto.request.UpdateMypetCommentParams;
import com.community.petish.community.mypet.comment.dto.response.MypetCommentListResponse;
import com.community.petish.community.mypet.comment.mapper.MypetCommentMapper;
import com.community.petish.community.user.dto.response.LoginedUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.community.mypet.comment.dto.request.SaveMypetCommentParams;
import com.community.petish.community.mypet.comment.dto.response.MypetCommentDetailResponse;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("mypetCommentService")
public class MypetCommentServiceImpl implements MypetCommentService{
	
	@Autowired
  MypetCommentMapper mypetCommentMapper;
	
	@Override
	public Long saveComment(HttpServletRequest request) {
		HttpSession session = request.getSession();
		LoginedUser user = (LoginedUser) session.getAttribute("LOGIN_USER");
		String content = request.getParameter("content");
		Long postId = Long.parseLong(request.getParameter("postId"));
		
		SaveMypetCommentParams saveMypetCommentParams = new SaveMypetCommentParams(content, postId, user.getId());
		
		log.info("mypet comment 작성 요청 saveMypetCommentParams = {} ", saveMypetCommentParams);
		
		Long commentId = mypetCommentMapper.save(saveMypetCommentParams);
		
		log.info("mypet comment 작성 완료 commentId = {}", commentId);
		
		return commentId;
	}

	@Override
	public MypetCommentListResponse getCommentsByPostId(Long postId) {

		log.info("comments 조회 요청 postId = {}", postId);
		
		List<MypetComment> comments = mypetCommentMapper.findAllByPostId(postId);
		
		List<MypetCommentDetailResponse> commentDetail = comments.stream()
			.map(comment -> new MypetCommentDetailResponse(comment)).collect(Collectors.toList());
		
		MypetCommentListResponse mypetCommentListResponse = new MypetCommentListResponse(commentDetail);

		log.info("comments 조회 완료 mypetCommentsListResponse = {}", mypetCommentListResponse);
		
		return mypetCommentListResponse;
	}

	@Override
	public void updateComment(UpdateMypetCommentParams updateMypetCommentParams) {
		mypetCommentMapper.update(updateMypetCommentParams);
		MypetComment comment = mypetCommentMapper.findByCommentId(updateMypetCommentParams.getCommentId());
		log.info("수정 완료 comment = {}", comment);
	}

	@Override
	public void deleteComment(Long commentId) {
		mypetCommentMapper.delete(commentId);
		MypetComment comment = mypetCommentMapper.findByCommentId(commentId);
		log.info("삭제 완료 comment = {}", comment);
	}
}
