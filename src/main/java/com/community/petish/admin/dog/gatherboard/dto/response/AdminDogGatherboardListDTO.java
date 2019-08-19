package com.community.petish.admin.dog.gatherboard.dto.response;

import java.sql.Timestamp;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class AdminDogGatherboardListDTO{
	private Long ID;
	private Long USER_ID;
	private String REGION_NAME;
	private String DOG_SPECIES;
	private String DOG_SIZE;
	private String TITLE;
	private String NICKNAME;
	@JsonFormat(pattern="yyyy/MM/dd HH:mm")
	private Date CREATED_DATE;
	private Timestamp GATHERING_DATE;
	private int GATHERING_STATE;
	private int VIEW_COUNT;
	private int DELETED;
	private int COUNT;
}