<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

<link rel='stylesheet prefetch'
   href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>
<link rel='stylesheet prefetch'
   href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

<link rel="stylesheet" href="/resources/css/loginstyle.css">
<script>
   $('.toggle').on('click', function() {
      $('.container').stop().addClass('active');
   });

   $('.close').on('click', function() {
      $('.container').stop().removeClass('active');
   });
</script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="js/index.js"></script>
</head>
<body>
   <!-- Mixins-->
   <!-- Pen Title-->
   <div class="pen-title">
      
   </div>
   <div class="rerun">
      <a href="home">Return home</a>
   </div>

   <div class="container">
      <div class="card"></div>
      <div class="card">
         <h1 class="title">Login</h1>

         <form method="POST">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <div class="input-container">
               <input name="username" type="text" required="required" /> <label for="">Username</label>
               <div class="bar"></div>
            </div>
            <div class="input-container">
               <input name="password" type="password" required="required" /> <label for="">Password</label>
               <div class="bar"></div>
            </div>
            <div class="button-container">
               
                  <button type="submit">
                  <span>Login</span>
                  </button>
            </div>
            <div class="footer">
               <a href="#">Forgot your password?</a>
            </div>
            	
         </form>
      </div>
      <div class="card alt">
         <a href="memberWriteView"><div class="toggle"></div></a>
         <p></p>
         
      </div>
   </div>

<c:if test="${not empty param.fail}">

<script type="text/javascript">
			swal("로그인에 실패하셨습니다. 다시 시도해주세요.");
</script>					

</c:if>
</body>
</html>