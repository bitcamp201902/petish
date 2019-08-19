package com.community.petish.community.mypet.hashtag.service;

import com.community.petish.community.mypet.hashtag.mapper.MypetHashTagMapper;
import com.community.petish.community.mypet.post.dto.request.MypetPostListCriteria;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Slf4j
@Service("mypetHashTagService")
public class MypetHashTagServiceImpl implements MypetHashTagService {

    @Autowired
    MypetHashTagMapper mypetHashTagMapper;

    @Override
    public void saveHashTag(String content, Long postId) {
        Pattern hashTagPattern = Pattern.compile("\\#([0-9a-zA-Z가-힣_]*)");
        Matcher matcher = hashTagPattern.matcher(content);

        Set<String> hashTagSet = new HashSet<String>();
        String extractedHashTag = null;
        while(matcher.find()) {
            extractedHashTag = replcateSpecialCharacter(matcher.group());

            if(extractedHashTag != null) {
                extractedHashTag = extractedHashTag.substring(1);
                log.info("최종 추출 해시태그 = {}", extractedHashTag);
                if( !extractedHashTag.equals("")) {
                    hashTagSet.add(extractedHashTag);
                }
            }
        }

        log.info("hashTag confirm = {}", hashTagSet);

        hashTagSet.forEach(
                hashtag -> mypetHashTagMapper.save(hashtag, postId)
        );
    }

    private String replcateSpecialCharacter(String originalHashTag) {
        log.info("old hashtag = {}", originalHashTag);
        String hashTagRemovedSpecialCharactersFromOriginalTag = StringUtils.replace(originalHashTag, "-+=!@#$%^&*()[]{}|\\;:'\"<>,.?/~`） ","");

        log.info("replactd hashtag = {} ", hashTagRemovedSpecialCharactersFromOriginalTag);
        if (hashTagRemovedSpecialCharactersFromOriginalTag.length() < 1) {
            return null;
        }

        return hashTagRemovedSpecialCharactersFromOriginalTag;
    }

    @Override
    public List<Long> getPostListByHashTag(MypetPostListCriteria mypetPostListCriteria) {

        List<Long> postIdList = mypetHashTagMapper.getPostIdsByHashTag(mypetPostListCriteria);

        return postIdList;
    }

}
