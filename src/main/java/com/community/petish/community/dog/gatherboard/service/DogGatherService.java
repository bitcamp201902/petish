package com.community.petish.community.dog.gatherboard.service;

import java.util.List;

import com.community.petish.community.dog.gatherboard.domain.Criteria;
import com.community.petish.community.dog.gatherboard.domain.DogGatherParticipantVO;
import com.community.petish.community.dog.gatherboard.domain.DogGatherPostVO;
import com.community.petish.community.dog.gatherboard.domain.DogSpeciesVO;
import com.community.petish.community.dog.gatherboard.dto.response.DogGatherListDTO;
import com.community.petish.community.dog.gatherboard.dto.response.DogGatherParticipantDTO;
import com.community.petish.community.dog.gatherboard.dto.response.RegionListDTO;
import com.community.petish.community.user.domain.User;

public interface DogGatherService {
	public List<DogGatherPostVO> getDogGatherList();
	public List<DogGatherListDTO> getListWithPaging(Criteria cri);
	public Long getMaxPostID();
	public List<RegionListDTO> getRegionList(Long regionID);
	public Long getUserRegionID(User user);
	public int getDogGatherPostCount(Criteria cri);
	public DogGatherPostVO getDogGatherPost(Long postID);
	public int updateViewCount(Long postID);
	public int insertDogGatherPost(DogGatherPostVO postVO);
	public int modifyDogGatherPost(DogGatherPostVO postVO);
	public int deleteDogGatherPost(Long postID);
	public int insertDogGatherParticipant(DogGatherParticipantVO participantVO);
	public List<DogGatherParticipantDTO> getDogGatherParticipantList(Long postID);
	public int getDogGatherParticipant(DogGatherParticipantVO participantVO);
	public int cancelParticipant(DogGatherParticipantDTO participantDTO);
	public int getDogGatherParticipantCount(Long postID);
	public Long getUserID(String username);
	public Long getUserIDbyNickName(String nickname);
	public String getUserName(Long userID);
	public String getUserNickName(Long userID);
	public Long getDogSpeciesID(String dogSpecies);
	public String getDogSpecies(Long speciesID);
	public Long getDogSizeID(Long speciesID);
	public List<DogSpeciesVO> getDogSpeciesList(Long dogSizeID);
	public Long getRegionID(String regionName);
}
