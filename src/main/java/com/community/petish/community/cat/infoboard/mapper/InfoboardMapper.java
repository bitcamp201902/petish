package com.community.petish.community.cat.infoboard.mapper;

import java.util.List;



import com.community.petish.community.cat.infoboard.domain.CatInfoboardVO;
import com.community.petish.community.cat.infoboard.domain.Criteria;
import com.community.petish.community.cat.infoboard.domain.LikeVO;

public interface InfoboardMapper {
	
	public List<CatInfoboardVO> getList();
	public void create(CatInfoboardVO catinfoboardvo);
	public void increaseViewcnt(int iD);
	public CatInfoboardVO detail(int iD);
	public void modify(CatInfoboardVO catinfoboardvo);
	public int delete(int ID);
	public List<CatInfoboardVO> getListWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);
	
//	public Integer getReplyRecommend(int COMMENT_ID);
//	public Integer getReplyDecommend(int COMMENT_ID);
//	public void updateReplyDecommend(LikeVO likevo);
//	public void updateReplyRecommend(LikeVO likevo);
//	public void replyRecommend(LikeVO likevo);
//	public LikeVO reply_check(LikeVO likevo);
	
}
