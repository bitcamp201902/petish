<%@page import="com.community.petish.community.mypage.dto.response.UserResponseDTO_Mypage"%>
<%@page
	import="com.community.petish.community.mypage.dto.request.UserModifyRequestDTO_Mypage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	UserResponseDTO_Mypage dto = (UserResponseDTO_Mypage) request.getAttribute("dto");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원정보 수정</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/resources/css/mypage/mypage.css">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="/resources/js/mypage/mypage.js"></script>
<script src="/resources/js/boardMap/write_map.js"></script>

<script src="/commons/kakaomap.jsp"></script>
<link rel="stylesheet" href="/resources/css/commons/kakaomap.css"></link>

</head>

<body>
	<div id="all">

		<%@ include file="/WEB-INF/views/commons/top.jspf"%>

		<!-- 테이블 -->
		<div id="content">
			<div class="container">
				<div id="checkout" style="margin-bottom: 2cm;">
					<div style="max-width: 20cm; margin: auto;">
						<!-- <form method="get" action=""> -->

						<h3 style="margin-top: 10%; font-weight: 700;">회원정보 수정</h3>
						<div class="memberInfo" style="margin-bottom: 1cm;">
							<div style="margin: 0.5cm;">
								<form action="/mypage/uploadFormAction" method="post"
									enctype="multipart/form-data">
									<img class="profile"
										src="<%=dto.getPicture()%>"
										style="margin-right: 30px;">프로필 사진 변경 <input type="file"
										name="uploadFile" multiple /> <input type="hidden" name="id"
										value=<%=dto.getId()%>>
									<button id='uploadBtn'>submit</button>
								</form>
							</div>
						</div>
						<form action="/mypage/modifyUserInfo" method="POST">
							<input type="hidden" value=<%=dto.getId()%> name="id">
							<table class="col-md-12">
								<tr style="height: 1.5cm;">
									<td class="font-grey"><label
										class="control-label col-md-8">이메일</label></td>
									<td style="padding-right: 15px;"><input type="text"
										value=<%=dto.getUsername()%> readonly class="form-control"></td>
								</tr>
								<tr style="height: 1.5cm;">
									<td rowspan="2" class="font-grey"><label
										class="control-label col-md-10">비밀번호</label></td>
									<td style="padding-right: 15px;"><input type="password"
										placeholder="새 비밀번호 입력" class="form-control" name="password"
										id="passwordInput" onkeyup="handledPasswordMatchCheck()">
								</tr>
								<tr style="height: 1.5cm;">
									<td style="padding-right: 15px;"><input type="password"
										placeholder="새 비밀번호 확인" class="form-control"
										name="passwordCheck" id="passwordCheckInput"
										onkeyup="handledPasswordMatchCheck()">
								<label id="passwordCheckFalseResult" class="inp"
									style="display: none; margin-top: 0px;"> <font size="1"
									color='red'>비밀번호가 일치하지 않습니다.</font>
								</label>
								</tr>
								<tr style="height: 1.5cm;">
									<td class="font-grey"><label
										class="control-label col-md-8">닉네임</label></td>
									<td>
									<div>
									<input type="text"
										name="nickname"
										value=<%=dto.getNickname()%> id="nicknameInput" style='width:70%;height:0.961cm;'>
									<input type="button" class="btn btn-template-outlined joinBtn" id="nicknameDuplicationCheckButton" value="중복확인" style='width:2cm;'></div>
										<input type="hidden" id="nicknameDuplicationCheckResult" name="nicknameDuplicationCheckResult" value="false">
										<input type="hidden" id="nicknameDuplicateCheck" name="nicknameDuplicateCheck" value="false">
									<label id="nicknameCheckFalseResult" class="inp" style="display:none; margin-top:0px;">
									<font size="1" color='red'>이미 존재하는 nickname입니다.</font>
									</label>
									</td>
								</tr>
								<tr style="height: 1.5cm;">
									<td class="font-grey"><label
										class="control-label col-md-8">휴대폰</label></td>
									<td><input type="button" value="휴대폰인증"> <input
										type="hidden" value="" name="phone"></td>
								</tr>
								<tr style="height: 1.5cm;">
									<td class="font-grey"><label
										class="control-label col-md-8">주소</label></td>
									<td><div>
											<input type="text" style="width: 70%; height: 0.961cm;"
												name="address" id="place" value="<%=dto.getAddress()%>"
												readonly> 
											<input class="btn btn-template-outlined joinBtn" onclick="openZipcode()" value="주소검색" style='width:2cm;'>
										</div></td>
								</tr>
								<tr style="height: 1.5cm;" class="gender">
									<td class="font-grey"><label
										class="control-label col-md-8">성별</label></td>
									<td><label class="form-check-label"
										style="margin-left: 20px; margin-right: 30px;"> <input
											class="form-check-input" type="radio" name="gender" value="여자"
											<%if (("여자").equals(dto.getGender())) {
				out.print("checked");
			}%>>여자
									</label> <label class="form-check-label"> <input
											class="form-check-input" type="radio" name="gender" value="남자"
											<%if (("남자").equals(dto.getGender())) {
				out.print("checked");
			}%>>남자
									</label></td>
								</tr>
								<tr style="height: 1.5cm;">
									<td class="font-grey"><label
										class="control-label col-md-8">관심사</label></td>
									<td><label class="form-check-label"
										style="margin-left: 20px; margin-right: 30px;"> <input
											class="form-check-input" type="radio" name="concern_id"
											<%if (1 == dto.getConcern_id())
				out.print("checked");%>
											value="1">강아지
									</label> <label class="form-check-label"
										style="margin-left: 20px; margin-right: 30px;"> <input
											class="form-check-input" type="radio" name="concern_id"
											<%if (2 == dto.getConcern_id())
				out.print("checked");%>
											value="2">고양이
									</label> <label class="form-check-label"
										style="margin-left: 20px; margin-right: 30px;"> <input
											class="form-check-input" type="radio" name="concern_id"
											<%if (3 == dto.getConcern_id())
				out.print("checked");%>
											value="3">기타
									</label></td>
								</tr>
							</table>
							<div
								class="box-footer d-flex flex-wrap align-items-center justify-content-between"
								style="margin-top: 1cm;">
								<div class="left-col">
									<button type="button" class="btn btn-outline-dark">
										회원탈퇴
									</button>
								</div>

								<div class="right-col">
									<button type="submit" class="btn btn-outline-primary" id="modifyBtn">
										수정하기
									</button>
								</div>
							</div>
						</form>
						<!-- </form> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="/resources/js/top/non-logined.js"></script>
	<script>
	$("#passwordInput").on("propertychange change keyup paste input", handledPasswordMatchCheck);
    $("#passwordCheckInput").on("propertychange change keyup paste input", handledPasswordMatchCheck);
    $("#nicknameDuplicationCheckButton").on("click", checkNicknameDuplication);

	function handledPasswordMatchCheck(){
			var password = $('#passwordInput').val();
			var passwordCheck = $('#passwordCheckInput').val();

			var password = $('#passwordInput').val();
			var passwordCheck = $('#passwordCheckInput').val();

			if ( password !== passwordCheck ) {
				$('#passwordCheckFalseResult').css("display", "inline-block");
				$("#modifyBtn").attr("disabled", "disabled");
			} else {
				$('#passwordCheckFalseResult').css('display', 'none');
				$("#modifyBtn").removeAttr("disabled");
			}
	}
	
	function checkNicknameDuplication() {
		var nickname = $("#nicknameInput").val();
		var nicknameData = { "nickname" : nickname };

		$.ajax({
			type: "GET",
			url: "/api/users/duplicate/nickname",
			data: nicknameData,
			success: function(data, status, xhr) {
				if (data === true) {
					$('#nicknameCheckFalseResult').css('display', 'inline-block');
					$("#modifyBtn").attr("disabled", "disabled");
				} else {
					alert("사용하실 수 있는 nickname입니다.");
					$('#nicknameCheckFalseResult').css('display', 'none');
					$('#nicknameDuplicationCheckResult').val('true');
					$("#modifyBtn").removeAttr("disabled");
				}
			}
		})
	};
	
	$("#nicknameDuplicationCheckButton").on("click", checkNicknameDuplication);
	
	var a = $("#nicknameInput");
	a.blur(function(){
		if("<%=loginedUser.getNickname()%>" != a.val()){
			$("#modifyBtn").attr("disabled", "disabled");
			//버튼 비활성화
		}else{
			$("#modifyBtn").removeAttr("disabled");
		}
	});
	</script>

</body>
</html>