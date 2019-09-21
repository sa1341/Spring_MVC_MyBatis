<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>HomePage</title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

    <!-- Plugin CSS -->
    <link href="/resources/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/css/creative.min.css" rel="stylesheet"> 
	<!--  JQuery CDN -->
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function(){
			  var modelAttr = $("#identity").val();
			 
			if(modelAttr == 'anonymousUser'){
			
				$('#log').html("Login");
			}else{
				
				$('#log').html("Logout");
				$("#log").attr("href", "logout")

			}

		});
			
	
		
			
	</script>


</head>


  <body id="page-top">

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">RnBsoft</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" id= "about" href="#about">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#services">Services</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#contact">Contact</a>
            </li>
             <li class="nav-item">
              <a class="nav-link js-scroll-trigger"  id="log" href="login">Login</a>
              <input type="hidden" id ="identity" value="${identity}"/> 
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <header class="masthead text-center text-white d-flex">
      <div class="container my-auto">
        <div class="row">
          <div class="col-lg-10 mx-auto">
            <h1 class="text-uppercase">
              <strong>알앤비 임직원들을 위한 공간</strong>
            </h1>
            <hr>
          </div>
          <div class="col-lg-8 mx-auto">
            <p class="text-faded mb-5">환영합니다.</p>
          </div>
        </div>
      </div>
    </header>

    <section class="bg-primary" id="about">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto text-center">
            <h2 class="section-heading text-white">알앤비식구들을 위한 모든것!</h2>
            <hr class="light my-4">
            <p class="text-faded mb-4">이 페이지는 각각의 임직원의 파견근무지에 관한 맛집정보 서비스에 대한 정보를 제공하고, 고충이나 개선사항들을 익명으로 제보하여 문제점을 해결하자는 취지하에 만든 웹페이지입니다.</p>
          </div>
        </div>
      </div>
    </section>

    <section id="services">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading">Our Service</h2>
            <hr class="my-4">
          </div>
        </div>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box mt-5 mx-auto">
            <a href="searchMember"><i class="fa fa-4x fa-diamond text-primary mb-3 sr-icons"></i></a>  
              <h3 class="mb-3">맛집 찾기</h3>
              <p class="text-muted mb-0">어느식당을 가야 점심을 잘먹었다고 소문이 날까요?</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box mt-5 mx-auto">
             <a href="IntroduceService"><i class="fa fa-4x fa-paper-plane text-primary mb-3 sr-icons"></i></a> 
              <h3 class="mb-3">서비스소개</h3>
              <p class="text-muted mb-0">우리가 제공하는 서비스에 대한 설명을 원한다면 클릭!</p>
            </div>
          </div>
          
          <div class="col-lg-3 col-md-6 text-center">
           	  <div class="service-box mt-5 mx-auto">
              <a href="list"><i class="fa fa-4x fa-newspaper-o text-primary mb-3 sr-icons"></i></a>
              <h3 class="mb-3">알앤비에게 전해줘</h3>
              <p class="text-muted mb-0">신입사원들의 고충사항과 개선할점들을 알려주세요.</p>
            </div>
          </div>
          
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box mt-5 mx-auto">
             <a href="IntroduceCompany"><i class="fa fa-4x fa-heart text-primary mb-3 sr-icons"></i></a>
              <h3 class="mb-3">회사소개</h3>
              <p class="text-muted mb-0">우리회사가 자랑하는 기술력과 사업영역들을 알고싶으시면 클릭!</p>
            </div>
          </div>
        </div>
      </div>
    </section>


    <section id="contact"  class="bg-dark text-white">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto text-center">
            <h2 class="section-heading">Q/A</h2>
            <hr class="my-4">
            <p class="mb-5">궁금한 사항이 있으시면 다음과 같은 방법으로 문의해주세요.</p>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-4 ml-auto text-center">
            <i class="fa fa-phone fa-3x mb-3 sr-contact"></i>
            <p>031-790-6689</p>
          </div>
          <div class="col-lg-4 mr-auto text-center">
            <i class="fa fa-envelope-o fa-3x mb-3 sr-contact"></i>
            <p>
              <a href="mailto:your-email@your-domain.com">a7900@sgmail.com</a>
            </p>
          </div>
        </div>
      </div>
    </section>

    <!-- Bootstrap core JavaScript -->
    <script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>">
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

 
  </body>

</html>
