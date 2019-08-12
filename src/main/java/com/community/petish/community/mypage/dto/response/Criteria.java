
package com.community.petish.community.mypage.dto.response;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class Criteria {
	private int pageNum;
	private int amount;
	private long user_id;
	
	public Criteria() {
		this(1,10,0);
	}
	
	public Criteria(int pageNum, int amount, long user_id) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.user_id = user_id;
	}
	
}
