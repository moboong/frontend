<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
											<h5 class="m-b-10">마이페이지</h5>
											<p class="m-b-0">Welcome to Stock Signal Mypage</p>
										</div>
									</div>
									<div class="col-md-4">
										<ul class="breadcrumb-title">
											<li class="breadcrumb-item"><a
												href="${pageContext.request.contextPath}"> <i
													class="fa fa-home"></i>
											</a></li>
											<li class="breadcrumb-item"><a
												href="${pageContext.request.contextPath}/mypage">마이페이지</a></li>
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
										<div class="row justify-content-md-center">
										<!-- 폼 시작 -->

										<!-- 카드 마이페이지 시작 -->
										<div class="col-xl-7 col-md-12">
											<div class="card">
												<div class="card-header">
													<h5>마이페이지</h5>
												</div>
												<div class="card-block">
													
													<div class="form-group row">
														<label class="col-sm-2 col-form-label">프로필 사진</label>
														<div class="col-sm-10">
															<img class="img-100 img-radius"
																src="${pageContext.request.contextPath}/display?fileName=profile/${ mypage.id }.png"
																alt="User-Profile-Image">														
														</div>
													</div>
													
													<div class="form-group row">
														<label class="col-sm-2 col-form-label">ID</label>
														<div class="col-sm-10">
															<input type="text" class="form-control"
																placeholder="<c:out value="${ mypage.id }" />" readonly>
														</div>
													</div>
													
													<div class="form-group row">
														<label class="col-sm-2 col-form-label">이름</label>
														<div class="col-sm-10">
															<input type="text" class="form-control"
																placeholder="<c:out value="${ mypage.name }" />" readonly>
														</div>
													</div>
	
													<div class="form-group row">
														<label class="col-sm-2 col-form-label">이메일</label>
														<div class="col-sm-10">
															<input type="email" class="form-control"
																placeholder="<c:out value="${ mypage.tel }" />" readonly>
														</div>
													</div>
													
													<div class="form-group row">
														<label class="col-sm-2 col-form-label">전화번호</label>
														<div class="col-sm-10">
															<input type="tel" class="form-control"
																placeholder="<c:out value="${ mypage.email }" />" readonly>
														</div>
													</div>
													
													<div class="form-group row">
														<label class="col-sm-2 col-form-label">동의여부</label>
														<div class="col-sm-10">
															<input type="text" class="form-control" placeholder="<c:out value="${ mypage.agree }" />" readonly>
														</div>
													</div>											
												</div>
												<div class="card-footer">
													<div class="text-right">
														<hr>
														<button type="button" onclick="showPwcheckModal();" class="btn waves-effect waves-light btn-primary"><i class="icofont icofont-user-alt-3"></i>수정하기</button>												
													</div>
												</div>
											</div>
										</div>
										<!-- 카드 폼 끝 -->

										<div class="col-xl-4 col-md-12">
											<div class="card">
												<div class="card-header">
													<h5>마이 알림설정</h5>
												</div>
												<div class="card-block">
													
													<div class="form-group row">
														<label class="col-sm-2 col-form-label">프로필 사진</label>
														<div class="col-sm-10">
															<img class="img-100 img-radius"
																src="${pageContext.request.contextPath}/display?fileName=profile/${ mypage.id }.png"
																alt="User-Profile-Image">														
														</div>
													</div>
													
													<div class="form-group row">
														<label class="col-sm-2 col-form-label">ID</label>
														<div class="col-sm-10">
															<input type="text" class="form-control"
																placeholder="<c:out value="${ mypage.id }" />" readonly>
														</div>
													</div>
													
													<div class="form-group row">
														<label class="col-sm-2 col-form-label">이름</label>
														<div class="col-sm-10">
															<input type="text" class="form-control"
																placeholder="<c:out value="${ mypage.name }" />" readonly>
														</div>
													</div>
	
													<div class="form-group row">
														<label class="col-sm-2 col-form-label">이메일</label>
														<div class="col-sm-10">
															<input type="email" class="form-control"
																placeholder="<c:out value="${ mypage.tel }" />" readonly>
														</div>
													</div>
													
													<div class="form-group row">
														<label class="col-sm-2 col-form-label">전화</label>
														<div class="col-sm-10">
															<input type="tel" class="form-control"
																placeholder="<c:out value="${ mypage.email }" />" readonly>
														</div>
													</div>
													
													<div class="form-group row">
														<label class="col-sm-2 col-form-label">동의</label>
														<div class="col-sm-10">
															<input type="text" class="form-control" placeholder="<c:out value="${ mypage.agree }" />" readonly>
														</div>
													</div>											
												</div>
												<div class="card-footer">
													<div class="text-right">
														<hr>
														<button type="button" onclick="showPwcheckModal();" class="btn waves-effect waves-light btn-primary"><i class="icofont icofont-user-alt-3"></i>수정하기</button>												
													</div>
												</div>
											</div>
										</div>


										<!-- 폼 끝 -->
										</div>
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
	
	<!-- 비밀번호 확인 모달 -->
	<jsp:include page="/WEB-INF/jsp/modal/pwcheck.jsp" />
	
	<jsp:include page="/WEB-INF/jsp/include/bottom.jsp" />
	
</body>
</html>