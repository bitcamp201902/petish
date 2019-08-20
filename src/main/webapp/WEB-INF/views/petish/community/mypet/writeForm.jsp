<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <link rel="stylesheet" href="/resources/css/mypet/mypet.css">
    <link rel="stylesheet" href="/resources/css/mypet/mypetForm.css">

</head>
<body class="bg-light">
	<div id="all">

  	<%@ include file="/WEB-INF/views/commons/mypet_top.jspf" %>

	<div class="container-fluid body-section">
    <!-- MyPet Write Start -->

		<div class="board-header">
			<div class="title">
				<h2>마이펫</h2>
			</div>
		</div>

		<div class="text-center">
			<div class="heading">
	      	<h2>마이펫 글 작성</h2>
	    	</div>
		</div>

		<div class="board-body">
			<div class="bar pt-0">
				<div class="col-md-8 mx-auto">

					<div id="write-form-carousel" class="col-sm-12">
						<div id="mypet-detail-carousel" class="carousel slide" data-ride="carousel" data-interval="false">
							<div class="carousel-inner">
							</div>
							<a class="carousel-control-prev" href="#mypet-detail-carousel" role="button" data-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a>
							<a class="carousel-control-next" href="#mypet-detail-carousel" role="button" data-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
					</div>

					<form enctype="multipart/form-data">
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<label for="fileInput">사진 첨부</label>
									<input id="fileInput" type="file" multiple="multiple" name="file">
								</div>
							</div>

							<div class="col-sm-12">
								<div class="form-group">
									<label for="firstname">제목</label>
									<input id="firstname" type="text" name="title" class="form-control">
                      			</div>
                    		</div>

                    		<div class="col-sm-12">
                    			<div class="form-group">
                    				<label for="message">내용</label>
                    				<textarea id="message" name="content" class="form-control" contenteditable="true"></textarea>
                      			</div>
                    		</div>

                    		<div class="col-sm-12 text-center">
                    			<input id="submit-button" class="btn btn-primary" type="button" value='등록'/>
                   				<input type="reset" class="btn btn-primary" value="취소" />
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>

	</body>
	<script>
		// // 아래는 모두 해쉬태그로직
		// var saveSelection, restoreSelection;
		//
		// //해시태그 모음 ...
		// var hash_txt = new Array();
		//
		// //커서위치...
		// if (window.getSelection && document.createRange) {
		// 	saveSelection = function(containerEl) {
		// 		var range = window.getSelection().getRangeAt(0);
		// 		var preSelectionRange = range.cloneRange();
		// 		preSelectionRange.selectNodeContents(containerEl);
		// 		preSelectionRange.setEnd(range.startContainer, range.startOffset);
		// 		var start = preSelectionRange.toString().length;
		//
		// 		return {
		// 			start: start,
		// 			end: start + range.toString().length
		// 		}
		// 	};
		//
		// 	restoreSelection = function(containerEl, savedSel) {
		// 		var charIndex = 0, range = document.createRange();
		// 		range.setStart(containerEl, 0);
		// 		range.collapse(true);
		// 		var nodeStack = [containerEl], node, foundStart = false, stop = false;
		//
		// 		while (!stop && (node = nodeStack.pop())) {
		// 			if (node.nodeType == 3) {
		// 				var nextCharIndex = charIndex + node.length;
		// 				if (!foundStart && savedSel.start >= charIndex && savedSel.start <= nextCharIndex) {
		// 					range.setStart(node, savedSel.start - charIndex);
		// 					foundStart = true;
		// 				}
		// 				if (foundStart && savedSel.end >= charIndex && savedSel.end <= nextCharIndex) {
		// 					range.setEnd(node, savedSel.end - charIndex);
		// 					stop = true;
		// 				}
		// 				charIndex = nextCharIndex;
		// 			} else {
		// 				var i = node.childNodes.length;
		// 				while (i--) {
		// 					nodeStack.push(node.childNodes[i]);
		// 				}
		// 			}
		// 		}
		//
		// 		var sel = window.getSelection();
		// 		sel.removeAllRanges();
		// 		sel.addRange(range);
		// 	}
		// } else if (document.selection) {
		// 	saveSelection = function(containerEl) {
		// 		var selectedTextRange = document.selection.createRange();
		// 		var preSelectionTextRange = document.body.createTextRange();
		// 		preSelectionTextRange.moveToElementText(containerEl);
		// 		preSelectionTextRange.setEndPoint("EndToStart", selectedTextRange);
		// 		var start = preSelectionTextRange.text.length;
		//
		// 		return {
		// 			start: start,
		// 			end: start + selectedTextRange.text.length
		// 		}
		// 	};
		//
		// 	restoreSelection = function(containerEl, savedSel) {
		// 		var textRange = document.body.createTextRange();
		// 		textRange.moveToElementText(containerEl);
		// 		textRange.collapse(true);
		// 		textRange.moveEnd("character", savedSel.end);
		// 		textRange.moveStart("character", savedSel.start);
		// 		textRange.select();
		// 	};
		// }
		//
		// //a태그
		// function createLink(matchedTextNode) {
		// 	var el = document.createElement("a");  // el : http://localhost/recipegram_write#djskfdl
		// 	var hash = matchedTextNode.data.split('#');  // search 하기위해 #제거
		// 	el.href = "recipegram_index?recipe_search=" +hash[1];  //링크는 해시태그 텍스트..
		// 	el.style.color="#5CD1E5";
		// 	el.appendChild(matchedTextNode);
		// 	hash_txt[hash_txt.length] = matchedTextNode.data;// 해시태그 내용...
		//
		// 	return el;
		// }
		//
		// function shouldLinkifyContents(el) {
		// 	return el.tagName != "A";
		// }
		//
		// function surroundInElement(el, regex, surrounderCreateFunc, shouldSurroundFunc) {
		// 	var child = el.lastChild;
		// 	while (child) {
		// 		if (child.nodeType == 1 && shouldSurroundFunc(el)) {
		// 			surroundInElement(child, regex, createLink, shouldSurroundFunc);
		// 		} else if (child.nodeType == 3) {
		// 			surroundMatchingText(child, regex, surrounderCreateFunc);
		// 		}
		// 		child = child.previousSibling;
		// 	}
		// }
		//
		// function surroundMatchingText(textNode, regex, surrounderCreateFunc) {
		// 	var parent = textNode.parentNode;
		// 	var result, surroundingNode, matchedTextNode, matchLength, matchedText;
		// 	while ( textNode && (result = regex.exec(textNode.data)) ) {
		// 		matchedTextNode = textNode.splitText(result.index);
		// 		matchedText = result[0];
		// 		matchLength = matchedText.length;
		// 		textNode = (matchedTextNode.length > matchLength) ?
		// 				matchedTextNode.splitText(matchLength) : null;
		// 		surroundingNode = surrounderCreateFunc(matchedTextNode.cloneNode(true));
		// 		parent.insertBefore(surroundingNode, matchedTextNode);
		// 		parent.removeChild(matchedTextNode);
		// 	}
		// }
		//
		// var textbox = document.getElementById("message");
		// var hashTag = /#([^#\s]+)/; //해시태그 정규식
		//
		// function updateLinks() {
		// 	var savedSelection = saveSelection(textbox); //커서위치 저장
		// 	surroundInElement(textbox, hashTag, createLink, shouldLinkifyContents);
		// 	restoreSelection(textbox, savedSelection);
		// }
		//
		// var $textbox = $(textbox); //해시태그
		//
		// $(document).ready(function () {
		// 	$textbox.focus(); //커서위치 뿌려줌
		//
		// 	var keyTimer = null, keyDelay = 1000; //해시태그가 적용되는 시간... 안하면 바로 변경되어 이어지지가 않는다...
		//
		// 	$textbox.keyup(function() {
		// 		if (keyTimer) {
		// 			window.clearTimeout(keyTimer);
		// 		}
		// 		keyTimer = window.setTimeout(function() {
		// 			updateLinks();
		// 			keyTimer = null;
		// 		}, keyDelay);
		//
		//
		// 	});
		// });

	</script>

	<script src="/resources/js/mypet/writeForm.js"></script>
</html>
