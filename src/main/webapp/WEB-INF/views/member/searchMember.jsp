<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파견지 조회</title>
<link href="/resources/vendor/bootstrap/css/style.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<link href="/resources/screen.css" rel="stylesheet" type="text/css" />
<link href="/resources/default.css" rel="stylesheet" type="text/css" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body class="home-template">

	<div id="header">
		<button id="menu-toggle" type="button">
			<span class="sr-only">Toggle Navigation Menu</span>
		</button>
		<button id="search-toggle" type="button">
			<span class="sr-only">Toggle Search Form</span>
		</button>
		<a id="logo" href="/"> <span class="sr-only">식사하러가시 조</span>
		</a>

		<ul id="menu" class="nav">
			<li class=""><a href="home">홈화면</a></li>
			<li class=""><a href="IntroduceCompany">회사소개</a></li>
			<li class="active"><a href="searchMember">맛집 찾기</a></li>
			<li class=""><a href="list">알앤비에게 전해줘</a></li>
			<li class=""><a href="IntroduceService">서비스소개</a></li>
		</ul>
	</div>

	<div id="cover" class="container-fluid"
		style="background-image: url(/assets/images/default_blog_cover.jpg);">

		<!--[if (gt IE 9)|!(IE)]><!-->
		<video loop muted preload="metadata" crossorigin="anonymous">
		<source src="/assets/images/blog_cover.webm" type="video/webm" /> <source
			src="/assets/images/blog_cover.ogv" type="video/ogg" /> <source
			src="/assets/images/blog_cover.mp4" type="video/mp4" /> </video>
		<!--<![endif]-->

		<div>
			<h1>사원 근무지 조회</h1> 
			<p>
				<br /> 사원 이름을 통해 알앤비소프트 임직원 정보를 조회 할 수 있습니다.<br />
			</p>
		</div>
	</div>

<c:if test="${not empty msg}">
   	   <script type="text/javascript">
			swal("비밀번호가 맞지 않습니다.");
		</script> 
</c:if> 


	  	<form action="memberList" method="get" align="center">
		
			<!-- <div class="form__field">
				<select name="keyField" size="1">
					<option value="bName">이름</option>
				</select>
 -->			<br/>	<br/>	<br/>
				<!--  <div class="col-lg-6"  style="display: inline-block;text-align: center;">  -->
			
					<div class="input-group" style="margin:30px 700px 700px;align: center;">
						<input type="text" class="form-control"
							placeholder="사원 이름을 입력해주세요" name="mname" required="required"> <span
							class="input-group-btn">
							<button class="btn btn-default" type="submit">검색</button>
						</span>
				
					<!-- /input-group -->
				 <!-- </div> --> 
				<!-- /.col-lg-6 -->
			</div>
			<!-- /.row -->

		<!-- 	<input type="text" name="mname" class="form__input"
				required="required" />

			<button type="submit" class="btn btn-default">검색</button> -->
	
	 </form> 



</body>
<div id="footer" class="container-fluid">
    <ul id="links">
        
        <li>
            <a id="link-github" href="http://github.com/kakao" target="_blank">
                <span class="sr-only">github</span>
            </a>
        </li>
        
        
        <li>
            <a id="link-facebook" href="http://facebook.com/nkakao" target="_blank">
                <span class="sr-only">facebook</span>
            </a>
        </li>
        
        
        <li>
            <a id="link-twitter" href="http://twitter.com/kakaodev" target="_blank">
                <span class="sr-only">twitter</span>
            </a>
        </li>
        
        <li>
            <a id="link-rss" href="/rss" target="_blank">
                <span class="sr-only">rss</span>
            </a>
        </li>
    </ul>
   
    <p id="copyright">
        <a href="//www.kakaocorp.com">Copyright &copy; 식사하러가시 조.</a>
        All rights reserved.
    </p>
</div><!--#footer-->
</html>