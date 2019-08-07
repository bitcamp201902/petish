package com.community.petish.hospital.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.hospital.domain.Criteria;
import com.community.petish.hospital.domain.ReviewModifyDTO;
import com.community.petish.hospital.domain.ReviewVO;
import com.community.petish.hospital.domain.getReviewDTO;
import com.community.petish.hospital.mapper.ReviewMapper;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewMapper reviewMapper;
	
	@Override
	public List<ReviewVO> getHospitalReviewList(Long id) {
		List<ReviewVO> rlist = null; 
		rlist=reviewMapper.getHospitalReviewList(id); 
		return rlist;
	}

	@Override
	public Integer insertReview(ReviewVO vo) {
		Integer checkReview = reviewMapper.getHospitalReview(vo);
		Integer retVal;
		if(checkReview !=0) {
			retVal = 0;
		}
		else {
			
			retVal= reviewMapper.insertReview(vo);
		}
		return retVal;
	}

	@Override
	public List<getReviewDTO> getReviewWithPaging(Criteria cri) {
		List<getReviewDTO> rlist = null; 
		rlist=reviewMapper.getReviewWithPaging(cri);
		return rlist;
	}

	@Override
	public Integer getTotalCount(Long id) {
		// TODO Auto-generated method stub
		return reviewMapper.getTotalCount(id);
	}

	@Override
	public Integer deleteReview(Long id) {
		Integer retVal = reviewMapper.deleteReview(id);
		return retVal;
	}

	@Override
	public Integer modifyReview(ReviewModifyDTO dto) {
		Integer retVal = reviewMapper.modifyReview(dto);
		return retVal;
	}
	
	
}
