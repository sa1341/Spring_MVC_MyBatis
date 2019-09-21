<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
body, td{text-align: center;}
</style>
<%-- <link rel="stylesheet" href="<%=ctx%>/resources/assets/css/main.css" />
 --%> <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css" >
</head>
<body>
<form action="update_view" method="post">
<h2><img src="/resources/images/nonmember.png" alt="비회원 글 수정"/></h2>
	<input type="hidden" name="bId" value="${update_bId}">
	<input type="hidden" name="bName" value="${update_bName}">
	<input type="hidden" name="bTitle" value="${update_bTitle}">
	<input type="hidden" name="bContent" value="${update_bContent}">
	<input type="hidden" name="pageNum" value="${pageNum}">
	
	<h3>비밀번호를 입력하여 주세요.</h3>
		<input type="password" id="bPassword" name="bPassword"><br><br>
		<input type="submit" class="btn btn-warn" value="확인">
		<a href="list">
		<img src="http://nstatic.dcinside.com/dgn/gallery/images/update/btn_list.png" class="btn_list" alt="목록보기"/>
		</a>
				   
		 <a href="javascript:history.back();"><img src="http://nstatic.dcinside.com/dgn/gallery/images/update/btn_prev.png" class="btn_prev" alt="이전으로"/>
		 </a>
</form>


</body>
</html>