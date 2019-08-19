const isAuthenticate = () => {
	$.ajax({
		type: "GET",
		url: "api/users/authenticate",
		success: function(result, status) {
			
		}
	})
}