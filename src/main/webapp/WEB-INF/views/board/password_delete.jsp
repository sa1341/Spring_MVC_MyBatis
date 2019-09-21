<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%String ctx = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
body, td{text-align: center;}
</style>
<%-- <link rel="stylesheet" href="<%=ctx%>/resources/assets/cs s/main.css" />
 --%> <link rel="stylesheet" href="<%=ctx%>/resources/bootstrap/css/bootstrap.css" >
</head>
<body>
<form action="delete" method="post">
<h2><img src="/resources/images/nonmember_del.PNG" alt="비회원 글 삭제"/></h2>
	<input type="hidden" name="bId" value="${delete_bId}">
	
	
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