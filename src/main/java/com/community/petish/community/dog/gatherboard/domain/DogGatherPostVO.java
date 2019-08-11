package com.community.petish.community.dog.gatherboard.domain;


import java.sql.Date;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DogGatherPostVO {

	private Long ID;
	private String TITLE;
	private String CONTENT;
	private Date CREATED_DATE;
	private Date UPDATED_DATE;
	private int VIEW_COUNT;
	private int PEOPLE_COUNT;
	private String GATHERING_ADDRESS;
	private Timestamp GATHERING_DATE;
	private int DELETED;
	private Long USER_ID;
	private Long SPECIES_ID;
	private Long REGION_ID;
	
	public DogGatherPostVO() {}

}
