$(document).ready(function(){

		commentList();
});

//댓글 목록
function commentList(param) {
	var params = $("#page_form").serialize(); //입력데이터를 쿼리스트링으로 만들어준다.
	//alert("params"+params);
	$('#commentCount').empty();
	$('#commentList').empty();
	
	//alert('commentList Test Start!');
	
	$.ajax({
		url:'/dog/gatherboard/commentList',
		type:'GET',
		data : params,
		contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		dataType:"json",
		success:function(result) {
			for(var i in result) {
				var count = '댓글 개수 : ' + result[i].count;
				//var image = '';
				var output = '';
				var modifyBtn = '';
				var deleteBtn = '';
				output += '<input type="hidden" id="commentCountVal" value='+result[i].count+'>';
				output += '<div class="col-sm-3 col-md-2 text-center-xs">'; //프로필 이미지
				output += '<p><img src="/resources/img/gatherboard/user.png" class="img-fluid rounded-circle" style="max-width:80%"></p>'; 
				output += '</div>';
				if(result[i].nickname == $("#NICKNAME").val()) { 
					output += '<div class="col-sm-9 col-md-10">';
				} else {					
					output += '<div class="col-sm-9 col-md-10" style="height:150px">'; 
				}
				output += '<h5 class="text-uppercase">' + result[i].nickname + '</h5>';
				output += '<p class="posted">';
				output += '<i class="fa fa-clock-o"></i> 등록일: ' + result[i].created_DATE ;
				output += '&nbsp;&nbsp;&nbsp;&nbsp;수정일: ' + result[i].updated_DATE + '</p>';
				output += '<input type="hidden" class="form-control" id="commentContent'+result[i].id+'" value="'+result[i].content+'">';
				output += '<li id="commentBlock'+result[i].id+'" style="display:block">';
				output += '<p id="commentInnerText'+result[i].id+'">' + result[i].content +'</p>';   
				//본인이 작성한 댓글일 경우
				if(result[i].nickname == $("#NICKNAME").val()) { 
					output += '<button id="commentUpdateBtn" class="btn btn-template-outlined" onclick="button('+result[i].id+')" style="float:right"><i class="fa fa-reply"></i> 수정</button></li>';
				}
				output += '<input id="commentCloseBtn'+result[i].id+'" onclick="closeComment('+result[i].id+')" type="hidden" class="btn btn-template-outlined" value="닫기" style="float:right; margin-top:20px">';	
				output += '<input id="commentDeleteBtn'+result[i].id+'" onclick="removeComment('+result[i].id+')" type="hidden" class="btn btn-template-outlined" value="삭제" style="float:right; margin-right:15px; margin-top:20px">';
				output += '<input id="commentModifyBtn'+result[i].id+'" onclick="modifyComment('+result[i].id+')" type="hidden" class="btn btn-template-outlined" value="수정" style="float:right; margin-right:15px; margin-top:20px">';
				output += '</div>';
				//console.log("output:"+output);
				$('#commentList').append(output);	
			}				
			$('#commentCount').append(count);	
			commentCount();

		},
		error:function() {
			alert("ajax통신 실패!!");
		}
	});
	
}

var pageNum = 1;
var commentPageFooter = $(".comment-footer");

//댓글 페이지 번호 출력
function commentCount() {
	var commentCnt = document.getElementById('commentCountVal').value;
	//alert(replyCnt);
		
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
	//alert("button id="+id);
	
	var contentVal = $("#commentContent"+id+"").val();
	
	$('#commentBlock'+id+'').attr({"style":"display:none"});
	$('#commentContent'+id+'').attr({"type":"text", "value":contentVal});
	$('#commentCloseBtn'+id+'').attr({"type":"button"});
	$('#commentDeleteBtn'+id+'').attr({"type":"button"});
	$('#commentModifyBtn'+id+'').attr({"type":"button"});
}


//댓글 등록 버튼 눌렀을 경우
$('#input_data').click(function(event){
	var params = $("#insert_form").serialize(); //입력데이터를 쿼리스트링으로 만들어준다.
	
	jQuery.ajax({
		url : '/dog/gatherboard/insertComment',
		type : 'POST',
		data : params,
		contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		dataType : "json",
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
	event.preventDefault();
});

//댓글 조회
function getComment(id) {
	
	jQuery.ajax({
		url : '/dog/gatherboard/'+id,
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
		url : '/dog/gatherboard/modifyComment/' + id,
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
			url : '/dog/gatherboard/removeComment/' + id,
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
