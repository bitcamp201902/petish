$(document).ready(function() {
	   jQuery.datetimepicker.setLocale('kr'); // 달력 한글표시

	   $('#datetimepicker').datetimepicker({ // 달력함수
	      minDate : "+0D"
	   });
});

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
