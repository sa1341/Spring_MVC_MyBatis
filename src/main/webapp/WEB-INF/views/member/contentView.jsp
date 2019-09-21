<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신입사원 등록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<link href="/resources/screen.css" rel="stylesheet" type="text/css"/>
<link href="/resources/default.css" rel="stylesheet" type="text/css"/>
</head>
<body>

    <div id="cover" class="container-fluid">
    
    
    <div>
        <h1>근무지 조회</h1>
        <p>근무지  및 프로젝트 팀을 조회 가능하고<br />
			근무지 지역을 검색하여 맛집을 알 수 있습니다.<br />
		</p>
    </div>
</div>
<br>

<form action="modifyPasswordView" method="post" class="container" onsubmit="return writeSave()">
		    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" name="password" id="mloc" size="40" value="${contentView.password}">    	
			<table class="table table-striped" width="500" cellpadding="0" cellspacing="0" border="1">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="username" id="username" size="40" value="${contentView.username}" readonly="readonly"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="mname" id="mname" size="40" value="${contentView.mname}" readonly="readonly"></td>
				</tr>
				<tr>
					<th>프로젝트팀</th>
					<td><input type="text" name="mdepartment" id="mdepartment" size="40" value="${contentView.mdepartment}" readonly="readonly"></td>
				</tr>
				<tr>
					<th>근무지</th>
					<td>
						<input type="text" name="mloc" id="mloc" size="40" value="${contentView.mloc}" readonly="readonly">
      				</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="수정 및 삭제" class="btn btn-success">&nbsp;&nbsp;
			<%-- <a href="memberDelete?username=${contentView.username}"><button type="button" class="btn btn-danger">삭제</button></a>&nbsp;&nbsp;--%>
 					<a href="searchMember"><button type="button" class="btn btn-warning">이전</button></a>
					</td>
				</tr>
			</table>
		</form> 
		
		
	
			
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
</body>
</html>