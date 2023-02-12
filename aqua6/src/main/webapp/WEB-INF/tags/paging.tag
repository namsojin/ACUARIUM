<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="url" %>
<%@ attribute name="part" %>
<%--페이징처리--%>

<jsp:include page="/paging.jsp">
	<jsp:param value="${url}" name="url"/>
	<jsp:param value="${part}" name="part"/>
	<jsp:param value="${search}" name="search"/>
	<jsp:param value="${category}" name="category"/>
    <jsp:param value="${paging.curpage}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
</jsp:include>