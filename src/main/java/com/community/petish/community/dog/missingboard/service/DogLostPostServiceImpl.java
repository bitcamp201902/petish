package com.community.petish.community.dog.missingboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.community.petish.community.dog.missingboard.domain.AttachFileVO;
import com.community.petish.community.dog.missingboard.dto.Criteria;
import com.community.petish.community.dog.missingboard.dto.DogLostPostRequestWriteDTO;
import com.community.petish.community.dog.missingboard.dto.DogLostPostResponseDetailDTO;
import com.community.petish.community.dog.missingboard.dto.DogLostPostResponseListDTO;
import com.community.petish.community.dog.missingboard.mapper.AttachFileMapper;
import com.community.petish.community.dog.missingboard.mapper.DogLostCommentMapper;
import com.community.petish.community.dog.missingboard.mapper.DogLostPostMapper;

@Service
public class DogLostPostServiceImpl implements DogLostPostService{
	
	@Autowired
	private DogLostPostMapper mapper;
	
	@Autowired
	private AttachFileMapper attachMapper;
	
	@Autowired
	private DogLostCommentMapper commentMapper;
	
	//게시글 수
	@Override
	public int getPostCount(Criteria cri) {
		return mapper.getPostCount(cri);
	}
	
	//게시글 리스트
	@Override
	public List<DogLostPostResponseListDTO> getPostList(Criteria cri){
		
		System.out.println("[Service]Cri : " + cri);
		
		int commentCount = 0;
		List<DogLostPostResponseListDTO> listDTO = mapper.getDogLostList(cri);
		
		for(int i=0; i<listDTO.size(); i++) {
			DogLostPostResponseListDTO dto = listDTO.get(i);
			commentCount = commentMapper.getCommentCount(dto.getId());
			dto.setCommentCount(commentCount);
		}
		return listDTO;
	}
	
	// 게시글 조회
	@Override
	public DogLostPostResponseDetailDTO getPostDetail(Long id) {
		return mapper.getPostDetail(id);
	}
	
	// 게시글 조회 수 갱신
	public int updateViewCount(Long id) {
		return mapper.updateViewCount(id);
	}

	// 게시글 작성
	@Transactional
	@Override
	public void register(DogLostPostRequestWriteDTO dto) {
		
		System.out.println("[Service] register");

		mapper.insertPost(dto); //게시글 저장
		
		if(dto.getAttachList() == null || dto.getAttachList().size() <=0 ) {
			return;
		}
		
		//사진 첨부
		try {			
		dto.getAttachList().forEach(attach -> {			
			System.out.println("[UUID]" + attach.getUuid());
			System.out.println("[attach] : " + attach);			
			
			Long id = dto.getId();			
			attach.setPostId(id);			
			System.out.println("[PostId()]" + attach.getPostId());
			
			attachMapper.insert(attach); //사진 저장
		});	
		}
		catch(Exception e) {
			e.printStackTrace();
		}		
		
		//쪽지 전송
		String address = dto.getDog_lost_address();
		
		Long id = dto.getId(); //게시글 번호
		Long senderId = dto.getUser_id(); //발신자
		
		String postURL = "/dog/missingboard/"+id; //실종견 게시글 주소
		//String content = "["+ address + "]" + " 실종견 게시글이 등록되었습니다.\r" + postURL;
		
		StringBuffer sb = new StringBuffer();
		sb.append("["+ address + "]" );
		sb.append(System.getProperty("line.separator"));
		sb.append("실종견 게시글이 등록되었습니다.");
		sb.append(System.getProperty("line.separator"));
		sb.append("<a href='");
		sb.append(postURL);
		sb.append("'>게시글 보기" + "</a>");
		
		String content = sb.toString();
		System.out.println("content : " + content);
		
		int messageResult = mapper.sendMessage(id, content, senderId);
		System.out.println("보낸 매세지 : " + messageResult);
		
		if(messageResult >= 0) {
			System.out.println("쪽지 전송 성공");
		}
		else {
			System.out.println("쪽지 전송 실패");
		}	
	}
	
	// 게시글 수정
	@Override	
	public int modify(DogLostPostRequestWriteDTO dto) {		
		//첨부 사진 삭제
		attachMapper.deleteAll(dto.getId());		
		//게시글 수정
		int result = mapper.updatePost(dto);
		System.out.println("modify result : " + result);
		
		if(result == 1 && dto.getAttachList().size() > 0) {
			dto.getAttachList().forEach(attach -> {
				attach.setPostId(dto.getId());
				//첨부 사진 등록
				attachMapper.insert(attach);
			});			
		}		
		return result;
	}
	
	//게시글 삭제
	@Transactional
	@Override
	public int delete(Long id) {
		
		attachMapper.deleteAll(id); //첨부 사진 삭제 
		
		return mapper.deletePost(id); //게시글 삭제
	}
	
	//사진 첨부
	@Override
	public List<AttachFileVO> getAttachList(Long postId) {

		System.out.println("get Attach list by postId" + postId);

		return attachMapper.findByPostId(postId);
	}	
}