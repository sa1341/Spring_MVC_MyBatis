<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
img {
	max-width: 100%;
	width: 600px;
}

.hidden {
	display: none;
}

body {
	font-family: 'Tangerine', serif;
}

.button {
	background-color: black;
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
}

.button2 {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
}
</style>
<title>양창곱창</title>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!--customizing link --> 
<link rel="stylesheet" href="/resources/vendor/bootstrap/css/menu.css">
<link href="/resources/screen.css" rel="stylesheet" type="text/css" />
<script src="/resources/js/reply.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>

<body>
		<!-- Modal -->
		<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
			
				<!-- Modal content -->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"></button>
						
						<h4 class="modal-title">Modal Header</h4>
					</div>
					
					<div class="modal-body">
						<label>식당번호</label>
						<input type="text" class="form-control" name='fno'  value="${fdto.fno}" readonly="readonly">		
						<label>작성자</label>
						<input type="text" class="form-control" name='replyer'>		
						<label>댓글 내용</label>
						<input type="text" class="form-control" name='replytext'>
						<label>ID</label>
						<input type="text" class="form-control" name='username'>
					</div>
					
					<div class="modal-footer">
						<button id='delModalBtn' class="btn btn-danger">삭제</button>
						<button id='modalBtn' class="btn btn-info">등록</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>	
					</div>
				</div>

			</div>
		</div>
		<!-- end Modal -->


	<center>
		<main>
		<div id="cover" class="container-fluid"
			style="background-image: url(/assets/images/default_blog_cover.jpg);">

			<div id="ex1">
				<h1>분당 양곱창</h1>
				<h2>모듬구이</h2>
				<h3>김치 곱창 미역국 볶음밥 양구이 양곱창 소곱창 식빵 천엽 염통 곱창전문 소주 곱창집 대창 막창 라면</h3>
			</div>
		</div>
		<div class="info-box-dark">
				<a href="home" class="button"><font color="white">Home</font></a>
		</div>
		<br>
		<div class="row">
			<div class="col col-md-one-half col-lg-one-fourth">
				<img src="/resources/images/magchang.jpg" alt="소막창구이">
				<h3>소막창 구이(250g): 15,000원</h3>
			</div>
			<div class="col col-md-one-half col-lg-one-fourth">
				<img src="/resources/images/yanggobchang.jpg" alt="곱창 구이 ">
				<h3>곱창 구이(250g): 17,000원</h3>
			</div>
			<div class="col col-md-one-half col-lg-one-fourth">
				<img src="/resources/images/tugyang.jpg" alt="특양 구이">
				<h3>특양 구이(200g): 19,000원</h3>
			</div>
			<div class="col col-md-one-half col-lg-one-fourth">
				<img src="/resources/images/modum.jpg" alt="모듬구이(3인분)">
				<h3>모듬구이(3인분): 57,000원</h3>
			</div>
		</div>
		</main>
	</center>

	<div class="pull-right">
		<button class="btn btn-default" id="addReplyBtn">리뷰남기기</button>
	</div>

	<a href="yanggobchangMapView"><button type="button" class="button2"
			id="mapBtn">지도보기</button> </a>

	<input type="hidden" id="fno" value="${fdto.fno}">

	<div class='container'>
		<table border="1"
			class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>댓글번호</th>
					<th>식당번호</th>
					<th>작성자</th>
					<th>리뷰평가</th>
					<td>ID</td>
				</tr>
			</thead>
			<tbody id="replyTable">
			</tbody>
		</table>
	</div>
<script type="text/javascript">
console.log(replyManager);
</script>

<script type="text/javascript">
$(document).ready(function(e){
 
	var rno;
	
	var fno = $("#fno").val(); 
	
	var mode;
	
	var foodNumber = $("input[name='fno']");
	var replyerObj = $("input[name='replyer']");
	var replyTextObj = $("input[name='replytext']");
	var replyUsername = $("input[name='username']");
	
	function afterAll(list){
		
		printList(list);
		$("#myModal").modal('hide');
		replyerObj.val("");
		replyTextObj.val("");
		replyUsername.val("");	
	}
	
	$("#ex1").click(function(){
		swal("Hello world!");
	});
	
	//리뷰 댓글 수정 및 삭제 버튼
	$("#replyTable").on("click", "tr", function(e){
			
			var tds = $(this).find('td');
			
			console.log(tds);
			
			rno =tds[0].innerHTML;
			mode = "MOD";
			
			replyerObj.val(tds[2].innerHTML);
			replyTextObj.val(tds[3].innerHTML);
			replyUsername.val(tds[4].innerHTML);
			
			$("#myModal").modal("show");
			$(".modal-title").text("수정 및 삭제");
		});
		 
	//리뷰 댓글 추가 버튼
	$("#addReplyBtn").click(function(){
			
			$("#myModal").modal('show');
			$(".modal-title").text("리뷰 남기기");
			 
			 mode= "ADD";	 
	 });
	
	$("#modalBtn").click(function(){
		
		var fno = foodNumber.val(); 		
		var replyer = replyerObj.val();
		var replytext = replyTextObj.val();
		var username = replyUsername.val();
		
		if(mode == 'ADD'){
		
			var obj = {fno:fno,replyer:replyer, replytext:replytext, username:username};
			
			
			replyManager.add(obj, function(list){
				//printList(list);
				swal("리뷰가 추가되었습니다.");
				afterAll(list);
			});
		
		}else if(mode='MOD'){
			
			var obj = {fno:fno,rno:rno,replyer:replyer,replytext:replytext};

			replyManager.update(obj, function(list){
				
				swal("리뷰가 수정되었습니다.");
				afterAll(list);
			});
		}
	});
 
	
	
	 //리뷰댓글 삭제버튼
	 $("#delModalBtn").on("click", function(){
		 
		 var obj = {fno:fno, rno:rno};
		 
		 replyManager.remove(obj, function(list){
			 printList(list);
			 swal("댓글이 삭제되었습니다.");
				$("#myModal").modal('hide');
				replyerObj.val("");
				replyTextObj.val("");
				replyUsername.val("");
			 
			 
		 });
		 
	 });
	 
	 //ajax를 통해서 페이지가 로딩되면서 리뷰 댓글목록을 출력하는 기능
	 (function(){
			
			replyManager.getAll(fno, printList);
			
	 })();
		
	
	 function printList(list){
			var str= "";
			var replyObj;
			for(var i=0; i< list.length; i++){
				replyObj = list[i];
				
				str +="<tr>"+
				"<td>"+ replyObj.rno+"</td>"+
				"<td>"+ replyObj.fno+"</td>"+
				"<td>"+ replyObj.replyer+"</td>"+
				"<td>"+ replyObj.replytext+"</td>"+
				"<td>"+ replyObj.username+"</td>"+
				"<tr>";
				
			}
			$("#replyTable").html(str);
		}
});
</script>
</body>
</html>