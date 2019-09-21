<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>
<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="/resources/css/loginstyle.css">
<script>
$(document).ready(function(){ 

	$('.toggle').on('click', function() {
      $('.container').stop().addClass('active');
   });

   $('.close').on('click', function() {
      $('.container').stop().removeClass('active');
   });
   
   
});
</script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
</head>
<body>

<div class="container">
  <div class="card"></div>
  <div class="card">
    <h1 class="title">회원가입</h1>
            <form method="POST">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <div class="input-container">
               <input name="username" type="text" required="required" /><label for="">임직원들을 위한 포털사이트</label>
               <div class="bar"></div>
            </div>
            <div class="input-container">
               <input name="password" type="password" required="required" /> <label for="">오른쪽 아이콘을 클릭하세요!</label>
               <div class="bar"></div>
            </div>
            <div class="button-container">
               	<a href="home">
                 <button type="button">
                  		Home
                 </button> 
                 </a>
            </div>
      <div class="footer"><a href="home"></a></div>
  </form>
  </div>
  <div class="card alt">
    <div class="toggle"></div>
    <h1 class="title">등록하기
      <div class="close"></div>
    </h1>

<form action="memberWrite" method="post" class="container" onsubmit="return writeSave()">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
      <div class="input-container">
        <input type="text" id="username" name ="username" required="required"/>
          <button type="button" class="btn btn-primary" id="idBtn">아이디 중복확인</button>
        <label for="username">아이디</label>
        <div class="bar"></div>
      </div>
      <div class="input-container">
        <input type="text" id="mname" name="mname" required="required"/>
        <label for="mname">이름</label>
        <div class="bar"></div>
      </div>
      <div class="input-container">
        <input type="text" id="mdepartment" name="mdepartment" required="required"/>
       	<label for="mdepartment">프로젝트팀</label>
      	<div class="bar"></div>
      </div>
   <!--    
      <div class="input-container">
        	<select name="mloc" size="1" class="selectpicker" multiple>
				<option value="수원">수원</option>
				<option value="정자">정자</option>
      		</select>
      		수원: 
			<input type ="radio" name ="mloc" value = "수원">
			정자: 
			<input type ="radio" name ="mloc" value = "정자" checked>
      	<div class="bar"></div>
      </div> -->
      
      <div class="input-container">
      	<input type="password" id="password" name="password" required="required"/>
      	<label for="password">비밀번호</label>
      	<div class="bar"></div>
      </div>
    
      <div class="input-container">
	      <input type="password" id="password1" name="password1" required="required"/>
	      <label for="password1">비밀번호 확인</label>
	      <div class="bar"></div>
      </div>
      
      <div class ="input-container">
      		
			<h1>수원:</h1><input type ="radio" name ="mloc" value = "수원">
		  	<h1>정자:</h1><input type ="radio" name ="mloc" value = "정자" checked>
		    <div class="bar"></div>
	 </div>
      
      <div class="button-container">
        <button type="submit">
        	<span>회원 등록</span>
        </button>
      </div>.
    </form>
  </div> 
</div>
<!-- Portfolio--><a id="portfolio" href="http://andytran.me/" title="View my portfolio!"><i class="fa fa-link"></i></a>
<!-- CodePen--><a id="codepen" href="https://codepen.io/andytran/" title="Follow me!"><i class="fa fa-codepen"></i></a>


</body>
</html>