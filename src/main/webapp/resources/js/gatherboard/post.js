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