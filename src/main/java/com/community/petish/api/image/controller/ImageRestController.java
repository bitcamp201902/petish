package com.community.petish.api.image.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/api/image")
@Slf4j
public class ImageRestController {

	@PostMapping
	public List<String> uploadImageFile(MultipartHttpServletRequest request) throws Exception {
		
		log.info("upload 요청");
		
		List<MultipartFile> files = request.getFiles("file");
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/img/mypet");
		
		log.info(uploadPath, "로 업로드");
		
		List<String> images = new ArrayList<>();
		
		for (MultipartFile file : files) {
			String fileName = file.getOriginalFilename();
			String originalFileExtension = fileName.substring(fileName.lastIndexOf("."));
			String storedFileName = UUID.randomUUID().toString().replace("-",  "") + originalFileExtension;
			
			if (file.getSize() != 0) {
				file.transferTo(new File(uploadPath + storedFileName));
				images.add(uploadPath + storedFileName);
			}
		}
		
		return images;
		
	}
	
}
