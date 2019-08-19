$(document).ready(function() {
			$('#summernote').summernote({
				height : 300, // set editor height
				minHeight : null, // set minimum height of editor
				maxHeight : null, // set maximum height of editor
				focus : false, // set focus to editable area after initializing summernote
				lang : 'ko-KR',
				toolbar : [
						[ 'style', [ 'style' ] ],
						[
								'font',
								[
										'bold',
										'italic',
										'underline',
										'clear' ] ],
						[ 'fontname',
								[ 'fontname' ] ],
						[ 'color', [ 'color' ] ],
						[
								'para',
								[ 'ul', 'ol',
										'paragraph' ] ],
						[ 'height',
								[ 'height' ] ],

						[
								'insert',
								[
										'link',
										'picture',
										'hr' ] ],

				],
				popover : {
					image : [],
					link : [],
					air : []
				}
		});
		$('#resetbtn').click(function() {
			$('#summernote').summernote('reset');
		});
	});