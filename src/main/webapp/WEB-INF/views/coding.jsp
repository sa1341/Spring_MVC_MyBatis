<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 
    <form action="./fileUpload.do" method="post" enctype="multipart/form-data">
        <input type="file" name="file"/>
        <input type="submit" value="전송"/>
    </form>
    
    <a href="./fileDownload.do">다운로드</a>
    <a href="./fileDelete.do">삭제하기</a>

</body>
</html>