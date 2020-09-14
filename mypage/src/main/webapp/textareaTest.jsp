<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- draggable에 필요한 cdn  -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script type="text/javascript">
	$(function() {
		$('.drag-item').draggable({
			snap : true,
			cursor : "move",
			delay : 100,
			scroll : false,
			cancel : "text",
		/* 	containment : "parent", */ /* draggable 구역을 막음.  */
			 drag : function(e, ui) {
				//some code
			} 
		}).resizable({
			/* containment : "parent", */ /* height 못 커지게 막음 */
			stop : function(e, ui) { /*얘네 가 있어야  draggable이 가능  */
				var width = ui.size.width;
				var height = ui.size.height;
				var hereDrag = this; 

				/* if ($(hereDrag).find('textarea').length > 0) {
					$(hereDrag).find('textarea').css('width', width - 10);
					$(hereDrag).find('textarea').css('height', height - 10);
				} */
			},
			/* resize : function(e, ui) {
				//some code
			} */
		})

	});
</script>
</head>
<body>
	<div class="drag-item" style="width: 100px; height: 100px;">
		<textarea style="width: 100%; height: 100%; padding:0; border: none;" name="text"
			id="text">Some text</textarea>
	</div>
</body>
</html>