//신고 작성	   
$('#input_report').click(function(event) {
	// 기본 이벤트 제거
	event.preventDefault();
	
	var report = $("#report_form").serialize();
	var reportTitle = $('select[name=category_id]').val();
	var reportContent = $('#description').val();
	
	$.ajax({
		url : '/report/new',
		type : 'POST',
		data : report,
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		dataType : "json",
		beforeSend : function(){
			if(reportTitle == "0" || reportTitle == ""){
				alert("신고 사유를 선택해주세요.");
				return false;
			}
			if(reportContent == ""){
				alert("신고 내용을 작성해주세요.");
				return false;
			}
			else return true;
		},
		success : function(retVal) {
			if (retVal.res == "OK") {
				alert("신고 완료");					
				$(".modal").modal("hide");
			} else {
				alert("신고 실패");
			}
		},
		error : function() {
			alert("AJAX 통신 실패");
		}
	});
	
});