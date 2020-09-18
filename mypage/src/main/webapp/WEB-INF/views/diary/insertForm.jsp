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
	$('#inputTd').hide();
	$('#diaryCatagory').change(function() {
		var dc = $('#diaryCatagory').val();
		if (dc == 'makeCata') {
			$('#select').hide();
			$('#inputTd').show();
			$('#newCata').focus();
		}
	});
});
function insertCata() {
	var name = $('#newCata').val();
	location.href ='diaryCatagory/insert?name='+ name +'&insertForm='+ 'insertForm';
}
function cataReset() {
	$("#inputTd").hide();
	$("#select").show();
}
	
	$(function() {
		$('#sticker').hide();
		$('#backColor').hide();
	});
	function openSti() {
		$('#sticker').show();
		$('#backColor').hide();
		$('#sti').resizable().draggable();
	}
	function openText() {
		$("#content")
				.prepend(
						"<div id='textbox' style='width: 100px; height: 100px;'><textarea style='width:100%; height:100%;padding:0; border: none;'id='text' name='content'>textbox</textarea><div>");
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
		});
	}
	function goSti(num,name) {
		console.log("name="+name);
		$('#content').prepend("<div class='sti' id='"+num+"' title='"+num+"' style='width:100px;height:100px'><img src='${path}/images/stickerImage/"+name+"' style='padding=0;width: 100%;height: 100%'/></div>");
		$('.sti').resizable().draggable();
	}
	function openBg() {
		$('#backColor').show();
		$('#sticker').hide();
	}
	function bg() {
		var bg=$('#bgInput').val();
		$('#content').css('background-color',bg);
	}
	function submt() {
		var stList = [];
		var diary =  {
				subject:$('#subject').val(),
				diaryCataNum:$('#diaryCataNum').val(),
				bgColor : $('#bgColor').val(),
				content : $('#content').val()
		};
		alert("diary bgColor="+bgColor);
		alert("diary diaryCataNum="+diaryCataNum);
		alert("diary content="+content);
		$('.sti').each(function() {
			var id = parseInt($(this).attr('id'),10);
			var width= $(this).width();	
			var height= $(this).height();
			var position = $(this).position();
			var x = position.left;
			var y = position.top;

			var location = {
					'id' : id,
					'width' : width,
					'height' :height,
					'x' : x,
					'y' : y
			}
			alert(id);
			stList.push(diary);
			stList.push(location);
			
		});
		
		console.log(typeof stList);
		$.ajax({
			url:"diary/decorate",
			dataType: "json",
			contentType : "application/json",
			data : JSON.stringify(stList),
			type:"POST",
			success :function(data){
				alert(data);
				if(data=='1'){
				 	alert("다이어리 입력 성공");
				 	location.href="main#dairyList";
				}
			}
		});	
	/* 	$.post("diary/decoLocation","stList="+stList,function(data){
			alert("다이어리 입력 성공");
		}) */
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
tr{
font-weight: bold;
}
</style>
</head>
<body>
	<table class="center"
		style="margin: auto; width: 50em; text-align: center;">
		<tr>
			<tr>
			<td id="select"><select name="diaryCataNum" id="diaryCataNum" class="form-control" style=" border: thin;">
					<option disabled="disabled" selected="selected">카테고리를 선택하세요</option>
					<c:forEach var="c" items="${cataList }">
						<c:if test="${c.del !='y' }">
							<option value="${c.diaryCataNum }">${c.name }</option>
						</c:if>
					</c:forEach>
					<option value="makeCata">카테고리 만들기</option>
			</select></td>
		</tr>
		<tr>
			<td id="inputTd"><input type="text" name="name" id="newCata"
				class="form-control" aria-label="Recipient's username"
				aria-describedby="basic-addon2" placeholder="create your catagory"
				autofocus="autofocus"> <input type="button"
				onclick="insertCata()" class="btn btn-outline-secondary" value="등록">
				<input type="button" onclick="cataReset()"
				class="btn btn-outline-secondary" value="취소"></td>
		</tr>
		<tr>
			<td><input class="form-control" aria-label="Recipient's username"
				aria-describedby="basic-addon2" 
				autofocus="autofocus" name="subject" 
				id="subject" style="border: thin;" placeholder="제목을 압력하세요"></td>
		</tr>
	</table>
	<div class="container" align="center" style="margin-top: 30">
		<div>
			<span style="font-family: 'Lilly'; font-size: 20px"> <a
				onclick="openSti()">sticker</a></span><span style="font-size: 20px">ㅣ</span>
			<span style="font-family: 'Lilly'; font-size: 20px"> <a
				onclick="openText()">textbox</a></span> <span style="font-size: 20px">ㅣ</span>
			<span style="font-family: 'Lilly'; font-size: 20px"> <a
				onclick="openBg()">background</a></span>
		</div>
		<p>
		<p>
		<p>
		<div id="backColor">
			<input type="color" class="bgInput" id="bgInput">
			<button class="bgInput" onclick="bg()"
				class="btn btn-outline-success">적용</button>
		</div>
		<div id="sticker">
			<ul class="nav nav-pills">
				<c:forEach items="${stickerGName}" var="g">
					<li><a data-toggle="pill" href="#${g.groupName }">${g.groupName}</a></li>
				</c:forEach>
			</ul>
			<div class="tab-content">
				<c:forEach items="${stickerGName}" var="g">
					<div id="${g.groupName }" class="tab-pane fade" style="margin: 20">
						<c:forEach items="${stickerList }" var="s">
							<c:if test="${g.groupName==s.groupName }">
								<a onclick="goSti(${s.stickerNum },'${s.name}')"><img
									src="${path }/images/stickerImage/${s.name}" width="100px"
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
		<div style="margin: 30" align="center">
			<button type="button" class="btn btn-outline-success"
				onclick="submt(${diaryNum})">저장</button>
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
