<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파견지 조회</title>
<link href="/resources/screen.css" rel="stylesheet" type="text/css" />
<link href="/resources/default.css" rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="/resources/vendor/bootstrap/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<style type="text/css">



.font_underline {
	color: #fbd6db;
	
}
</style>



</head>
<body class="home-template">

	<div id="header">

		<ul id="menu" class="nav" align="center">
			<li class=""><a href="home">홈화면</a></li>
			<li class=""><a href="IntroduceCompany">회사소개</a></li>
			<li class="active"><a href="searchMember">맛집 찾기</a></li>
			<li class=""><a href="list">알앤비에게 전해줘</a></li>
			<li class=""><a href="IntroduceService">서비스소개</a></li>
		</ul>
	</div>
	<center>
		<div id="cover" class="container-fluid"
			style="background-image: url(/assets/images/default_blog_cover.jpg);">

			<div>
				<h1>근무지 조회</h1>
				<p>
					근무지 및 프로젝트 팀을 조회 가능하고<br /> 근무지 지역을 검색하여 맛집을 알 수 있습니다.<br />
				</p>
			</div>
		</div>

		<table class="table table-striped" width="500" cellpadding="0"
			cellspacing="0" border="1" style="text-align: center;  " >
			<tr>
				<th style="text-align: center;">아이디</th>
				<th style="text-align: center;">이름</th>
				<th style="text-align: center;">부서</th>
				<th style="text-align: center;">근로지</th>
			</tr>
			<c:forEach items="${member}" var="dto">
	      <tr height="30">
					<td><a href="contentView?username=${dto.username}">${dto.username}</a></td>
					<td>${dto.mname}</td>
					<td>${dto.mdepartment}</td>
					<td><font class="font_underline"> <u>
					<a href="seeRegion?mloc=${dto.mloc}" id="mloc"  style="color: red">${dto.mloc}</a></u>
					</font></td>
				</tr>
			</c:forEach>
			<!-- <tr>
				<td colspan="5"><a href="memberWriteView"
					class="btn btn-success pull-right">회원등록</a></td>
			</tr> -->
		</table>


		<form action="memberList" method="post">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<div class="form__field">
				<!-- <select name="keyField" size="1">
					<option value="bName">이름</option>
				</select> -->
				<input type="text" name="mname" class="form__input"
					required="required" placeholder="이름을 입력해주세요" />

				<button type="submit" class="btn btn-default">검색</button>
			</div>
		</form>
	</center>

<c:if test="${Mcount==0}">
   <script type="text/javascript">
			swal("조회하신 회원이 존재하지 않습니다.");
	</script> 
</c:if>


	<script type="text/javascript">
		$(window).load(function() {

			var message = $
			{
				msg
			}
			;

			if (message != null) {
				alert(message);

			}

		});

		$(document).ready(function() {

			$('#display').click(function() {

				alert('one');
				var mloc = $('#display').text();
				alert(mloc);
				sessionStorage.setItem('display', mloc);

			});

		});
	</script>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
		integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
		integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
		crossorigin="anonymous"></script>
</body>
</html>