package com.community.petish.community.dog.gatherboard.dto.request;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DogGatherPostDTO {
	private Long ID;
	private String USERNAME;
	private String REGION_NAME;
	private String SPECIES;
	private String STR_GATHRING_DATE;
}
