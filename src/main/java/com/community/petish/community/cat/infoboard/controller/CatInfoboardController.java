package com.community.petish.community.cat.infoboard.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.community.petish.community.cat.infoboard.domain.CatInfoboardVO;
import com.community.petish.community.cat.infoboard.domain.Criteria;
import com.community.petish.community.cat.infoboard.domain.LikeVO;
import com.community.petish.community.cat.infoboard.domain.PageDTO;
import com.community.petish.community.cat.infoboard.service.InfoboardService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/cat/infoboard/*")
@AllArgsConstructor
public class CatInfoboardController {
	
	@Autowired
	private InfoboardService service;
	
	@RequestMapping("/list")
	public ModelAndView CatInfoboardList(Criteria cri) throws Exception {
		
		log.info("criteria = {}", cri);
		
		List<CatInfoboardVO> list = service.getList(cri);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("petish/community/cat/infoboard/list"); //뷰 위치 설정
		mav.addObject("list", service.getList(cri));
		
		int total = service.getTotal(cri);
		
		mav.addObject("pageMaker", new PageDTO(cri, total));
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value="/insertForm", method=RequestMethod.POST)
	public String CatInfoboardInsert( @ModelAttribute CatInfoboardVO catinfoboardvo, RedirectAttributes rttr) throws Exception {
		
		log.info("catinfoboardvo.getCATEGORY_ID() = {}", catinfoboardvo.getCATEGORY_ID());
		
		service.create(catinfoboardvo);
		rttr.addFlashAttribute("result", catinfoboardvo.getID());
		rttr.addFlashAttribute("msg", "insertSuccess");
		
		return "redirect:/cat/infoboard/list";
	}
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public ModelAndView CatInfoboardDetail(@RequestParam int ID, HttpSession session,@ModelAttribute("cri") Criteria cri) throws Exception {
		List<CatInfoboardVO> detail = service.getList(cri);
		service.increaseViewcnt(ID,session);
		
//		session.setAttribute("user_id", 1);
//		int user_id = (int)session.getAttribute("user_id");
//		LikeVO likevo = new LikeVO();
		
//		String boardlike = service.reply_check(likevo);
//		log.info("boardlike = {}", boardlike);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("petish/community/cat/infoboard/detail");
		mav.addObject("boardinfo",service.detail(ID));
//		mav.addObject("dislike_like", likevo.getDISLIKE_LIKE());
				
//		mav.addObject("dislike_like", boardlike);
		mav.addObject("detail",detail);
		return mav;
	}
	
	@RequestMapping("/writeForm")
	public String CatInfoboardWriteForm() {
		return "petish/community/cat/infoboard/write_form";
	}
	
	@RequestMapping(value = "/modifyForm", method = RequestMethod.GET)
	public String CatInfoboardModifyForm(@RequestParam("ID") int ID,CatInfoboardVO catInfoboardVO, Model model) throws Exception {
		log.info("ModifyForm_ID = {}", ID);
		
		model.addAttribute("boardinfo", service.detail(ID));
		return "petish/community/cat/infoboard/modify_form";
	}

	@RequestMapping(value="/modify")
	public String CatInfoboardModify(CatInfoboardVO catInfoboardVO, RedirectAttributes rttr) throws Exception{
		
		log.info("modify = {}", catInfoboardVO);
		
		service.modify(catInfoboardVO);
		rttr.addFlashAttribute("msg", "modifySuccess");
		
		return "redirect:/cat/infoboard/list";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("ID") int ID, RedirectAttributes rttr) throws Exception{
		
		log.info("delete_ID = {}", ID);
		
		service.delete(ID);
		rttr.addFlashAttribute("msg", "deleteSuccess");
		
		return "redirect:/cat/infoboard/list";
	}
	
//	@ResponseBody
//    @RequestMapping(value = "/dislike_like", method = RequestMethod.POST, produces = "application/json")
//    public String dislike_like(HttpSession session, HttpServletRequest httpRequest) throws Exception {
//		
////		String sessionid = (String) session.getAttribute("USER_ID");
////		int USER_ID = ((CatInfoboardVO) httpRequest.getSession().getAttribute("USER_ID")).getUSER_ID();
//		int board = Integer.parseInt(httpRequest.getParameter("id"));
//		int type = Integer.parseInt(httpRequest.getParameter("type"));
//		
//		LikeVO likevo = new LikeVO();
//		//likevo.setUSER_ID(USER_ID);
//		likevo.setCOMMENT_ID(board);
//		likevo.setDISLIKE_LIKE(type);
//				
//		if(type == 1) {
//			System.out.println("1");
//			String msg = service.reply_check(likevo);
//			return msg;
//		}else {
//			System.out.println("0");
//			String msg = service.reply_check(likevo);
//			return msg;
//		}
//	}
	
}
