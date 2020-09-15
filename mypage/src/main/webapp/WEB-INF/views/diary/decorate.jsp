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
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!--draggable  -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<!--resizable -->
<script type="text/javascript">
	$(function() {
		$('#sticker').hide();
		$('#getfile').hide();
		$('#backColor').hide();
		
		var file = document.querySelector('#getfile');
		
		file.onchange =function(){
			var fileList = file.files;
			//읽기
			var reader = new FileReader();
			reader.readAsDataURL(fileList[0]);
			//로드한 후
			reader.onload = function() {
			/* 	document.querySelector('#preview').src=reader.result; */
				$('#content').prepend("<div class='imgDisp' style='width: 100px; height: 100px'><img src="+reader.result+" width='100%' height='100%' style='padding: 0'></div>");
				$('.imgDisp').resizable().draggable();
		/* 		$('#morefile').prepend('<a onclick="morefile()">사진추가하기(click)</a>'); */
				var width=$('.imgDisp').width();
				var heigth=$('.imgDisp').height();
				var postion=$('.imgDisp').postion();
				alert(width);
				alert(heigth);
				alert(postion.left);
				alert(postion.top);
			}
		}
	});
	function openSti() {
		$('#sticker').show();
		$('#getfile').hide();
		$('#backColor').hide();
		/*  $("#content")
		.prepend(
				"<div id='sti'style='width: 100px;height: 100px'><img src='${path}/images/me.jpg' style='padding=0;width: 100%;height: 100%'/></div>"); */
		$('#sti').resizable().draggable();
	}
	function openText() {
		$("#content")
				.prepend(
						"<div class='textbox' style='width: 100px; height: 100px;'><textarea style='width: 100%; height: 100%; padding:0; border: none;'id='text'>Some text</textarea><div>");
		$('.textbox').draggable({
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
		});
	}
	function getfile() {
		$('#sticker').hide();
		$('#backColor').hide();
		$('#getfile').show();
	}
	function goSti(name) {
		console.log("name="+name);
		$('#content').prepend("<div class='sti' id='"+name+"' style='width:100px;height:100px'><img src='${path}/images/stickerImage/"+name+"' style='padding=0;width: 100%;height: 100%'/></div>");
		$('.sti').resizable().draggable();
	}
	function openBg() {
		$('#backColor').show();
		$('#sticker').hide();
		$('#getfile').hide();
	}
	function changeBg() {
		var color = $('#bgInput').val();
		$('#content').css('background-color',color);
	}
	function pageReload() {
		location.reload();
	}
	function submit() {
		var stiList = [];
		$('.sti').each(function() {
			var id = $(this).attr('id');
			var width= $(this).width();	
			var height= $(this).height();
			var position = $(this).position();
			var x = position.left;
			var y = position.top;
			var location = {
					'diaryCataNum' : diaryCataNum,
					'subject' : subject,
					'name' : id,
					'width' : width,
					'height' :height,
					'x' : x,
					'y' : y 
			}
			stiList.push(location);
		});
		$.ajax({
			url:"decoLocation",
			dataType: "json",
			contentType : "application/json",
			data : JSON.stringify(stiList),
			traditional :true,
			type:"POST",
			success :function(data){
				if(data=='성공'){
				 	alert("다이어리 입력 성공");
				 	location.href="${path}/main#diaryList";
				}
			}
		});
		
	}
</script>
<style type="text/css">
a:link {
	text-decoration: none;
	color: #646464;
}

a:visited {
	text-decoration: none;
	color: #646464;
}

a:active {
	text-decoration: none;
	color: #646464;
}

a:hover {
	text-decoration: none;
	color: #646464;
}

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
		<a href="${path }/main"><span
			style="font-family: 'Dynalight'; font-size: 50px; color: black">My
				Page</span></a>
	</div>
	<div style="margin-bottom: 30px; font-family: 'Lilly'; font-size: 25px"
		align="center">"${subject }"</div>
	<div class="container" align="center">
		<div>
			<span style="font-family: 'Lilly'; font-size: 20px"> <a
				onclick="openSti()">sticker</a></span><span style="font-size: 20px">ㅣ</span>
			<span style="font-family: 'Lilly'; font-size: 20px"> <a
				onclick="openText()">textbox</a></span> <span style="font-size: 20px">ㅣ</span>
			<span style="font-family: 'Lilly'; font-size: 20px"> <a
				onclick="openBg()">background</a></span><span style="font-size: 20px">ㅣ</span>
			<span style="font-family: 'Lilly'; font-size: 20px"> <a
				onclick="getfile()">photo</a></span>
		</div>
		<p>
		<p>
		<p>
		<div id="backColor">
			<input type="color" id="bgInput" onchange="changeBg()">
		</div>
		<div id="picture">
			<!-- <img  id="preview" alt="이미지가 보여지는 영역" src="" width="300px" height="300px"> -->
			<input type="file" name="name" id="getfile" accept="image/*">
		</div>
		<div id="sticker">
			<ul class="nav nav-pills">
<!-- 				<li class="active"><a data-toggle="pill" href="#home">전체</a></li> -->
				<c:forEach items="${stickerGName}" var="g">
					<li><a data-toggle="pill" href="#${g.groupName }">${g.groupName}</a></li>
				</c:forEach>
			</ul>
			<div class="tab-content">
<%-- 				<div id="home" class="tab-pane fade in active">
					<c:forEach items="${stickerList }" var="s">
						<a onclick="goSti(${s.name})"><img alt=""
							src="${path }/images/stickerImage/${s.name}" width="100px"
							height="100px"></a>
					</c:forEach>
				</div> --%>
				<c:forEach items="${stickerGName}" var="g">
					<div id="${g.groupName }" class="tab-pane fade" style="margin: 20">
						<c:forEach items="${stickerList }" var="s">
							<c:if test="${g.groupName==s.groupName }">
								<a onclick="goSti('${s.name}')"><img src="${path }/images/stickerImage/${s.name}" width="100px" height="100px"></a>
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
		<div style="margin: 30" align="center">
			<button type="button" class="btn btn-outline-success"
				onclick="submit()">저장</button>
			<button type="button" class="btn btn-outline-success"
				onclick="pageReload()">초기화</button>
		</div>
	</div>

	<!-- Footer -->
	<div id="footer" style="margin: 50;" align="center">
		<ul class="copyright" style="list-style: none">
			<li>mypage</li>
		</ul>
	</div>

</body>
</html>
