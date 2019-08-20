$(document).ready(function(){
	commentList();
});

//총 댓글 수
var cnt = 0;

//댓글 목록
function commentList(param) {
	
	var params = $("#page_form").serialize(); //입력데이터를 쿼리스트링으로 만들어준다.
	
	//댓글 목록창, 댓글 수 초기화
	$('#commentCount').empty();
	$('#commentList').empty();
	
	$.ajax({
		url:'/dog/freeboard/comments',
		type:'GET',
		data : params,
		contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		dataType:"json",
		
		success:function(result) {
			
			if(result == "" || result == null){
				$('#commentList').append("<p style='margin:auto'>등록된 댓글이 없습니다. 댓글을 등록해주세요.</p>");
				return;
			}
			
			for(var i in result) {
				
				var count = '댓글  ' + result[i].count;
				cnt = result[i].count;
				var output = '';
				var modifyBtn = '';
				var deleteBtn = '';
				
				//댓글 갯수
				output += '<input type="hidden" id="commentCountVal" value=result[i].count>';
				
				//유저 프로필 사진
				output += '<div class="replyer-image-container">'; //프로필 이미지
				output += '<img src="/resources/img/user.png" class="replyer-image" style="max-width:70%">'; 
				output += '</div>';
				
				output += '<div class="reply-content" id="reply-content' + result[i].id + '">';				
				output += '<h5 class="text-uppercase" style="display:inline-block; padding-right:1rem">' + result[i].nickname + '</h5>';
				output += '<a class="posted">';
				output += '<i class="fa fa-clock-o" style="padding-right:0.2rem"></i>' + result[i].created_date + '</a>';
				
				//수정 시에만 출력
				if(result[i].created_date != result[i].updated_date){
					output += '<a class="posted">';
					output += '<i class="fa fa-history" style="padding:0 0.2rem 0 1.5rem; "></i>' + result[i].updated_date + ' 수정됨</a>';
				}
				
				output += '<input type="hidden" class="form-control comment-input-form" id="commentContent'+result[i].id+'" value="'+result[i].content+'">';
				output += '<div id="commentBlock'+result[i].id+'">';
				
				output += '<div id="commentInnerText'+result[i].id+'" class="modify-comment">' + result[i].content +'</div>';   
				
				//본인이 작성한 댓글일 경우
				if(result[i].nickname == $("#NICKNAME").val()) {		
					
					output += '<div class="nav navbar-nav ml-auto modify-remove-navbar">';
					output += '<a href="#" data-toggle="dropdown" class="dropdown modify-remove-dropdown"><img src="/resources/img/reply-modify-button.png" class="modifyBtn" onclick="buttonChange('+result[i].id+')"></a>';
					output += '<div class="dropdown-menu modify-remove-dropdown-menu" role="menu">';
					output += '<div class="dropdown">';
					output += '<a href="#" class="nav-link"><a onclick="button('+result[i].id+')">수정</a>';
					output += '</div>';
					output += '<div class="dropdown">';
					output += '<a href="#" class="nav-link" id="message-btn" data-toggle="modal"><a onclick="removeComment('+result[i].id+')">삭제</a></a>';
					output += '</div>';
					output += '</div>';
					output += '</div>';
					
					output += '</div>';
					
				}
				output += '</div>';
				
				console.log("output:"+output);				
				//댓글 append
				$('#commentList').append(output);	
			}			
			//댓글 수 append
			$('#commentCount').append(count);	
			
			//댓글 페이지 번호 출력
			commentCount();
		},
		
		error:function(request, status, error) {
			alert("ajax통신 실패!!");
			alert("code : " + request.status+"\n"+"message : " + request.responseText + "\n" + "error : " + error);			
		}
	});	
}

var pageNum = 1;
var commentPageFooter = $(".comment-footer");

//댓글 페이지 번호 출력
function commentCount() {
	var commentCnt = cnt;
	
	//댓글 없으면 페이징 출력X
	if(commentCnt == 0) return;
	
	var endNum = Math.ceil(pageNum / 10.0) * 10;
	var startNum = endNum - 9;
	
	var prev = startNum != 1;
	var next = false;
	
	if(endNum * 10 >= commentCnt) {
		endNum = Math.ceil(commentCnt/10.0);
	}
	
	if(endNum * 10 < commentCnt) {
		next = true;
	}
	
	var str = "<ul class='pagination pull-right'>";
	
	if(prev) {
		str += "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'><<</a></li>";
	}
	
	for(var i = startNum ; i <= endNum; i++) {
		var active = pageNum == i? "active":"";
		
		str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
	}
	
	if(next) {
		str += "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>>></a></li>";
	}
	
	str += "</ul></div>";
	
	console.log(str);
	
	commentPageFooter.html(str);
}

//페이지의 번호를 클릭했을 때 새로운 댓글을 가져오도록 하기
commentPageFooter.on("click", "li a", function(e){
	e.preventDefault();
	console.log("page click");
	
	var targetPageNum = $(this).attr("href");
	
	console.log("targetPageNum: " + targetPageNum);
	
	pageNum = targetPageNum;
	
	var actionForm = $("#page_form");
	actionForm.find("input[name='pageNum']").val(pageNum);
	
	var params = $("#page_form").serialize();
	commentList(params);
});

