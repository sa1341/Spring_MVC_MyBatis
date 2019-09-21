<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String ctx = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</script>
<style type="text/css">
body,td{text-align: center;}
</style>
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css" >
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap-theme.css" > 
</head>
<body>	
<div id="content">
	<div class="inner">
    	<article class="box post post-excerpt">
        	<header>
     	       <h2>게시물 작성</h2>
               </header>
               	<div class="info">
        </article> 
		
		<form action="write" method="post" class="container" onsubmit="return writeSave()">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<table class="table table-striped" width="500" cellpadding="0" cellspacing="0" border="1">
				<tr>
					<th>이름</th>
					<td><input type="text" name="bName" id="bName" size="40"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="bTitle" id="bTitle" size="40"></td>
				</tr>
				<tr>
				<th>내용</th>
					<td><textarea name="bContent" rows="10" cols="40" id="bContent"></textarea></td>
				</tr>
				<tr><th>비밀번호</th><td class="left"><input type="password" name="bPassword" id="bPassword" size="10" maxlength="10"></td></tr>
				<tr><th>비밀번호 확인</th><td class="left"><input type="password" name="bPassword1" id="bPassword1" size="10" maxlength="10"></td></tr>
				<tr>
					<td colspan="2"><input type="submit" value="입력" class="btn btn-success">&nbsp;&nbsp;<input type="reset" value="초기화" class="btn">&nbsp;&nbsp;
					<a href="list"><button type="button" class="btn btn-warning">목록보기</button></a></td>
				</tr>
			</table>
		</form> 	
	</div>
</div>
<script type="text/javascript">
	function writeSave(){
		var bName = document.getElementById('bName');	
		var bTitle = document.getElementById('bTitle');	
		var bContent = document.getElementById('bContent');
		var bPassword = document.getElementById('bPassword');
		var bPassword1 = document.getElementById('bPassword1');
		
		if(!bName.value){	
			alert("이름을 입력하세요");
			bName.focus();
			return false;
		}
		
		if(!bTitle.value){
			alert("제목을 입력하세요");
			bTitle.focus();
			return false;
		}
		if(!bContent.value){
			alert("내용을 입력하세요");
			bContent.focus();
			return false;
		}
		if(!bPassword.value){
			alert("비밀번호를 입력하세요");
			bPassword.focus();
			return false;
		}
		if(!bPassword1.value){
			alert("비밀번호 확인을 입력하세요");
			bPassword1.focus();
			return false;
		}
		if(!(bPassword.value == bPassword1.value)){
			alert("패스워드가 서로다릅니다. 입력하세요");
			bPassword.focus();
			bPassword.value="";
			bPassword1.value="";
			return false;
		}
		return true;
	} 
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="/resources/bootstrap/js/bootstrap.js"></script>
</body>
</html>