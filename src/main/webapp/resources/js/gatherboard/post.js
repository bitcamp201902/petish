/* 글 작성 */
function Check() {
	var region = document.getElementById('region');
	var place = document.getElementById('place');
	var size = document.getElementById('size');
	var species = document.getElementById('species');
	var personnel = document.getElementById('personnel');
	var date = document.getElementById('datetimepicker');
	var title = document.getElementById('password_old');
	var content = document.getElementById('summernote');
			
	if(region.value=="" || region.value.length == 0) {
		alert("지역을 입력하세요.");
		region.focus();
		return false;
	}
	
	if(size.value=="크기" || size.value.length == 0) {
		alert("크기를 입력하세요.");
		size.focus();
		return false;
	}
		
	if(species.value=="" || species.value.length == 0) {
		alert("종를 입력하세요.");
		species.focus();
		return false;
	}
	
	if(personnel.value=="" || personnel.value.length == 0) {
		alert("인원을 입력하세요.");
		personnel.focus();
		return false;
	}
	
	if(date.value=="" || date.value.length == 0) {
		alert("모임일시를 입력하세요.");
		date.focus();
		return false;
	}

	if(place.value=="" || place.value.length == 0) {
		alert("모임장소를 입력하세요.");
		place.focus();
		return false;
	}
	
	if(title.value=="" || title.value.length == 0) {
		alert("제목을 입력하세요.");
		title.focus();
		return false;
	}
	
	if(content.value.length==0) {
		alert("내용을 입력하세요.");
		content.focus();
		return false;
	}
	
	var regionValue = region[region.value].innerText;
	var placeValue = place.value.substring(0,2);
	
	if(regionValue != placeValue) {
		alert('지역을 다시 선택해주세요!');
		return false;
	}
	
	return true;
}

/* 크기별 견종 분류 */
function categoryChange() {
	var size = document.getElementsByName('DOG_SIZE');
	var small = ["스피츠","꼬똥 드 툴레아","시츄","요크셔테리어","말티즈","포메라니안","푸들","치와와","미니핀","슈나우저","페키니즈","닥스훈트","빠삐용","기타 소형견"];
	var medium = ["비숑 프리제","보스턴 테리어","샤페이","웰시코기","비글","코카스파니엘","불독","기타 중형견"];
	var large = ["사모예드","피레니즈","리트리버","말라뮤트","한국 토종견","허스키","세퍼트","하운드","달마시안","콜리","쉽독","기타 대형견"];
	var target = document.getElementById("species");
	
	if(size[0].value == 1) var d = small;
	else if(size[0].value == 2) var d = medium;
	else if(size[0].value == 3) var d = large;
	
	target.options.length = 0;
	
	for(x in d) {
		var opt = document.createElement("option");
		opt.value = d[x];
		opt.innerHTML = d[x];
		target.appendChild(opt);
	}
}

$('#participantResetBtn').click(function(){
	$('#myLargeModal').modal('hide');
})

function participantCheck(size) {	
	var sizeID = size;
	var participantSizeID = document.getElementById('size');
	var requestContent = document.getElementById('requestContent');
	
	if(sizeID != participantSizeID.value) {
		alert("크기를 다시 선택해주세요!");
		return false;
	}
	
	if(requestContent.value == "" || requestContent.value == null) {
		alert("신청 내용을 입력해주세요!");
		return false;
	}
	
	return true;
}

$(document).ready(function() {
	   jQuery.datetimepicker.setLocale('kr'); // 달력 한글표시

	   $('#datetimepicker').datetimepicker({ // 달력함수
	      minDate : "+0D"
	   });
	});