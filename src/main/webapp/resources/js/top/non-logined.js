$(function() {

    $('#joinFormButton').on("click", hideModal);

	$('#findFormButton').on("click",hideModal);

	$('#loginModalButton').on("click", hideModal);

    $('#login-button').on("click", function(event) {
        handledLoginClick(event);
    });

    $("#usernameCertificationRequestButton").on("click", requestUsernameCertification);

    $("#usernameCertificationCheckButton").on("click", checkUsernameCertificationNumber);

    $('#usernameInput').on("propertychange change keyup paste input", initializeUsernameInput);

    $("#passwordInput").on("propertychange change keyup paste input", handledPasswordMatchCheck);

    $("#passwordCheckInput").on("propertychange change keyup paste input", handledPasswordMatchCheck);

    $("#nicknameDuplicationCheckButton").on("click", checkNicknameDuplication);

    $('#nicknameInput').on("propertychange change keyup paste input", initializeNicknameCheck);

    $('#zipcodeButton').on('click', function(event) {
		openZipcode(event);
	});

    $('#joinButton').on('click', function(event) {
        handledJoinClick(event);
    });

    $('#password_input').on("keyup", function(event) {
        handledPressKey(event);
    });

});

const hideModal = () => {
    $('.modal').modal('hide');
};

const handledLoginClick = (event) => {
    event.preventDefault();

	let username = $("#email_input").val();
	let password = $("#password_input").val();

	if (username === "" || username === null) {
	    alert("username을 입력해주세요.");
		return
	}
	if (password === "" || password === null) {
        alert("password를 입력해주세요.");
		return
	}

	let loginUserParams = {
			"username" : username,
			"password" : password
	};

	$.ajax({
		type: "POST",
		url: "/api/users/login",
		contentType:"application/json; charset=utf-8",
		data: JSON.stringify(loginUserParams),
		success: function(result, status, xhr) {
			location.reload();
		},
		error: function(error, status, xhr) {
			if (error) {
				alert("error : " + JSON.stringify(error) + "\n" + "status: " + status + "\n" + "xhr : " + xhr);
			}
		}

	})
};

const handledPressKey = (event) => {
    if (event.key === "Enter") {
        handledLoginClick(event);
    }
};

const requestUsernameCertification = () => {
	let username = $("#usernameInput").val();

	if(username === '' || username === null) {
		alert("username을 입력하세요.");
		$('#usernameInput').focus();
		return;
	}

	if (!username.includes("@")){
		alert("알맞은 email 형식이 아님니다.");
		$('#usernameInput').focus();
		return;
	}

	$.ajax({
		type: "POST",
		url: "/api/users/certificate/username",
		data: { "username" : username },
		success: function() {
			alert(username + "으로 인증번호 발송.\nemail을 확인해주세요.");
			$(".certificate-input").css("display", "inline-block");
		},
		error: function(error, status, xhr) {
			console.log('error: ' + JSON.stringify(error) + "\n" + "status : " + status + "\n" + "xhr : " + xhr);
			$("#usernameCheckFalseResult").css("display", "inline-block");
		}
	})

};

const checkUsernameCertificationNumber = () => {
	let username = $("#usernameInput").val();
	let certificateNumber = $("#certificateNumberInput").val();

	$.ajax({
		type: "GET",
		url: "/api/users/certificate/username",
		data: { "username" : username, "certificateNumber" : certificateNumber },
		success: function(data, status, xhr) {
			if (data === true) {
				$('#usernameCheckFalseResult').css('display', 'inline-block');
			} else {
				alert("사용하실 수 있는 username입니다.");
				$('#usernameCheckFalseResult').css('display', 'none');
				$('#usernameDuplicationCheckResult').val('true');
				$(".certificate-input").css("display", "none");
			}
		}
	})
};

const initializeUsernameInput = () => {
	$('#usernameDuplicateCheckResult').val("false");
	$(".certificate-input").css("display", "none");
	$("#usernameCheckFalseResult").css("display", "none");
	$("#certificateNumberInput").val("");
};

const handledPasswordMatchCheck = () => {
	let password = $('#passwordInput').val();
	let passwordCheck = $('#passwordCheckInput').val();

	if ( password !== passwordCheck ) {
		$('#passwordCheckFalseResult').css("display", "inline-block");
	} else {
		$('#passwordCheckFalseResult').css('display', 'none');
	}
};

