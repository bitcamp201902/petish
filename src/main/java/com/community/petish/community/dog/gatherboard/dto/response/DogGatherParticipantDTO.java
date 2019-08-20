package com.community.petish.community.dog.gatherboard.dto.response;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DogGatherParticipantDTO {
	private Long ID;
	private Long POST_ID;
	private Long USER_ID;
	private int CANCELED;
	private String USERNAME;
	private String NICKNAME;
	private String DOG_SPECIES;
	private String REQUEST_CONTENT;
}
