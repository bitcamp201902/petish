package com.community.petish.community.hospital.domain;

import lombok.Data;

@Data
public class HospitalVO {
	private Long id;
	private String hospital_name;
	private String hospital_addr;
	private String hospital_phone;
	private String hospital_check;
	private String hospital_hours;
	private String hospital_website;
	private String hospital_img;
	private int isParking;
	private int isEmergency;
	
	
	
	
	
}
