package com.community.petish.mypet.comment.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.mypet.comment.dto.request.SaveMypetCommentParams;
import com.community.petish.mypet.comment.mapper.MypetCommentMapper;
import com.community.petish.user.dto.response.LoginedUser;

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

}