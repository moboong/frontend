<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/layout.css" />
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/board.css" />
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
function connect() {
	var ws = new WebSocket("ws://localhost:9999/Mission-Spring/replyEcho?boardNo=${board.no}");

	ws.onopen = function() {
		console.log('Info: connection opened.');
		setTimeout(function() {
			connect();
		}, 1000); // retry connection!!
	};

	ws.onmessage = function(event) {
		console.log(event.data + '\n');
	};

	ws.onclose = function(event) {
		console.log('Info: connection closed.');
	};
	ws.onerror = function(event) {
		console.log('Info: connection closed.');
	};

	$('#send').on('click', function(evt) {
		evt.preventDefault();
		if (socket.readyState !== 1)
			return;
		let msg = $('input#msg').val();
		ws.send(msg);
	});
}
	
</script>

<script>
	
	$(document).ready(
		getReplyList()
	)

	function getReplyList() {
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : '${ pageContext.request.contextPath }/reply/${board.no}',
			success : function(data) {
				$('#msgView').html("");
				for(var i = 0 ; i < data.length; i++){
				    let str = data[i].no + " / " + data[i].boardNo + " / " + data[i].writer + " / " + data[i].content + " / " + data[i].regDate;
					$('#msgView').append("<h4>" + str + "</h4>")
				}
			},
			'error' : function() {
				alert('실패')
			}
		})
	}

	function addReply() {

		var queryString = $("form[name=replyForm]").serialize();

		$.ajax({
			type : 'POST',
			url : '${ pageContext.request.contextPath }/reply/write',
			data : queryString,
			async : false,
			dataType : 'json',
			success : function(msg) {
				alert(msg)
				getReplyList()
			},
			'error' : function() {
				alert('실패')
			}
		})
	}

	function clickBtnReply(type) {
		switch (type) {
		case 'C':
			addReply()
			break
		case 'U':
			alert('댓글수정입장')
			/* updateReply() */
			break
		case 'D':
			if (confirm('[ reply number ]번 게시글을 삭제할까요?')) {
				alert('댓글수정입장')
				/* updateReply() */
			}
			break
		}
	}

	function clickBtn(type) {
		switch (type) {
		case 'U':
			location.href = '/board/updateFrom/${ board.no }'
			break
		case 'D':
			if (confirm('[${board.no}]번 게시글을 삭제할까요?'))
				location.href = '${ pageContext.request.contextPath }/board/delete/${ board.no }'
			break
		case 'L':
			location.href = "${ pageContext.request.contextPath }/board"
			break
		}
	}
</script>
</head>
<body>
	<header>
		<%-- <jsp:include page="/jsp/include/topMenu.jsp" /> --%>
	</header>
	<section>
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
				<%-- <tr>
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
			</tr> --%>
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
						<td><input type="text" size="10" name="writer"
							value="${ userVO.id }"></td>
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
			<div id="msgView"></div>
		</div>
	</section>
	<footer>
		<%-- <%@ include file="/jsp/include/bottom.jsp" %> --%>
	</footer>
</body>
</html>