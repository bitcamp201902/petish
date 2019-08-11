package com.community.petish.community.hospital.service;

import java.util.List;

import com.community.petish.community.hospital.domain.Criteria;
import com.community.petish.community.hospital.domain.ReviewModifyDTO;
import com.community.petish.community.hospital.domain.ReviewVO;
import com.community.petish.community.hospital.domain.getReviewDTO;

public interface ReviewService {
	List<ReviewVO> getHospitalReviewList(Long id);
	List<getReviewDTO> getReviewWithPaging(Criteria cri);
	Integer insertReview(ReviewVO vo);
	Integer modifyReview(ReviewModifyDTO dto);
	Integer deleteReview(Long id);
	Integer getTotalCount(Long id);
}
