package com.community.petish.community.dog.missingboard.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.community.petish.community.dog.missingboard.dto.AttachFileDTO;
import com.community.petish.community.dog.missingboard.mapper.AttachFileMapper;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Slf4j
public class UploadController {
	
	@Autowired
	AttachFileMapper mapper;

	@GetMapping("/uploadForm")
	public void uploadForm() {

		log.info("upload form");
	}

	//실제 파일 업로드
	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model, HttpServletRequest request) {

		//String uploadFolder = "C:\\upload";
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/img/missingboard/dog");
		
		log.info("uploadPath : " + uploadPath);

		for (MultipartFile multipartFile : uploadFile) {

			log.info("-------------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());

			File saveFile = new File(uploadPath, multipartFile.getOriginalFilename());

			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				
				log.error(e.getMessage());
			} // end catch
		} // end for
	}

	@GetMapping("/uploadAjax")
	public void uploadAjax() {

		log.info("upload ajax");
	}
	
	//첨부 파일이 이미지인지 학인
	private boolean checkImageType(File file) {

		try {
			String contentType = Files.probeContentType(file.toPath());

			return contentType.startsWith("image");

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile, HttpServletRequest request) {
		
		//파일 리스트
		List<AttachFileDTO> list = new ArrayList<>();
		//업로드 할 경로
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/img/missingboard/dog");

		log.info("uploadPath : " + uploadPath);
		
		for (MultipartFile multipartFile : uploadFile) {

			AttachFileDTO attachDTO = new AttachFileDTO();

			String uploadFileName = multipartFile.getOriginalFilename();

			// IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("실제 파일명 : " + uploadFileName);
			attachDTO.setFileName(uploadFileName); //DB에 들어갈 파일명 지정
			
			UUID uuid = UUID.randomUUID(); //UUID생성

			uploadFileName = uuid.toString() + "_" + uploadFileName; //업로드 파일명  : [UUID]_[실제 파일명]

			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile); //파일 객체를 실제 지정해준 경로+이름으로 바꿈

				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadPath);
				
				log.info("uploadPath : " + uploadPath);
				log.info("uploadFileName : " + uploadFileName);

        attachDTO.setImage(true);
        //썸네일 이미지 파일명, 경로, 크기 지정해 생성
        FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
        try{
          Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
        }
        catch(IllegalStateException e) {
          log.info("Thumbnail error");
          e.printStackTrace();
        }

        thumbnail.close();
				//파일 리스트에 추가
				list.add(attachDTO);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} // end for
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	//Detail에 출력
	@GetMapping("/display")	
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {

		log.info("fileName: " + fileName);

		File file = new File(fileName);

		log.info("file: " + file);

		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();

			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	//미리보기에서 삭제
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type, HttpServletRequest request) {

		log.info("deleteFile: " + fileName);
		
		File file;

		try {
			file = new File(URLDecoder.decode(fileName, "UTF-8"));
			file.delete();

			if (type.equals("image")) {
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				log.info("largeFileName: " + largeFileName);
				file = new File(largeFileName);
				file.delete();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
}