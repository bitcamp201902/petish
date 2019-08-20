package com.community.petish.community.dog.gatherboard.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.community.petish.community.dog.gatherboard.domain.Criteria;
import com.community.petish.community.dog.gatherboard.domain.DogGatherCommentVO;
import com.community.petish.community.dog.gatherboard.domain.DogGatherParticipantVO;
import com.community.petish.community.dog.gatherboard.domain.DogGatherPostVO;
import com.community.petish.community.dog.gatherboard.dto.request.DogGatherPostDTO;
import com.community.petish.community.dog.gatherboard.dto.response.CommentPageDTO;
import com.community.petish.community.dog.gatherboard.dto.response.DogGatherListDTO;
import com.community.petish.community.dog.gatherboard.dto.response.DogGatherParticipantDTO;
import com.community.petish.community.dog.gatherboard.dto.response.PageDTO;
import com.community.petish.community.dog.gatherboard.dto.response.RegionListDTO;
import com.community.petish.community.dog.gatherboard.service.DogGatherCommentService;
import com.community.petish.community.dog.gatherboard.service.DogGatherService;
import com.community.petish.community.user.domain.User;
import com.community.petish.community.user.dto.response.LoginedUser;
import com.community.petish.community.user.service.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/dog/gatherboard")
public class DogGatherboardController {

	@Autowired
	private DogGatherService dogGatherService; 
	
	@Autowired
	private DogGatherCommentService dogGatherCommentService;
	
	@Autowired
	private UserService userService;
	
			 
	//게시글 리스트
	@RequestMapping("")
	public String dogGatherboardList(HttpSession session, Criteria cri, Model model, HttpServletResponse response) throws Exception {

		int total = dogGatherService.getDogGatherPostCount(cri);
		List<DogGatherListDTO> dogGatherDTOList = dogGatherService.getListWithPaging(cri);
	
		System.out.println("total="+total);
		System.out.println("dogGatherDTOList="+dogGatherDTOList);
		model.addAttribute("list",dogGatherDTOList);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "petish/community/dog/gatherboard/list";
	}
	
	//지도로 보기
	@RequestMapping("/mapList")
	public String dogGatherboardMapList(HttpSession session, Model model, HttpServletResponse response) throws Exception {
		LoginedUser user = (LoginedUser) session.getAttribute("LOGIN_USER");
		Long USER_ID = user.getId();
		User getUser = userService.findById(USER_ID);
		Long REGION_ID = dogGatherService.getUserRegionID(getUser);
		
		model.addAttribute("REGION_ID",REGION_ID);
		return "petish/community/dog/gatherboard/mapList";
	}
		   
	@RequestMapping(value="/searchMap",  method= RequestMethod.GET, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String getRegionList(Long REGION_ID) {
		
		List<RegionListDTO> regionList = dogGatherService.getRegionList(REGION_ID);
		System.out.println("regionList="+regionList);
		
		String str = "";
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(regionList);
			System.out.println("str="+str);
		}
		catch(Exception e) {
			System.out.println("region mapper:"+e.getMessage());
		}
		return str;
	}
	
