package com.community.petish.community.report.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.community.dog.gatherboard.mapper.DogGatherMapper;
import com.community.petish.community.dog.missingboard.mapper.DogLostPostMapper;
import com.community.petish.community.report.dto.ReportRequestDTO;
import com.community.petish.community.report.dto.ReportResponseDTO;
import com.community.petish.community.report.mapper.ReportGetdeletedMapper;
import com.community.petish.community.report.mapper.ReportMapper;

@Service
public class ReportServiceImpl implements ReportService{
	
	@Autowired
	private ReportMapper mapper;
	
	//@Autowired
	//private DogFreePostMapoer dogFreePostMapper;
	
	//@Autowired
	//private DogInfoPostMapoer dogInfoPostMapper;
	
	@Autowired
	private DogLostPostMapper dogLostPostMapper;
		
	@Autowired
	private DogGatherMapper dogGatherMapper;
	
	//@Autowired
	//private CatFreePostMapoer catFreePostMapper;
	
	//@Autowired
	//private CatInfoPostMapoer catInfoPostMapper;
	
	//@Autowired
	//private CatLostPostMapper CatLostPostMapper;
		
	//@Autowired
	//private CatGatherMapper CatGatherMapper;
	//신고 작성
	public int register(ReportRequestDTO dto) {
		System.out.println("Service");
		return mapper.insertReport(dto);
	}
	
	//신고 삭제
	public int delete(Long id) {
		return mapper.deleteReport(id);
	}
	
	//신고 리스트
	public List<ReportResponseDTO> getReportList(){
		List<ReportResponseDTO> reports= mapper.getReportList();
		
		Map<String, ReportGetdeletedMapper> mapperMap= new HashMap<String, ReportGetdeletedMapper>();
		//mapperMap.put("dog_free_post_tb", dogFreePostMapper);
		//mapperMap.put("dog_info_post_tb", dogInfoPostMapper);
		mapperMap.put("dog_lost_post_tb", dogLostPostMapper);
		mapperMap.put("dog_gather_post_tb", dogGatherMapper);
		
		//mapperMap.put("cat_free_post_tb", catFreePostMapper);
		//mapperMap.put("cat_info_post_tb", catInfoPostMapper);
		//mapperMap.put("cat_lost_post_tb", catLostPostMapper);
		//mapperMap.put("cat_gather_post_tb", catGatherMapper);
		
		for (ReportResponseDTO report : reports) {
			String tableName = report.getBoard_table_ename();
			Integer deleted = mapperMap.get(tableName).getDeletedById(report.getPost_id());
			System.out.println("현재글="+deleted);
			System.out.println("현재글report="+report.getDeleted());
			report.setDeleted(deleted);
			System.out.println("내용="+report.getDescription());
			System.out.println("delted="+report.getDeleted());
			
		}
		
		
		return reports;
	}
		
	//신고 조회
	public ReportResponseDTO getReport(Long id) {
		return mapper.getReport(id);
	}

	@Override
	public List<ReportResponseDTO> getBoardReportList(Long board_id, Long post_id) {
		System.out.println("reportservice : "+post_id+", "+board_id);
		return mapper.getBoardReportList(board_id, post_id);
	}
}