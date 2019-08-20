package com.community.petish.community.dog.gatherboard.dto.response;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class DogGatherListDTO{
	private Long ID;
	private Long USER_ID;
	private String REGION_NAME;
	private String DOG_SPECIES;
	private String DOG_SIZE;
	private String TITLE;
	private String NICKNAME;
	private Date CREATED_DATE;
	private Timestamp GATHERING_DATE;
	private String GATHERING_ADDRESS;
	private int GATHERING_STATE;
	private int VIEW_COUNT;
	private int COMMENT_COUNT;
}
