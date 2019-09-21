<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css" />
</head>
<body>
<center>
	<form action="memberModifyView" method="post">
	<h2><img src="/resources/images/nonmember.png" alt="비회원 글 수정"/></h2>
		<input type="hidden" name="username" value="${mpw.username}">
		<input type="hidden" name="mname" value="${mpw.mname}">
		<input type="hidden" name="mdepartment" value="${mpw.mdepartment}">
		<input type="hidden" name="mloc" value="${mpw.mloc}">
		<input type="hidden" name="password" value="${mpw.password}">
		<%-- <input type="hidden" name="pageNum" value="${pageNum}"> --%>
		
		<h3>비밀번호를 입력하여 주세요.</h3>
		   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>	
			<input type="password" id="password1" name="password1"><br><br>
			<input type="submit" class="btn btn-warn" value="확인">
			<a href="list">
			<img src="http://nstatic.dcinside.com/dgn/gallery/images/update/btn_list.png" class="btn_list" alt="목록보기"/>
			</a>
					   
			 <a href="javascript:history.back();"><img src="http://nstatic.dcinside.com/dgn/gallery/images/update/btn_prev.png" class="btn_prev" alt="이전으로"/>
			 </a>
	</form>
</center>
</body>
</html>