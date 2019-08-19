package com.community.petish.community.cat.gatherboard.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CatGatherParticipantVO {

	private Long ID;
	private Long POST_ID;
	private Long USER_ID;
	private String REQUEST_CONTENT;
	private int CANCELED;
	private Long SPECIES_ID;
	
	public CatGatherParticipantVO() {}
	
	public CatGatherParticipantVO(Long ID, Long POST_ID, Long USER_ID, String REQUEST_CONTENT, Long SPECIES_ID) {
		this.ID = ID;
		this.POST_ID = POST_ID;
		this.REQUEST_CONTENT = REQUEST_CONTENT;
		this.SPECIES_ID = SPECIES_ID;
	}
}
