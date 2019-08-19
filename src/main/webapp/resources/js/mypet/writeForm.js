$(function() {
    $(".carousel-control-prev").hide();
    $(".carousel-control-next").hide();

    $("#fileInput").on("change", function(event) {
        makeImageCarousel(event.target);
    });

    $("#submit-button").on("click", function(event) {
        postUpload(event.target.form);
    })
});

const makeImageCarousel = (file) => {
	
	let fileList = file.files;

	if (!fileList) {
		return;
	}

	for (let file of fileList) {
		if (file.size > 2097152) {
			alert("사진 사이즈는 2MB이하만 가능합니다.");
			initializeFileInput(file);
			return;
		}
		if ( !isImage(file.name)) {
			alert("파일은 jps, gif, png, jpeg 확장자만 가능합니다.");
			initializeFileInput(file);
			return;
		}
	}

	$("div").remove(".carousel-item");

	if ( fileList.length == 1 ) {
	    $(".carousel-control-next").hide();
	    $(".carousel-control-prev").hide();
    } else {
	    $(".carousel-control-next").show();
	    $(".carousel-control-prev").show();
    }

	for (let i = 0; i < fileList.length; i++) {

		let reader = new FileReader();
		
		if (i == 0) {
			reader.onloadend = function() {
				$("#picture1").addClass("active");
			}
		}
		
		reader.onload = function(e) {

			let img = '<div class="carousel-item" id=picture' + (i + 1) +'>' +
                '<div class="carousel-item-inner">' +
                '<div class="img-wrapper">' +
				'<img src=' + e.target.result + '>' +
				'</div>' +
                '</div>' +
                '</div>';


			$('.carousel-inner').append(img);
		};
		
		reader.readAsDataURL(fileList[i]);
	}
	
};

const isImage = (fileName) => {
	let pattern = /jpg$|gif$|png$|jpeg$/i;
	return fileName.match(pattern);
};

const initializeFileInput = (fileInput) => {
	fileInput.value = "";
};

const handledPostUpload = (form) => {
	checkAuthentication(postUpload, form);
};

const postUpload = (form) => {
	let formData = new FormData(form);
	// let content = $("div[name='content']").html();
	// formData.append("content", content);

	$.ajax({
		type:"POST",
		url:"/api/mypet/posts",
		data: formData,
		processData: false,
	    contentType: false,
		success: function(result, status, xhr) {
			alert("업로드 성공");
			window.location.href = "/mypet";
			
		},
		error: function(error, status, xhr) {
			console.log("업로드 실패");
		
		}
	})
};

const checkAuthentication = (callback, param) => {
	$.ajax({
		type: "GET",
		url: "/api/users/authenticate",
		success: function(data, status, xhr) {
			if (callback) {
				callback(param);
			}
		},
		error: function(error, status, xhr) {
			if ( error.status == 401 ) {
				alert("권한이 없습니다. 로그인 후 이용해주세요.");
				$(".modal").modal("hide");
				$("#login-modal").modal("show");
			}
		}
	})
};