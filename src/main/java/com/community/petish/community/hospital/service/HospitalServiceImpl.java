package com.community.petish.community.hospital.service;

import java.util.List;

import com.community.petish.community.hospital.domain.Criteria;
import com.community.petish.community.hospital.domain.HospitalVO;
import com.community.petish.community.hospital.mapper.HospitalMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.community.hospital.domain.ListDTO;

@Service("hospitalService")
public class HospitalServiceImpl implements HospitalService{
	
	@Autowired
	private HospitalMapper hospitalMapper;
	
	@Override
	public List<ListDTO> gethospitalList(String hospital_addr) {
		
		 List<ListDTO> hospitalList = null; 
		 hospitalList=hospitalMapper.gethospitalList(hospital_addr); 
		 
		 return hospitalList;
		 
	}
	@Override
	public List<ListDTO> getEmerhospitalList(String hospital_addr) {
		
		 List<ListDTO> hospitalList = null; 
		 hospitalList=hospitalMapper.getEmerhospitalList(hospital_addr); 
		 
		 return hospitalList;
		 
	}
	@Override
	public List<ListDTO> getListWithPaging(Criteria cri) {
		 List<ListDTO> hospitalList = null; 
		 hospitalList=hospitalMapper.getListWithPaging(cri); 
		 
		 return hospitalList;
	}
	@Override
	public List<ListDTO> getEmerListWithPaging(Criteria cri) {
		 List<ListDTO> hospitalList = null; 
		 hospitalList=hospitalMapper.getEmerListWithPaging(cri); 
		 return hospitalList;
	}
	@Override
	public Integer getTotalCount(String hospital_addr) {
		
		return hospitalMapper.getTotalCount(hospital_addr);
	}
	@Override
	public Integer getEmerTotalCount(String hospital_addr) {
		// TODO Auto-generated method stub
		return hospitalMapper.getEmerTotalCount(hospital_addr);
	}
	@Override
	public HospitalVO getHospital(Long id) {
		HospitalVO vo = hospitalMapper.getHospital(id);
		return vo;
	}
	@Override
	public Double getScore(Long id) {
		// TODO Auto-generated method stub
		double avg;
		if(hospitalMapper.getScore(id) == null) {
			
			avg =0;
		}
		else {
			avg = hospitalMapper.getScore(id);
		}
		
		return avg;
	}
	

}
