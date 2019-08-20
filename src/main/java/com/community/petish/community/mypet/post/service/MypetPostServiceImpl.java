package com.community.petish.community.mypet.post.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import com.community.petish.community.mypet.hashtag.mapper.MypetHashTagMapper;
import com.community.petish.community.mypet.post.domain.MypetPost;
import com.community.petish.community.mypet.post.domain.MypetPostLike;
import com.community.petish.community.mypet.post.dto.request.MypetPostListCriteria;
import com.community.petish.community.mypet.post.dto.request.SaveMypetPostParams;
import com.community.petish.community.mypet.post.dto.response.MypetPostDetailResponse;
import com.community.petish.community.mypet.post.dto.response.MypetPostLikeListResponse;
import com.community.petish.community.mypet.post.dto.response.MypetPostLikeResponse;
import com.community.petish.community.mypet.post.dto.response.MypetPostSummary;
import com.community.petish.community.mypet.post.dto.response.MypetPostSummaryList;
import com.community.petish.community.mypet.post.mapper.MypetPostMapper;
import com.community.petish.community.user.dto.response.LoginedUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("mypetPostService")
public class MypetPostServiceImpl implements MypetPostService{
	
	@Autowired
  	MypetPostMapper mypetPostMapper;

	@Autowired
	MypetHashTagMapper mypetHashTagMapper;

	@Override
	public Long savePost(MultipartHttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		LoginedUser user = (LoginedUser) session.getAttribute("LOGIN_USER");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		List<MultipartFile> files = request.getFiles("file");
		Long userId = user.getId();
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/img/mypet/");
		log.info("사진 업로드 요청", files.size(), "장");
		log.info(uploadPath, "로 업로드");
		
		List<String> imgFileNames = new ArrayList<>();
		
		for (MultipartFile file : files) {
			String fileName = file.getOriginalFilename();
			String originalFileExtension = fileName.substring(fileName.lastIndexOf("."));
			String storedFileName = UUID.randomUUID().toString().replace("-",  "") + originalFileExtension;
			
			if (file.getSize() != 0) {
				file.transferTo(new File(uploadPath + storedFileName));
				imgFileNames.add("/resources/img/mypet/" + storedFileName);
			}
			
		}
		
		String images = String.join(",", imgFileNames);

		SaveMypetPostParams saveMypetPostParams = new SaveMypetPostParams(title, content, images, userId);
		
		log.info("saveMypetPostParams = {}", saveMypetPostParams);
		
		Long postId = mypetPostMapper.savePost(saveMypetPostParams);

		return postId;
		
	}
	
	@Override
	public MypetPostSummaryList getPosts(MypetPostListCriteria mypetPostListCriteria) {
		if (Objects.isNull(mypetPostListCriteria.getHashtag())) {

			List<MypetPost> posts = mypetPostMapper.findByPage(mypetPostListCriteria);
            Long mypetPostCount = mypetPostMapper.countAll();
            List<MypetPostSummary> postSummaries =
            posts.stream()
                .map(post ->
                new MypetPostSummary(
                        post.getId(),
                        post.getImage().split(",")[0],
                        mypetPostMapper.countLikes(post.getId()),
                        mypetPostMapper.countComments(post.getId())
                        )
                ).collect(Collectors.toList());

            Integer lastPage = (int) ( Math.ceil(mypetPostCount / mypetPostListCriteria.getAmount().doubleValue()) );

            MypetPostSummaryList mypetPostSummaryList = new MypetPostSummaryList(mypetPostListCriteria, lastPage, postSummaries);

            return mypetPostSummaryList;

		}

		List<Long> postIds = mypetHashTagMapper.getPostIdsByHashTag(mypetPostListCriteria);

		List<MypetPost> posts = postIds.stream()
				.map(postId -> mypetPostMapper.findById(postId))
				.collect(Collectors.toList());

		List<MypetPostSummary> postSummaries =
			posts.stream()
				.map(post ->
					new MypetPostSummary(
						post.getId(),
						post.getImage().split(",")[0],
						mypetPostMapper.countLikes(post.getId()),
						mypetPostMapper.countComments(post.getId())
					)
				).collect(Collectors.toList());

		Long mypetPostCount = mypetHashTagMapper.countAllByHashTag(mypetPostListCriteria.getHashtag());

		Integer lastPage = (int) ( Math.ceil(mypetPostCount / mypetPostListCriteria.getAmount().doubleValue()) );

		MypetPostSummaryList mypetPostSummaryList = new MypetPostSummaryList(mypetPostListCriteria, lastPage, postSummaries);

		return mypetPostSummaryList;

	}

	@Override
	public MypetPostDetailResponse getPost(Long postId) {
		log.info("mypet post 조회 요청 postId={}", postId);
		MypetPost mypetPostFoundByPostId = mypetPostMapper.findById(postId);
		MypetPostDetailResponse mypetPostDetailResponse = MypetPostDetailResponse.generatedByMypetPost(mypetPostFoundByPostId);
		log.info("mypet post 조회 완료 postDetail = {}", mypetPostDetailResponse);
		return mypetPostDetailResponse;
	}

	@Override
	public Boolean getIsLikePressedOnPost(Long postId, HttpSession session) {

		LoginedUser user = (LoginedUser) session.getAttribute("LOGIN_USER");
		
		if ( user == null ) {
			return false;
		}
		
		log.info("mypet post 좋아요 확인 : postId = {}", postId, "loginedUserId = {}", user.getId());
		
		MypetPostLike mypetPostLike = mypetPostMapper.findIsLikePressedOnPost(postId, user.getId());
		
		if (mypetPostLike == null || mypetPostLike.getDeleted() == 1) {
			return false;
		}
		
		return true;
	}
	
	@Override
	public MypetPostLikeListResponse getLikes(Long postId) {
		
		List<MypetPostLikeResponse> likes = mypetPostMapper.findLikesByPostId(postId);
		MypetPostLikeListResponse mypetPostLikeListResponse = new MypetPostLikeListResponse(likes);
		
		log.info("mypet post에 대한 좋아요 조회 요청 완료 postId = {}, mypetPostLikeListResponse = {}", postId, mypetPostLikeListResponse);
		
		return mypetPostLikeListResponse;
		

	}

	@Override
	public Long pressLikeOnPost(Long postId, HttpSession session) {
		LoginedUser user = (LoginedUser) session.getAttribute("LOGIN_USER");
		
		log.info("mypet post 좋아요 요청 postId = {} loginedUserId = {}", postId, user.getId());
		
		MypetPostLike mypetPostLike = mypetPostMapper.findIsLikePressedOnPost(postId, user.getId());
		
		log.info("mypetPostLike = {}", mypetPostLike);
		
		Long mypetPostLikeId = null;
		
		if ( mypetPostLike == null ) {
			mypetPostLikeId = mypetPostMapper.saveLike(postId, user.getId());
			log.info("userId = {} 가 postId = {} 에 대하여 좋아요 생성, likeId = {}", user.getId(), postId, mypetPostLikeId);
		} else if ( mypetPostLike.getDeleted() == 1 ) {
			mypetPostLikeId = mypetPostMapper.updateLikeNotDeleted(postId, user.getId());
			log.info("userId = {} 가 postId = {} 에 대하여 좋아요 다시 누름", user.getId(), postId);
		} else if ( mypetPostLike.getDeleted() == 0 ) {
			mypetPostLikeId = mypetPostMapper.updateLikeDeleted(postId, user.getId());
			log.info("userId = {} 가 postId = {} 에 대하여 좋아요 취소", user.getId(), postId);
		}
		
		return mypetPostLikeId;
	}

}
