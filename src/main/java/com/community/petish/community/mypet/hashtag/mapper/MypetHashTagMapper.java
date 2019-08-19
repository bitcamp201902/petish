package com.community.petish.community.mypet.hashtag.mapper;

import com.community.petish.community.mypet.post.dto.request.MypetPostListCriteria;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MypetHashTagMapper {

    void save(@Param("hashTag") String hashTag, @Param("postId") Long postId);

    List<Long> getPostIdsByHashTag(MypetPostListCriteria mypetPostListCriteria);

    Long countAllByHashTag(String hashtag);
}
