package com.community.petish.community.mypet.post.mapper;

import java.util.Set;

public interface MypetHashTagMapper {

    void save(Set<String> hashTagSet, Long postId);
}
