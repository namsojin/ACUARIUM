<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>페이징 처리(어드민페이지부부에 해당함)</title>
</head>
<body>

	<c:choose>
		<c:when test="${param.part==admin}">
			<div class="product__pagination blog__pagination">
					<%-- memberList.do라는 url 경로를 action이라는 변수명으로 세팅한다 --%>
					<c:url var="action" value="${param.url}" />
					<%-- prev라는 파라미터가 true라면 prev를 표시하겠다. 그리고 prev를 클릭하면 ${action}?page=${param.beginPage-1} (/memList.do?page=beginPage-1)와 같음 로 이동시키겠다. --%>
					<c:if test="${param.prev}">
						<a href="${action}?page=${param.beginPage-1}"><i
							class="fa fa-long-arrow-left"></i></a>
					</c:if>
					<%-- beginPage에서부터 endPage까지 반복문을 돌며 표시하겠다. --%>
					<c:forEach begin="${param.beginPage}" end="${param.endPage}"
						step="1" var="index">
						<c:choose>
							<%-- 현재 보고 있는 페이지는 링크를 삭제하고 단순히 숫자만 표시하겠다. --%>
							<c:when test="${param.curpage==index}">
								<a href="#"> ${index} </a>
							</c:when>
							<%-- 현재 보고 있는 페이지가 아니면 링크를 살리겠다. --%>
							<c:otherwise>
								<a href="${action}?page=${index}">${index}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<%-- next를 표시할지 말지. next를 누르면 어디로 이동시킬지 로직은 prev와 같다. --%>
					<c:if test="${param.next}">
						<a href="${action}?page=${param.endPage+1}"><i
							class="fa fa-long-arrow-right"></i></a>
					</c:if>
				</div>
			
		</c:when>
		<c:otherwise>
			<div class="col-lg-12">
				<div class="product__pagination blog__pagination">
					<%-- memberList.do라는 url 경로를 action이라는 변수명으로 세팅한다 --%>
					<c:url var="action" value="${param.url}" />
					<%--검색어 --%>
					<c:if test="${param.search != null}">
						<input type="hidden" name="search" value="${param.search}">
					</c:if>
					
					<%-- prev라는 파라미터가 true라면 prev를 표시하겠다. 그리고 prev를 클릭하면 ${action}?page=${param.beginPage-1} (/memList.do?page=beginPage-1)와 같음 로 이동시키겠다. --%>
					<c:if test="${param.prev}">
						<a href="${action}?page=${param.beginPage-1}"><i
							class="fa fa-long-arrow-left"></i></a>
					</c:if>
					<%-- beginPage에서부터 endPage까지 반복문을 돌며 표시하겠다. --%>
					<c:forEach begin="${param.beginPage}" end="${param.endPage}"
						step="1" var="index">
						<c:choose>
							<%-- 현재 보고 있는 페이지는 링크를 삭제하고 단순히 숫자만 표시하겠다. --%>
							<c:when test="${param.curpage==index}">
								<a href="#"> ${index} </a>
							</c:when>
							<%-- 현재 보고 있는 페이지가 아니면 링크를 살리겠다. --%>
							<c:otherwise>
								<a href="${action}?page=${index}">${index}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<%-- next를 표시할지 말지. next를 누르면 어디로 이동시킬지 로직은 prev와 같다. --%>
					<c:if test="${param.next}">
						<a href="${action}?page=${param.endPage+1}"><i
							class="fa fa-long-arrow-right"></i></a>
					</c:if>
				</div>
			</div>
		</c:otherwise>
	</c:choose>

















</body>
</html>