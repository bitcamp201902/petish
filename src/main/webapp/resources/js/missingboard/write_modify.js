//첨부 사진 추가
var formObj = $("#dogLostPostForm");
var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
var maxSize = 5242880; // 5MB

function checkExtension(fileName, fileSize) {

	if (fileSize >= maxSize) {
		alert("파일 사이즈 초과");
		return false;
	}

	if (regex.test(fileName)) {
		alert("해당 종류의 파일은 업로드할 수 없습니다.");
		return false;
	}
	return true;
}

//사진 변경
$("input[type='file']").change(function(e) {

	var formData = new FormData();
	var inputFile = $("#uploadFile");
	var files = inputFile[0].files;

	for (var i = 0; i < files.length; i++) {
		if (!checkExtension(files[i].name, files[i].size)) {
			return false;
		}
		formData.append("uploadFile", files[i]);
	}
	
	// 사진 등록(경로 C:\\)
	$.ajax({
		url : '/uploadAjaxAction',
		processData : false,
		contentType : false,
		data : formData,
		type : 'POST',
		dataType : 'json',
		success : function(result) {
			console.log(result);
			showUploadResult(result); // 업로드 결과 처리 함수
		}
	});
});

// 파일 첨부 시 미리보기 썸네일 출력
function showUploadResult(uploadResultArr) {

	if (!uploadResultArr || uploadResultArr.length == 0) {
		return;
	}

	var uploadUL = $(".uploadResult ul");
	var str = "";

	$(uploadResultArr).each(function(i, obj) {
		if (obj.image) {
			var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
			str += "<li data-path='" + obj.uploadPath + "'";
			str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'" + " ><div>";
			str += "<span> " + obj.fileName + "</span>";
			str += "<button type='button' data-file=\'" + fileCallPath + "\' "
			str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='/display?fileName=" + fileCallPath + "'>";
			str += "</div>";
			str += "</li>";

			console.log("(obj.image)str : " + str);
		}
	});
	uploadUL.append(str);
}

// 첨부 파일 미리보기에서 삭제
$(".uploadResult").on("click", "button", function(e) {

	console.log("delete file");

	var targetFile = $(this).data("file");
	var type = $(this).data("type");

	var targetLi = $(this).closest("li"); // 미리보기에서 삭제

	console.log("targetFile : " + targetFile);
	console.log("type : " + type);

	$.ajax({
		url : '/deleteFile',
		data : {
			fileName : targetFile,
			type : type
		},
		dataType : 'text',
		type : 'POST',
		success : function(result) {
			targetLi.remove();
		}
	}); // $.ajax
});

function formCheck(){
	var formObj = document.dogLostPostForm;
	
	var dogName = formObj.dog_name.value;
	var dogAge = formObj.dog_age.value;
	var speciesId = $('select[name=species_id]').val();
	var dogGender = formObj.dog_gender.value;
	var dogImage = formObj.dog_image.value;
	var description = formObj.dog_description.value;
	var dogLostDate = formObj.dog_lost_date.value;
	var dogLostAddr = formObj.dog_lost_address.value;
	var reward = formObj.reward.value;
	var phoneNumber = formObj.phone_number.value;
	
	if(dogName == "" || dogName == null){
		alert("강아지 이름을 입력해주세요");
		return false;
	}
	if(dogAge == "" || dogAge == null){
		alert("강아지 나이를 입력해주세요");
		return false;
	}
	if(speciesId == "0" || speciesId == ""){
		alert("강아지 종을 선택해주세요");
		return false;
	}
	if(dogGender == "" || dogName == null){
		alert("강아지 성별을 선택해주세요");
		return false;
	}
	if(dogImage == "" || dogImage == null){
		alert("등록된 사진이 없습니다. 사진을 등록해주세요");
		return false;
	}
	if(description == "" || description == null){
		alert("강아지 특징을 1개 이상 작성해주세요");
		return false;
	}
	if(dogLostDate == "" || dogLostDate == null){
		alert("실종 날짜를 입력해주세요");
		return false;
	}
	if(dogLostAddr == "" || dogLostAddr == null){
		alert("실종 장소를 입력해주세요");
		return false;
	}
	if(reward == "" || reward == null){
		alert("사례금을 입력해주세요");
		return false;
	}
	if(phoneNumber == "" || phoneNumber == null){
		alert("연락처를 입력해주세요");
		return false;
	}		
	return true;
}

