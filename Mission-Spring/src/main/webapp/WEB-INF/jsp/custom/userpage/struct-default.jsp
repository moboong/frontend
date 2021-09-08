<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- e1-4/e3-4/e2-4 -->

<c:forEach items="${ requestScope.list }" var="custom" varStatus="loop">
	<jsp:include page="../graph/example${ custom.no }.jsp" />
	<script>
		arr[idx++] = ${ custom.size }
	</script>
</c:forEach>