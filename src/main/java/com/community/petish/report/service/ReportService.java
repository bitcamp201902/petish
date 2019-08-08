package com.community.petish.report.service;

import java.util.List;

import com.community.petish.report.dto.ReportRequestDTO;
import com.community.petish.report.dto.ReportResponseDTO;

public interface ReportService {
	//신고 수
	int getReportCount(); 
	
	//신고 작성
	int register(ReportRequestDTO dto);
	
	//신고 삭제
	int delete(Long id);
	
	//신고 리스트
	List<ReportResponseDTO> getReportList();
	
	//신고 조회
	ReportResponseDTO getReport(Long id);	
}
