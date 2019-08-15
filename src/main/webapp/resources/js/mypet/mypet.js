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

    $('#comment-save-part').on("keypress", function(event) {
    	handleKeyPress(event);
	})
});

$(window).resize(function() {
    resizeIcon();
});

const checkAuthentication = (callback, param) => {
	$.ajax({
		type: "GET",
		url: "/api/users/authenticate",
		dataType: "json",
		success: function(loginedUserData, status, xhr) {
			if (callback) {
				callback(loginedUserData, param);
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

const likePost = (loginedUserData, id) => {
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

        e.target.value = '';
    }
};

const addReply = (loginedUserData, formData) => {
	
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

const makePostPart = (postId) => {
	let userId;
	
	$.ajax({
	    type:"GET",
	    url:"/api/mypet/posts/" + postId,
	    success: function(result, status, xhr) {
			let images = result.image.split(",");
			let imageTag;

			if (images.length == 1) {
			    
			    imageTag = "<div class='carousel-inner'>";
			    imageTag += "<div class='carousel-item active'>";
			    imageTag += "<div class='carousel-item-inner'>";
			    imageTag += "<div class='img-wrapper'>";
				imageTag += "<img src=" + images[0] + ">";
				imageTag += "</div>";
				imageTag += "</div>";
				imageTag += "</div>";
				imageTag += "</div>";
				
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
				url: "/api/users/" + result.userId,
				success: function(result, status, xhr) {
					let userTag = "";
					userTag += "<div class='replyer-image-container' id='user" + result.id + "'>";
					userTag += '<img src="' + result.profileImage + '" class="replyer-image">';
					userTag += "</div>";
					userTag += '<div class="reply-content" id="post-user-' + result.id + '">';
					userTag += '<h5 id="replyer-nickname-' + result.id +  '" class="text-uppercase" style="display:inline-block; padding-right:1rem">' + result.nickname + '</h5>';
					userTag += '</div>';
					getLoginedUserInfo(makeUpdateDeleteButtonForPost, result.id, postId);
					$('#profile-area').html(userTag);
				},
				error: function(error, status, xhr) {
					
				}
			})
			
	    },
	    error: function(error, status, xhr) {
	        
	    }
	});
};

const makeUpdateDeleteButtonForPost = (loginedUserData, userId, postId) => {
	if ( loginedUserData.id == userId) {
		let reply = "";
		reply += '<div class="nav navbar-nav ml-auto modify-remove-navbar">';
		reply += '<a href="#" data-toggle="dropdown" class="dropdown modify-remove-dropdown"><img src="/resources/img/reply-modify-button.png" class="modifyBtn" style="float: right"></a>';
		reply += '<div class="dropdown-menu modify-remove-dropdown-menu" role="menu">';
		reply += '<div class="dropdown">';
		reply += '<a onclick="modifyPost('+ postId +')">수정</a>';
		reply += '</div>';
		reply += '<div class="dropdown">';
		reply += '<a href="#" class="nav-link" id="message-btn" data-toggle="modal"><a onclick="removePost(' + postId +')">삭제</a></a>';
		reply += '</div>';
		reply += '</div>';
		reply += '</div>';
		reply += '</div>';

		$("#post-user-" + userId).append(reply);
	} else {
		let reply = "";
		reply += '<div class="nav navbar-nav ml-auto modify-remove-navbar" >';
		reply += '<a href="#" data-toggle="dropdown" class="dropdown modify-remove-dropdown"><img src="/resources/img/reply-modify-button.png" class="modifyBtn" style="float: right"></a>';
		reply += '<div class="dropdown-menu modify-remove-dropdown-menu" role="menu">';
		reply += '<div class="dropdown">';
		reply += '<a onclick="reportPost('+ postId +')">신고</a>';
		reply += '</div>';
		reply += '</div>';
		reply += '</div>';

		$("#post-user-" + userId).append(reply);
	}
};

const modifyPost = (postId) => {

};

const removePost = (postId) => {

};

const reportPost = (postId) => {

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
				reply += "<div id='replyer-picture-" + value.userId + "' class='replyer-image-container replyer-picture-" + value.userId + "'>";
				reply += '</div>';

				reply += '<div class="reply-content" id="reply-content' + value.commentId + '">';
				reply += '<h5 id="replyer-nickname-' + value.userId +  '" class="text-uppercase replyer-nickname-' + value.userId + '" style="display:inline-block; padding-right:1rem"></h5>';
				reply += '<a class="posted">';
				reply += '<i class="fa fa-clock-o" style="padding-right:0.2rem"></i>' + makeDateString(new Date(value.createdDate)) + '</a>';

				//수정 시에만 출력
				if(value.created_date != value.updated_date){
					reply += '<a class="posted">';
					reply += '<i class="fa fa-history" style="padding:0 0.2rem 0 1.5rem; "></i>' + value.updated_date + ' 수정됨</a>';
				}

				reply += '<input type="hidden" class="form-control comment-input-form" id="commentContent'+ value.commentId +'" value="'+ value.content +'">';
				reply += '<div id="commentBlock'+ value.commentId +'">';

				reply += '<div id="commentInnerText' + value.commentId + '" class="modify-comment">' + value.content +'</div>';

				//본인이 작성한 댓글일 경우
				getLoginedUserInfo(makeUpdateDeleteButton, value.userId, value.commentId, id);

				reply += '</div>';

				//댓글 append
				$("#mypet-replies-body").append(reply);
				
				$.ajax({
					type: "GET",
					url: "/api/users/" + value.userId,
					success: function(result, status, xhr) {
						$('.replyer-nickname-'+value.userId).html(result.nickname);
						let profileImage = '<img src="' + result.profileImage + '" class="replyer-image">';
						$('.replyer-picture-' + value.userId).html(profileImage);
					},
					error: function(error, status, xhr) {
						
					}
				})
				
			})
		}
	})
};

