package com.community.petish.community.dog.gatherboard.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DogSpeciesVO {

	private Long ID;
	private String DOG_SPECIES;
	private Long SIZE_ID;
	
	public DogSpeciesVO() {}
}