//버튼 속성 변경
function button(id) {
	
	var contentVal = $("#commentContent"+id+"").val();
	var loginModal = $("#login-modal");
	
	//output += '<input id="commentModifyBtn'+result[i].id+'" onclick="modifyComment('+result[i].id+')" type="hidden" class="btn btn-template-outlined buttons" value="수정" style="float:right; margin-right:15px; margin-top:20px">';
	
	$('#commentBlock'+id+'').attr({"style":"display:none"});
	$('#commentContent'+id+'').attr({"type":"text", "value":contentVal});
	$('#reply-content'+id+'').append('<div><input id="commentModifyBtn'+id+'" onclick="modifyComment('+id+')" type="hidden" class="btn btn-template-outlined buttons" value="수정" style="float:right; margin-right:15px; margin-top:20px"></div>');
	
	$('#commentCloseBtn'+id+'').attr({"type":"button"});
	$('#commentDeleteBtn'+id+'').attr({"type":"button"});
	$('#commentModifyBtn'+id+'').attr({"type":"button"});
}

function buttonChange(id) {
	
	var contentVal = $("#commentContent"+id+"").val();
	var loginModal = $("#login-modal");
	
	$('#commentModifyBtn'+id+'').attr({"type":"button"});
}

//댓글 등록
$('#input_data').click(function(event){
	
	var params = $("#insert_form").serialize(); //입력데이터를 쿼리스트링으로 만들어준다.
	
	$.ajax({
		type: "GET",
		url: "/api/users/authenticate",
		success: function(data) {
			insertComment();
		},
		error: function(error) {
			alert("로그인이 필요합니다.");
			$('#login-modal').modal("show");
		}
	});	
	//alert(params);
	
	
	event.preventDefault();
});

function insertComment(){
	
	var params = $("#insert_form").serialize(); //입력데이터를 쿼리스트링으로 만들어준다.
	var content = $("#CONTENT").val();
	
	jQuery.ajax({
		url : '/dog/freeboard/comments',
		type : 'POST',
		data : params,
		contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		dataType : "json",
		beforeSend : function(){
			if(content == ""){
				alert("댓글 내용을 작성해주세요.");
				return false;
			}
			else return true;
		},
		success : function(retVal) {
			if(retVal.res == "OK") {
				//alert("댓글을 추가하였습니다!");
				//초기화
				$('textarea').val('');
				var actionForm = $("#page_form");
				
				//현재 있는 페이지 유지
				commentList(actionForm.find("input[name='pageNum']").val());
			}
			else {
				alert("댓글 추가 실패!");
			}
		},
		error:function() {
			alert("ajax통신 실패!!!");
		}
	});
	//기본 이벤트 제거	
}


//댓글 조회
function getComment(id) {
	
	jQuery.ajax({
		url : '/dog/freeboard/comments/'+id,
		type : 'GET',
		contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		dataType : "json",
		success : function(result) {
			//alert("댓글 조회 성공!");
		},
		error:function() {
			alert("ajax통신 실패!!!");
		}
	});
}

//댓글 수정
function modifyComment(id, callback, error) {
	
	var comment = {id:id, content:$('#commentContent'+id+'').val()};

	$.ajax({
		type : 'put',
		url : '/dog/freeboard/comments/modify/' + id,
		data : JSON.stringify(comment),
		contentType : "application/json; charset=utf-8",
		success : function(result, status, xhr) {
			if(result) {		
				//alert(result);
				var commentInnerText = document.getElementById('commentInnerText'+id+'');

				$("#commentContent"+id+"").attr({"type":"hidden", "value":$('#commentContent'+id+'').val()});
				$("#commentModifyBtn"+id+"").attr({"type":"hidden"});
				$("#commentDeleteBtn"+id+"").attr({"type":"hidden"});
				$("#commentCloseBtn"+id+"").attr({"type":"hidden"});
				$("#commentBlock"+id+"").attr({"style":"display:block"});
				commentInnerText.innerText = $('#commentContent'+id+'').val();
				//alert('댓글을 수정하였습니다!');
			}
		},
		error : function(xhr, status, er) {
			if(error) {
				error(er);
			}
		}		
	});
}

//댓글 삭제
function removeComment(id) {
	//alert("remove!");
	if(confirm("삭제하시겠습니까?")) {		
		$.ajax({
			type : 'put',
			url : '/dog/freeboard/comments/remove/' + id,
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if(result) {
					//alert('댓글삭제!');
					commentList();
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	}
	else {
		//alert('삭제 취소!');
		closeComment(id);
	}
}

//댓글 닫기
function closeComment(id) {
	$("#commentContent"+id+"").attr({"type":"hidden"});
	$("#commentModifyBtn"+id+"").attr({"type":"hidden"});
	$("#commentDeleteBtn"+id+"").attr({"type":"hidden"});
	$("#commentCloseBtn"+id+"").attr({"type":"hidden"});
	$("#commentBlock"+id+"").attr({"style":"display:block"});
}
