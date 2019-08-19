package com.community.petish.community.hospital.domain;

import lombok.Data;

@Data
public class ListDTO {
	private Long id;
	private String hospital_name;
	private String hospital_addr;
	private String hospital_phone;
	private String hospital_hours;
	private String hospital_img;
	private int isEmergency;
}
