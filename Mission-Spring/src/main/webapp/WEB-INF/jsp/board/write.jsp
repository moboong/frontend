<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새글등록</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/layout.css" />
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/board.css" />
<style>
	.error {
		color: red;
	}
</style>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>


</script>
</head>
<body>
	<header>
		<%-- <jsp:include page="/jsp/include/topMenu.jsp" /> --%>
	</header>
	<section>
		<div align="center">
			<hr width="80%">
			<h2>게시글 등록폼</h2>
			<hr width="80%">
			<br>
			<form:form method="post" modelAttribute="boardVO">
				<table border="1" style="width: 100%;">
					<tr>
						<th>제목</th>
						<td>
							<form:input path="title" />
							<form:errors path="title" class="error" />
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							<form:input path="writer" />
							<form:errors path="writer" class="error" />
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<form:textarea row="8" cols="60" path="content" />
							<form:errors path="content" class="error" />
						</td>	
					</tr>
				</table>
				<br>
				<form:button type="submit">등록</form:button>
			</form:form>			
		</div>
	</section>
	<footer>
		<%-- <%@ include file="/jsp/include/bottom.jsp" %> --%>
	</footer>
</body>
</html>