<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>회원가입 페이지</title>
    <!-- HTML5 Shim and Respond.js IE10 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 10]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
      <!-- Meta -->
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="description" content="Mega Able Bootstrap admin template made using Bootstrap 4 and it has huge amount of ready made feature, UI components, pages which completely fulfills any dashboard needs." />
      <meta name="keywords" content="bootstrap, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
      <meta name="author" content="codedthemes" />
      <!-- Favicon icon -->
      <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon.ico" type="image/x-icon">
      <!-- Google font-->     
      <link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet">
      <!-- Required Fremwork -->
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap/css/bootstrap.min.css">
      <!-- waves.css -->
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/pages/waves/css/waves.min.css" type="text/css" media="all">
      <!-- themify-icons line icon -->
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/icon/themify-icons/themify-icons.css">
      <!-- ico font -->
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/icon/icofont/css/icofont.css">
      <!-- Font Awesome -->
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/icon/font-awesome/css/font-awesome.min.css">
      <!-- Style.css -->
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css">
      
      <script>
		if('${ msg }')
			alert('${ msg }')
	  </script>
  </head>

  <body themebg-pattern="theme1">
  <!-- Pre-loader start -->
  <div class="theme-loader">
      <div class="loader-track">
          <div class="preloader-wrapper">
              <div class="spinner-layer spinner-blue">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
              <div class="spinner-layer spinner-red">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
            
              <div class="spinner-layer spinner-yellow">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
            
              <div class="spinner-layer spinner-green">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
          </div>
      </div>
  </div>
  <!-- Pre-loader end -->
  <section class="login-block">
        <!-- Container-fluid starts -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12">
                    <form method="post" enctype="multipart/form-data" class="md-float-material form-material">
                        <div class="text-center">
                            <img src="${pageContext.request.contextPath}/assets/images/logo6.png" alt="logo6.png">
                        </div>
                        <div class="auth-box card">
                            <div class="card-block">
                                <div class="row m-b-20">
                                    <div class="col-md-12">
                                        <h3 class="text-center txt-primary">Register</h3>
                                    </div>
                                </div>
                                <div class="form-group form-primary">
                                    <input type="text" name="id" class="form-control" required="required">
                                    <span class="form-bar"></span>
                                    <label class="float-label">ID를 입력하세요</label>
                                </div>
                                <div class="form-group form-primary">
                                    <input type="text" name="name" class="form-control" required="required">
                                    <span class="form-bar"></span>
                                    <label class="float-label">이름을 입력하세요</label>
                                </div>
                                <div class="form-group form-primary">
                                    <input type="text" name="email" class="form-control" required="required">
                                    <span class="form-bar"></span>
                                    <label class="float-label">Email을 입력하세요</label>
                                </div>
                                <div class="form-group form-primary">
                                    <input type="tel" name="tel" class="form-control" required="required">
                                    <span class="form-bar"></span>
                                    <label class="float-label">전화번호를 입력하세요</label>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group form-primary">
                                            <input type="password" name="password" class="form-control" required="required">
                                            <span class="form-bar"></span>
                                            <label class="float-label">비밀번호</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group form-primary">
                                            <input type="password" name="confirm-password" class="form-control" required="required">
                                            <span class="form-bar"></span>
                                            <label class="float-label">비밀번호 확인</label>
                                        </div>
                                    </div>
                                </div>

								<div class="form-group form-primary">
									<label class="col-sm-12 col-form-label">프로필 사진 (JPG, PNG)</label>
									<div class="col-sm-12">
										<input type="file" name="attachFile" id="input-image"
											class="form-control"> <br> <img
											style="width: 100%; border: solid 1px #cccccc;"
											id="preview-image"
											src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
										<br>
									</div>
								</div>

								<div class="row m-t-25 text-left">
                                    <div class="col-md-12">
                                        <div class="checkbox-fade fade-in-primary">
                                            <label>
                                                <input type="checkbox" value="Y" required="required">
                                                <span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span>
                                                <span class="text-inverse">동의여부 선택 : <a href="#">이용약관 &amp; Compliance Notice</a></span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="checkbox-fade fade-in-primary">
                                            <label>
                                                <input type="checkbox" name="agree" value="Y">
                                                <span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span>
                                                <span class="text-inverse">데일리 모닝시그널을 받으시겠습니까?</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row m-t-30">
                                    <div class="col-md-12">
                                        <button type="submit" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">회원등록</button>
                                    </div>
                                </div>
                                <hr/>
                                <div class="row">
                                    <div class="col-md-10">
                                        <p class="text-inverse text-left"><a href="${pageContext.request.contextPath}/login"><b>이미 가입된 회원이라면?</b></a></p>
                                        <p class="text-inverse text-left"><a href="${pageContext.request.contextPath}"><b>메인으로 돌아가기</b></a></p>
                                    </div>
                                    <div class="col-md-2">
                                        <img src="${pageContext.request.contextPath}/assets/images/auth/Logo-small-bottom.png" alt="small-logo.png">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- end of col-sm-12 -->
            </div>
            <!-- end of row -->
        </div>
        <!-- end of container-fluid -->
    </section>
    
<!-- Required Jquery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery.min.js"></script>     
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-ui/jquery-ui.min.js "></script>     
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/popper.js/popper.min.js"></script>     
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap/js/bootstrap.min.js "></script>
<!-- waves js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/pages/waves/js/waves.min.js"></script>
<!-- jquery slimscroll js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-slimscroll/jquery.slimscroll.js "></script>
<!-- modernizr js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/SmoothScroll.js"></script>     
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.mCustomScrollbar.concat.min.js "></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/common-pages.js"></script>

<jsp:include page="/WEB-INF/jsp/modal/msgalert.jsp" />
<script>
	    if ('${ msg }') {
			$('#msgModalBody').html('${ msg }');
			$('#msgModal').modal('show'); 
		}
</script>

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