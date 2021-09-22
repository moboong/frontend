<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>토론실 게시판 : 게시글 수정</title>
<jsp:include page="/WEB-INF/jsp/include/head.jsp"></jsp:include>
<style>
	.error{
		color : red;
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
											<h5 class="m-b-10">지표 토론실 : 게시글 수정</h5>
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
											<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/board/update">${board.no}번수정</a></li>
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

										
										<!-- 카드 폼 시작 -->
										<div class="card">
											<div class="card-header">
												<h5>게시글 수정하기</h5>
											</div>
											<form:form method="post" enctype="multipart/form-data" modelAttribute="boardVO">
											<div class="card-block">
												<h4 class="sub-title">수정 폼</h4>
													<div class="form-group row">
														<label class="col-sm-2 col-form-label">토론 주제</label>
														<div class="col-sm-10">
															<form:select path="type" class="form-control" required="required">								
																<option value="01" <c:if test="${ board.type == '01' }">selected="selected"</c:if>>환율</option>
																<option value="02" <c:if test="${ board.type == '02' }">selected="selected"</c:if>>금리</option>
																<option value="03" <c:if test="${ board.type == '03' }">selected="selected"</c:if>>유가</option>
																<option value="04" <c:if test="${ board.type == '04' }">selected="selected"</c:if>>원자재</option>
																<option value="05" <c:if test="${ board.type == '05' }">selected="selected"</c:if>>금속</option>
																<option value="06" <c:if test="${ board.type == '06' }">selected="selected"</c:if>>주가지수</option>
																<option value="00" <c:if test="${ board.type == '00' }">selected="selected"</c:if>>자유주제</option>																
															</form:select>
															<form:errors path="type" class="error" />
														</div>
													</div>							
													<div class="form-group row">
														<label class="col-sm-2 col-form-label">게시글 제목</label>
														<div class="col-sm-10">															
															<form:input path="title" class="form-control" type="text" placeholder="${ board.title }" />
															<form:errors path="title" class="error" />
														</div>
													</div>																										
													<div class="form-group row">
														<label class="col-sm-2 col-form-label">게시글 작성자</label>
														<div class="col-sm-10">										
															<form:input path="writer" class="form-control" type="text" value="${ userVO.id }" readonly="true" /> 
															<form:errors path="writer" class="error" />
														</div>
													</div>
													<div class="form-group row">
														<label class="col-sm-2 col-form-label">파일 업로드</label>
														<div class="col-sm-10">
															<input type="file" name="attachFile" id="input-image" class="form-control" />																																																																																																
															<br>
															<img style="width: 100%; border:solid 1px #cccccc;" id="preview-image" 
																src="<c:if test="${ board.fileSaveName ne null }">${pageContext.request.contextPath}/display?fileName=${ board.writer }/${ board.fileSaveName }</c:if>">																																														
															<br>						
														</div>
													</div>
													
													<div class="form-group row">
														<label class="col-sm-2 col-form-label">게시글 내용</label>
														<div class="col-sm-10">															
															<form:textarea rows="20" cols="5" path="content" class="form-control" placeholder="${board.content}" />
															<form:errors path="content" class="error" />
														</div>
													</div>																																	
												</div>
												<div class="card-footer">
													<div class="text-center">
														<hr>
														<a type="button" class="btn btn-inverse btn-round waves-effect waves-light" href="${ pageContext.request.contextPath }/board/${board.no}">뒤로가기</a>
														<form:button type="submit" class="btn btn-primary btn-round waves-effect waves-light">수정</form:button>
													</div>
												</div>
											</form:form>
										</div>
										<!-- 카드 폼 끝 -->

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

		$(document).ready(function() {
			// input file에 change 이벤트 부여
			const inputImage = document.getElementById("input-image")
			inputImage.addEventListener("change", e => {
			    readImage(e.target)
			})		
		});
		
		function readImage(input) {
		    // 인풋 태그에 파일이 있는 경우
		    if(input.files && input.files[0]) {
		        // 이미지 파일인지 검사 (생략)
		        // FileReader 인스턴스 생성
		        const reader = new FileReader()
		        // 이미지가 로드가 된 경우
		        reader.onload = e => {
		            const previewImage = document.getElementById("preview-image")
		            previewImage.src = e.target.result
		        }
		        // reader가 이미지 읽도록 하기
		        reader.readAsDataURL(input.files[0])
		    }
		}
		//이것도 리스토 및 자원 사용을 클라이언트에 부과한 사례 이런 식으로 클라이언트가 하면 효율적일
		//사안들은 클라이언트에 맡김으로써 부하를 분산했다.!!
		
	</script>

</body>
</html>