<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>토론실 게시판</title>
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
											<h5 class="m-b-10">지표 토론실</h5>
											<p class="m-b-0">Welcome to Stock Signal Forum</p>
										</div>
									</div>
									<div class="col-md-4">
										<ul class="breadcrumb-title">
											<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}"> <i
													class="fa fa-home"></i>
											</a></li>
											<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/board">지표토론실</a></li>
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


										<!-- 카드 테이블 시작 -->
										<div class="card">
											<div class="card-header">
												<h5>환율 지표 토론실</h5>
												<span>환율에 대한 다양한 의견들을 <code>공유</code>해봐요!</span>
												<div class="card-header-right">
													<i class="fa fa-window-maximize full-card"></i>
													<i class="fa fa-minus minimize-card"></i> 
													<i class="fa fa-refresh reload-card"></i>
												</div>
											</div>
											<div class="card-block table-border-style">
												<div class="table-responsive">
													<table class="table table-hover"> <!-- id="list" 이거 영향있냐? -->
														<thead>
															<tr>
																<th>번호</th>
																<th>제목</th>
																<th>작성자</th>
																<th>조회수</th>						
																<th>등록일</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${ requestScope.list }" var="board"
																varStatus="loop">
																<tr>
																	<td>${ board.no }</td>
																	<td><a
																		href="${ pageContext.request.contextPath }/board/${ board.no }">
																			<c:out value="${ board.title }" />
																		</a>&nbsp;
																		<c:if test="${ board.replyCnt != 0 }">
																			<label class="badge badge-success">
																				<c:out value="${ board.replyCnt }" />
																			</label>
																		</c:if>
																	</td>
																	<td>${ board.writer }</td>
																	<td>${ board.viewCnt }</td>
																	<td>${ board.regDate }</td>
																</tr>
															</c:forEach>
														</tbody>
													</table>								
												</div>
											</div>
											<div class="card-footer">
												<div class="text-center">	
													<hr>												
													<c:if test="${ not empty userVO }">
														<a type="button" class="btn btn-primary btn-round waves-effect waves-light" href="${ pageContext.request.contextPath }/board/write">새글등록</a>
													</c:if>
												</div>
											</div>
										</div>
										<!-- 카드 테이블 끝 -->
										
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

</body>
</html>