const checkNicknameDuplication = () => {
	let nickname = $("#nicknameInput").val();

	if(nickname === '' || nickname === null) {
		alert("nickname을 입력하세요.");
		$('#nicknameInput').focus();
		return;
	}

	let nicknameData = { "nickname" : nickname };

	$.ajax({
		type: "GET",
		url: "/api/users/duplicate/nickname",
		data: nicknameData,
		success: function(data, status, xhr) {
			if (data === true) {
				$('#nicknameCheckFalseResult').css('display', 'inline-block');
			} else {
				alert("사용하실 수 있는 nickname입니다.");
				$('#nicknameCheckFalseResult').css('display', 'none');
				$('#nicknameDuplicationCheckResult').val('true');
			}
		}
	})
};

const initializeNicknameCheck = () => {
	$('#nicknameDuplicationCheckResult').val("false");
};

const openZipcode = (event) => {
	event.preventDefault();

    let url="/resources/api/searchMap.jsp";
    open(url, "confirm", "toolbar=no,location=no,"
              +"status=no,menubar=no,"
              +"scrollbars=yes,resizable=no,"
              +"width=700,height=500");
};

const handledJoinClick = (e) => {
	e.preventDefault();

	let username = $('#usernameInput').val();
	if (username === '' || username === null) {
		alert("username을 입력해주세요");
		$('#usernameInput').focus();
		return;
	}

	let usernameCheck = $('#usernameDuplicationCheckResult').val();
	if ( usernameCheck === 'false' || usernameCheck === null) {
		alert("username 인증을 해주세요");
		$("usernameInput").focus();
		return;
	}

	let password = $('#passwordInput').val();
	if (password === '' || password === null ) {
		alert('password를 입력해주세요');
		$('#passwordInput').focus();
		return;
	}

	let passwordCheck = $('#passwordCheckInput').val();
	if (passwordCheck === '' || passwordCheck === null ) {
		alert('password 확인을 입력해주세요');
		$('#passwordCheckInput').focus();
		return;
	}

	if (password !== passwordCheck) {
		alert("password가 일치하지 않습니다.");
		$('#passwordCheckInput').focus();
		return;
	}

	let nickname = $('#nicknameInput').val();
	if (nickname === '' || nickname === null ) {
		alert('nickname을 입력해주세요');
		$('#nicknameInput').focus();
		return;
	}
	let nicknameCheck = $('#nicknameDuplicationCheckResult').val();
	if ( nicknameCheck === 'false' || nicknameCheck === null) {
		alert("nickname 중복 체크를 해주세요");
		$("nicknameInput").focus();
		return;
	}

	let address = $('#addressInput').val();
	if (address === '' || address === null ) {
		alert('주소를 입력해주세요');
		$('#addressInput').focus();
		return;
	}

	let genders = $('input[name="gender"]');
	let gender;
	for (let i = 0; i < genders.length; i++) {
		if ( genders[i].checked ) {
			gender = genders[i].value;
			break;
		}
	}
	if (gender === '' || gender === null ) {
		alert('성별을 선택해주세요');
		$('#genderInput').focus();
		return;
	}

	let concerns = $('input[name="concern"]');
	let concern;
	for (let i = 0; i < concerns.length; i++) {
		if ( concerns[i].checked ) {
			concern = concerns[i].value;
			break;
		}
	}
	if (concern === '' || concern === null ) {
		alert('관심사를 선택해주세요');
		$('#genderInput').focus();
		return;
	}

	let saveUserParams = {
			"username" : username,
			"password" : password,
			"nickname" : nickname,
			"address" : address,
			"gender" : gender,
			"concern" : concern,
	};

	$.ajax({
		type: "POST",
		url: "/api/users",
		contentType:"application/json; charset=utf-8",
		data: JSON.stringify(saveUserParams),
		success: function(result, status, xhr) {
			alert("회원가입 성공!");
			location.reload();
		},
		error: function(error, status, xhr) {
			if (error) {
				alert("error : " + JSON.stringify(error) + "\n" + "status: " + status + "\n" + "xhr : " + xhr);
			}
		}
	})
};
