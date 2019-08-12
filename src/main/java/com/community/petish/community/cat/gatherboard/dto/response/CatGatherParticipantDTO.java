package com.community.petish.community.cat.gatherboard.dto.response;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CatGatherParticipantDTO {
	private Long ID;
	private Long POST_ID;
	private int CANCELED;
	private String USERNAME;
	private String NICKNAME;
	private String DOG_SPECIES;
	private String REQUEST_CONTENT;
}
