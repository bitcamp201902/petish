package com.community.petish.community.mypet.comment.dto.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class UpdateMypetCommentParams {

    private Long commentId;
    private String content;

}
