package com.community.petish.community.dog.gatherboard.mapper;

import java.util.List;

import com.community.petish.community.dog.gatherboard.domain.Criteria;
import com.community.petish.community.dog.gatherboard.domain.DogGatherParticipantVO;
import com.community.petish.community.dog.gatherboard.domain.DogGatherPostVO;
import com.community.petish.community.dog.gatherboard.domain.DogSpeciesVO;
import com.community.petish.community.dog.gatherboard.dto.response.DogGatherListDTO;
import com.community.petish.community.dog.gatherboard.dto.response.DogGatherParticipantDTO;
import com.community.petish.community.report.mapper.ReportGetdeletedMapper;
import com.community.petish.community.dog.gatherboard.dto.response.RegionListDTO;
import com.community.petish.community.user.domain.User;


public interface DogGatherMapper extends ReportGetdeletedMapper {
	List<DogGatherPostVO> getDogGatherList();
	List<DogGatherListDTO> getListWithPaging(Criteria cri);
	Long getMaxPostID();
	List<RegionListDTO> getRegionList(Long regionID);
	Long getUserRegionID(User user);
	int getDogGatherPostCount(Criteria cri);
	DogGatherPostVO getDogGatherPost(Long postID);
	int updateViewCount(Long postID);
	int insertDogGatherPost(DogGatherPostVO dogGatherPostVO);
	int modifyDogGatherPost(DogGatherPostVO dogGatherPostVO);
	int deleteDogGatherPost(Long postID);
	int insertDogGatherParticipant(DogGatherParticipantVO participantVO);
	List<DogGatherParticipantDTO> getDogGatherParticipantList(Long postID);
	int getDogGatherParticipant(DogGatherParticipantVO participantVO);
	int cancelParticipant(DogGatherParticipantDTO participantDTO);
	void allCancelParticipant(Long postID);
	int getDogGatherParticipantCount(Long postID);
	Long getUserID(String username);
	Long getUserIDbyNickName(String nickname);
	String getUserName(Long userID);
	String getUserNickName(Long userID);
	Long getDogSpeciesID(String dogSpecies);
	String getDogSpecies(Long speciesID);
	Long getDogSizeID(Long speciesID);
	List<DogSpeciesVO> getDogSpeciesList(Long sizeID);
	Long getRegionID(String regionName);
	
	Integer getDeletedById(Long id);
}
