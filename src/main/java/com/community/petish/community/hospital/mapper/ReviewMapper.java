package com.community.petish.community.hospital.mapper;

import java.util.List;

import com.community.petish.community.hospital.domain.Criteria;
import com.community.petish.community.hospital.domain.ReviewModifyDTO;
import com.community.petish.community.hospital.domain.ReviewVO;
import com.community.petish.community.hospital.domain.getReviewDTO;

public interface ReviewMapper {
	List<ReviewVO> getHospitalReviewList(Long id);
	List<getReviewDTO> getReviewWithPaging(Criteria cri);
	Integer getHospitalReview(ReviewVO vo);
	Integer insertReview(ReviewVO vo);
	Integer modifyReview(ReviewModifyDTO dto);
	Integer deleteReview(Long id);
	Integer getTotalCount(Long id);
}
