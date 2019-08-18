package com.community.petish.community.cat.infoboard.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.community.petish.community.cat.infoboard.domain.CatInfoboardVO;
import com.community.petish.community.cat.infoboard.domain.Criteria;
import com.community.petish.community.cat.infoboard.domain.LikeVO;

public interface InfoboardService {
	
	public List<CatInfoboardVO> getList(Criteria cri) throws Exception;

	public void create(CatInfoboardVO catinfoboardvo) throws Exception;

	public void increaseViewcnt(int iD, HttpSession session) throws Exception;

	public CatInfoboardVO detail(int iD) throws Exception;

	public int delete(int ID) throws Exception;

	public void modify(CatInfoboardVO catinfoboardvo) throws Exception;
	
	public int getTotal(Criteria cri) throws Exception;
	
//	public String reply_check(LikeVO likevo) throws Exception;
//		
//	public Integer replyRecommend(LikeVO likevo) throws Exception;

}