const makeUpdateDeleteButton = (loginedUserData, commentUserId, commentId, postId) => {
	if (loginedUserData.id == commentUserId) {
		let reply = "";
		reply += '<div class="nav navbar-nav ml-auto modify-remove-navbar">';
		reply += '<a href="#" data-toggle="dropdown" class="dropdown modify-remove-dropdown"><img src="/resources/img/reply-modify-button.png" class="modifyBtn" onclick="buttonChange('+ commentId +')"></a>';
		reply += '<div class="dropdown-menu modify-remove-dropdown-menu" role="menu">';
		reply += '<div class="dropdown">';
		reply += '<a onclick="button('+ commentId + "," + postId +')">수정</a>';
		reply += '</div>';
		reply += '<div class="dropdown">';
		reply += '<a href="#" class="nav-link" id="message-btn" data-toggle="modal"><a onclick="removeComment('+ commentId +', ' + postId +')">삭제</a></a>';
		reply += '</div>';
		reply += '</div>';
		reply += '</div>';
		reply += '</div>';

		$("#commentId" + commentId).append(reply);
	}
};

const getLoginedUserInfo = (callback, param1, param2, param3) => {
	$.ajax({
		type: "GET",
		url: "/api/users/authenticate",
		dataType: "json",
		success : function(loginedUser) {
			if(callback) {
				callback(loginedUser, param1, param2, param3);
			}
		}
	})
};

//버튼 속성 변경
function button(commentId, postId) {

	var contentVal = $("#commentContent"+commentId+"").val();
	var loginModal = $("#login-modal");

	//output += '<input id="commentModifyBtn'+result[i].id+'" onclick="modifyComment('+result[i].id+')" type="hidden" class="btn btn-template-outlined buttons" value="수정" style="float:right; margin-right:15px; margin-top:20px">';

	$('#commentBlock'+commentId+'').attr({"style":"display:none"});
	$('#commentContent'+commentId+'').attr({"type":"text", "value":contentVal});
	$('#reply-content'+commentId+'').append('<div><input id="commentModifyBtn'+commentId+'" onclick="modifyComment('+ commentId + ", " + postId+')" type="hidden" class="btn btn-template-outlined buttons" value="수정" style="float:right; margin-right:15px; margin-top:20px"></div>');

	$('#commentCloseBtn'+commentId+'').attr({"type":"button"});
	$('#commentDeleteBtn'+commentId+'').attr({"type":"button"});
	$('#commentModifyBtn'+commentId+'').attr({"type":"button"});
}

function buttonChange(id) {

	let contentVal = $("#commentContent"+id+"").val();
	let loginModal = $("#login-modal");

	$('#commentModifyBtn'+id+'').attr({"type":"button"});
}

//댓글 수정
function modifyComment(id, postId, callback, error) {
	let comment = {"commentId":id, "content":$('#commentContent'+id+'').val()};

	$.ajax({
		type : 'put',
		url : '/api/mypet/comments',
		data : JSON.stringify(comment),
		contentType : "application/json; charset=utf-8",
		success : function(result, status, xhr) {
			makeCommentPart(postId);
		},
		error : function(xhr, status, er) {
			if(error) {
				error(er);
			}
		}
	});
}

//댓글 삭제
function removeComment(commentId, postId) {

	if(confirm("삭제하시겠습니까?")) {
		$.ajax({
			type : 'delete',
			url : '/api/mypet/comments/' + commentId,
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				makeCommentPart(postId)
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	}
	else {
		//alert('삭제 취소!');
		closeComment(id);
	}
}

//댓글 닫기
function closeComment(id) {
	$("#commentContent"+id+"").attr({"type":"hidden"});
	$("#commentModifyBtn"+id+"").attr({"type":"hidden"});
	$("#commentDeleteBtn"+id+"").attr({"type":"hidden"});
	$("#commentCloseBtn"+id+"").attr({"type":"hidden"});
	$("#commentBlock"+id+"").attr({"style":"display:block"});
}

const makeDateString = (date) => {

    let createdDate = new Date(date);
    let createdDateYear = createdDate.getFullYear();
    let createdDateMonth = createdDate.getMonth();
    let createdDateHour = createdDate.getHours();
    let createdDateMinute = createdDate.getMinutes();
    if ( createdDateMonth < 10) {
        createdDateMonth = "0" + createdDateMonth;
    }
    let createdDateDay = createdDate.getDay();
    if (createdDateDay < 10) {
        createdDateDay = "0" + createdDateDay;
    }
    if (createdDateHour < 10) {
    	createdDateHour = "0" + createdDateHour;
	}
    if (createdDateMinute < 10) {
    	createdDateMinute = "0" + createdDateMinute;
	}

    let createdDateString = createdDateYear + "." + createdDateMonth + "." + createdDateDay + " " + createdDateHour + ":" + createdDateMinute;

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
			if (page > data.lastPage) {
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

