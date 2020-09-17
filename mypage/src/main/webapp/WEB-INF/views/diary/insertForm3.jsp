
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../member/sessionChk.jsp"%>
<%@ include file="../header.jsp"%>
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
<!--draggable  -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
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

/* 	function goDeco() {
		var diaryCataNum = $('#diaryCatagory').val();
		if (diaryCataNum == null) {
			alert("카테고리를 선택해주세요.");
			return false;
		}
		var subject = $('#subject').val();
		if (subject == "") {
			alert("제목을 입력해주세요.");
			$('#subject').focus();
			return false;
		}
		location.href = "diary/decorate?memberNum=${memberNum}&diaryCataNum=" + diaryCataNum
				+ "&subject=" + subject;
	} */
	$(function() {
		$('#sticker').hide();
		$('#backColor').hide();
	});
	function openSti() {
		$('#sticker').show();
		$('#sti').resizable().draggable();
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
		$('textarea').css('background-color',bg);
	}
	function submt(num) {
		var stList = [];
		$('.sti').each(function() {
			var id = parseInt($(this).attr('id'),10);
			var width= $(this).width();	
			var height= $(this).height();
			var position = $(this).position();
			var x = position.left;
			var y = position.top;
			var location = {
					'num':num,
					'id' : id,
					'width' : width,
					'height' :height,
					'x' : x,
					'y' : y 
			}
			stList.push(location);
		});
		var colorNum = $('#bgInput').val()+"";
		$.ajax({
			url:"decoLocation",
			dataType: "json",
			contentType : "application/json",
			data : JSON.stringify(stList),
			type:"POST",
			success :function(data){
				alert(data);
				if(data=='1'){
				 	alert("다이어리 입력 성공");
				 	location.href="content?colorNum="+colorNum+"&content="+content;
				}
			}
		});	
	}
</script>
<style type="text/css">
*{
	margin: 30;
}
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
	resize: none;
	background-color: seashell;
	padding: auto;
	margin: 0;
	width: 600;
	height: 800;
	border-color: transparent;
	position: static;
	font-size: medium;
	font-size: 25px;
}

pre {
	width: 1400;
	height: 1000;
	margin-right: 0;
}

.center {
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body>
	<form action="diary/insert" method="post">
	<input type="hidden" name="memberNum" value="${membeNum }">
		<table class="center"
			style="margin: auto; width: 50em; text-align: center;">
			<tr>
				<th>catagory</th>
			</tr>
			<tr>
				<td id="select"><select name="diaryCataNum" id="diaryCatagory">
						<option disabled="disabled" selected="selected">select
							catagory</option>
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
				<th>subject</th>
			</tr>
			<tr>
				<td><input type="text" name="subject" autofocus="autofocus"
					id="subject"></td>
			</tr>
			<tr>
				<td><div align="center" style="margin: 20">
						<span style="font-family: 'Lilly'; font-size: 20px"> <a
							onclick="openSti()">sticker</a></span><span style="font-size: 20px">ㅣ</span>
						<span style="font-family: 'Lilly'; font-size: 20px"> <a
							onclick="openBg()">background</a></span>
					</div>
			</tr>
			<tr>
				<td>
					<div id="backColor" align="center">
						<input type="color" class="bgInput" id="bgInput" name="bgColor">
						<input type="button" class="bgInput" onclick="bg()"
							class="btn btn-outline-success" value="적용">
					</div>
					<div id="sticker">
						<ul class="nav nav-pills">
							<c:forEach items="${stickerGName}" var="g">
								<li><a data-toggle="pill" href="#${g.groupName }">${g.groupName}</a></li>
							</c:forEach>
						</ul>
						<div class="tab-content">
							<c:forEach items="${stickerGName}" var="g">
								<div id="${g.groupName }" class="tab-pane fade"
									style="margin: 20">
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
				</td>
			</tr>
			<tr>
				<td>

					<div class="container" align="center" style="margin-top: 20px">
						<div id="content"
							style="width: 40em; height: 50em; overflow: hidden;">
							<textarea rows="" cols="" name="content" ></textarea>
						</div>
						</div>
				</td>
			</tr>
		</table>
		<div style="margin: 10" align="center">
			<input type="submit" name="저장" class="btn btn-outline-success">
		</div>
	</form>

</body>
</html>