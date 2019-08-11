package com.community.petish.community.report.mapper;

import java.util.List;

import com.community.petish.community.report.dto.ReportRequestDTO;
import com.community.petish.community.report.dto.ReportResponseDTO;

public interface ReportMapper{
	
	//신고 작성
	int insertReport(ReportRequestDTO dto);
	
	//신고 삭제
	int deleteReport(Long id);
	
	//신고 리스트
	List<ReportResponseDTO> getReportList();
	
	//신고 조회
	ReportResponseDTO getReport(Long id);
	
}
