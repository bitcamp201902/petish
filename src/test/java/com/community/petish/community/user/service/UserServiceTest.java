package com.community.petish.community.user.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertThrows;

import com.community.petish.community.user.service.UserService;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.community.petish.community.user.domain.User;
import com.community.petish.community.user.dto.request.LoginUserParams;
import com.community.petish.community.user.dto.request.SaveUserParams;
import com.community.petish.community.user.dto.response.LoginedUser;
import com.community.petish.community.user.dto.response.UserListResponse;
import com.community.petish.community.user.exception.NotLoginedException;
import com.community.petish.community.user.exception.PasswordNotMatchException;
import com.community.petish.community.user.exception.UserNotFoundException;
import com.community.petish.community.user.mapper.UserMapper;

import lombok.extern.slf4j.Slf4j;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/spring-security.xml"})
@Slf4j
public class UserServiceTest {

	
	@Autowired
  UserService userService;
	
	@Autowired
	UserMapper userMapper;
	
	@AfterEach
	void deleteUsers() {
		userMapper.deleteAll();
	}
	
	@Test
	void bcryptEncoderLearningTest() {
		/* Given: bcryptEncoder로 패스워드를 암호화했을 떄 암호화된 패스워드는 일치하지 않는다. */
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		String password = "장재주짱";
		
		String encodedPassword1 = bCryptPasswordEncoder.encode(password);
		String encodedPassword2 = bCryptPasswordEncoder.encode(password);
		String encodedPassword3 = bCryptPasswordEncoder.encode(password);
		String encodedPassword4 = bCryptPasswordEncoder.encode(password);
		String encodedPassword5 = bCryptPasswordEncoder.encode(password);
		
		System.out.println("encodedPassword : " + encodedPassword1);
		System.out.println("encodedPassword : " + encodedPassword2);
		System.out.println("encodedPassword : " + encodedPassword3);
		System.out.println("encodedPassword : " + encodedPassword4);
		System.out.println("encodedPassword : " + encodedPassword5);
		
		assertThat(encodedPassword1).isNotEqualTo(encodedPassword2);
		
		/* When: bcryptEncoder 내부에 있는 matches라는 함수를 이용하면, Password는 일치한다. */
		assertThat(bCryptPasswordEncoder.matches(password, encodedPassword1)).isTrue();
		assertThat(bCryptPasswordEncoder.matches(password, encodedPassword2)).isTrue();
		assertThat(bCryptPasswordEncoder.matches(password, encodedPassword3)).isTrue();
		assertThat(bCryptPasswordEncoder.matches(password, encodedPassword4)).isTrue();
		assertThat(bCryptPasswordEncoder.matches(password, encodedPassword5)).isTrue();
		
		
	}
	
	@Test
	void saveUserTest() {
		String imgaddr = "https://image.fmkorea.com/files/attach/new/20181128/486616/796418645/1413259662/fa0f4a56ff0bc3e2d25ab1f3c6e42fc7.jpeg";
		SaveUserParams saveUserParams = new SaveUserParams("jjj0611@hanmail.net", "1234", "dipord", "서울 동대문구 휘경동 183-108번지", "남자", "/resources/img/user/picture_man.jpg", "dog");

		Long userId = userService.saveUser(saveUserParams);
		
		log.info("새롭게 생성된 유저 아이디 : " + userId);
		
		User resultUser = userService.findById(userId);
		
		assertThat(resultUser.getId()).isEqualTo(userId);
		assertThat(resultUser.getUsername()).isEqualTo(saveUserParams.getUsername());
		assertThat(resultUser.getNickname()).isEqualTo(saveUserParams.getNickname());
	}
	
	@Test
	void findAllTest() {
		
		/* Given : 2명의 유저에 대한 saveUserParams 생성 */
		String imgaddr = "https://image.fmkorea.com/files/attach/new/20181128/486616/796418645/1413259662/fa0f4a56ff0bc3e2d25ab1f3c6e42fc7.jpeg";
		SaveUserParams saveUserParams = new SaveUserParams("jjj0611@hanmail.net", "1234", "dipord", "서울 동대문구 휘경동 183-108번지", "남자", "/resources/img/user/picture_man" , "dog");
		
		String imgaddr2 = "https://image.ytn.co.kr/general/jpg/2017/1018/201710181100063682_d.jpg";
		SaveUserParams saveUserParams2 = new SaveUserParams("djw627@gmail.com", "5678", "djw", "서울 동대문구 휘경동 209번지", "여자", "/resources/img/user/picture_woman.jpg", "cat");
		
		userService.saveUser(saveUserParams);
		userService.saveUser(saveUserParams2);

		/* When : UserService의 모든 유저를 불러오는 getUsers 호출  */
		
		UserListResponse users = userService.getUsers();

		/* Then : 조회된 유저 전체 목록의 크기가 2인지 검증 */
		assertThat(users.getUsers().size()).isEqualTo(2);
		
		log.info("모든 유저 : " + users);

	}
	
