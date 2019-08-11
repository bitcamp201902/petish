<<<<<<< HEAD:src/main/java/com/community/petish/community/mypage/dto/response/response/Criteria.java
package com.community.petish.mypage.dto.response;
=======
package com.community.petish.community.mypage.dto.response;
>>>>>>> fda4f2d15939573444b0292410cb1859f5983d84:src/main/java/com/community/petish/community/mypage/dto/response/Criteria.java

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
