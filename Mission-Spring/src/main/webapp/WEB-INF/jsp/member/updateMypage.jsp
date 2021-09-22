<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지(수정)</title>
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
											<li class="breadcrumb-item"><a
												href="${pageContext.request.contextPath}/updateMypage">수정하기</a></li>
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
										<div class="col-xl-8 col-md-12">
										<div class="card">
											<div class="card-header">
												<h5>마이페이지</h5>
											</div>
											<form class="validation-form" method="post" enctype="multipart/form-data" onsubmit="return validatePW()">
											<div class="card-block">
												
												<div class="form-group row">
													<label class="col-sm-2 col-form-label">프로필 사진</label>
													<div class="col-sm-10">
														<img class="img-100 img-radius" id="preview-image"
															src="${pageContext.request.contextPath}/display?fileName=profile/${ mypage.id }.png"
															alt="User-Profile-Image">														
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-2 col-form-label"></label>
													<div class="col-sm-10">
														<input type="file" name="attachFile" id="input-image" class="form-control">
													</div>
												</div>
												
												
												<div class="form-group row">
													<label class="col-sm-2 col-form-label">ID</label>
													<div class="col-sm-10">
														<input type="text" name="id" class="form-control" value="<c:out value="${ mypage.id }" />"
															   readonly="readonly">
													</div>
												</div>
												
												<div class="form-group row">
													<label class="col-sm-2 col-form-label">비밀번호 변경</label>
													<div class="col-sm-10">
														<input type="password" name="password" class="form-control" id="pw" onkeyup="passwordCheckFunction();">															
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-2 col-form-label">비밀번호 확인</label>
													<div class="col-sm-10">
														<input type="password" name="password2" class="form-control" id="pwcheck" onkeyup="passwordCheckFunction();">															
														<span id="pwCheckMsg" style="color: red"></span>
													</div>
												</div>
												
												
												<div class="form-group row">
													<label class="col-sm-2 col-form-label">이름</label>
													<div class="col-sm-10">
														<input type="text" name="name" class="form-control"
															placeholder="<c:out value="${ mypage.name }" />">
													</div>
												</div>

												<div class="form-group row">
													<label class="col-sm-2 col-form-label">이메일</label>
													<div class="col-sm-10">
														<input type="email" name="email" class="form-control"
															placeholder="<c:out value="${ mypage.email }" />">
													</div>
												</div>
												
												<div class="form-group row">
													<label class="col-sm-2 col-form-label">전화번호</label>
													<div class="col-sm-10">
														<input type="tel" name="tel" class="form-control"
															placeholder="<c:out value="${ mypage.tel }" />">
													</div>
												</div>
												
												<div class="form-group row">
													<label class="col-sm-2 col-form-label">동의여부 : ${ mypage.agree}</label>
													
													<div class="col-sm-10">					
														동의 <input type="radio" name="agree" value="Y">
														&nbsp;거부 <input type="radio" name="agree" value="N">	
													</div>
													
												</div>											
											</div>
											<div class="card-footer">
												<div class="text-right">
													<hr>
													<a href="${pageContext.request.contextPath}/mypage" class="btn waves-effect waves-light btn-inverse">
														<i class="ti-arrow-left"></i>돌아가기
													</a>
													<button type="submit" class="btn waves-effect waves-light btn-primary">
														<i class="ti-save"></i>저장하기
													</button>											
												</div>
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
	
	<script>
		function passwordCheckFunction() {
			
			let pw = $('#pw').val()
			let pwcheck = $('#pwcheck').val()
			
			if(pw != pwcheck){
				$('#pwCheckMsg').html('비밀번호가 일치하지 않습니다.')
			} else {
				$('#pwCheckMsg').html('')
			}
		}
		function validatePW(){
			let bool = false;
			if($('#pwCheckMsg').html() == ''){
				bool = true;
			}
			return bool; 
		}
		
		
		//유효성 검사
	    window.addEventListener('load', () => {
	      const forms = document.getElementsByClassName('validation-form');

	      Array.prototype.filter.call(forms, (form) => {
	        form.addEventListener('submit', function (event) {
	          if (form.checkValidity() === false) {
	            event.preventDefault();
	            event.stopPropagation();
	          }

	          form.classList.add('was-validated');
	        }, false);
	      });
	    }, false);
		//이것도 리스토 및 자원 사용을 클라이언트에 부과한 사례 이런 식으로 클라이언트가 하면 효율적일
		//사안들은 클라이언트에 맡김으로써 부하를 분산했다.!!
		
	</script>

</body>
</html>