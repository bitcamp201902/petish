package com.community.petish.community.report.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.petish.community.report.dto.ReportRequestDTO;
import com.community.petish.community.report.dto.ReportResponseDTO;

public interface ReportMapper{
	
	//신고 작성
	int insertReport(ReportRequestDTO dto);
	
	//신고 삭제
	int deleteReport(Long id);
	
	//신고 리스트
	List<ReportResponseDTO> getReportList();
	List<ReportResponseDTO> getDogMissingReportList(@Param("board_id") Long board_id, @Param("post_id") Long post_id);
	//신고 조회
	ReportResponseDTO getReport(Long id);
	
}