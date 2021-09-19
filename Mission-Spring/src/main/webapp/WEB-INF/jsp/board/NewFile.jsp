<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<!-- 폼 시작 -->
<div align="center">
	<hr width="80%">
	<h2>게시판 상세</h2>
	<hr width="80%">
	<br>
	<table border="1" style="width: 80%">
		<tr>
			<th width="25%">번호</th>
			<td><c:out value="${ board.no }" /></td>
		</tr>
		<tr>
			<th width="25%">제목</th>
			<td><c:out value="${ board.title }" /></td>
		</tr>
		<tr>
			<th width="25%">작성자</th>
			<td>${ board.writer }</td>
		</tr>
		<tr>
			<th width="25%">내용</th>
			<td>${ board.content }</td>
		</tr>
		<tr>
			<th width="25%">조회수</th>
			<td>${ board.viewCnt }</td>
		</tr>
		<tr>
			<th width="25%">등록일</th>
			<td>${ board.regDate }</td>
		</tr>
		<%-- 
		<tr>
			<th>첨부파일</th>
			<td>
				<c:forEach items="${ fileList }" var="file">
					<a href="/Mission-Web/upload/${ file.fileSaveName }">
						<c:out value="${ file.fileOriName }" />
					</a>
					(${ file.fileSize } bytes)
					<br>
				</c:forEach>
			</td>
		</tr> 
		--%>
	</table>
	<br>
	<button onclick="clickBtn('U')">수정</button>
	<button onclick="clickBtn('D')">삭제</button>
	<button onclick="clickBtn('L')">목록</button>
</div>
<hr>
<div align="center">
	<form method="post" name="replyForm">
		<input type="hidden" name="boardNo" value="${ board.no }" />
		<table border="1" style="width: 80%">
			<tr>
				<th>작성자</th>
				<td><input type="text" size="10" name="writer" value="${ userVO.id }"></td>
				<th>내용</th>
				<td><textarea rows="2" cols="60" name="content"></textarea></td>
			</tr>
		</table>
	</form>
	<br>
	<button id="send" onclick="clickBtnReply('C')">댓글등록</button>
	<button onclick="clickBtnReply('U')">댓글수정</button>
	<button onclick="clickBtnReply('D')">댓글삭제</button>
	<hr>
	<div id="replyView"></div>
</div>


<!-- 전체 메세지 보낼 수 있는 곳 -->
<div class="well">
	<input type="text" id="msg" value="1212" class="form-control" />
	<button id="btnSend" class="btn btn-primary">Send Message</button>
</div>
<!-- 폼 시작 -->