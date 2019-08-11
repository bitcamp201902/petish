package com.community.petish.community.hospital.mapper;

import java.util.List;

import com.community.petish.community.hospital.domain.Criteria;
import com.community.petish.community.hospital.domain.HospitalVO;
import com.community.petish.community.hospital.domain.ListDTO;

public interface HospitalMapper {
	HospitalVO getHospital(Long id);
	
	List<ListDTO> gethospitalList(String hospital_addr);
	List<ListDTO> getEmerhospitalList(String hospital_addr);
	
	List<ListDTO> getListWithPaging(Criteria cri);
	List<ListDTO> getEmerListWithPaging(Criteria cri);
	
	Integer getTotalCount(String hospital_addr);
	Integer getEmerTotalCount(String hospital_addr);
	Double getScore(Long id);
}
