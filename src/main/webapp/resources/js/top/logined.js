$(function() {
    $('#logout-button').on("click", function(event) {
        handledLogoutClick(event);
    })
});

const handledLogoutClick = (e) => {
	e.preventDefault();

	$.ajax({
		type: "POST",
		url:"/api/users/logout",
		success: function(result, status, xhr) {
			alert("로그아웃 되었습니다.");
		    location.reload();
		},
		error: function(error, status, xhr) {

		}
	})
};


