package com.community.petish.community.etc.hamster.controller;

import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.community.petish.community.etc.hamster.dto.Criteria;
import com.community.petish.community.etc.hamster.dto.HamsterPostPageDTO;
import com.community.petish.community.etc.hamster.dto.HamsterPostRequestDTO;
import com.community.petish.community.etc.hamster.dto.HamsterPostResponseDTO;
import com.community.petish.community.etc.hamster.service.HamsterCommentService;
import com.community.petish.community.etc.hamster.service.HamsterPostService;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/etc/hamster")
@Controller
@Slf4j
public class HamsterPostController {

	@Autowired
	private HamsterPostService service;
	@Autowired
	private HamsterCommentService commentService;
	
	//게시글 리스트 조회
	@RequestMapping("")
	public String hamsterPostList(Criteria cri, Model model) throws ParseException {
		
		cri.setPageNum(cri.getPageNum());
		
		List<HamsterPostResponseDTO> dtoList = service.getPostList(cri);
		
		model.addAttribute("dtoList",  dtoList);
		
		//전체 게시글 갯수
		int total = service.getPostCount(cri);
		
		model.addAttribute("pageMaker",  new HamsterPostPageDTO(cri, total));		
		model.addAttribute("pageNum", cri.getPageNum());		
		
		return "petish/community/etc/hamster/list";
	}
	
	//게시글 조회
	@RequestMapping("/{id}")
	public String hamsterPostDetail(@PathVariable Long id, Model model) {
		
		//댓글 수 조회
		int commentCount = commentService.getCommentCnt(id);
		System.out.println("commentCount : " + commentCount);
		
		//조회 수 갱신
		service.updateViewCount(id);
			
		//게시글 조회
		HamsterPostResponseDTO dto = service.getPostDetail(id);
		
		System.out.println("[Controller]" + dto);
		
		model.addAttribute("dto", dto);
		model.addAttribute("commentCount", commentCount);
		
		return "petish/community/etc/hamster/detail";
	}
	
	//게시글 입력 폼
	@RequestMapping("/writeForm")
	public String hamsterPostWriteForm() {		
		return "petish/community/etc/hamster/write_form";
	}
	
	//게시글 입력
	@PostMapping("/register")
	public String register(HamsterPostRequestDTO dto, Model model, RedirectAttributes rttr){
		
		int result = service.register(dto);
		
		model.addAttribute("dto",  dto);
		
		rttr.addFlashAttribute("result", dto.getId());
		
		return "redirect:/etc/hamster/"+dto.getId();
	}
	
	//게시글 수정 폼
	@RequestMapping("/modifyForm/{id}")
	public String modifyForm(@PathVariable Long id, Model model) {
		
		HamsterPostResponseDTO dto = service.getPostDetail(id);
		
		model.addAttribute("dto",  dto);
		
		return "petish/community/etc/hamster/modify_form";
	}
	
	//게시글 수정
	@PostMapping("/modify")
	public String modify(HamsterPostRequestDTO dto, Model model, RedirectAttributes rttr){
		
		int result = service.modify(dto);
		
		if(result == 1) {
			log.info("수정 성공");
			rttr.addFlashAttribute("modify_msg", "success");			
		}
		else {
			log.info("수정 실패");
			rttr.addFlashAttribute("modify_msg", "failure");
		}
		
		model.addAttribute("dto",  dto);
		
		rttr.addFlashAttribute("result", dto.getId());
		System.out.println("[Controller]dto : " + dto);
		
		return "redirect:/etc/hamster/"+dto.getId();
	}
	
	//게시글 삭제
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable Long id, RedirectAttributes rttr) {
	
		int result = service.delete(id);
		
		log.info("result : " + result);
		
		if (result == 1) {			
			log.info("삭제 성공");
			rttr.addFlashAttribute("delete_msg", "success");
		}
		else {
			log.info("삭제 실패");
			rttr.addFlashAttribute("delete_msg", "failure");
		}
		
		return "redirect:/etc/hamster";
	}
}
