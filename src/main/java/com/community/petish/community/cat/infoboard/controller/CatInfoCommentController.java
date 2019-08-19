package com.community.petish.community.cat.infoboard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.community.petish.community.cat.infoboard.domain.Criteria;
import com.community.petish.community.cat.infoboard.domain.CatInfoCommentVO;
import com.community.petish.community.cat.infoboard.domain.CatInfoCommentDTO;
import com.community.petish.community.cat.infoboard.service.CatInfoCommentService;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.log4j.Log4j;

@RequestMapping("/cat/infoboard/comments")
@RestController
@Log4j
public class CatInfoCommentController {

  @Autowired
  private CatInfoCommentService catInfoCommentService;

  //댓글 전체 조회
  @RequestMapping(value="/commentList", method= RequestMethod.GET, produces="application/json;charset=UTF-8")
  @ResponseBody
  public String getCommetListJSON(Criteria cri, CatInfoCommentVO comment) {
    System.out.println("getCommentListJSON Start!!!!!!!!");
    log.info("pageNum="+cri.getPageNum());
    System.out.println("commentPostID="+comment.getPOST_ID());
    
    
    List<CatInfoCommentDTO> commentDTOList = catInfoCommentService.getCommentList(cri, comment.getPOST_ID());
    System.out.println("commentDTOList="+commentDTOList);
    
    for(int i=0; i<commentDTOList.size(); i++) {
      CatInfoCommentDTO commentDTO = commentDTOList.get(i);

        int count = catInfoCommentService.getCommentCnt(comment.getPOST_ID());

        commentDTO.setCOUNT(count);
    }
    String str = "";

    ObjectMapper mapper = new ObjectMapper();
    try {
      System.out.println("commentDTOList="+commentDTOList);
      str = mapper.writeValueAsString(commentDTOList);
      System.out.println("str="+str);
    }
    catch(Exception e) {
      System.out.println("first() mapper:"+e.getMessage());
    }

    return str;
  }

  //댓글 조회
  @RequestMapping(value = "{id}", method= RequestMethod.GET, produces="application/json;charset=UTF-8")
  @ResponseBody
  public String getComment(@PathVariable("commentID") Long commentID) {

    CatInfoCommentVO commentVo = catInfoCommentService.getComment(commentID);

    System.out.println("getCommentVO="+commentVo.toString());

    String str = "";

    ObjectMapper mapper = new ObjectMapper();
    try {
      str = mapper.writeValueAsString(commentVo);
      System.out.println("str="+str);
    }
    catch(Exception e) {
      System.out.println("first() mapper:"+e.getMessage());
    }

    return str;
  }

  //댓글 추가
  @RequestMapping(value = "/insertComment", method= RequestMethod.POST, produces="application/json;charset=UTF-8")
  @ResponseBody
  public Map<String, Object> insertComment(CatInfoCommentVO commentVO) {
	  System.out.println("insertCommentStart!!!!!");
	  
    Map<String, Object> retVal = new HashMap<String, Object>();
    try {
      int res = catInfoCommentService.insertComment(commentVO);
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
      value = "modifyComment/{commentID}",
      consumes = "application/json",
      produces = {MediaType.TEXT_PLAIN_VALUE })
  public ResponseEntity<String> modifyComment(@RequestBody CatInfoCommentVO commentVo, @PathVariable("commentID") Long commentID) {
    commentVo.setID(commentID);

    System.out.println("id="+commentVo.getID());
    System.out.println("modify="+commentVo.getCONTENT());

    return catInfoCommentService.modifyComment(commentVo) == 1
        ? new ResponseEntity<>("success", HttpStatus.OK)
        : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
  }

  //댓글 삭제
  @RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
      value = "removeComment/{commentID}",
      consumes = "application/json",
      produces = {MediaType.TEXT_PLAIN_VALUE })
  public ResponseEntity<String> removeComment(@PathVariable("commentID") Long commentID) {

    System.out.println("remove="+commentID);

    return catInfoCommentService.removeCommet(commentID) == 1
        ? new ResponseEntity<>("success", HttpStatus.OK)
        : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
  }


}
