<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h6 class="h6">
	댓글 <label class="badge badge-lg bg-info">${ requestScope.replyList.size() }</label>
</h6>
<div align="center">
	<table border="1" style="width: 80%">
		<tr>
			<td>부모 번호</td>
			<td>작성자</td>
			<td><input type="text" size="10" name="writer" value="${ userVO.id }"></td>
			<td>내용</td>
			<td><textarea rows="2" cols="60" name="content"></textarea></td>
			<td><button id="send" onclick="clickBtnReply('C')">댓글등록</button></td>
		</tr>

		<c:forEach items="${ requestScope.replyList }" var="reply"
			varStatus="loop">
			<tr>
				<td>${ reply.no }</td>
				<td>${ reply.boardNo }</td>
				<td>${ reply.content }</td>
				<td>${ reply.writer }</td>
				<td>${ reply.regDate }</td>
				<td>
					<button onclick="clickBtnReply('U')">댓글수정</button>
					<button onclick="clickBtnReply('D')">댓글삭제</button>
				</td>
			</tr>
		</c:forEach>
		
	</table>
</div>