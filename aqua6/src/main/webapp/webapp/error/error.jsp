<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지</title>
</head>
<body>

처리중이었던 URI : ${pageContext.errorData.requestURI} <br> <%-- 무슨 경로에서 --%>
에러 상태 코드 : ${pageContext.errorData.statusCode} <br> <%-- 어떤 에러인지 --%>
예외 메세지 : ${pageContext.errorData.throwable} <%-- 오류내용이 뭔지 --%>

</body>
</html>