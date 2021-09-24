<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<jsp:include page="/WEB-INF/jsp/include/head.jsp"></jsp:include>
</head>
<body>
	<!-- Pre-loader start -->
	<jsp:include page="/WEB-INF/jsp/include/preloader.jsp" />
	<!-- Pre-loader end -->
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">
			<!-- nav-top start -->
			<jsp:include page="/WEB-INF/jsp/include/navtop.jsp" />
			<!-- nav-top end -->
			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">
					<!-- nav-side start -->
					<jsp:include page="/WEB-INF/jsp/include/navside.jsp" />
					<!-- nav-side end -->
					
					<!-- 컨텐츠 시작 -->
					<div class="pcoded-content">
						<!-- Page-header start -->
						<div class="page-header">
							<div class="page-block">
								<div class="row align-items-center">
									<div class="col-md-8">
										<div class="page-header-title">
											<h5 class="m-b-10">지표 토론실 : ${board.no}번 상세보기</h5>
											<p class="m-b-0">Welcome to Stock Signal Forum</p>
										</div>
									</div>
									<div class="col-md-4">
										<ul class="breadcrumb-title">
											<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}"> <i
													class="fa fa-home"></i>
											</a></li>
											<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/board">지표토론실</a></li>
											<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/board/${board.no}">${board.no}번상세</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!-- Page-header end -->
						<div class="pcoded-inner-content">
							<!-- Main-body start -->
							<div class="main-body">
								<div class="page-wrapper">
									<!-- Page-body start -->
									<div class="page-body">
										
										<!-- 폼 시작 -->
										
										<!-- 카드 폼 시작 -->
										<div class="card">
											<div class="card-header">												
												<h5><c:out value="${ board.title }" /></h5>
												<span><code>조회수</code> <c:out value="${ board.viewCnt }" /></span>
												<span><code>등록일</code> <c:out value="${ board.regDate }" /></span>
												<span><code>작성자</code> <c:out value="${ board.writer }" /></span>
											</div>
											<div class="card-block">
												<h4 class="sub-title">카테고리 : <c:out value="환율" /></h4>											
												<c:if test="${ not empty board.fileSaveName }">
													<div class="form-group row">													
														<div class="col-sm-12">														
															<img style="width: 100%; border:solid 1px #cccccc;" src="${pageContext.request.contextPath}/display?fileName=${ board.writer }/${ board.fileSaveName }">																																																											
														</div>
													</div>															
												</c:if>
												<div class="form-group row">													
													<div class="col-sm-12">															
														<c:out value="${ board.content }" />
													</div>
												</div>																																													
											</div>
											<div class="card-footer">
												<div class="text-center">
													<hr>
													<c:if test="${ sessionScope.userVO.id == board.writer }">	
														<button class="btn btn-primary btn-round waves-effect waves-light" onclick="clickBtn('U')">수정</button>
														<button class="btn btn-danger btn-round waves-effect waves-light" onclick="clickBtn('D')">삭제</button>
													</c:if>
													<button class="btn btn-inverse btn-round waves-effect waves-light" onclick="clickBtn('L')">목록</button>
													<hr>
												</div>
												<br>
												<form method="post" name="replyForm">
													<input type="hidden" name="boardNo" value="${ board.no }" />
													<div id="replyTable">
													
													</div>
												</form>
											</div>
										</div>
										<!-- 카드 폼 끝 -->
										
										<!-- 폼 끝 -->
										
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 컨텐츠 끝 -->
					
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/jsp/include/bottom.jsp" />

<script>

	function getReplyList() {
		$.ajax({
			type : 'GET',
			url : '${ pageContext.request.contextPath }/reply/${board.no}',
			success : function(data) {
				$('#replyTable').html(data);
				console.log('GET 비동기 댓글jsp 성공')
			},
			'error' : function() {
				console.log('GET 비동기 댓글jsp 실패')
			}
		})
	}
	
	//댓글 작성하는 부분
	function addReply() {

		var queryString = $("form[name=replyForm]").serialize();

		$.ajax({
			type : 'POST',
			url : '${ pageContext.request.contextPath }/reply/write',
			data : queryString,
			async : false,
			success : function(result) {
				
				alert('댓글 성공 여부: ' + result);
				
				//댓글 불러오기
				getReplyList();
				
				//소켓이 연결됐을 때만 보낸다. (reply,댓글작성자,게시글작성자,글번호)
				if(socket) {
					let socketMsg = "reply," + "${ userVO.id }," + "${ board.writer }," + "${ board.no }";
					socket.send(socketMsg);
				}
				
			},
			error : function() {
				alert('댓글 추가 실패')
			}
		})
	}

	function clickBtnReply(type, no) {
		switch (type) {
		case 'R':
			//getReReply()
			break
		case 'C':
			let bool = confirm("진짜 등록하시겠습니까?");
			if(bool){
				addReply();				
			}
			break
		case 'U':
			alert('댓글수정입장')
			/* updateReply() */
			break
		case 'D':
			$(this).parents()
			if (confirm('[ ' + no + ' ]번 게시글을 삭제할까요?')) {
				alert('댓글삭제입장')
				/* updateReply() */
			}
			break
		}
	}

	function clickBtn(type) {
		switch (type) {
		case 'U':
			location.href = '${ pageContext.request.contextPath }/board/update/${ board.no }'
			break
		case 'D':
			if (confirm('[${board.no}]번 게시글을 삭제할까요?')){				
				alert('void 삭제 후 목록으로 이동함.');
			}
			break
		case 'L':
			location.href = "${ pageContext.request.contextPath }/board"
			break
		}
	}
</script>

<script>
	$(document).ready(function() {
		
		getReplyList();
		
	});
</script>

</body>
</html>