// 글 입력 버튼
var inputBtn = $("#input_post");

inputBtn.on("click", function(e) {
	e.preventDefault();

	// 강아지 특징
	var description = "";
	if ($('#description1').val())
		description += "" + $('#description1').val();
	if ($('#description2').val())
		description += " / " + $('#description2').val();
	if ($('#description3').val())
		description += " / " + $('#description3').val();
	if ($('#description4').val())
		description += " / " + $('#description4').val();
	if ($('#description5').val())
		description += " / " + $('#description5').val();
	$("input[name=dog_description]").val(description); // 특징 입력 폼 5개 내용 1개로

	// 연락처
	var telephone = "";
	if ($('#tel1').val() != '')
		telephone += "" + $('#tel1').val();
	if ($('#tel2').val() != '')
		telephone += "-" + $('#tel2').val();
	if ($('#tel3').val() != '')
		telephone += "-" + $('#tel3').val();

	// 성별
	$('#input[name=dog_gender]').change(function() {
		var checked = $(this).prop('checked'); // checked 상태 (true, false)

		var gender = $("input[name='dog_gender']:checked").val();

		if (gender == "수컷") {
			$("input[name='dog_gender']").prop("value", "수컷")
		}
		if(gender == "암컷"){
			$("input[name='dog_gender']").prop("value", "암컷")
		}
	});
	
	// 첨부 이미지
	var str = "";
	var fileName = "";
	var uuid = "";
	var uploadPath = "";
	var fileType = "";

	$(".uploadResult ul li").each(
		function(i, obj) {

			var jobj = $(obj);

			console.dir(jobj);
			console.log("-------------------------");
			console.log(jobj.data("filename"));

			str += "<input type='hidden' name='attachList[" + i
					+ "].fileName' value='" + jobj.data("filename") + "'>";
			str += "<input type='hidden' name='attachList[" + i
					+ "].uuid' value='" + jobj.data("uuid") + "'>";
			str += "<input type='hidden' name='attachList[" + i
					+ "].uploadPath' value='" + jobj.data("path") + "'>";
			str += "<input type='hidden' name='attachList[" + i
					+ "].fileType' value='" + jobj.data("type") + "'>";
	});
	
	// 성별
	var gender = $('input[type=radio]:checked').val();
	$("input[name=dog_gender]").val(gender);

	formObj.append(str).submit(); // 폼 전송
});


function add(post, callback, error) {
	$.ajax({
		url : '/dog/missingboard/POST',
		type : 'POST',
		data : JSON.stringify(post),
		dataType : "json",
		contentType : 'application/json; charset=utf-8',
		success : function(retVal) {
			if (retVal.res == "OK") {
				alert("게시글이 등록되었습니다.");
			} else {
				alert("게시글 등록 실패");
			}
		},
		error : function() {
			alert("AJAX 통신 실패");
		}
	});
}

//강아지 특징 작성 input 폼 추가
var addPlace; 
var descriptionIndex = 1;

//특징 입력 폼 추가 함수
function insRow() {	   
   addPlace = $("#addHere"); //추가할 위치      
   
   var frmTag = '<div id="removeDiv"><input type="text" class="form-control" id="description'+(++descriptionIndex)+'" name="addDescriptions" style="display: inline-block!important; margin-top:5px; width: 80%!important;">';      
   frmTag += '<button onclick="removeRow()" type="button" style="font-size: 0.9rem; margin-left:0.2rem;" class="btn btn-sm btn-template-main">삭제</button></div>';
   
   // 특징 항목 입력 5개로 제한
   if($("input[name=addDescriptions]").length >= 4){
 	  alert("최대 5개 항목까지만 입력 가능합니다.");
 	  return;
   }      
   addPlace.append(frmTag);      
}



//특징 입력 폼 삭제 
function removeRow(){
	$('#removeDiv').remove();
	descriptionIndex--;
	alert(descriptionIndex);
}