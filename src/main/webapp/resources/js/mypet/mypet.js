const resizeIcon = () => {
	
    if (window.innerWidth < 576) {
    	
        $('#profile-icon').removeClass('fa-2x');
	    $('#profile-icon').addClass('fa-lg');
	    $('.like-icon').removeClass('fa-lg');
	    $('.comment-icon').removeClass('fa-lg');
    } else {
        $('#profile-icon').removeClass('fa-lg');
        $('#profile-icon').addClass('fa-2x');
        $('.like-icon').addClass('fa-lg');
        $('.comment-icon').addClass('fa-lg');
    }
};

$(window).ready(function() {
    resizeIcon();
});

$(window).resize(function() {
    resizeIcon();
});

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

const likeDoubleClick = () => {
    likeClick();
};

const likeClick = () => {
    
	const id = $('#post-id').val();
	
	checkAuthentication(likePost, id);
	
//    likePost(id);
};

const likePost = (id) => {
	$.ajax({
		type: "POST",
		url: "/api/mypet/posts/likes/" + id,
		success: function(data, status, xhr) {
			const like = $("#like-icon");
		    let likeCount = parseInt($('#like-count').text());
		    if (like.hasClass('s-likes-icon-active')) {
		        like.removeClass('s-likes-icon-active');
		        likeCount--;
		    } else {
		        like.addClass('s-likes-icon-active');
		        likeCount++;
		    }
		    $('#like-count').html(likeCount);
		},
		error: function(error, status, xhr) {
			console.log("좋아요 오청 실패");
		}
	})
};

const handleKeyPress = (e) => {
    if (e.key === 'Enter') {
    	e.preventDefault();
        let formData = new FormData(e.target.form);
        
        checkAuthentication(addReply, formData);
//        addReply(formData);
        
        e.target.value = '';
    }
};

const addReply = (formData) => {
	
	let postId = formData.get("postId");
	
	$.ajax({
		type: "POST",
		url: "/api/mypet/comments",
		data: formData,
		processData: false,
	    contentType: false,
	    success: function(result, status, xhr) {
	    	makeCommentPart(postId);
	    },
	    error: function(error, status, xhr) {
	    	alert("로그인이 필요합니다.");
	    	$(".modal").modal("hide");
	    	$("#login-modal").modal("show");
	    }
	})
};


const openPost = (id) => {
	
	makePostPart(id);
	makeCommentPart(id);
	makeLikePart(id);
	makeLikeStatus(id);
	
    $('#mypet-detail-modal').modal('show');
};

const makePostPart = (id) => {
	let userId;
	
	$.ajax({
	    type:"GET",
	    url:"/api/mypet/posts/" + id,
	    success: function(result, status, xhr) {
			let images = result.image.split(",");
			let imageTag;

			if (images.length == 1) {
				
				imageTag = "<img src=" + images[0] + ">";
				
			} else {

				imageTag = '	<div id="mypet-detail-carousel" class="carousel slide" data-ride="carousel" data-interval="false">';
				imageTag +='		<div class="carousel-inner">';
							
				for ( i in images ) {
					let img;

					if ( i == 0 ) {
						img = '<div class="carousel-item active" >';
					} else {
						img = '<div class="carousel-item" >';
					}

					img += '<div class="carousel-item-inner">';
					img += '<div class="img-wrapper">';
					img += '<img src=' + images[i] + '/>';
					img += '</div>';
					img += '</div>';
					img += '</div>';
					imageTag += img;
				}
				
				imageTag += '	</div>';
				imageTag += '		<a class="carousel-control-prev" href="#mypet-detail-carousel" role="button" data-slide="prev">';
				imageTag += '			<span class="carousel-control-prev-icon" aria-hidden="true"></span>';
				imageTag += '			<span class="sr-only">Previous</span>';
				imageTag += '		</a>';
				imageTag += '		<a class="carousel-control-next" href="#mypet-detail-carousel" role="button" data-slide="next">';
				imageTag += '			<span class="carousel-control-next-icon" aria-hidden="true"></span>';
				imageTag += '			<span class="sr-only">Next</span>';
				imageTag += '		</a>';
				imageTag += '	</div>';

			}
			
			$('#post-id').val(result.postId);
			
			$('#post-picture').html(imageTag);
			$('#post-title').html(result.title);
			$('#post-content').html(result.content);

			// date 변환
            $('#created-date').html(makeDateString(new Date(result.createdDate)));
		    
		    //userId 부여
		    let userId = result.userId;
		    
		    $.ajax({
				type: "GET",
				url: "/api/users/" + userId,
				success: function(result, status, xhr) {
					$('#post-creator').html(result.nickname);
				},
				error: function(error, status, xhr) {
					
				}
			})
			
	    },
	    error: function(error, status, xhr) {
	        
	    }
	});
};

