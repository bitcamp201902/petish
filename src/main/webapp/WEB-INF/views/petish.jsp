<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"> <!-- fas 보기 위해서  -->
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="resources/css/mypet.css">
    <script src="resources/js/mypet.js"></script>
    
</head>
<body>

    <div class="container-fluid">

        <div class="board-header">
            <div class="title">
                <h2>마이펫</h2>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".modal">모달</button>
            </div>
        </div>

        <div class="modal fade" tabindex="-1" role="dialog" id="mypet-detail-modal">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <div class="modal-body" id="profile-area">
                        <div class="user-profile-picture">
                            <i class="fas fa-user-circle fa-2x" id="profile-icon"></i>
                        </div>
                            
                        <div class="user-profile-info">
                            <a href="" id="user-id">
                                아이디
                            </a>
                        </div>
                    </div>

                    <div class='modal-body' id="content-area">
                        <div class="mypet-body">
                            <div class="mypet-picture">
                                <div class="picture">

                                    <div class="picture-wrapper" id="1" ondblclick="likeDoubleClick(this.id)">
                                        <div id="post-picture">
                                        <!-- <img src="https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2018/05/22224952/beagle-puppy-in-large-cushion-chair.jpg"> -->
                                        </div>
                                    </div>

                                </div> 
                            </div>
                            
                        </div>

                        <div class="mypet-content-body">
                            <div class="mypet-title">
                                <h4 id="post-title">우리 아기 이쁘죵</h4>
                            </div>

                            <div class="mypet-created-date">
                                <span id="create-date">2019-06-11</span>
                            </div>

                            <div class="mypet-content" id="post-content">
                                어제 찍은 우리 아기 사진이에요~~<br>
                                이게 뭐하는 짓인지<br>
                                현타가 온다~~~~<br>
                                어제 찍은 우리 아기 사진이에요~~<br>
                                이게 뭐하는 짓인지<br>
                                현타가 온다~~~~<br>
                                어제 찍은 우리 아기 사진이에요~~<br>
                                이게 뭐하는 짓인지<br>
                                현타가 온다~~~~<br>
                                어제 찍은 우리 아기 사진이에요~~<br>
                                이게 뭐하는 짓인지<br>
                                현타가 온다~~~~<br>
                                어제 찍은 우리 아기 사진이에요~~<br>
                                이게 뭐하는 짓인지<br>
                                현타가 온다~~~~<br>
                                어제 찍은 우리 아기 사진이에요~~<br>
                                이게 뭐하는 짓인지<br>
                                현타가 온다~~~~<br>
                            </div>
                        </div>

                        <div class="reply-like">
                            <table class="s-caption-table">
                                <tr>
                                    <td class="pr-1"> <i id="like-icon" class="like-icon fas fa-paw s-likes-icon" onclick="likeClick()"></i> 좋아요 <span class="s-likes" id="like-count">49</span> </td>
                                    <td class="px-1"> <i id="1" class='comment-icon far fa-comment'></i> 댓글 <span class="s-comments" id="commnent-count">3</span></td>
                                </tr>
                            </table>
                        </div>

                        <div class="mypet-replies">

                            <!-- reply 한개 -->
                            <div class="mypet-reply">

                                <div class="replyer">
                                    <div class="replyer-wrapper">
                                        <div class="user-profile-picture">
                                            <i class="fas fa-user-circle fa-lg"></i>
                                        </div>
                                            
                                        <div class="user-profile-info">
                                            <a href="">
                                                User1
                                            </a>
                                        </div>
                                    </div>
                                </div>

                                <div class="reply-content">
                                    와 진짜 이쁘네요
                                </div>

                                

                                <div class="reply-created-date">
                                    2019-6-13
                                </div>

                            </div>

                            <!-- reply 한 개 -->
                            <div class="mypet-reply">

                                <div class="replyer">
                                    <div class="replyer-wrapper">
                                        <div class="user-profile-picture">
                                            <i class="fas fa-user-circle fa-lg"></i>
                                        </div>
                                            
                                        <div class="user-profile-info">
                                            <a href="">
                                                User1
                                            </a>
                                        </div>
                                    </div>
                                </div>

                                <div class="reply-content">
                                    와 진짜 이쁘네요
                                </div>

                                <div class="reply-created-date">
                                    2019-6-13
                                </div>

                            </div>

                            <!-- reply 한 개 -->
                            <div class="mypet-reply">

                                <div class="replyer">
                                    <div class="replyer-wrapper">
                                        <div class="user-profile-picture">
                                            <i class="fas fa-user-circle fa-lg"></i>
                                        </div>
                                            
                                        <div class="user-profile-info">
                                            <a href="">
                                                User1
                                            </a>
                                        </div>
                                    </div>
                                </div>

                                <div class="reply-content">
                                    와 진짜 이쁘네요
                                </div>

                                <div class="reply-created-date">
                                    2019-6-13
                                </div>

                            </div>

                        </div>
                        
                    </div>

                    <div class="modal-body" id="reply-form">
                        <input class="form-control" placeholder="댓글 달기..." onkeypress="handleKeyPress(event)">
                    </div>

                </div>
            </div>
        </div>

        <div class="board-body">
        <div id="columns" >
            
            <div id="14" onclick="openPost(this.id)" ondblclick="likeDoubleClick(this.id)">
                <figure>
                    <img src="https://c.pxhere.com/photos/b1/90/dog_puppy_pet_animal_cute_labrador-855217.jpg!d">
                </figure>
            </div>

            <div id="13" onclick="openPost(this.id)">
            <figure>
                <img src="https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2018/05/22224952/beagle-puppy-in-large-cushion-chair.jpg">
            </figure>
            </div>

            <div id="12" onclick="openPost(this.id)">
            <figure>
                <img src="https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12193133/German-Shepherd-Puppy-Fetch.jpg">
            </figure>
            </div>

            <div id="11" onclick="openPost(this.id)">
            <figure>
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP_-HHVJrxrUwVgcif6cpBPCp18jayAdpwXyecnu7bxdueXa2U">
            </figure>
            </div>

            <div id="10" onclick="openPost(this.id)">
            <figure>
                <img src="https://tul.imgix.net/content/article/puppy-pinot-sydney.jpg?auto=format,compress&w=740&h=486&fit=crop&crop=edges">
            </figure>
            </div>

            <div id="9" onclick="openPost(this.id)">
            <figure>
                <img src="https://c.pxhere.com/photos/7b/38/cat_pet_look_animal_feline_animals_kitten_cute-795388.jpg!d">
            </figure>
            </div>

            <div id="8" onclick="openPost(this.id)">
            <figure>
                <img src="https://c.pxhere.com/photos/21/18/dog_animal_cute_pet_portrait-494070.jpg!d">
            </figure>
            </div>

            <div id="7" onclick="openPost(this.id)">
            <figure>
                <img src="https://upload.wikimedia.org/wikipedia/en/thumb/c/c9/Puppy_Up_Close.jpg/1062px-Puppy_Up_Close.jpg">
            </figure>
            </div>

            <div id="6" onclick="openPost(this.id)">
            <figure>
                <img src="https://c.pxhere.com/images/b2/13/73dd518494efc186e51e6df93f7e-1418279.jpg!d">
            </figure>
            </div>

            <div id="5" onclick="openPost(this.id)">
            <figure>
                <img src="https://c.pxhere.com/photos/7b/38/cat_pet_look_animal_feline_animals_kitten_cute-795388.jpg!d">
            </figure>
            </div>

            <div id="4" onclick="openPost(this.id)">
            <figure>
                <img src="https://c.pxhere.com/photos/68/3c/dog_labrador_christmas_lights_cute_retriever_animal_pet-373153.jpg!d">
            </figure>
            </div>

            <div id="3" onclick="openPost(this.id)">
            <figure>
                <img src="https://c.pxhere.com/photos/10/55/mouse_racing_mouse_nager_pet_sun_hand_tame_gerbil-1385729.jpg!d">
            </figure>
            </div>

            <div id="2" onclick="openPost(this.id)">
            <figure>
                <img src="https://c.pxhere.com/photos/79/c1/dog_face_hybrid_eyes_animal_pet_comrade_portrait-626744.jpg!d">
            </figure>
            </div>

            <div id="1" onclick="openPost(this.id)">
            <figure>
                <img src="https://c.pxhere.com/photos/46/fa/puppy_german_shepherd_tiny_cute_animal_dog_pet_young-630530.jpg!d">
            </figure>
            </div>

        </div>
        </div>
    </div>

</body>
</html>