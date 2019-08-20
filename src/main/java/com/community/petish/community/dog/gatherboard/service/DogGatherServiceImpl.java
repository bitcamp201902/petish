package com.community.petish.community.dog.gatherboard.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.community.dog.gatherboard.domain.Criteria;
import com.community.petish.community.dog.gatherboard.domain.DogGatherParticipantVO;
import com.community.petish.community.dog.gatherboard.domain.DogGatherPostVO;
import com.community.petish.community.dog.gatherboard.domain.DogSpeciesVO;
import com.community.petish.community.dog.gatherboard.dto.response.DogGatherListDTO;
import com.community.petish.community.dog.gatherboard.dto.response.DogGatherParticipantDTO;
import com.community.petish.community.dog.gatherboard.dto.response.RegionListDTO;
import com.community.petish.community.dog.gatherboard.mapper.DogGatherCommentMapper;
import com.community.petish.community.dog.gatherboard.mapper.DogGatherMapper;
import com.community.petish.community.user.domain.User;

@Service("dogGatherService")
public class DogGatherServiceImpl implements DogGatherService {

	@Autowired
	private DogGatherMapper dogGatherMapper;
	
	@Autowired
	private DogGatherCommentMapper dogGatherCommentMapper;
	
	@Override
	public List<DogGatherPostVO> getDogGatherList() {
		List<DogGatherPostVO> list = dogGatherMapper.getDogGatherList();
		return list;
	}
	
	@Override
	public List<DogGatherListDTO> getListWithPaging(Criteria cri) {
		System.out.println("get list with paging="+cri);
		List<DogGatherListDTO> dogGatherDTOList = dogGatherMapper.getListWithPaging(cri);
		int commentCount = 0;
		int gatheringState = 0;
		
		for(int i=0; i<dogGatherDTOList.size(); i++) {
			DogGatherListDTO dogGatherListDTO = dogGatherDTOList.get(i);
			
			commentCount = dogGatherCommentMapper.getCommentCount(dogGatherListDTO.getID());
			
			Timestamp GATHERING_DATE = dogGatherListDTO.getGATHERING_DATE();
			// 정모 날짜 지나면 신청 못하도록 구현
			// 현재 시간 Timestamp 형식으로 구하기
			// 앞에 변수가 크면 1, 작으면 -1, 같으면 0
			SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
			Calendar cal = Calendar.getInstance();
			String today = null;
			today = formatter.format(cal.getTime());
			Timestamp ts = Timestamp.valueOf(today);
			
			//정모 날짜가 지나지 않았을 경우
			if(GATHERING_DATE.compareTo(ts) >= 1) {
				gatheringState = 1;
			}
			else {
				gatheringState = 0;
			}
			
			dogGatherListDTO.setCOMMENT_COUNT(commentCount);
			dogGatherListDTO.setGATHERING_STATE(gatheringState);
		}
		
		System.out.println(dogGatherDTOList);
		return dogGatherDTOList;
	}
	
	@Override
	public Long getMaxPostID() {
		Long maxPostID = dogGatherMapper.getMaxPostID();
		return maxPostID;
	}
	
	@Override
	public List<RegionListDTO> getRegionList(Long regionID) {
		List<RegionListDTO> regionList = dogGatherMapper.getRegionList(regionID);
		return regionList;
	}
	
	@Override
	public Long getUserRegionID(User user) {
		Long regionID = dogGatherMapper.getUserRegionID(user);
		return regionID;
	}

	@Override
	public int getDogGatherPostCount(Criteria cri) {
		int count = dogGatherMapper.getDogGatherPostCount(cri);
		return count;
	}
	
	@Override
	public DogGatherPostVO getDogGatherPost(Long postID) {
		DogGatherPostVO post = dogGatherMapper.getDogGatherPost(postID);
		return post;
	}
	
	@Override
	public int updateViewCount(Long postID) {
		int res = dogGatherMapper.updateViewCount(postID);
		return res;
	}
	
	@Override
	public int insertDogGatherPost(DogGatherPostVO dogGatherPostVO) {
		int res = dogGatherMapper.insertDogGatherPost(dogGatherPostVO);
		return res;
	}
	
	@Override
	public int modifyDogGatherPost(DogGatherPostVO dogGatherPostVO) {
		int res = dogGatherMapper.modifyDogGatherPost(dogGatherPostVO);
		return res;
	}
	
	@Override
	public int deleteDogGatherPost(Long postID) {
		//해당 글의 정모 참여 신청을 모두 취소함
		dogGatherMapper.allCancelParticipant(postID);
		int res = dogGatherMapper.deleteDogGatherPost(postID);
		return res;
	}
	
	@Override
	public int insertDogGatherParticipant(DogGatherParticipantVO participantVO) {
		int res = dogGatherMapper.insertDogGatherParticipant(participantVO);
		return res;
	}

	@Override
	public List<DogGatherParticipantDTO> getDogGatherParticipantList(Long postID) {
		List<DogGatherParticipantDTO> list = dogGatherMapper.getDogGatherParticipantList(postID);
		return list;
	}
	
	@Override
	public int getDogGatherParticipant(DogGatherParticipantVO participantVO) {
		int res = dogGatherMapper.getDogGatherParticipant(participantVO);
		return res;
	}
	
	@Override
	public int cancelParticipant(DogGatherParticipantDTO participantDTO) {
		int res = dogGatherMapper.cancelParticipant(participantDTO);
		return res;
	}
	
	@Override
	public int getDogGatherParticipantCount(Long postID) {
		int count = dogGatherMapper.getDogGatherParticipantCount(postID);
		return count;
	}
	
	@Override
	public Long getUserID(String username) {
		Long USER_ID = dogGatherMapper.getUserID(username);
		return USER_ID;
	}
	
	@Override
	public Long getUserIDbyNickName(String nickname) {
		Long USER_ID = dogGatherMapper.getUserIDbyNickName(nickname);
		return USER_ID;
	}
	
	@Override
	public String getUserName(Long userID) {
		String USER_NAME = dogGatherMapper.getUserName(userID);
		return USER_NAME;
	}

	@Override
	public String getUserNickName(Long userID) {
		String NICKNAME = dogGatherMapper.getUserNickName(userID);
		return NICKNAME;
	}
	
	@Override
	public Long getDogSpeciesID(String dogSpecies) {		
		Long SPECIES_ID = dogGatherMapper.getDogSpeciesID(dogSpecies);
		return SPECIES_ID;
	}
	
	@Override
	public String getDogSpecies(Long speciesID) {
		String SPECIES_NAME = dogGatherMapper.getDogSpecies(speciesID);
		return SPECIES_NAME;
	}

	@Override
	public Long getRegionID(String regionName) {		
		Long REGION_ID = dogGatherMapper.getRegionID(regionName);
		return REGION_ID;
	}

	@Override
	public Long getDogSizeID(Long speciesID) {	
		Long SIZE_ID = dogGatherMapper.getDogSizeID(speciesID); 
		return SIZE_ID;
	}

	@Override
	public List<DogSpeciesVO> getDogSpeciesList(Long sizeID) {		
		List<DogSpeciesVO> list = dogGatherMapper.getDogSpeciesList(sizeID);
		return list;
	}

}
