
/* ******************************************************************************
 * seekForm
 * *******************************************************************************/
// 무한 스크롤 부분
var startNum = 1;	
var endCommunityChk = false;
var cHeight = new Array(3);

$(function() {
	
	//기본 5개 게시물 추가
	$.post("addCoummunityList","startNum=" +startNum,function(values){
		// 데이터가 비어있으면 endChk로 비어있다는 걸 표시해주고 메소드 끝내기
		if(JSON.stringify(values) =="[]") {
			endCommunityChk = true;
			return;
		}
		
		//반복
        $.each(values, function( index, value ) {	

        	//최솟값의 인덱스 구하기;
        	cHeight = [$("#col1").height(),$("#col2").height(),$("#col3").height()];
        	var minIndex = isMinIndex(cHeight);
        	
        	//게시물 추가
        	$('<a href="/mypage/images/trash.png">'
				+'<img src="/mypage/images/trash.png" alt="" />'
				+'<h3>좋아요 '+value.likeyCount +'개 </h3>'
				+'<h3>rn '+value.rn+'</h3>'
				+'</a>').appendTo('#col'+ minIndex);
        	
        });
		startNum +=5;
	});
	
	$(window).scroll(function() { // 스크롤 이벤트 발생시 필요한 변수를 구합니다.
		var scrollHeight = $(window).scrollTop() + $(window).height();
		var documentHeight = parseInt($(document).height()* 0.9) ;
		
		console.log("scrollHeight : " +scrollHeight + ", documentHeight : " + documentHeight);
		//스크롤의 높이와 문서의 높이가 같고 community에 데이터가 남아있을때
		if (scrollHeight >= documentHeight && endCommunityChk==false) {
			$.post("addCoummunityList","startNum=" +startNum,function(values){
				// 데이터가 비어있으면 endChk로 비어있다는 걸 표시해주고 메소드 끝내기
				if(JSON.stringify(values) =="[]") {
					endCommunityChk = true;
					return;
				}
				
				//반복
                $.each(values, function( index, value ) {	
                	//최솟값의 인덱스 구하기;
                	cHeight = [$("#col1").height(),$("#col2").height(),$("#col3").height()];
                	var minIndex = isMinIndex(cHeight);
            		
                	//height길이가 제일 작은 div에 데이터 추가하기
                    $('<a href="/mypage/images/test1.png">'
						+'<img src="/mypage/images/test1.png" alt="" />'
						+'<h3>좋아요 '+value.likeyCount +'개</h3>'
						+'<h3>rn '+value.rn+'</h3>'
						+'</a>'	).appendTo('#col'+ minIndex);
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
		