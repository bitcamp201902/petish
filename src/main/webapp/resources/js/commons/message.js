let newModal = $("#messageWrite-modal"); //모달창
let modalInputReceivedNickname = newModal.find("input[name='nickname']"); //모달창 받는사람
let modalInputReceiver_id = newModal.find("input[name='receiver_id']"); //모달창 받는 user_id
let modalInputTitle = newModal.find("input[name='title']"); //모달창 제목
let modalInputContent = newModal.find("textarea[name='content']"); //모달창 내용
let modalSendBtn = $(".modalSendBtn"); //모달 보내기 버튼

//쪽지작성 모달 열기(닉네임 및 아이디 전달)
const openMessageForm = () => {
    let showmodal = $(".showmodal");
    showmodal.on("click", function(e) {
        let id = $(this).data("id");
        let nick = $(this).data("nick");
        modalInputReceiver_id.val(id);
        modalInputReceivedNickname.val(nick);
        $("#messageWrite-modal").modal("show");
    });
};

//쪽지보내기 버튼 클릭시
modalSendBtn.on("click", function(e) {
    var message = {
        title : modalInputTitle.val(),
        content : modalInputContent.val(),
        sender_id : user_id,
        receiver_id : modalInputReceiver_id.val()
    };

    messageService.writeMessage(message, function(result) {
        alert("result : " + result);
        $("#new-modal").modal("hide");
        location.reload();
    });
});


//쪽지보내기 ajax메서드
var messageService = (function() {
    function writeMessage(message, callback, error) {
        $.ajax({
            type : 'post',
            url : '/mypage/api/message/new',
            data : JSON.stringify(message),
            contentType : "application/json; charset=utf-8",
            success : function(result, status, xhr) {
                if (callback) {
                    callback(result);
                }
            },
            error : function(xhr, status, er) {
                if (error) {
                    error(er);
                }
            }
        })
    }
    return {
        writeMessage : writeMessage
    };
})();