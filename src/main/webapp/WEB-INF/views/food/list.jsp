<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​
<%int count =(Integer)session.getAttribute("count"); %>
<%int currentPage =(Integer)session.getAttribute("currentPage"); %>
<%int pageSize =(Integer)session.getAttribute("pageSize"); %> 
<%int number =(Integer)session.getAttribute("number"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css" >
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap-theme.css" >
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
   <div id="content">
            <div class="inner">
	
				<a href="home"><img src="/resources/images/RnB.png"/></a>
               <!-- Post -->
                  <article class="box post post-excerpt">
                     <header>
                        <h2>알앤비에게 전해줘</h2>
                        <p></p>
                     </header>
                
                   </article>
  
  
   <form action="boardSearch" method="post">
            <select name="keyField" size="1">
                <option value="bName" <c:if test="${'name'==keyField }"> selected</c:if>> 이름 </option>
                <option value="bTitle" <c:if test="${'title'==keyField }"> selected</c:if>> 제목 </option>
                <option value="bContent" <c:if test="${'content'==keyField }"> selected</c:if>> 내용 </option>
            </select>
                 <input type="text" size="16" name="keyWord" >
                 <input type="button" value="검색" onClick="check()">
           		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>      
   </form>    

<c:if test="${not empty msg}">
   	   <script type="text/javascript">
			swal("비밀번호가 맞지 않습니다.");
		</script> 
 </c:if> 
  
 <c:if test="${count==0}">
   	   <script type="text/javascript">
			swal("게시판에 저장된 글이 없습니다.");
		</script> 
 </c:if> 
   <table class="table table-striped" width="500" cellpadding="0" cellspacing="0" border="1">
      <tr>
         <th>번호</th>
         <th>이름</th>
         <th>제목</th>
         <th>날짜</th>
         <th>조회수</th>
      </tr>
      <c:forEach items="${list}" var="dto">.
      <tr height= "30">
          <td><%=number--%></td>
         <td width="250" class="left">
   
         <c:if test="${dto.bIndent>0}">
                <img src = "/resources/images/level.gif" width="${dto.bIndent*10}" height="16"> 
                <img src="/resources/images/reply-all.png">        
            </c:if>                
      
        	 <c:if test="${dto.bIndent ==0}">
              <img src = "/resources/images/level.gif" width="0" height="16">
             </c:if>
   
         <a href ="content_view?bId=${dto.bId}&pageNum=${currentPage}">${dto.bName}</a>
          
          <c:if test="${dto.bHit>=10 && dto.favorCnt > 5}">
              <img src="/resources/images/star.png"  border="0" height="16">
            </c:if> 
         </td>
         
         
         <td>
         <a href="content_view?bId=${dto.bId}&pageNum=${currentPage}">${dto.bTitle}</a>
         </td>
         <td>${dto.bDate}</td>
         <td>${dto.bHit}</td>
      </tr>
      </c:forEach>
      
       <tr>
         <td colspan="5"><a href="write_view" class="btn btn-default pull-right">글작성</a></td>
          </tr>     
   </table>

     
  

       <c:if test ="${count>0}">   
       <% 
         int pageCount = count/pageSize     /* 전체 건수 /페이지 크기 결과는 정수 페이지 수 */ 
                               + (count%pageSize==0?0:1);/* 나머지가 있으면 한 페이지를 추가 */
         int startPage = (int)((currentPage-1)/10)*10+1;   //현재페이지의 시작번호
         int pageBlock = 10;//한 화면에 보여지는 페이 수 단위
         int endPage = startPage + pageBlock -1;//한  화면에 보여지는 페이지 끝 번호
         if(endPage > pageCount) endPage = pageCount;
                               /* 끝페이지가 전체 페이지를 넘지못하게 처리  */
         
         if(startPage > 10){ %>
         <a href="list?pageNum=<%=startPage - 10 %>&keyField=${keyField}&keyWord=${keyWord}">
         <img src="/resources/images/prec.gif">
         Previous Page</a>
         <%
         }
         for(int i=startPage;i<=endPage;i++){%>
         <div class="pagination">
            <div class="pages">
            <a href="list?pageNum=<%=i%>&keyField=${keyField}&keyWord=${keyWord}"><%=i%></a>
            </div>
         </div><%
         }
         if(endPage < pageCount){%>
         <a href="list?pageNum=<%=startPage+10 %>&keyField=${keyField}&keyWord=${keyWord}">Next Page
         <img src="/resources/images/next.gif"></a><%
         }     
       %>
     </c:if> 
          
         </div>
   </div>
         
      
<script>
  function check() {
        if (document.search.keyWord.value == "") {
            alert("검색어를 입력하세요.");
            document.search.keyWord.focus();
            return;
        }
        document.search.submit();
    }

</script>

<script src="/resources/bootstrap/js/bootstrap.min.js"></script>   
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/skel.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>
</body>
</html>