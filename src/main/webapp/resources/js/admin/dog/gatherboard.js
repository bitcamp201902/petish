$(document).ready(function(){

gatherboardList();

});

//게시글 목록
function gatherboardList() {
	$('#gatherboardList').empty();
	alert('gatherboardList 시작!');
	
	$.ajax({
		url:'/admin/dog/gatherboardList',
		type:'GET',
		contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		dataType:"json",
		success:function(result) {

			for(var i in result) {
				var output = '';
				output += '<tr role="row" class="odd">';
				output += '<td class="sorting_1">' + result[i].id + '</td>';
				output += '<td>' + result[i].gathering_STATE + '</td>';
				output += '<td>' + result[i].region_NAME + '</td>';
				output += '<td>' + result[i].dog_SIZE + '</td>';
				output += '<td>' + result[i].title + '</td>';
				output += '<td>' + result[i].nickname + '</td>';
				output += '<td>' + result[i].created_DATE + '</td>';
				output += '<td>' + result[i].view_COUNT + '</td>';
				output += '<td>' + '<button type="button" id="deletebtn_1" class="btn btn-template-outlined">삭제</button>' + '</td>';
				output += '</tr>';
				
				$('#gatherboardList').append(output);
			}
		},
		error:function() {
			alert("ajax 통신 실패!");
		}
	});
}