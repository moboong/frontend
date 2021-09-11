<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 1번 기사 -->
<c:out value="${ latestTime }"/>

<c:forEach items="${ requestScope.newsList }" var="news" varStatus="loop">
	<tr>
		<td><img
			src="<c:out value="${ news.imgSrc }"/>"
			alt="user image" class="img-100 align-top m-r-15"></td>
		<td>
			<div class="d-inline-block align-middle">
				<div class="d-inline-block">
					<h4>
						<a href="<c:out value="${ news.link }"/>">
							<c:out value="${ news.title }"/>
						</a>
					</h4>					
					<p class="text-muted m-b-0"><c:out value="${ news.contents }"/></p>
				</div>
			</div>
		</td>
	</tr>
</c:forEach>

