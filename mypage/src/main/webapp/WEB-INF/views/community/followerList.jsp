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
		console.log("followerList 실행");
	});
	
	//팔로우버튼
	function follow(target) {
		$.post("/mypage/community/follow","target="+target,function(result){
			if(result == 1){
				$(".followBtn_"+target).html('<button class="btn btn-default btn" onclick="follow('+target+')">팔로잉취소</button>');
			}else if (result== -1){
				$(".followBtn_"+target).html('<button class="btn btn-info btn" onclick="follow('+target+')">팔로우</button>');
			}else{
				alert("follow() 실패");
			}
		});
	}	
</script>
</head>
<body>
	<div class="modal-dialog modal-sm">
    
	      <!-- Follower List-->
	      <div class="modal-content">
		        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4 class="modal-title">팔로워</h4>
		        </div>
		        <table class="table table-striped">
		        	<tbody>
		        		<c:forEach items="${followerList }" var="f" varStatus="i">
		        			<tr>
				        		<td>
				        			<a href="javascript:coummunityChange('communityProfile?memberNum=${f.memberNum}')"><b style="font-size: medium;">${f.nickName }</b></a>
				        		</td>
				        		<td class="followBtn_${f.memberNum}" >
					        		<c:if test="${f.memberNum != memberNum }">
										<c:if test="${f.memberNum == isFollowerList[i.index].memberNum}">
											<button class="btn btn-default " onclick="follow('${f.target}')">팔로잉취소</button>
										</c:if>
										<c:if test="${empty isFollowerList[i.index] }">
											<button class="btn btn-info " onclick="follow('${f.target}')">팔로우</button>
										</c:if>
									</c:if>
				        		</td>
		        			</tr>
		        		
		          	</c:forEach>
		        	</tbody>
		        </table>
		        <%-- <div class="modal-body" >
		          	<c:forEach items="${followerList }" var="f" varStatus="i">
		          		<div id="div_${f.target }" style="height: 40px; ">
		          			<a href="communityProfile?memberNum=${f.target}"><b style="font-size: medium;">${f.nickName }</b></a> 

		          			<span class="followBtn_${f.target}" style="float: right;">
								<c:if test="${f.target != memberNum }">
									<c:if test="${f.target == isFollowerList[i.index].target }">
										<button class="btn btn-default " onclick="follow(${f.target})">팔로잉취소</button>
									</c:if>
									<c:if test="${empty isFollowerList[i.index] }">
										<button class="btn btn-info " onclick="follow(${f.target})">팔로우</button>
									</c:if>
								</c:if>
							</span>
		          		</div>
		          	</c:forEach>
		        </div> --%>
	       
	      </div>
      </div>
</body>
</html>