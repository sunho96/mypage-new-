<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>mypage</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> <!--draggable  -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> <!--resizable -->
<script type="text/javascript">
	$(function() {
		$('#sticker').hide();
	});
	function openSti() {
		$('#sticker').show();
		$("#content")
		.prepend(
				"<div id='sti'style='width: 100px;height: 100px'><img src='${path}/images/me.jpg' style='padding=0;width: 100%;height: 100%'/></div>");
		$('#sti').resizable().draggable();
	}
	function openText() {
		$("#content")
				.prepend(
						"<div id='textbox' style='width: 100px; height: 100px;'><textarea style='width: 100%; height: 100%; padding:0; border: none;'id='text'>Some text</textarea><div>");
		$('#textbox').draggable({
			snap : true,
			cursor : "move",
			delay : 100,
			scroll : false,
			cancel : "text",
			drag : function(e, ui) {
				//some code
			}
		}).resizable({
			/* containment : "parent", */ /* height 못 커지게 막음 */
			stop : function(e, ui) { /*얘네 가 있어야  draggable이 가능  */
				var width = ui.size.width;
				var height = ui.size.height;
				var hereDrag = this; 
			},
			/* resize : function(e, ui) {
				//some code
			} */
		})

	}
	function goSti(name) {
		$('#content').prepend("<div id='sti'style='width: 100px;height: 100px'><img src='${path}/resources/sticker/"+name+".png' style='padding=0;width: 100%;height: 100%'/></div>");
		$('#sti').resizable().draggable();
	}
</script>
<style type="text/css">

a:link { text-decoration:none; color:#646464;}

 a:visited { text-decoration:none;color:#646464;}

 a:active {text-decoration:none; color:#646464; }

 a:hover { text-decoration:none; color:#646464;}
textarea {
	background-color: transparent;	
}
textarea:focus {
	outline: none;
}
</style>
</head>
<body>
	<h2></h2>
	<div id="logo" align="center"
		style="margin-top: 10px; margin-bottom: 30px">
		<a href="${path }/main"><span style="font-family: 'Dynalight'; font-size: 50px; color: black">My Page</span></a>
	</div>
	<div style=" margin-bottom:30px; font-family:'Lilly'; font-size: 25px" align="center">"${subject }"</div>
	<div class="container" align="center">
		<div>
			<span style="font-family: 'Lilly'; font-size: 20px"> <a
				onclick="openSti()">sticker</a></span><span style="font-size: 20px">ㅣ</span>
			<span style="font-family: 'Lilly'; font-size: 20px"> <a
				onclick="openText()">textbox</a></span> <span style="font-size: 20px">ㅣ</span>
			<span style="font-family: 'Lilly'; font-size: 20px"> <a
				onclick="openBg()">background</a></span><span style="font-size: 20px">ㅣ</span>
			<span style="font-family: 'Lilly'; font-size: 20px"> <a
				onclick="openPhoto()">photo</a></span>
		</div>
		<p>
		<p>
		<p>
		<div id="sticker">
			<ul class="nav nav-pills">
				<li class="active"><a data-toggle="pill" href="#home">전체</a></li>
				<c:forEach items="${stickerGName}" var="g">
					<li><a data-toggle="pill" href="#${g.groupName }">${g.groupName}</a></li>
				</c:forEach>
			</ul>
			<div class="tab-content">

				<div id="home" class="tab-pane fade in active">
					<c:forEach items="${stickerList }" var="s">
						<a onclick="goSti(${s.name})"><img
							alt="" src="../resources/sticker/${s.name}.png" width="100px"
							height="100px"></a>
					</c:forEach>
				</div>

				<c:forEach items="${stickerGName}" var="g">
					<div id="${g.groupName }" class="tab-pane fade">
						<c:forEach items="${stickerList }" var="s">
							<c:if test="${g.groupName==s.groupName }">
								<a onclick="goSti(${s.name})"><img
									alt="" src="../resources/sticker/${s.name}.png" width="100px"
									height="100px"></a>
							</c:if>
						</c:forEach>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<div class="container" align="center" style="margin-top: 20px">
		<div id="content"
			style="width: 40em; height: 50em; background-color: seashell; overflow: hidden;">

		</div>
	</div>
</body>
</html>
