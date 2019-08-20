package com.community.petish.community.dog.freeboard.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.community.petish.community.dog.freeboard.dto.CommentCriteria;
import com.community.petish.community.dog.freeboard.dto.DogFreeCommentRequestDTO;
import com.community.petish.community.dog.freeboard.dto.DogFreeCommentResponseDTO;
import com.community.petish.community.dog.freeboard.service.DogFreeCommentService;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/dog/freeboard/comments")
@RestController
@Slf4j
public class DogFreeboardCommentController {
	
	@Autowired
	private DogFreeCommentService service;

	//댓글 리스트 조회
	@GetMapping(produces="application/json;charset=UTF-8")
	public String getCommetListJSON(CommentCriteria cri, Model model) {
		
		System.out.println("getCommentListJSON Start!!!!!!!!");
		System.out.println("cri : " + cri);
		
		//게시글 내 댓글 전체
		List<DogFreeCommentResponseDTO> list = service.getCommentList(cri);
		//댓글 저장할 dto
		List<DogFreeCommentResponseDTO> commentDTOList = new ArrayList<DogFreeCommentResponseDTO>();
		
		//댓글 전체 갯수
		int commentCount = 0;
				
		for(int i=0; i<list.size(); i++) {
			//댓글 1개
			DogFreeCommentResponseDTO commentDTO = list.get(i);			
			commentCount = service.getCommentCnt(cri.getPost_id());
			
			DogFreeCommentResponseDTO newDTO = 
					new DogFreeCommentResponseDTO(commentDTO.getId(), commentDTO.getContent(), 
											commentDTO.getCreated_date(), commentDTO.getUpdated_date(),
											commentDTO.getDeleted(), commentDTO.getPost_id(),
											commentDTO.getUser_id(), commentDTO.getNickname(), commentCount);			
			commentDTOList.add(newDTO);			
		}
		
		String str = "";
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			str = mapper.writeValueAsString(commentDTOList);
			System.out.println("str="+str);
		}
		catch(Exception e) {
			System.out.println("first() mapper:"+e.getMessage());
		}
		return str;
	}
	
	//댓글 조회
	@GetMapping(value = "{id}", produces="application/json;charset=UTF-8")
	public String getComment(@PathVariable("commentID") Long commentID) {
		
		DogFreeCommentResponseDTO dto = service.getComment(commentID);
		
		System.out.println("getCommentVO="+dto.toString());
		
		String str = "";
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(dto);
			System.out.println("str="+str);
		}
		catch(Exception e) {
			System.out.println("first() mapper:"+e.getMessage());
		}
		
		return str;
	}
	
	//댓글 추가
	@PostMapping(produces="application/json;charset=UTF-8")
	public Map<String, Object> insertComment(DogFreeCommentRequestDTO dto) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		try {
			int res = service.insertComment(dto);
			System.out.println("insetCommentRes="+res);
			retVal.put("res", "OK");
		}
		catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		return retVal;
	}
	
	//댓글 수정
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
			value = "modify/{commentID}",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modifyComment(@RequestBody DogFreeCommentRequestDTO dto, @PathVariable("commentID") Long commentID) {
		dto.setId(commentID);
		
		System.out.println("id="+dto.getId());
		System.out.println("modify="+dto.getContent());
		
		return service.modifyComment(dto) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//댓글 삭제
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
			value = "remove/{commentID}",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> removeComment(@PathVariable("commentID") Long commentID) {
		
		System.out.println("remove="+commentID);
		
		return service.removeCommet(commentID) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