	//게시글 조회
	@RequestMapping(value = "/{ID}")
	public ModelAndView dogGatherboardDetail(@PathVariable("ID") Long postID, Criteria cri, HttpServletResponse response, HttpSession session) throws Exception {
		LoginedUser user = (LoginedUser) session.getAttribute("LOGIN_USER");
		
		if(user == null) {
			response.setContentType("text/html charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();			
		}
		int res = dogGatherService.updateViewCount(postID);
		System.out.println("UpdateViewCountRes="+res);
		
		ModelAndView result = new ModelAndView();
		
		if(res != 0) {			
			System.out.println("조회수 업데이트 성공!");
			DogGatherPostVO post = dogGatherService.getDogGatherPost(postID);
			String dogSpecies = dogGatherService.getDogSpecies(post.getSPECIES_ID());
			String writer = dogGatherService.getUserNickName(post.getUSER_ID());
			Long sizeID = dogGatherService.getDogSizeID(post.getSPECIES_ID());
			int commentCnt = dogGatherCommentService.getCommentCnt(postID);
			int participantCount = dogGatherService.getDogGatherParticipantCount(postID);
			
			result.addObject("participantCount",participantCount);
			result.addObject("post",post);
			result.addObject("writer",writer);
			result.addObject("dogSpecies",dogSpecies);
			result.addObject("sizeID",sizeID);
			result.addObject("pageMaker", new CommentPageDTO(cri, commentCnt));
			
			List<DogGatherParticipantDTO> participantDTOList = dogGatherService.getDogGatherParticipantList(postID);

			System.out.println("participantList="+participantDTOList);
			result.addObject("participantList",participantDTOList);
			result.setViewName("petish/community/dog/gatherboard/detail");
		}
		else {
			response.setContentType("text/html charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('존재하지 않는 게시글입니다!');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
		
		return result;
	}
	
	//게시글 작성폼
	@RequestMapping("/writeForm")
	public ModelAndView dogGatherboardWriteForm(HttpServletResponse response, HttpSession session) throws Exception {		
		
		ModelAndView result = new ModelAndView();		
		result.setViewName("petish/community/dog/gatherboard/write_form");
			
		return result;
	}
	
	//게시글 수정폼
	@RequestMapping("/modifyForm/{ID}")
	public String dogGatherboardModifyForm(@PathVariable("ID") Long postID, Model model) {
		
		DogGatherPostVO post = dogGatherService.getDogGatherPost(postID);
		Long size = dogGatherService.getDogSizeID(post.getSPECIES_ID());
		String species = dogGatherService.getDogSpecies(post.getSPECIES_ID());
		System.out.println("size="+size);
		System.out.println("species="+species);
		
		model.addAttribute("post",post);
		model.addAttribute("size",size);
		model.addAttribute("species",species);
		
		return "petish/community/dog/gatherboard/modify_form";
	}
	
	//게시글 작성
	@RequestMapping("/insertPost")
	public ModelAndView insertPost(Criteria cri, Model model, DogGatherPostVO postVO, DogGatherPostDTO postDTO) throws Exception {
		
		String USERNAME = postDTO.getUSERNAME();
		String DOG_SPECIES = postDTO.getSPECIES();
		String now = postDTO.getSTR_GATHRING_DATE();
		System.out.println("now="+now);

		//Timestamp 형식 변환(yyyy-MM-dd HH:mm:ss)
		StringBuffer sb = new StringBuffer();
		sb.append(now);
		sb.append(":00");		
		sb.replace(4, 5, "-");
		sb.replace(7, 8, "-");

		System.out.println("sb.toString()="+sb.toString());
		java.sql.Timestamp t = java.sql.Timestamp.valueOf(sb.toString());
		
		postVO.setUSER_ID(dogGatherService.getUserID(USERNAME));
		postVO.setSPECIES_ID(dogGatherService.getDogSpeciesID(DOG_SPECIES));
		postVO.setGATHERING_DATE(t);

		DogGatherParticipantVO participantVO = new DogGatherParticipantVO(dogGatherService.getMaxPostID()+1L,postVO.getUSER_ID(),"글쓴이",postVO.getSPECIES_ID());
		System.out.println("participant="+participantVO.toString());
		
		int res = dogGatherService.insertDogGatherPost(postVO);
		int insertParticipantRes = dogGatherService.insertDogGatherParticipant(participantVO);
		
		ModelAndView result = new ModelAndView();
		
		if(res != 0 && insertParticipantRes != 0) {
			System.out.println("InsertResult="+res);
			System.out.println("게시글 추가 성공!");
	
			result.setViewName("redirect:.");
			return result;
		}
		else {			
			System.out.println("InsertResult="+res);
			System.out.println("게시글 추가 실패!");
			result.setViewName("petish/community/dog/gatherboard/write_form");
		}
		
		return result;
	}
	
	//게시글 수정
	@RequestMapping("/modifyPost/{ID}")
	public ModelAndView modifyPost(@PathVariable("ID") Long postID, DogGatherPostVO postVO, DogGatherPostDTO postDTO, Criteria cri, HttpServletResponse response) throws Exception{
		
		DogGatherPostVO prev_post = dogGatherService.getDogGatherPost(postID);
		System.out.println("modifypost(id)="+postID);
		
		String DOG_SPECIES = postDTO.getSPECIES();
		Long SPECIES_ID = dogGatherService.getDogSpeciesID(DOG_SPECIES);
		System.out.println("modifyPost(SPECIES_ID)="+SPECIES_ID);
		// 수정하기 전 게시물의 정모날짜
		String prev_date = ""+prev_post.getGATHERING_DATE();
		System.out.println("prev_date="+prev_date);
		String now = postDTO.getSTR_GATHRING_DATE();
		System.out.println("now="+now);
		
		// 수정하기 전 게시물의 정모날짜와 수정한 뒤 게시물의 정모날짜 비교
		if(!(prev_date.equals(now))) {			
			System.out.println("정모 날짜 수정함!");
			// Timestamp 형식 변환(yyyy-MM-dd HH:mm:ss)
			StringBuffer sb = new StringBuffer();
			sb.append(now);
			sb.append(":00");		
			sb.replace(4, 5, "-");
			sb.replace(7, 8, "-");
			
			System.out.println("sb.toString()="+sb.toString());
			java.sql.Timestamp t = java.sql.Timestamp.valueOf(sb.toString());
			
			postVO.setGATHERING_DATE(t);
		}
		else {
			System.out.println("정모 날짜 수정하지 않음!");
			postVO.setGATHERING_DATE(prev_post.getGATHERING_DATE());
		}
		
		postVO.setSPECIES_ID(SPECIES_ID);
		
		int res = dogGatherService.modifyDogGatherPost(postVO);
		System.out.println("modify res="+res);
		
		ModelAndView result = new ModelAndView();
		
		if(res != 0) {
			System.out.println("게시물 수정 성공!");
			List<DogGatherListDTO> dogGatherDTOList = dogGatherService.getListWithPaging(cri);
			int total = dogGatherService.getDogGatherPostCount(cri);
			
			result.addObject("list",dogGatherDTOList);
			result.addObject("pageMaker", new PageDTO(cri, total));

			result.setViewName("petish/community/dog/gatherboard/list");
			return result;
		}
		else {
			response.setContentType("text/html charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('참여 신청에 실패하였습니다!');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		}
	}
	
	//정모 신청
	@RequestMapping("/insertParticipant")
	public String insertParticipant(HttpServletResponse response, HttpSession session, DogGatherParticipantVO participantVO, DogGatherPostDTO postDTO) throws Exception {
		LoginedUser user = (LoginedUser) session.getAttribute("LOGIN_USER");
		String username = postDTO.getUSERNAME();
		String species = postDTO.getSPECIES();
		// 설정한 인원 수
		DogGatherPostVO post = dogGatherService.getDogGatherPost(participantVO.getPOST_ID());
		int peopleCount = post.getPEOPLE_COUNT();
		// 참가신청 수
		int participantCount = dogGatherService.getDogGatherParticipantCount(participantVO.getPOST_ID());
		Long USER_ID = dogGatherService.getUserID(username);
		Long SPECIES_ID = dogGatherService.getDogSpeciesID(species);
		
		System.out.println("userID="+user.getId()+",participantID="+post.getUSER_ID());
		
		if(user.getId()==post.getUSER_ID()) {
			response.setContentType("text/html charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('본인 글에 참여 신청을 할 수 없습니다!');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;			
		} else {			
			if(participantCount < peopleCount) {
				
				participantVO.setUSER_ID(USER_ID);
				participantVO.setSPECIES_ID(SPECIES_ID);
				System.out.println("ParticipantVO="+participantVO.toString());
				
				int getParticipant = dogGatherService.getDogGatherParticipant(participantVO);
				System.out.println("getParticipant="+getParticipant);
				
				//참여신청을 한 적이 없을 경우
				if(getParticipant == 0) {
					
					int res = dogGatherService.insertDogGatherParticipant(participantVO);
					System.out.println("ParticipantRes="+res);
					
					if(res!=0) {
						System.out.println("참여 신청 성공!");
						return "redirect:"+participantVO.getPOST_ID();
					}
					else {
						response.setContentType("text/html charset=UTF-8");
						PrintWriter out = response.getWriter();
						out.println("<script>");
						out.println("alert('참여 신청에 실패하였습니다!');");
						out.println("history.go(-1);");
						out.println("</script>");
						out.close();
						return null;
					}
				} else {
					response.setContentType("text/html charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('이미 참여 신청이 완료된 정모입니다!');");
					out.println("history.go(-1);");
					out.println("</script>");
					out.close();
					return null;
				}
			}
			else {
				response.setContentType("text/html charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('참여 인원수를 초과하였습니다!');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;
			}
		}
	}
	
	//정모 신청 취소
	@RequestMapping("/cancelParticipant")
	public String cancelParticipant(DogGatherParticipantDTO participantDTO) {
		Long POST_ID = participantDTO.getPOST_ID();
		Long ID = participantDTO.getID();

		System.out.println("POST_ID="+POST_ID);

		participantDTO.setID(ID);
		participantDTO.setPOST_ID(POST_ID);
		int res = dogGatherService.cancelParticipant(participantDTO);
		System.out.println("cancelParticipantRes="+res);
		
		if(res != 0) {
			System.out.println("참가 신청 취소 성공!");
			return "redirect:"+participantDTO.getPOST_ID();
		}
		else {
			System.out.println("참가 신청 취소 실패!");
			return "redirect:"+participantDTO.getPOST_ID();
		}
	}
	
	//게시글 삭제
	@RequestMapping("/deleteDogGatherPost/{ID}")
	public ModelAndView deleteDogGatherPost(Model model,@PathVariable("ID") Long postID, HttpServletResponse response, Criteria cri) throws Exception {
		int res = dogGatherService.deleteDogGatherPost(postID);
		
		ModelAndView result = new ModelAndView();
		if(res != 0) {
			System.out.println("게시물 삭제 성공!");
			List<DogGatherListDTO> dogGatherDTOList = dogGatherService.getListWithPaging(cri);
			int total = dogGatherService.getDogGatherPostCount(cri);
			
			model.addAttribute("list",dogGatherDTOList);
			model.addAttribute("pageMaker", new PageDTO(cri, total));
			result.setViewName("petish/community/dog/gatherboard/list");
			
			return result;
		}
		else {			
			response.setContentType("text/html charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('게시물 삭제 실패!');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		}
	}
	
    //USER_ID 조회
    @RequestMapping(value = "getUserIDbyNickName/{nickname}", method=RequestMethod.GET, produces="application/json;charset=UTF-8")
    @ResponseBody
    public Long getUserID(@PathVariable("nickname") String nickname) {
  
      Long userID = dogGatherService.getUserIDbyNickName(nickname);
  
      System.out.println("getUseriD="+userID);
      return userID;
    }

}
