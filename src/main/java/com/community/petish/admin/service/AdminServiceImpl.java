package com.community.petish.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.admin.domain.getUserListDTO;
import com.community.petish.admin.mapper.AdminMapper;
import com.community.petish.user.dto.UserResponseDTO_Mypage;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper adminMapper;
	@Override
	public Long getUserCount() {
		return adminMapper.getUserCount();
	}
	@Override
	public Long getMaleCount() {
		// TODO Auto-generated method stub
		return adminMapper.getMaleCount();
	}
	@Override
	public Long getFemaleCount() {
		// TODO Auto-generated method stub
		return adminMapper.getFemaleCount();
	}
	@Override
	public Long getConcernCatCount() {
		// TODO Auto-generated method stub
		return adminMapper.getConcernCatCount();
	}
	@Override
	public Long getConcernDogCount() {
		// TODO Auto-generated method stub
		return adminMapper.getConcernDogCount();
	}
	@Override
	public List<getUserListDTO> getUserList() {
		List<getUserListDTO> list = null;
		list = adminMapper.getUserList();
		return list;
	}
	@Override
	public boolean deleteUser(Long id) {
		int result = adminMapper.deleteUser(id);
		if(result == 0) {
			return false;
		}
		else {
			return true;
		}
	}
	@Override
	public UserResponseDTO_Mypage getUser(Long id) {
		return adminMapper.getUser(id);
	}
	

}
