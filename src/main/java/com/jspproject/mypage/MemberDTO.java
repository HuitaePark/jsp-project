package com.jspproject.mypage;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberDTO {
	private String memberid;
	private String password;
	private String name;
	private String email;
	private String tel;
	private String addr;

}
