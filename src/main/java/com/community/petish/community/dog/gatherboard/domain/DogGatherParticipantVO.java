package com.community.petish.community.dog.gatherboard.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DogGatherParticipantVO {

	private Long ID;
	private Long POST_ID;
	private Long USER_ID;
	private String REQUEST_CONTENT;
	private int CANCELED;
	private Long SPECIES_ID;
	
	public DogGatherParticipantVO() {}
	
	public DogGatherParticipantVO(Long POST_ID, Long USER_ID, String REQUEST_CONTENT, Long SPECIES_ID) {
		this.POST_ID = POST_ID;
		this.USER_ID = USER_ID;
		this.REQUEST_CONTENT = REQUEST_CONTENT;
		this.SPECIES_ID = SPECIES_ID;
	}
}
