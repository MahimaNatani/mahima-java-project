var img=2;
(function($){
	$("input[name='addimg']").click(function(){
		var parent = $(".images");
		var elem = "<input type='file' name='img"+img+"' /><input type='submit' value='Delete Image' name='delimg'/><br />";
		elem.appendTo(parent);
		img++;
	})
})(jQuery);