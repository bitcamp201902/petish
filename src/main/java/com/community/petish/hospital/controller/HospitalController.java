package com.community.petish.hospital.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.community.petish.hospital.domain.Criteria;
import com.community.petish.hospital.domain.HospitalVO;
import com.community.petish.hospital.domain.PageDTO;
import com.community.petish.hospital.service.HospitalService;

@Controller
@RequestMapping("/hospital")
public class HospitalController {
	@Autowired
	public HospitalService hospitalService;
	
	@RequestMapping("/search")
	public String hospitalSerachForm() {
		return "petish/hospital/main_search";
	}

	@RequestMapping(value="/search/{addr}/{isEmer}/{page}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> gethospitalList(@PathVariable("addr") String addr, @PathVariable("isEmer")boolean isEmer, @PathVariable("page")int page, Model model) {
		List<HospitalVO> list;
		//페이징 설정위해 만드는 객체
		Criteria cri = new Criteria();
		cri.setHospital_addr(addr);
		cri.setPageNum(page);
		cri.setAmount(4);
		
		//해당 시/군 의 해당하는 총개수 구하는 함수
		int total = hospitalService.getTotalCount(addr);
		System.out.println(total);
		PageDTO paging = new PageDTO(cri, total);
		
		//응급 진료 체크박스 체크 안했을때
		if(isEmer==false) {
			list = hospitalService.getListWithPaging(cri);
			//list = hospitalService.gethospitalList(addr);
		}
		//응급진료 체크박스 체크 했을때
		else {
			total = hospitalService.getEmerTotalCount(addr);
			paging = new PageDTO(cri, total);
			list = hospitalService.getEmerListWithPaging(cri);
			//list = hospitalService.getEmerhospitalList(addr);
		}
		
		System.out.println("list="+list);
		System.out.println("paging="+paging);
//		String str ="";
//		ObjectMapper mapper = new ObjectMapper();
//		try {
//			//list json 형태롤변경
//			str = mapper.writeValueAsString(list);
//		}catch(Exception e) {
//			System.out.println("first() mapper : "+ e.getMessage());
//		}
//						
//		return str;
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("paging", paging);
		result.put("list", list);
		return result;
	}
	
	@RequestMapping(value="/{id}", produces="application/json;charset=UTF-8")
	public ModelAndView hospitalDetail(@PathVariable("id") String id) {
		System.out.println("id="+id);
		
		HospitalVO vo = hospitalService.getHospital(id);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("petish/hospital/detail");
		mv.addObject("hospital", vo);
		return mv;
	}
	
	
}
