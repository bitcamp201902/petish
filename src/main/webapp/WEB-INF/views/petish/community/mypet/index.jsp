<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mypet</title>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/resources/css/mypet/mypet.css">
    <link rel="stylesheet" href="/resources/css/mypet/comment.css">
    <link rel="stylesheet" href="/resources/css/mypet/mypetvote.css">
    <script src="/resources/js/mypet/mypet.js"></script>
    <script src="/resources/js/mypet/mypetvote.js"></script>

</head>
<body style="font-family: 'Do Hyeon', sans-serif ">
<div class="all">

	<%@ include file="/WEB-INF/views/commons/top.jspf" %>

    <div class="container-fluid">

        <div class="board-header">
            <div class="title">
                <button type="button" id="voteModalButton" class="btn btn-primary" data-toggle="modal" data-target="#mypet-vote-modal">투표 모달</button>
                <button type="button" id="writeFormButton" class="btn btn-primary" style="float: right" onclick="location.href='/mypet/write'">글쓰기</button>
                <h2>마이펫</h2>
            </div>
        </div>
        
        <div class="board-body">
            <div id="columns" >

            </div>
        </div>
    </div>

</div>

		<!-- 투표창 모달 시 -->
		<div class="modal fade" id="mypet-vote-modal">
			<div class="modal-dialog modal-dialog-centered modal-dialog-resizer">
            	<div class="modal-content vote-modal"> 

	                <div class="modal-header vote-modal-header">
	                    <div class="vote-modal-header-content">
	                        <div class="vote-modal-header-body">
	                            <span class="vote-modal-header-body">가장 이쁜 동물을 투표해주세요!</span>
	                        </div>
	                    </div>
	                </div>

                	<div class="modal-body vote-modal-body">
                    	<form id="vote-form">
                    	<div class="vote-candidate-container">
                        
							<div class="vote-candidate-wrapper" id="1">
								<div class="vote-candidate">
									<div class="vote-image-wrapper">
										<div class="vote-image">
											<img src="https://c.pxhere.com/photos/b1/90/dog_puppy_pet_animal_cute_labrador-855217.jpg!d" >
                                        </div>
                                    </div>  
                                    <div class="vote-select-wrapper">
                                        <div class="vote-selector">
                                            <input type="radio" name="vote-candidate" value="1">
                                        </div>
                                    </div>
                                </div>
                            </div>
                    
                            <div class="vote-candidate-wrapper" id="2">
                                <div class="vote-candidate">
                                    <div class="vote-image-wrapper">
                                        <div class="vote-image">
                                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP_-HHVJrxrUwVgcif6cpBPCp18jayAdpwXyecnu7bxdueXa2U">
                                        </div>
                                    </div>  
                                    <div class="vote-select-wrapper">
                                        <div class="vote-selector">
                                            <input type="radio" name="vote-candidate" value="2">
                                        </div>
                                    </div>
                                </div>
                            </div>
                    
                            <div class="vote-candidate-wrapper" id="3">
                                <div class="vote-candidate">
                                    <div class="vote-image-wrapper">
                                        <div class="vote-image">
                                            <img src="https://tul.imgix.net/content/article/puppy-pinot-sydney.jpg?auto=format,compress&w=740&h=486&fit=crop&crop=edges">
                                        </div>
                                    </div>  
                                    <div class="vote-select-wrapper">
                                        <div class="vote-selector">
                                            <input type="radio" name="vote-candidate" value="3">
                                        </div>
                                    </div>
                                </div>
                            </div>
                    
                            <div class="vote-candidate-wrapper" id="4">
                                <div class="vote-candidate">
                                    <div class="vote-image-wrapper">
                                        <div class="vote-image">
                                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/c/c9/Puppy_Up_Close.jpg/1062px-Puppy_Up_Close.jpg">
                                        </div>
                                    </div>  
                                    <div class="vote-select-wrapper">
                                        <div class="vote-selector">
                                            <input type="radio" name="vote-candidate" value="4">
                                        </div>
                                    </div>
                                </div>
                            </div>
                                
                        </div>
                    	</form>
                	</div>

	                <div class="modal-body vote-modal-footer">
	                    <div class="vote-modal-footer-content">
	                        <div class="vote-modal-footer-body">
	                            <button id="voteButton" >투표하기</button>
	                        </div>
	                    </div>
	                </div>

	            </div>
	        </div>
	    </div>
	    <!-- 투표창 모달  -->

		<!-- 조회창 모달 시작 -->
        <div class="modal fade" tabindex="-1" role="dialog" id="mypet-detail-modal">
            <div class="modal-dialog modal-dialog-centered" id="mypet-modal-dialog">
                <div class="modal-content" id="mypet-modal-content">

                    <div class="modal-body" id="profile-area">

                    </div>

                    <div class='modal-body' id="content-area">
                        <div class="mypet-body">
                            <div class="mypet-picture">
                                <div class="picture">

                                    <div class="picture-wrapper" ondblclick="likeDoubleClick()">
                                        <div id="post-picture">
                                        <!-- <img src="https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2018/05/22224952/beagle-puppy-in-large-cushion-chair.jpg"> -->
                                        </div>
                                    </div>

                                </div> 
                            </div>
                            
                        </div>

                        <div class="mypet-content-body">
                            <div class="mypet-title">
                                <h4 id="post-title"></h4>
                            </div>

                            <div class="mypet-created-date">
                                <span id="created-date"></span>
                            </div>

                            <div class="mypet-content" id="post-content">

                            </div>
                        </div>

                        <div class="reply-like">
                            <table class="s-caption-table">
                                <tr>
                                    <td class="pr-1"> <i id="like-icon" class="like-icon fas fa-paw s-likes-icon" onclick="likeClick()"></i> 좋아요 <span class="s-likes" id="like-count"></span> </td>
                                    <td class="px-1"> <i id="comment-icon" class='comment-icon far fa-comment'></i> 댓글 <span id="comment-count" class="s-comments"></span></td>
                                </tr>
                            </table>
                        </div>

                        <div id="mypet-replies-body" class="mypet-replies">

                        </div>

                    </div>

                    <div class="modal-body" id="reply-form">
                    	<form>
	                        <input name="content" id="comment-save-part" class="form-control" placeholder="댓글 달기...">
	                        <input name="postId" id="post-id" type="hidden" value="2">
                    	</form>
                    </div>

                </div>
            </div>
        </div>
        <!-- 조회창 모달  -->

</body>
</html>