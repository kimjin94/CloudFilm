
/* 추천  */
function good(){
	var board_num = $("#board_num").val();
     $.ajax({
   	    url : 'trailergood', // 요청 할 주소
   	    type : 'post', // GET, PUT
   	    dataType : 'text',
   	    data : {
   	    	"board_num" : board_num
   	    },
   	    success : function(data) {
   	    	$('#goodandbad').html(data);
   	    }, // 요청 완료 시
   	    error :function(xhr,status,error){
				console.log("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
				alert(xhr.status);
		}
	})
}
/* 추천 취소 */
function nogood(){
	var board_num = $("#board_num").val();
     $.ajax({
   	    url : 'trailernogood', // 요청 할 주소
   	    type : 'post', // GET, PUT
   	    dataType : 'text',
   	    data : {
   	    	"board_num" : board_num
   	    },
   	    success : function(data) {
   	    	$('#goodandbad').html(data);
   	    }, // 요청 완료 시
   	    error :function(xhr,status,error){
				console.log("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
				alert(xhr.status);
		}
	})
}
/* 비추  */
function bad(){
	var board_num = $("#board_num").val();
     $.ajax({
   	    url : 'trailerbad', // 요청 할 주소
   	    type : 'post', // GET, PUT
   	    dataType : 'text',
   	    data : {
   	    	"board_num" : board_num
   	    },
   	    success : function(data) {
   	    	$('#goodandbad').html(data);
   	    }, // 요청 완료 시
   	    error :function(xhr,status,error){
				console.log("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
				alert(xhr.status);
		}
	})
}
/* 비추 취소 */
function nobad(){
	var board_num = $("#board_num").val();
     $.ajax({
   	    url : 'trailernobad', // 요청 할 주소
   	    type : 'post', // GET, PUT
   	    dataType : 'text',
   	    data : {
   	    	"board_num" : board_num
   	    },
   	    success : function(data) {
   	    	$('#goodandbad').html(data);
   	    }, // 요청 완료 시
   	    error :function(xhr,status,error){
				console.log("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
				alert(xhr.status);
		}
	})
}
function login(){
	alert("추천, 비추천은 로그인 후에 가능합니다.");
}