<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		console.log("followingList 실행");
	});
</script>
</head>
<body>
	<div class="modal-dialog">
    
	      <!-- Following List-->
	      <div class="modal-content">
		        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4 class="modal-title">Modal Header</h4>
		        </div>
		        <div class="modal-body" >
		          	<c:forEach items="${followingList }" var="f" varStatus="i">
		          		<div id="div_${f.target }" style="height: 40px; ">
		          			<a href="communityProfile?memberNum=${f.memberNum}"><b>${f.nickName }</b></a> 
		          			f.target : 	${f.target }, memberNum : ${memberNum }
		          			<span class="followBtn_${member.memberNum }" style="float: right;">
								<c:if test="${f.target != memberNum }">
									<c:if test="${f.target }">
										<button class="btn btn-default btn-xs" onclick="follow(${member.memberNum})">팔로잉취소</button>
									</c:if>
									<c:if test="${empty isFollowing }">
										<button class="btn btn-info btn-xs" onclick="follow(${member.memberNum})">팔로우</button>
									</c:if>
								</c:if>
							</span>
		          		</div>
		          	</c:forEach>
		        </div>
	       
	      </div>
      </div>
</body>
</html>