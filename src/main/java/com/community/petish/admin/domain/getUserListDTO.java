package com.community.petish.admin.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import oracle.sql.DATE;

@Data
public class getUserListDTO {
	private Long id;
	private String username;
	private String nickname;
	private String address;
	private String gender;
	private String join_date;
	private int deleted;
}
