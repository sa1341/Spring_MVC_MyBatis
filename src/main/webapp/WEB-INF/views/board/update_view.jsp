<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="/resources/assets/css/main.css" />
 <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css" >
</head>
<body>
<form action="modify" method="post">
<h2><img src="/resources/images/nonmember.png" alt="비회원 글 수정"/></h2>
	<input type="hidden" name="bId" value="${update_bId}">
<%-- 	<input type="hidden" name="bPassword" value="${update_bPassword}"> --%>	
	 <table class="table table-striped" width="400" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<th><h4>이름</h4></th>
			<td><h4><input type="text" name="bName" value="${update_bName}"></h4></td>
		</tr>
		<tr>
			<th><h4>제목</h4></th>
			<td><h4><input type="text" name="bTitle" value="${update_bTitle}"></h4></td>
		</tr>
		<tr>
			<th><h4>내용</h4></th>
			<td><textarea rows="10" cols="50" name="bContent">${update_bContent}</textarea></td>
		</tr>
		<tr>
			<td><input type="submit" class="btn btn-info" value="저장"><input type="reset" value="초기화">
			<a href="list?pageNum=${pageNum}"><input type="button" value="목록"></a>
			</td>
		</tr>
	</table>
</form>


</body>
</html>