<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<!--
	Visualize by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>Visualize by TEMPLATED</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="/mypage/resources/community/gridLayout/assets/css/main.css" />
		<script src="/mypage/resources/community/gridLayout/assets/js/jquery.min.js"></script>
		<script src="/mypage/resources/community/gridLayout/assets/js/jquery.poptrox.min.js"></script>
		
		<script type="text/javascript">
			// 무한 스크롤 부분
			var startNum = 1;	
			var endCommunityChk = false;
			var cHeight = new Array(3);
			
			$(document).ready(function() { // 스크롤 이벤트 발생 시
				$(window).scroll(function() { // 필요한 변수를 구합니다.
					var scrollHeight = $(window).scrollTop() + $(window).height();
					var documentHeight = parseInt($(document).height()* 0.9) ;
					
					//스크롤의 높이와 문서의 높이가 같고 community에 데이터가 남아있을때
					if (scrollHeight >= documentHeight && endCommunityChk==false) {
						console.log("길이가 같음");
						$.post("addCoummunityList","startNum=" +startNum,function(values){
								
							// 데이터가 비어있으면 endChk로 비어있다는 걸 표시해주고 메소드 끝내기
							if(JSON.stringify(values) =="[]") {
								endCommunityChk = true;
								return;
							}
							
							//반복
			                $.each(values, function( index, value ) {	
			                	
			                	cHeight = [$("#col1").height(),$("#col2").height(),$("#col3").height()];
			                	//최솟값의 인덱스 구하기;
			                	var minIndex = isMinIndex(cHeight);
			                	console.log("minIndex : " + minIndex);
			            		
			                	if(startNum==1){
			                		$('<a href="/mypage/images/trash.png">'
											+'<img src="/mypage/images/trash.png" alt="" />'
											+'<h3>좋아요 '+value.likeyCount +'개 </h3>'
											+'<h3>rn '+value.rn+'</h3>'
											+'</a>'
				  						).appendTo('#col'+ minIndex);
			                	}else{
				                	//height길이가 제일 작은 div에 데이터 추가하기
				                    $('<a href="/mypage/images/test1.png">'
											+'<img src="/mypage/images/test1.png" alt="" />'
											+'<h3>좋아요 '+value.likeyCount +'개</h3>'
											+'<h3>rn '+value.rn+'</h3>'
											+'</a>'
				  						).appendTo('#col'+ minIndex);
			                		
			                	}
			   	            });
							startNum +=5;

						});
					}
					
				});
			});
			
			
			
			//div의 높이를 비교한 후 제일 낮은 div의 인덱스 구하는 메소드
			function isMinIndex(values) {
				var min = values[0];
				var index=0;
				
				for(var i=1;i<values.length;i++){
					if(min> values[i]){
						min=values[i];
						index=i;
					}
				}
				
				return index+1;
			}
		</script>
	</head>
	<body>
		<%@ include file="communityNav.jsp" %>
		
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<span class="avatar"><img src="/mypage/resources/community/gridLayout/images/avatar.jpg" alt="" /></span>
						<h1>This is <strong>Visualize</strong>, a responsive site template designed by <a href="http://templated.co">TEMPLATED</a><br />
						and released for free under the Creative Commons License.</h1>
						<ul class="icons">
							<li><a href="#" class="icon style2 fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon style2 fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon style2 fa-instagram"><span class="label">Instagram</span></a></li>
							<li><a href="#" class="icon style2 fa-500px"><span class="label">500px</span></a></li>
							<li><a href="#" class="icon style2 fa-envelope-o"><span class="label">Email</span></a></li>
						</ul>
					</header>

				<!-- Main -->
					<section id="main">

						<!-- Thumbnails -->
							<section class="thumbnails">
								<!--div 안에 하나씩 넣을때마다 세로로 늘어남  -->
								<div style="background: green;" id="col1">
									<a href="/mypage/resources/community/gridLayout/images/fulls/01.jpg">
										<img src="/mypage/resources/community/gridLayout/images/thumbs/01.jpg" alt="" />
										<h3>1</h3>
									</a>
									<a href="/mypage/resources/community/gridLayout/images/fulls/02.jpg">
										<img src="/mypage/resources/community/gridLayout/images/thumbs/02.jpg" alt="" />
										<h3>2</h3>
									</a>
								</div>
								<div style="background: pink;" id="col2">
									<a href="/mypage/resources/community/gridLayout/images/fulls/03.jpg">
										<img src="/mypage/resources/community/gridLayout/images/thumbs/03.jpg" alt="" />
										<h3>3</h3>
									</a>
									<a href="/mypage/resources/community/gridLayout/images/fulls/04.jpg">
										<img src="/mypage/resources/community/gridLayout/images/thumbs/04.jpg" alt="" />
										<h3>4</h3>
									</a>
									<a href="/mypage/resources/community/gridLayout/images/fulls/05.jpg">
										<img src="/mypage/resources/community/gridLayout/images/thumbs/05.jpg" alt="" />
										<h3>5</h3>
									</a>
									<a href="/mypage/resources/community/gridLayout/images/fulls/05.jpg">
										<img src="/mypage/resources/community/gridLayout/images/thumbs/05.jpg" alt="" />
										<h3>5</h3>
									</a>
								</div>
								<div style="background: red;" id="col3">
									<a href="/mypage/resources/community/gridLayout/images/fulls/06.jpg">
										<img src="/mypage/resources/community/gridLayout/images/thumbs/06.jpg" alt="" />
										<h3>6</h3>
									</a>
									<a href="/mypage/resources/community/gridLayout/images/fulls/07.jpg">
										<img src="/mypage/resources/community/gridLayout/images/thumbs/07.jpg" alt="" />
										<h3>7</h3>
									</a>
								</div>
							</section>

					</section>
					
					
				<!-- Footer -->
					<footer id="footer">
						<p>&copy; Untitled. All rights reserved. Design: <a href="http://templated.co">TEMPLATED</a>. Demo Images: <a href="http://unsplash.com">Unsplash</a>.</p>
					</footer>

			</div>

		<!-- Scripts -->
			
			<script src="/mypage/resources/community/gridLayout/assets/js/skel.min.js"></script>
			<script src="/mypage/resources/community/gridLayout/assets/js/main.js"></script>

	</body>
</html>