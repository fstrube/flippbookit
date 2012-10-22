(function($){
	$(function(){
		// Uploadify
		// $('.input-file').uploadify({
		// 	buttonClass : 'btn',
		// 	swf         : '/js/uploadify.swf',
		// 	uploader    : '/upload'
		// });

		// Valums FileUploader
		// if ( $.find('#file-upload') ) {
		// 	var uploader = new qq.FileUploader({
		// 		action           : '/upload',
		// 		element          : document.getElementById('file-upload'),
		// 		uploadButtonText : 'Upload a File'
		// 	});
		// }

		// Bootstrap Fileupload
		$('.fileupload').fileupload();
	});
})(jQuery);