package com.community.petish.community.dog.missingboard.domain;

/*
 create table attach_tb(
        uuid varchar2(100) not null, --PK
        uploadPath varchar2(200) not null,
        fileName varchar2(100) not null,
        filetype char(1) default 'I',
        postid number(10,0) --FK
        );
        alter table attach_tb add constraint pk_attach primary key(uuid);
        alter table attach_tb add constraint fk_post_attach foreign key(postid)
        references dog_lost_post_tb;
        COMMIT; 
 */

import lombok.Data;
@Data
public class AttachFileVO {
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	private Long postId;
}
