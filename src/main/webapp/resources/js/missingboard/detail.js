//즉시 실행 함수
$(document).ready(function() {

(function(){
   var id = '<c:out value="${dto.id}"/>';
   
   $.getJSON("/dog/missingboard/getAttachList/<%=ID%>", function(arr){              
       console.log(arr);
       
       var str = "";
       var dotStr = "";
       
       var dots = document.getElementsByClassName("dot");
       
       $(arr).each(function(i, attach){                  
           //이미지 파일
           if(attach.fileType){                	
             var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/"+attach.uuid +"_"+attach.fileName); //파일 이름(썸네일)                   
             
             str += "<div class='mySlides active'>"
             str += "<img id='lostdog' style='width:100%' src='/display?fileName="+fileCallPath+"'>";                                   
             str += "</div>";
             
             //사진 갯수만큼 dot 생성
             dotStr += "<span class='dot' onclick='currentSlide("+i+")' style='margin:0.3rem!important;'></span>"
             
           }
           //이미지 파일 X                  
           else{
             str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
             str += "<span> "+ attach.fileName+"</span><br/>";
             str += "<img src='/resources/img/attach.png'></a>";
             str += "</div>";
             str +"</li>";
           }               
       });
       
       //이미지 생성
       $("#imageSlides").html(str);                
       
       //dot 생성
       $("#dots").html(dotStr);              
       
       //맨 처음 로딩 시 첫번째 사진만 보여줌
       showSlides(1);
       
       });//end getjson
       
 })();//end function
});

//신고 작성	   
$('#input_report').click(function(event) {
	
	var report = $("#report_form").serialize();
	
	var reportTitle = $('select[name=CATEGORY_ID]').val();
	var reportContent = $('#DESCRIPTION').val();
	
	$.ajax({
		url : '/report/new',
		type : 'POST',
		data : report,
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		dataType : "json",
		success : function(retVal) {
			if(reportTitle == "0" || reportTitle == ""){
				alert("신고 사유를 선택해주세요.");
				return;
			}
			if(reportContent == ""){
				alert("신고 내용을 작성해주세요.");
				return;
			}
			
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
	// 기본 이벤트 제거
	event.preventDefault();
});
