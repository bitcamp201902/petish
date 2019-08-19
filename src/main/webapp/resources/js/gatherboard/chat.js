$(document).ready(function(){
    var elem = document.getElementById('messageWindow');
    elem.scrollTop = elem.scrollHeight;
});
	var postID = $("#post_id").val();
	
	/* 채팅 이미지 눌렀을 때 */    
    function chatClick(username) {
        if ($(".chat").attr("src") == "/resources/img/gatherboard/chat.png") {
            $(".chat").attr("src", "/resources/img/gatherboard/chatHide.png");
            $("#chat_box").css("display", "block");
            webSocket.send($("#chat_id").val() + "|" + inputMessage.value + "|" + postID + "|" + "입장");
        } else if ($(".chat").attr("src") == "/resources/img/gatherboard/chatHide.png") {
            $(".chat").attr("src", "/resources/img/gatherboard/chat.png");
            $("#chat_box").css("display", "none");
            webSocket.send($("#chat_id").val() + "|" + username + "님이 퇴장하셨습니다." + "|" + postID + "|" + "퇴장");
        }
    }
    
    var textarea = document.getElementById("messageWindow");
    var webSocket = new WebSocket('ws://192.168.1.5:8080/broadcasting'); /* 서버 IP 주소에 맞게 변경 */
    var inputMessage = document.getElementById('inputMessage');
    webSocket.onerror = function(event) {
        onError(event)
    };
    webSocket.onopen = function(event) { 
        onOpen(event)
                var me = "<div class='nav navbar-nav ml-auto'>" 
			  +	"<a href='#' data-toggle='dropdown' class='dropdown'><div id='"+$("#chat_id").val()+"' style='margin:3px; color:dimgray;'>" 
			  + $("#chat_id").val()+ "</div></a>" 
			  + "<div class='dropdown-menu'>"
			  	+ "<div class='dropdown'><a href='#' class='nav-link' id='oneOnOne"+$("#chat_id").val()+"'>1:1 채팅하기</a></div>"
			  	+ "<div class='dropdown'><a href='#' class='nav-link' id='whisper"+$("#chat_id").val()+"');'>귓속말하기</a></div>"
			  	+ "<div class='dropdown'><a href='#' class='nav-link');'>쪽지보내기</a></div>"
			  + "</div></div>";
        
        var user = document.getElementById(''+$("#chat_id").val()+'');
                
        if(user == null) {        	
        	$(".onUser").append(me);
            webSocket.send($("#chat_id").val() + "|" + $("#chat_id").val() + "님이 입장하셨습니다." + "|" + postID + "|" + "입장");
        	
         	 /* 본인에게 1:1 채팅 */
         	 $("#oneOnOne"+$("#chat_id").val()+"").click(function(){      			 
         			 alert('본인에게 1대1 채팅신청을 할 수 없습니다!');
         	 });
         	 
         	 /* 본인에게 귓속말 */
         	 $("#whisper"+$("#chat_id").val()+"").click(function(){      			 
         			 alert('본인에게 귓속말을 할 수 없습니다!');
         	 });
         	 
        }
    };
    /* 입장할 때 */
    webSocket.onmessage = function(event) {
        onMessage(event)
        //alert(event.data);
        var message = event.data.split("|");
        var sender = message[0];
        var content = message[1];
        var channel = message[2];
        var state = message[3];
        
        
        /* 접속자 */
        var onUser = "<div class='nav navbar-nav ml-auto'>" 
        			  +	"<a href='#' data-toggle='dropdown' class='dropdown'><div id='"+sender+"' style='margin:3px; color:dimgray;'>" +sender+ "</div></a>" 
        			  + "<div class='dropdown-menu'>"
        			  	+ "<div class='dropdown'><a href='#' class='nav-link' id='oneOnOne"+sender+"'>1:1 채팅하기</a></div>"
        			  	+ "<div class='dropdown'><a href='#' class='nav-link' id='whisper"+sender+"');'>귓속말하기</a></div>"
        			  	+ "<div class='dropdown'><a href='#' class='nav-link');'>쪽지보내기</a></div>"
        			  + "</div></div>";
                    
        var user = document.getElementById(''+sender+'');
        
        if(user==null && postID == channel) {        		
        	$(".onUser").append(onUser);
        	 webSocket.send($("#chat_id").val() + "|" + inputMessage.value + "|" + postID + "|" + "입장"); 
        	 
        	 /* 귓속말 하기 눌렀을 경우 */
        	 $("#whisper"+sender+"").click(function(){   			 
            	 inputMessage.value="/" +sender+ "/";
            	 inputMessage.focus();
        	 })
        	 
        	 /* 1:1 채팅 */
        	 $("#oneOnOne"+sender+"").click(function(){      			 
        		 // 1대1 채팅 요청을 보냄
        		 webSocket.send($("#chat_id").val() + "|" + "%" +sender+ "%" + "|" + postID); 
        	 });
        }
        /* 채팅 재접속 */
        else if(user.hidden==true) {
           	user.hidden=false;
            webSocket.send($("#chat_id").val() + "|" + $("#chat_id").val() + "님이 입장하셨습니다." + "|" + postID + "|" + "입장");
        } 
       
        if(state=="퇴장") {   	
        	user.hidden = true;
        }
        
    };
    
    /* 메세지 전송할 때 */
    function onMessage(event) {
        var message = event.data.split("|");
        var sender = message[0];
        var content = message[1];
        var channel = message[2];
        var receiver = message[4];

        if (content == "") {
        	return;
        } else {
        	/* 귓속말 */
        	if(content.match("/")) {       	
                if (content.match(("/" + $("#chat_id").val() + "/")) && sender!=$("#chat_id").val()) {
                	/* 본인의 $(#chat_id).val()의 앞뒤에 '/' 를 추가한 뒤 전송된 content의 내용과 비교해서 맞으면 귓속말 대상 */
                        var temp = content.replace("/" + $("#chat_id").val() + "/", "(귓속말) :").split(":");
                        /* 전달하는 내용 유무 확인 */
                        if (temp[1].trim() == "") {
                        	return;
                        } else {
                            $("#messageWindow").html($("#messageWindow").html() 
                            	+ "<p class='triangle-border left' style='color:blue;'>"
                                + sender + content.replace("/" + $("#chat_id").val() + "/", "(귓속말) :") + "</p>");
                            var elem = document.getElementById('messageWindow');
                            elem.scrollTop = elem.scrollHeight;
                        }
                }
        	} else {
            	/* 공지사항(굵은 글씨) */	
                if (content.match("!")) {
                	if($("#chat_id").val()!=sender && postID == channel) {
	                    $("#messageWindow").html($("#messageWindow").html()
	                        + "<p class='triangle-border left' style='color:red'><b class='impress'>" + sender + " : " + content + "</b></p>");
	                    var elem = document.getElementById('messageWindow');
	                    elem.scrollTop = elem.scrollHeight;
                	}
                /* 1대1 채팅 요청 */
                } else if(content.match("%")) {
                	if (content.match(("%" + $("#chat_id").val() + "%"))) {
                		if(confirm(sender+"님과의 1대1 채팅을 수락하시겠습니까?")) {
                			if(connectChat==null) {
                				$("#messageWindow").empty();
                			}
                			inputMessage.value="@"+sender+"@" + $("#chat_id").val() + "님께서 1대1 요청을 수락하셨습니다.";
                 			send();
                           	inputMessage.value="@"+sender+"@"; // 1대1 요청 받은 사람의 메세지 창에 sender의 아이디 표시
                			
                		}
                	}
                } 
                /* 1대1 채팅 수락후 */
                else if(content.match("@")) {
                	var message = content.split("@");
                	var receiver = message[1];
                	var connectChat = document.getElementById('connectChat');
                	                    
                	// 받는 사람이 나인 경우
                	if (content.match(("@" + $("#chat_id").val() + "@"))) { 
                		var connectChat = document.getElementById('connectChat');
                		if(connectChat==null) {
                			$("#messageWindow").empty();
                			$("#messageWindow").html($("#messageWindow").html()+"<p class='chatNotice' id='connectChat'>" + sender + "님과의 1대1채팅이 연결되었습니다.</p>");
                		}

                		inputMessage.value="@"+sender+"@";
                		inputMessage.focus();
                		
                		$("#messageWindow").html($("#messageWindow").html() 
                            + "<p class='triangle-border left' style='color:cadetblue;'>"
                            + sender + content.replace("@" + $("#chat_id").val() + "@", "(1대1) :") + "</p>");
	                    var elem = document.getElementById('messageWindow');
	                    elem.scrollTop = elem.scrollHeight;
                	}
                } 
                
                
                else {
                	/* 본인을 제외하고 메세지 출력 */
                	/* 글 번호에 따라 채팅 채널 구분 */
                	if($("#chat_id").val()!=sender && postID == channel) {     
                		$("#messageWindow").html($("#messageWindow").html()
                			+ "<p class='triangle-border left'>" + sender + " : " + content + "</p>");
                        var elem = document.getElementById('messageWindow');
                        elem.scrollTop = elem.scrollHeight;
                	}
                }
            }
        }
    }

    
    function onOpen(event) {
        $("#messageWindow").html("<p class='chatNotice'>"+ postID +" 번 글 채팅에 참여하였습니다.<br>'귓속말': /닉네임/, '공지': !내용 </p>"); 
    }
    function onError(event) {
        $("#messageWindow").html("<p class='chat_content' style='color:red' id='errorMsg'>채팅 서버에 연결되지 않았습니다!</p>");
    }
    function send() {    	    	
        if (inputMessage.value == "") {
        	return;
        } else {
        	webSocket.send($("#chat_id").val() + "|" + inputMessage.value + "|" + postID);
            $("#messageWindow").html($("#messageWindow").html()
                + "<p class='triangle-border right'> 나: " + inputMessage.value + "</p>");
            
            if(inputMessage.value.match("@")) {           	
            	var message = inputMessage.value.split("@");
            	var receiver = message[1];
            	var content = message[2];
            	if(content!=null) {            		
            		inputMessage.value = "@" + receiver + "@";
            	}
            	else {
            		// '@'가 들어갔지만 1대1 채팅은 아닌 경우
            		inputMessage.value = "";
            	}
            } else {
            	// 일반 채팅일 경우
            	inputMessage.value = "";
            } 
            
                   
            /* 채팅이 많아져도 스크롤이 제일 하단에 위치하도록 함 */
            var elem = document.getElementById('messageWindow');
            elem.scrollTop = elem.scrollHeight;
        }
    }
    // 엔터키를 통해 메세지 전송함
    function enterkey() {
        if (window.event.keyCode == 13) {
            send();
        }
    }
    
	/* 목록 버튼 눌렀을 때*/
	function listClick() {
		if ($(".chat").attr("src") == "/resources/img/gatherboard/chatHide.png") {
			webSocket.send($("#chat_id").val() + "|" + $("#chat_id").val() + "님이 퇴장하셨습니다." + "|" + postID + "|" + "퇴장");
		}
	}

    