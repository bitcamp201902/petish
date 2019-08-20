$(document).ready(function(){
	var region = document.getElementById('region-category');
	var size = document.getElementById('size-category');
	var keyword = document.getElementById('categoryKeyword');	
});

var actionForm = $("#actionForm");

$(".page a").on("click", function(e) {
                            		
	e.preventDefault(); // 이동 방지 
	console.log('click');
	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	actionForm.submit();
                            		
});	

var categoryForm = $("#categoryForm");
var region = document.getElementById('region-category');
var size = document.getElementById('size-category');

function regionSearch() {
	if(!(region.value == "" || region.value == null)) {
		
		categoryForm.find("input[name='keyword']").val(region.value);
		categoryForm.submit();
	}
}

function sizeSearch() {
	if(!(size.value == "" || size.value == null)) {

		categoryForm.find("input[name='type']").val("S");
		categoryForm.find("input[name='keyword']").val(size.value);
		categoryForm.submit();
	}
}

function writeFormClick() {
	$.ajax({
		type: "GET",
		url: "/api/users/authenticate",
		success: function(data) {
			location.href="/dog/gatherboard/writeForm";
		},
		error: function(error) {
			$("#login-modal").modal("show");
		}
	})
}

function detailClick(boardID) {
	$.ajax({
		type: "GET",
		url: "/api/users/authenticate",
		success: function(data) {
			location.href="/dog/gatherboard/"+boardID+"";
		},
		error: function(error) {
			$("#login-modal").modal("show");
		}
	})
}

function mapListClick() {
	$.ajax({
		type: "GET",
		url: "/api/users/authenticate",
		success: function(data) {
			location.href="/dog/gatherboard/mapList";
		},
		error: function(error) {
			$("#login-modal").modal("show");
		}
	})
}

//쪽지 전송
$('#modalSendBtn').click(function(event){          
     event.preventDefault();
     
     var newModal = $("#message-modal"); //모달창
     
     var modalInputTitle = newModal.find("input[name='messageTitle']"); //모달창 제목
     var modalInputContent = newModal.find("textarea[name='messageContent']"); //모달창 내용
     var modalInputSender_id = newModal.find("#sender_id"); // 모달창 보내는 user_id
     var modalInputReceiver_id = newModal.find("input[name='messageReceiver_id']"); //모달창 받는 user_id
     
     var modalSendBtn = $(".modalSendBtn"); //모달 보내기 버튼
     
     //var msg = $("#message_form").serialize();
     //alert(msg);
     
     var message = {
            title : modalInputTitle.val(),
            content : modalInputContent.val(),
            sender_id : modalInputSender_id.val(),
            receiver_id : modalInputReceiver_id.val()
            }
      
       $.ajax({
           url : '/mypage/api/message/new',
           type : 'post',
           data : JSON.stringify(message),
           contentType : "application/json; charset=utf-8",
           beforeSend : function(){
        	  if(message.sender_id == message.receiver_id) {
             	 alert("본인에게는 쪽지를 보낼 수 없습니다!");
             	 $("#message-modal").modal("hide");
             	 return false;
              }
              else{
                 return true;
              }
           },
           success : function(result, status, xhr) {
              if (result) {
                 alert("쪽지가 성공적으로 전송됐습니다.");
                 $("#message-modal").modal("hide");
              }
          },
          error : function(xhr, status, er) {
              if (error) {
                  error(er);
                  alert("쪽지 전송 실패");
              }
          }
       });
});   
