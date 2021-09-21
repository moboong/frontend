<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<li>
	<h6>Stock Signal Notice</h6> <label class="label label-danger">New</label>
</li>

<c:forEach items="${ requestScope.noticeList }" var="notice" varStatus="loop">
	<li class="waves-effect waves-light">
		<div class="media">
			<img class="d-flex align-self-center img-radius"
				src="${pageContext.request.contextPath}/display?fileName=profile/${ notice.writer }.png"
				alt="Generic placeholder image">
			<div class="media-body">
				<h5 class="notification-user">${ notice.writer }</h5>
				<p class="notification-msg"><a href="${pageContext.request.contextPath}/board/${ notice.boardNo }">내 ${ notice.boardNo }게시글에 댓글을 달았습니다.</a></p>
				<span class="notification-time">${ notice.regDate }</span>
			</div>
		</div>
	</li>
</c:forEach>