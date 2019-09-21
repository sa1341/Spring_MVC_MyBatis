<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap-theme.css" > 
</head>
<body>
<div id="content">
            <div class="inner">

                <!-- Post -->
                  <!-- <article class="box post post-excerpt">
                     <header>
                        <h2></h2>
                     </header>
                     <div class="info">
                        <span class="date"><span class="month">Jul<span>y</span></span> <span class="day">14</span><span class="year">, 2014</span></span>
                   </article> 
    -->
	
	<form action="password_modify" method="post" class="container">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>		
		<input type="hidden" name="bId" id="bId" value="${content_view.bId }">
		<input type="hidden" name="bName" value="${content_view.bName }">
		<input type="hidden" name="bTitle" value="${content_view.bTitle}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<table class="table table-striped" width="400" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<th><h4>이름</h4></th>
			<td><h4>${content_view.bName}</h4></td>
		</tr>
		<tr>
			<th><h4>제목</h4></th>
			<td><h4>${content_view.bTitle}</h4></td>
		</tr>
		<tr>
			<th><h4>내용</h4></th>
			<td><textarea rows="10" cols="50" name="bContent">${content_view.bContent}</textarea></td>			
		</tr>
		<tr>
			<td>
			<table border=1>
   			<tr>
    		<td id="favor"><img src="/resources/images/like.png"><span>좋아요</span></td>
            <td id ="hate"><img src="/resources/images/thumb-down.png"><span>싫어요</span></td>
     		</tr>
     		<tr><td id="favorCnt">${content_view.favorCnt}</td><td id="hateCnt">${content_view.hateCnt}</td></tr> 
			</table>
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit"  class="btn btn-info" value="수정">&nbsp;&nbsp;<a href="list?pageNum=${pageNum}"><button type="button" class="btn btn-warning">목록</button></a>&nbsp;&nbsp;
			<a href="password_delete?bId=${content_view.bId }"><button type="button" class="btn btn-danger">삭제</button></a>&nbsp;&nbsp;
			<a href="reply_view?bId=${content_view.bId}"><button type="button" class="btn btn-success">답변</button></a></td>
		</tr>
	</table>
	</form>
</div>
</div>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>   
<script src="/resources/assets/js/jquery.min.js"></script> 
<script src="/resources/assets/js/skel.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="/resources/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript">
	$("#favor").click(function(){
		var id = $("#bId").val();
		
		 $.ajax({
		        url:"/boards/"+id+"/favor",
		        type:'GET',
		        success:function(data){
		        	$("#favorCnt").text(data.favorCnt);
		        	
		        },
		        error:function(jqXHR, textStatus, errorThrown){
		            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
		            self.close();
		        }
		    });
	});
</script>

<script type="text/javascript">
$("#hate").click(function(){
	var id = $("#bId").val();
	
	 $.ajax({
	        url:"/boards/"+id+"/hate",
	        type:'GET',
	        success:function(data){
	        	$("#hateCnt").text(data.hateCnt);
	        	
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	            self.close();
	        }
	    });
});
</script>
	
</body>
</html>