const makeCommentPart = (id) => {
	$.ajax({
		type: "GET",
		url: "/api/mypet/comments/post/" + id,
		success: function(data, status, xhr) {
			$('#comment-count').html(data.comments.length);
			$("#mypet-replies-body").html("");
			$.each(data.comments, function(index, value) {
				let reply = "<div id='commentId" + value.commentId + "' class='mypet-reply'>";
				reply += "<div class='replyer'>";
				reply += "<div class='replyer-wrapper'>";
				reply += "<div class='user-profile-picture'>";
				reply += "<i class='fas fa-user-circle fa-lg'></i>";
				reply += "</div>";
                reply += "<div class='user-profile-info'>";
                reply += "<a class='userId" + value.userId + " user-detail' href=''>";
                reply += "</a>";
                reply += "</div>";
                reply += "</div>";
                reply += "</div>";
                reply += "<div class='reply-content'>";
                reply += value.content;
                reply += "</div>";
                reply += "<div class='reply-created-date'>";
                reply += makeDateString(new Date(value.createdDate));
                reply += "</div>";
                reply += "</div>";
				$("#mypet-replies-body").append(reply);
				
				$.ajax({
					type: "GET",
					url: "/api/users/" + value.userId,
					success: function(result, status, xhr) {
						$('.userId'+value.userId).html(result.nickname);
					},
					error: function(error, status, xhr) {
						
					}
				})
				
			})
		}
	})
};

const makeDateString = (date) => {

    let createdDate = new Date(date);
    let createdDateYear = createdDate.getFullYear();
    let createdDateMonth = createdDate.getMonth();
    if ( createdDateMonth < 10) {
        createdDateMonth = "0" + createdDateMonth;
    }
    let createdDateDay = createdDate.getDay();
    if (createdDateDay < 10) {
        createdDateDay = "0" + createdDateDay;
    }

    let createdDateString = createdDateYear + "." + createdDateMonth + "." + createdDateDay;

    return createdDateString;
};

const makeLikePart = (id) => {
	$.ajax({
		type: "GET",
		url: "/api/mypet/posts/likes/" + id,
		success: function(data, status, xhr) {
		    $('#like-count').html(data.likes.length);
			
		},
		error: function(error, status, xhr) {
			
		}
	})
};

const makeLikeStatus = (id) => {
	$.ajax({
		type: "GET",
		url: "/api/mypet/posts/isLiked/" + id,
		success: function(data, status, xhr) {
			const like= $('#like-icon');
			if (data == true) {
				like.addClass("s-likes-icon-active");
			}
			if ( data == false ) {
				like.removeClass("s-likes-icon-active");
			}
		},
		error: function(error, status, xhr) {
			
		}
	})
};

let page = 1;
let isEndPage = false;
const makeMypetPostList = (pageNum, hashtag) => {
	if (isEndPage) {
		alert("마지막 게시물입니다.");
		return;
	}
	
	$.ajax({
		type: "GET",
		url: "/api/mypet/posts",
		data: {"pageNum" : pageNum, "hashtag" : hashtag},
		success: function(data, status, xhr) {
			page++;
			if (page >= data.lastPage) {
				isEndPage = true;
			}
			$.each(data.posts, function(index, value) {
				let img = "<div id='" + value.postId + "' onclick='openPost(this.id)' ondblclick='likeDoubleClick(this.id)'>"
				img += "<figure>";
				img += "<img src=" + value.image + ">";
				img += "</figure>";
				img += "</div>";
				$("#columns").append(img);
			})
		},
		error: function(error, status, xhr) {
			
		}
	})
};

$(window).scroll(function() {

	if ( $(window).scrollTop() == $(document).height() - $(window).height() ) {
		makeMypetPostList(page);
	}

});

$(window).ready(function() {
	makeMypetPostList(page);
});

