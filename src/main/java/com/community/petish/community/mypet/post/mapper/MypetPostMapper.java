package com.community.petish.community.mypet.post.mapper;

import java.util.List;

import com.community.petish.community.mypet.post.domain.MypetPost;
import com.community.petish.community.mypet.post.domain.MypetPostLike;
import com.community.petish.community.mypet.post.dto.request.MypetPostListCriteria;
import com.community.petish.community.mypet.post.dto.request.SaveMypetPostParams;
import com.community.petish.community.mypet.post.dto.response.MypetPostDetailResponse;
import com.community.petish.community.mypet.post.dto.response.MypetPostLikeResponse;
import org.apache.ibatis.annotations.Param;

public interface MypetPostMapper {

	Long savePost(SaveMypetPostParams saveMypetPostParams);
	
	List<MypetPost> findByPage(MypetPostListCriteria mypetPostListCriteria);
	
	Long countLikes(Long postId);
	
	Long countComments(Long postId);
	
	MypetPost findById(Long postId);
	
	MypetPostLike findIsLikePressedOnPost(@Param("postId") Long postId, @Param("userId") Long userId);
	
	List<MypetPostLikeResponse> findLikesByPostId(Long postId);
	
	Long saveLike(@Param("postId") Long postId, @Param("userId") Long userId);
	
	Long updateLikeNotDeleted(@Param("postId") Long postId, @Param("userId") Long userId);
	
	Long updateLikeDeleted(@Param("postId") Long postId, @Param("userId") Long userId);
	
	Long countAll();

}
