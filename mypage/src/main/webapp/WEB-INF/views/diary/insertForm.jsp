<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>mypage</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--resizable -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!--draggable  -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
 <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script type="text/javascript">
var num = 0;
$(function() {
	$('#inputTd').hide();

	$('#cataNum').change(function() {
		var dc = $('#cataNum').val();
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
	$("#select1").show();
}	
	$(function() {
		$('#sticker').hide();
		$('#backColor').hide();
		$('#font').hide();		
	});
	function openSti1() {
		$('#sticker').show();
		$('#backColor').hide();
		$('#font').hide();
	}
	function openText1() {
		var i = 1;
		$('#font').show();
		$('#sticker').hide();
		$('#backColor').hide();
		
	}
	function openTextarea1() {
		num++;
		var t1 = "<div class='textbox' style='width: 100px; height: 100px; position:absolute;'><textarea style='width:100%; height:100%;padding:0; border: none; font-size:30px;' class='textarea1' id='"+num+"' placeholder='textbox'></textarea><div>";
		$("#content").prepend(t1);
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
			resize : function(e, ui) {
				//some code
			} 
		});
	}
	function goSti(num,name) {
		console.log("name="+name);
		$('#content').prepend("<div class='sti' id='"+num+"' title='"+num+"' style='width:100px;height:100px; position:absolute;'><img src='${path}/images/stickerImage/"+name+"' style='padding=0;width: 100%;height: 100%'/></div>");
		$('.sti').resizable().draggable();
	}
	function openBg1() {
		$('#backColor').show();
		$('#sticker').hide();
		$('#font').hide();
	}
	function goBg() {
		var bg=$('#bgColor').val();
		$('#content').css('background-color',bg);
	}
	function fontSize1() {
		var i = $('#fontSelect').val();
		$('.textarea1').css("font-size", i+'px');
	}
	function fnt() {
		var fontColor=$('#fontColor').val();
		$('.textarea1').css('color',fontColor);
	}
	function fntWeight() {
		var fontWeight=$('#fontWeight').val();
		$('.textarea1').css('font-weight',fontWeight);
	}
	

	function insert() {
		/* 값 넣었는 지 체크 */
		diaryCataNum = $('#cataNum').val();
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
		/* 보낼 값 */
		var allList = [];
		var diary =  {
				subject:$('#subject').val(),
				diaryCataNum:$('#cataNum').val(),
				bgColor : $('#bgColor').val(),
		};
		allList.push(diary);
		/* alert("diary bgColor="+diary.bgColor);
		alert("diary diaryCataNum="+diary.diaryCataNum);
		alert("diary content="+diary.content); */
		$('.sti').each(function() {
			var id = parseInt($(this).attr('id'),10);
			var width= $(this).width();	
			var height= $(this).height();
			var position = $(this).position();
			var x = position.left;
			var y = position.top;
		/* 	alert(width);
			alert(height); 	
			alert(x);
			alert(y); */
			var location = {
					'st' : 'st',
					'stickerNum' : id,
					'stWidth' : width,
					'stHeight' :height,
					'stX' : x,
					'stY' : y
			}
			allList.push(location);			
		});
		
		$('.textarea1').each(function(){
			var width= $('.textbox').width();	
			var height= $('.textbox').height();
			var position = $('.textbox').position();
			var x = position.left;
			var y = position.top;
			var content = $(this).val();
			var fontSize =  $(this).css('font-size');
			var fontColor =  $(this).css('color');
			var fonWeight =  $(this).css('font-weight');
		 	alert(content);
			alert(width);
			alert(height); 	
			alert(x);
			alert(y); 
/* 			alert(fontSize);
			alert(fontColor);
			alert(fonWeight); */
			var textLocation = {
					'txt' : 'txt',
					'txtWidth' : width,
					'txtHeight' :height,
					'txtX' : x,
					'txtY' : y,
					'content' : content,
					'fntSize':fontSize,
					'fntColor':fontColor,
					'fntWeight':fonWeight
			}
			allList.push(textLocation);
		});
   
		
		/* console.log(typeof List); */
		$.ajax({
			url:"decorate",
			dataType: "json",
			contentType : "application/json",
			data : JSON.stringify(allList),
			type:"POST",
			success :function(data){
				 	alert("다이어리 입력 성공");
				 	screenShot($('#content'),data);
				}
		});	
	}
	function reset() {
		$('.sti').remove();
		$('.textbox').remove();
	}
	function screenShot(target,data) {
		alert("screenShot함수 들어옴");
		console.log(typeof(target));
		console.log(typeof(diaryNum));
		console.log("screen 메소드 실행");

		if (target != null && target.length > 0) {
			console.log("if문 실행");

			var t = target[0];
			console.log("t : " + t);
			html2canvas(t).then(function(canvas) {
				var myImg = canvas.toDataURL("image/png");
				myImg = myImg.replace("data:image/png;base64,", "");
				console.log("myImg : " + myImg);
				$.ajax({
					type : "POST",
					data : {
						"imgSrc" : myImg,
						"diaryNum" : data
					},
					dataType : "text",
					url : "${path}/community/ImgSave",
					success : function(data) {
						console.log(data);
						alert("공유 성공");
						location.href="${path}/main#community";
					},
					error : function(a, b, c) {
						alert("error");
					}
				});
			});
		}
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

#content {
	width: 40em;
	height: 50em;
	background-color: seashell;
	overflow: hidden;
	position: relative;
	border-radius: 7px;
}
</style>
</head>
<body>
	<div id="logo" align="center"
		style="margin-top: 10px; margin-bottom: 30px">
		<a href="${path }/main"><span
			style="font-family: 'Dynalight'; font-size: 50px; color: black; margin-bottom: 20">My
				Page</span></a>
	</div>
	<table class="center"
		style="margin: auto; width: 50em; text-align: center;">
		<tr>
		<tr>
			<td id="select1"><select name="diaryCataNum" id="cataNum"
				class="form-control" style="border: thin;">
					<option disabled="disabled" selected="selected">카테고리를
						선택하세요</option>
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
			<td><input class="form-control"
				aria-label="Recipient's username" aria-describedby="basic-addon2"
				autofocus="autofocus" name="subject" id="subject"
				style="border: thin;" placeholder="제목을 압력하세요"></td>
		</tr>
	</table>
	<div class="container" align="center" style="margin-top: 30">
		<div>
			<span style="font-family: 'Lilly'; font-size: 20px"> <a
				onclick="openBg1()">background</a></span><span style="font-size: 20px">ㅣ</span>
			<span style="font-family: 'Lilly'; font-size: 20px"> <a
				onclick="openText1()">textbox</a></span> <span style="font-size: 20px">ㅣ</span>
			<span style="font-family: 'Lilly'; font-size: 20px"> <a
				onclick="openSti1()">sticker</a></span>
		</div>
		<p>
		<p>
		<p>
		<div id="backColor">
			<input type="color" id="bgColor">

			<button onclick="goBg()" class="btn btn-outline-success">적용</button>
		</div>
		<div id="font">
			<div style="">
				<c:set var="a" value="1" />
				<button onclick="openTextarea1(${a})"
					class="btn btn-outline-success" style="width: 30%">텍스트박스</button>
				<select id="fontSelect" onchange="fontSize1()" style="width: 30%"
					class="form-control">
					<option selected="selected" disabled="disabled">font size</option>
					<c:forEach var="i" begin="10" end="80">
						<option value="${i }">${i }</option>
					</c:forEach>
				</select>
			</div>
			<div>
				<input type="color" id="fontColor">
				<button onclick="fnt()" class="btn btn-outline-success">색깔
					적용</button>
			</div>
			<div>
				<input type="range" id="fontWeight" min="200" max="900" style="width: 30%"
					onchange="fntWeight()" class="form-control-range">
			</div>
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
		<div id="content"></div>
		<div style="margin: 30" align="center">
			<button type="button" class="btn btn-outline-success"
				onclick="insert()">저장</button>
			<button type="button" class="btn btn-outline-success"
				onclick="reset()">초기화</button>
		</div>
	</div>

	<!-- Footer -->
	<div id="footer" style="margin: 500;" align="center">	
		<div id="logo" align="center"
		style="margin-top: 10px; margin-bottom: 30px">
		<a href="${path }/main"><span
			style="font-family: 'Dynalight'; font-size: 28px; color: black; margin-bottom: 20">My
				Page</span></a>
	</div>
	</div>
</body>
</html>