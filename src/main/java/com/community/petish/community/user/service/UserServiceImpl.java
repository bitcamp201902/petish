package com.community.petish.community.user.service;

import java.util.Objects;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import com.community.petish.community.user.domain.User;
import com.community.petish.community.user.dto.request.LoginUserParams;
import com.community.petish.community.user.dto.request.SaveUserParams;
import com.community.petish.community.user.dto.response.LoginedUser;
import com.community.petish.community.user.dto.response.UserDetailResponse;
import com.community.petish.community.user.dto.response.UserListResponse;
import com.community.petish.community.user.exception.ExistingUserException;
import com.community.petish.community.user.exception.NotEmailAddress;
import com.community.petish.community.user.exception.NotLoginedException;
import com.community.petish.community.user.exception.PasswordNotMatchException;
import com.community.petish.community.user.exception.UserNotFoundException;
import com.community.petish.community.user.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    JavaMailSenderImpl mailService;

	@Override
	public Long saveUser(SaveUserParams saveUserParams) {
		
		log.info("회원가입 요청 saveUserParams = {} ", saveUserParams );
		
		String encodedPassword = passwordEncoder.encode(saveUserParams.getPassword());
		saveUserParams.setPassword(encodedPassword);

		String picture;
		if ( saveUserParams.getGender().equals("남자")) {
		  picture = "/resources/img/user/picture_man.jpg";
    } else {
		  picture = "/resources/img/user/picture_woman.jpg";
    }

    saveUserParams.setPicture(picture);

		log.info("회원 가입 시도 saveUserParams = {}, picture = {}", saveUserParams, picture);

		Long userId =  userMapper.save(saveUserParams);
		return userId;
	}
	
	@Override
	public UserListResponse getUsers() {
		UserListResponse userListResponse = new UserListResponse(userMapper.findAll());
	  return userListResponse;
	}
	
	@Override
	public UserDetailResponse getUser(Long userId) {
		User user = userMapper.findById(userId);
		UserDetailResponse userDetailResponse = new UserDetailResponse(user.getId(), user.getUsername(), user.getNickname(), user.getGender(), user.getPicture());
		return userDetailResponse;
	}
	
	@Override
	public Boolean checkNicknameDuplication(String nickname) {
		String nicknameFromDB = userMapper.findByNickname(nickname);
		Boolean isDuplicated = nicknameFromDB != null;
		return isDuplicated;
	}

	@Override
	public void sendCertificateNumber(String username, HttpSession session) {
		if ( !username.contains("@") ) {
			throw new NotEmailAddress();
		}

		User user = userMapper.findByUsername(username);

	    if ( user != null ) {
	        throw new ExistingUserException();
        }

	    String certificateNumber = String.format("%06d", (int) ( Math.random() * 100000 ) );
	    String mailContent = "귀하의 인증 번호는 " + certificateNumber + "입니다.";

		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
	    	@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
	    		final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
	    		helper.setFrom("petishBit@gmail.com");
	    		helper.setTo(username);
	    		helper.setSubject("petish 귀하의 인증 번호입니다.");
	    		helper.setText(mailContent, true);
	    	}
	    };

	    mailService.send(preparator);
		session.setAttribute("CERTIFICATE_NUMBER", certificateNumber);
		session.setAttribute("USERNAME", username);

		log.info("이메일 인증 요청 username = {}, 메일 내용 = {}", username, mailContent);

	}

	@Override
	public Boolean checkCertificateNumber(String username, String certificateNumber, HttpSession session) {
		String certificateNumberFromApi = (String) session.getAttribute("CERTIFICATE_NUMBER");
		String usernameFromApi = (String) session.getAttribute("USERNAME");
		Boolean isCertificated =  certificateNumber.equals(certificateNumberFromApi) && username.equals(usernameFromApi);
		log.info("인증 번호 확인 certificate number = {}, certificate number from api = {}, 인증 성공 = {}", certificateNumber, certificateNumberFromApi, isCertificated);
		if (isCertificated) {
		  session.invalidate();
    }
		return isCertificated;
	}

	@Override
	public void login(LoginUserParams loginUserParams, HttpSession session) {
		String username = loginUserParams.getUsername();
		User user = userMapper.findByUsername(username);
		
		if (user == null) {
			throw new UserNotFoundException("잘못된 아이디입니다.");
		}
		
		if (user.matchPassword(loginUserParams.getPassword(), passwordEncoder)) {
			log.info("로그인 성공! userParams = {}", loginUserParams);
			LoginedUser userSession = new LoginedUser(user);
			session.setAttribute("LOGIN_USER", userSession);
			return;
		}
		
		throw new PasswordNotMatchException();
		
	}
	
	@Override
	public void logout(HttpSession session) {
		
		log.info("로그아웃");

		LoginedUser loginedUser = (LoginedUser) session.getAttribute("LOGIN_USER");
		if (Objects.isNull(loginedUser)) {
			throw new NotLoginedException();
		}
		
		session.invalidate();
	}

  @Override
	public User findById(Long id) {

		User user = userMapper.findById(id);
		
		if (user == null) {
			throw new UserNotFoundException("해당하는 유저를 찾을 수 없습니다. userId : " + id);
		}
		
		return user;
	}
}
