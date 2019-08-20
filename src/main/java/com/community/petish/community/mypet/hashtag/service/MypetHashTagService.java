package com.community.petish.community.mypet.hashtag.service;

import com.community.petish.community.mypet.post.dto.request.MypetPostListCriteria;

import java.util.List;

public interface MypetHashTagService {

    void saveHashTag(String content, Long postId);

    List<Long> getPostListByHashTag(MypetPostListCriteria mypetPostListCriteria);

}
