<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<jsp:include page="/WEB-INF/jsp/include/head.jsp"></jsp:include>
<style type="text/css">
.pcoded .pcoded-header[header-theme="theme1"] {
	background: #448aff;
}

.pcoded[fream-type="theme1"] .page-header:before, .pcoded[fream-type="theme1"] .main-menu .main-menu-header:before
	{
	background: rgba(68, 138, 255, 0.5);
}

.btn-primary, .sweet-alert button.confirm, .wizard>.actions a {
	background-color: #448aff;
	border-color: #448aff;
	color: #fff;
	cursor: pointer;
	-webkit-transition: all ease-in 0.3s;
	transition: all ease-in 0.3s;
}
.card .card-header h5:after {
    content: "";
    background-color: #448aff;
    position: absolute;
    left: -20px;
    top: 0;
    width: 4px;
    height: 20px;
}
.checkbox-fade.fade-in-primary .cr, .checkbox-fade.zoom-primary .cr, .checkbox-zoom.fade-in-primary .cr, .checkbox-zoom.zoom-primary .cr {
    border: 2px solid #448aff;
}
</style>
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
											<h5 class="m-b-10">관리자페이지 : 환율시그널 설정</h5>
											<p class="m-b-0">Welcome to Stock Signal Admin</p>
										</div>
									</div>
									<div class="col-md-4">
										<ul class="breadcrumb-title">
											<li class="breadcrumb-item"><a
												href="${pageContext.request.contextPath}"> <i
													class="fa fa-home"></i>
											</a></li>
											<li class="breadcrumb-item"><a
												href="${pageContext.request.contextPath}/admin">관리자페이지</a></li>
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
										<div id="conditionPart" class="row justify-content-md-center">

											<!-- 삽입 부분 -->

											<!-- 삽입 부분 -->

										</div>
										<div class="row justify-content-md-center">
											<div class="col-xl-4 col-md-12">
												<div class="card">
													<div class="card-header">
														<h5>인메모리 현황</h5>
														<button style="float: right" type="button"
															onclick="selectAll();"
															class="btn waves-effect waves-light btn-primary">
															<i class="icofont icofont-user-alt-3"></i>전체조회(selectAll)
														</button>

													</div>
													<div class="card-block">

														<h5>미국-달러 환율</h5>
														<div class="table-responsive" id="selectAll"
															style="max-height: 650px; overflow-y: auto;"></div>

													</div>
													<div class="card-footer">
														<div class="text-right">
															<hr>
															<button type="button" onclick="insertAll();"
																onclick="selectAllForeign();"
																class="btn waves-effect waves-light btn-primary">
																<i class="icofont icofont-user-alt-3"></i>전체삽입(insertAll)
															</button>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-4 col-md-12">
												<div class="card">
													<div class="card-header">
														<h5>인메모리 현황</h5>
														<button style="float: right" type="button"
															onclick="selectAllForeign();"
															class="btn waves-effect waves-light btn-primary">
															<i class="icofont icofont-user-alt-3"></i>전체조회(selectAll)
														</button>
													</div>
													<div class="card-block">
														<h5>외국인 매도세</h5>
														<div class="table-responsive" id="selectAllForeign"
															style="max-height: 650px; overflow-y: auto;"></div>

													</div>
													<div class="card-footer">
														<div class="text-right">
															<hr>
															<button type="button" onclick="insertAllForeign();"
																class="btn waves-effect waves-light btn-primary">
																<i class="icofont icofont-user-alt-3"></i>전체삽입(insertAll)
															</button>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-4 col-md-12">
												<div class="card">
													<div class="card-header">
														<h5>인메모리 현황</h5>
														<button style="float: right" type="button"
															onclick="selectAllKospi();"
															class="btn waves-effect waves-light btn-primary">
															<i class="icofont icofont-user-alt-3"></i>전체조회(selectAll)
														</button>

													</div>
													<div class="card-block">

														<h5>코스피</h5>
														<div class="table-responsive" id="selectAllKospi"
															style="max-height: 650px; overflow-y: auto;"></div>

													</div>
													<div class="card-footer">
														<div class="text-right">
															<hr>
															<button type="button" onclick="insertAllKospi();"
																class="btn waves-effect waves-light btn-primary">
																<i class="icofont icofont-user-alt-3"></i>전체삽입(insertAll)
															</button>
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

	<!-- 조건 변경 모달 -->
	<jsp:include page="/WEB-INF/jsp/modal/editcondition.jsp" />

	<jsp:include page="/WEB-INF/jsp/include/bottom.jsp" />

	<script>
		function insertAndCheck(cType, cTop, cVar) {

			$.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath}/inmemory/' + cType
						+ '/' + cTop + '/' + cVar,
				success : function(data) {
					console.log(data)
					let temp = JSON.parse(data)
					console.log(temp)
					console.log('func: GET 인메모리 삽입-체크 성공')
				},
				error : function() {
					console.log('func: GET 인메모리 삽입-체크 실패')
				}
			});

		}
		function insertAll() {

			$.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath}/inmemory/insertAll',
				success : function(data) {
					console.log(data)
					console.log('func: GET 인메모리 환율 삽입 성공')
					$('#insertAll').text(data)
				},
				error : function() {
					console.log('func: GET 인메모리 환율 삽입 실패')
				}
			});

		}
		function insertAllKospi() {

			$
					.ajax({
						type : 'GET',
						url : '${pageContext.request.contextPath}/inmemory/insertAllKospi',
						success : function(data) {
							console.log(data)
							console.log('func: GET 인메모리 코스피 삽입 성공')
						},
						error : function() {
							console.log('func: GET 인메모리 코스피 삽입 실패')
						}
					});

		}
		function insertAllForeign() {

			$
					.ajax({
						type : 'GET',
						url : '${pageContext.request.contextPath}/inmemory/insertAllForeign',
						success : function(data) {
							console.log(data)
							console.log('func: GET 인메모리 외매 삽입 성공')
						},
						error : function() {
							console.log('func: GET 인메모리 외매 삽입 실패')
						}
					});

		}
		function selectAll() {

			$.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath}/inmemory/selectAll',
				success : function(data) {
					console.log('func: GET 인메모리 환율 조회 성공')
					$('#selectAll').html(data)
				},
				error : function() {
					console.log('func: GET 인메모리 환율 조회 실패')
				}
			});

		}
		function selectAllKospi() {

			$
					.ajax({
						type : 'GET',
						url : '${pageContext.request.contextPath}/inmemory/selectAllKospi',
						success : function(data) {
							console.log('func: GET 인메모리 코스피 조회 성공')
							$('#selectAllKospi').html(data)
						},
						error : function() {
							console.log('func: GET 인메모리 코스피 조회 실패')
						}
					});

		}
		function selectAllForeign() {

			$
					.ajax({
						type : 'GET',
						url : '${pageContext.request.contextPath}/inmemory/selectAllForeign',
						success : function(data) {
							console.log('func: GET 인메모리 외국인매도세 조회 성공')
							$('#selectAllForeign').html(data)
						},
						error : function() {
							console.log('func: GET 인메모리 외국인매도세 조회 실패')
						}
					});

		}

		function editCondition() {
			let condition = {
				"no" : $('input[name=no]').val(),
				"type" : "01",
				"top" : $('input[name=top]').val(),
				"var" : $('input[name=var]').val()
			};
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/admin/edit/'
						+ $('input[name=no]').val(),
				data : JSON.stringify(condition),
				contentType : "application/json",
				success : function(data) {
					$('#conditionPart').html(data);
					console.log('func: POST 조건수정 성공');
					//모달 닫기
					$('#editModal').modal("hide");
				},
				error : function() {
					console.log('func: POST 조건수정 실패');
				}
			});

		}

		function showCondition(type) {

			$.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath}/admin/show/' + type,
				success : function(data) {
					$('#conditionPart').append(data);
					console.log('ready: GET 조건출력 성공')
					//모달 닫기
					$('#editModal').modal("hide");
				},
				error : function() {
					console.log('ready: GET 조건출력 실패')
				}
			});

		}

		function editModalShow(no) {
			$('#editModal').modal("show");
			$('input[name=no]').val(no)
		}
	</script>

	<script>
		$(document).ready(function() {
			showCondition("01");
			selectAll();
			selectAllKospi();
			selectAllForeign();
		});
	</script>
</body>
</html>