	@Test
	void checkNicknameDuplication() {
		String imgaddr = "https://image.fmkorea.com/files/attach/new/20181128/486616/796418645/1413259662/fa0f4a56ff0bc3e2d25ab1f3c6e42fc7.jpeg";
		SaveUserParams saveUserParams = new SaveUserParams("jjj0611@hanmail.net", "1234", "dipord", "서울 동대문구 휘경동 183-108번지", "남자", "/resources/img/user/picture_man.jpg", "dog");
		
		userService.saveUser(saveUserParams);
		
		Boolean isDuplicated = userService.checkNicknameDuplication("dipord");
		
		assertThat(isDuplicated).isEqualTo(true);
		
	}
	
	@Test
	void loginTest() {
		String imgaddr = "https://image.fmkorea.com/files/attach/new/20181128/486616/796418645/1413259662/fa0f4a56ff0bc3e2d25ab1f3c6e42fc7.jpeg";
		SaveUserParams saveUserParams = new SaveUserParams("jjj0611@hanmail.net", "1234", "dipord", "서울 동대문구 휘경동 183-108번지", "남자", "/resources/img/user/picture_man.jpg" , "dog");
		
		Long userId = userService.saveUser(saveUserParams);
		
		LoginUserParams loginUserParams = new LoginUserParams("jjj0611@hanmail.net", "1234");
		
		MockHttpSession session = new MockHttpSession();
		
		userService.login(loginUserParams, session);
		
		LoginedUser loginedUser = (LoginedUser) session.getAttribute("LOGIN_USER");
		
		assertThat(loginedUser.getId()).isEqualTo(userId);
		assertThat(loginedUser.getUsername()).isEqualTo("jjj0611@hanmail.net");
		assertThat(loginedUser.getNickname()).isEqualTo("dipord");
	}
	
	@Test
	void wrongLoginTest() {
		String imgaddr = "https://image.fmkorea.com/files/attach/new/20181128/486616/796418645/1413259662/fa0f4a56ff0bc3e2d25ab1f3c6e42fc7.jpeg";
		SaveUserParams saveUserParams = new SaveUserParams("jjj0611@hanmail.net", "1234", "dipord", "서울 동대문구 휘경동 183-108번지", "남자", "/resources/img/user/picture_man.jpg" , "dog");
		
		Long userId = userService.saveUser(saveUserParams);
		
		LoginUserParams wrongPasswordLoginUserParams = new LoginUserParams("jjj0611@hanmail.net", "1235");
		
		MockHttpSession session = new MockHttpSession();
		
		assertThrows(PasswordNotMatchException.class, () -> userService.login(wrongPasswordLoginUserParams, session));
		
		LoginUserParams wrongUsernameLoginUserParams = new LoginUserParams("jiwoo@naver.com", "1234");
		assertThrows(UserNotFoundException.class, () -> userService.login(wrongUsernameLoginUserParams, session));
		
	}
	
	@Test
	void logoutTest() {
		String imgaddr = "https://image.fmkorea.com/files/attach/new/20181128/486616/796418645/1413259662/fa0f4a56ff0bc3e2d25ab1f3c6e42fc7.jpeg";
		SaveUserParams saveUserParams = new SaveUserParams("jjj0611@hanmail.net", "1234", "dipord", "서울 동대문구 휘경동 183-108번지", "남자", "/resources/img/user/picture_man.jpg" , "dog");
		
		Long userId = userService.saveUser(saveUserParams);
		
		LoginUserParams loginUserParams = new LoginUserParams("jjj0611@hanmail.net", "1234");
		
		MockHttpSession session = new MockHttpSession();
		
		userService.login(loginUserParams, session);
				
		userService.logout(session);
	
		assertThat(session.isInvalid()).isEqualTo(true);

	}
	
	@Test
	void wrongLogoutTest() {
		MockHttpSession session = new MockHttpSession();
		assertThrows(NotLoginedException.class, () -> userService.logout(session));
	}
	
}
