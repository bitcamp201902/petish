package com.community.petish.community.cat.infoboard.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.community.cat.infoboard.domain.CatInfoboardVO;
import com.community.petish.community.cat.infoboard.domain.Criteria;
import com.community.petish.community.cat.infoboard.domain.LikeVO;
import com.community.petish.community.cat.infoboard.mapper.InfoboardMapper;


import lombok.AllArgsConstructor;
import lombok.Setter;


@Service("service")
@AllArgsConstructor
public class InfoboardServiceImpl implements InfoboardService	{

	@Setter(onMethod_ = @Autowired)
	private InfoboardMapper infoboardMapper;

	@Override
	public List<CatInfoboardVO> getList(Criteria cri) throws Exception{
		
		return infoboardMapper.getListWithPaging(cri);
	}
	
	@Override
	public void create(CatInfoboardVO catinfoboardvo) throws Exception{
		
		Long id = catinfoboardvo.getID();
		String title = catinfoboardvo.getTITLE();
		String content = catinfoboardvo.getCONTENT();
		Date create_date = catinfoboardvo.getCREATE_DATE();
		Date updated_date = catinfoboardvo.getUPDATED_DATE();
		int view_count  = catinfoboardvo.getVIEW_COUNT();
		int deleted = catinfoboardvo.getDELETED();
		int category_id = catinfoboardvo.getCATEGORY_ID();
		Long user_id = catinfoboardvo.getUSER_ID();
		
		catinfoboardvo.setID(id);
		catinfoboardvo.setTITLE(title);
		catinfoboardvo.setCONTENT(content);
		catinfoboardvo.setCREATE_DATE(create_date);
		catinfoboardvo.setUPDATED_DATE(updated_date);
		catinfoboardvo.setVIEW_COUNT(view_count);
		catinfoboardvo.setDELETED(deleted);
		catinfoboardvo.setCATEGORY_ID(category_id);
		catinfoboardvo.setUSER_ID(user_id);
		infoboardMapper.create(catinfoboardvo);
		
	}

	@Override
	public void increaseViewcnt(int ID, HttpSession session) throws Exception {
		long update_time = 0;
		
		if(session.getAttribute("update_time__"+ID) != null) {
			update_time = (long) session.getAttribute("update_time__" + ID);
		}
		long current_time = System.currentTimeMillis();
		
		if(current_time - update_time > 5 * 1000) {
			infoboardMapper.increaseViewcnt(ID);
			session.setAttribute("update_time__"+ID, current_time);
		}
	}

	@Override
	public CatInfoboardVO detail(int ID) throws Exception {
		return infoboardMapper.detail(ID);
	}
	
	@Override
	public void modify(CatInfoboardVO catinfoboardvo) throws Exception {
		infoboardMapper.modify(catinfoboardvo);
		
	}
	
	@Override
	public int delete(int ID) throws Exception {
		infoboardMapper.delete(ID);
		return ID;
		
	}

	@Override
	public int getTotal(Criteria cri) {
		return infoboardMapper.getTotalCount(cri);
	}

//	@Override
//	public String reply_check(LikeVO likevo) throws Exception {
//		LikeVO likeVO = infoboardMapper.reply_check(likevo);
//		String msg = "";
//		
//		if(likeVO != null) {
//			msg = "fail";
//		}else {
//			msg = String.valueOf(replyRecommend(likevo));
//		}
//		return msg;
//	}
//
//	@Override
//	public Integer replyRecommend(LikeVO likevo) throws Exception {
//		infoboardMapper.replyRecommend(likevo);
//		Integer num = 0;
//		if(likevo.getDISLIKE_LIKE() == 1) {
//			updateReplyRecommend(likevo);
//			num = getReplyRecommend(likevo.getCOMMENT_ID());
//		}else {
//			updateReplyDecommend(likevo);
//			num = getReplyDecommend(likevo.getCOMMENT_ID());
//		}
//		return num;
//	}
//	
//	private Integer getReplyRecommend(int COMMENT_ID) {
//		Integer num = infoboardMapper.getReplyRecommend(COMMENT_ID);
//		return num;
//	}
//
//	private Integer getReplyDecommend(int COMMENT_ID) {
//		Integer num = infoboardMapper.getReplyDecommend(COMMENT_ID);
//		return num;
//	}
//
//	private void updateReplyDecommend(LikeVO likevo) {
//		infoboardMapper.updateReplyDecommend(likevo);
//	}
//
//	private void updateReplyRecommend(LikeVO likevo) {
//		infoboardMapper.updateReplyRecommend(likevo);
//	}

}
