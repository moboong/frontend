<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>메인페이지</title>
    <jsp:include page="/WEB-INF/jsp/include/head.jsp"></jsp:include>
  </head>

  <body>
  <!-- Pre-loader start -->
  <jsp:include page="/WEB-INF/jsp/include/preloader.jsp"></jsp:include>
  <!-- Pre-loader end -->
  <div id="pcoded" class="pcoded">
      <div class="pcoded-overlay-box"></div>
      <div class="pcoded-container navbar-wrapper">
          <!-- nav-top start -->
          <jsp:include page="/WEB-INF/jsp/include/navtop.jsp"/>
		  <!-- nav-top end -->
          <div class="pcoded-main-container">
              <div class="pcoded-wrapper">
                  <!-- nav-side start -->
                  <jsp:include page="/WEB-INF/jsp/include/navside.jsp"/>
                  <!-- nav-side end -->
                  
                  <!-- 해당 페이지 시작 -->
                  <div class="pcoded-content">
                      <!-- Page-header start -->
                      <div class="page-header">
                          <div class="page-block">
                              <div class="row align-items-center">
                                  <div class="col-md-8">
                                      <div class="page-header-title">
                                          <h5 class="m-b-10">메인페이지</h5>
                                          <p class="m-b-0">Welcome to Stock Signal</p>
                                      </div>
                                  </div>
                                  <div class="col-md-4">
                                      <ul class="breadcrumb-title">
                                          <li class="breadcrumb-item">
                                              <a href="${pageContext.request.contextPath}"> <i class="fa fa-home"></i> </a>
                                          </li>
                                          <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">메인페이지</a>
                                          </li>
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
                                        <div class="row">
                                            
    										
    										<div class="col-xl-7 col-md-12">
												<div class="card">
													<div class="card-header">
														<h5>WELCOME!!</h5>
														<span class="text-muted">어서오세요! 친절한 거시경제지표 서비스 스톡시그널입니다!</span>
													</div>
													<div class="card-block"
														style="">
														<div
															class="row align-items-center">
															<div class="container">
																<img id="signalImg"
																	src="${pageContext.request.contextPath}/assets/images/main.png"
																	class="card-img rounded mx-auto d-block"
																	style="">
															</div>
														</div>
														
													</div>
												</div>
											</div>
    										
    										
                                           	<div class="col-xl-5 col-md-12">
												<div class="card">
													<div class="card-header">
														<h5>스톡 시그널</h5>
														<span class="text-muted">거시경제지표이 내 주식에 어떤 영향을 미치는 걸까?</span>
													</div>
													<div class="card-block"
														style="min-height: 400px;">
														<!-- Nav tabs -->
														<div class="col-xl-12 col-md-12">
															<ul class="nav nav-tabs md-tabs" role="tablist">
																<li class="nav-item"><a class="nav-link active"
																	data-toggle="tab" href="#home3" role="tab">환율시그널</a>
																	<div class="slide"></div></li>
																<li class="nav-item"><a class="nav-link"
																	data-toggle="tab" href="#profile3" role="tab">금리시그널</a>
																	<div class="slide"></div></li>
																<li class="nav-item"><a class="nav-link"
																	data-toggle="tab" href="#messages3" role="tab">유가시그널</a>
																	<div class="slide"></div></li>
																<li class="nav-item"><a class="nav-link"
																	data-toggle="tab" href="#settings3" role="tab">원자재시그널</a>
																	<div class="slide"></div></li>
																<li class="nav-item"><a class="nav-link"
																	data-toggle="tab" href="#settings3" role="tab">금속시그널</a>
																	<div class="slide"></div></li>
																	<li class="nav-item"><a class="nav-link"
																	data-toggle="tab" href="#settings3" role="tab">주가지수</a>
																	<div class="slide"></div></li>
															</ul>
														</div>
														<!-- Nav tabs -->
														<div style="max-height: 500px;"
															class="row align-items-center">
															<div class="container">
																<img id="signalImg"
																	src="${pageContext.request.contextPath}/assets/images/exchange/1.png"
																	class="card-img rounded mx-auto d-block"
																	style="max-height: 500px; max-width: 500px;">
															</div>
														</div>
													</div>
												</div>
											</div>
											
											<!-- task, page, download counter  start -->
											<div class="col-xl-2 col-md-4">
                                                <div class="card">
                                                    <div class="card-block">
                                                        <div class="row align-items-center">
                                                            <div class="col-8">
                                                                <h4 class="text-c-red">1,178.00원</h4>
                                                                <h6 class="text-muted m-b-0">환율(미국-달러)</h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                            	<i class="fa fa-usd f-28"></i>                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-red">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <p class="text-white m-b-0">전일대비 +4.00(+0.34%)</p>
                                                            </div>
                                                            <div class="col-3 text-right">
                                                                <i class="fa fa-hand-o-up text-white f-16"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-2 col-md-4">
                                                <div class="card">
                                                    <div class="card-block">
                                                        <div class="row align-items-center">
                                                            <div class="col-8">
                                                                <h4 class="text-c-purple">0.75%</h4>
                                                                <h6 class="text-muted m-b-0">금리(콜금리-1일)</h6>
                                                            </div>
                                                            <div class="col-4 text-right">                                                                
                                                                <i class="fa fa-percent f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-purple">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <p class="text-white m-b-0">전일대비 -0.02(-2.60%)</p>
                                                            </div>
                                                            <div class="col-3 text-right">
                                                                <i class="fa fa-hand-o-down text-white f-16"></i>
                                                            </div>
                                                        </div>
            
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-2 col-md-4">
                                                <div class="card">
                                                    <div class="card-block">
                                                        <div class="row align-items-center">
                                                            <div class="col-8">
                                                                <h4 class="text-c-red">75.02</h4>
                                                                <h6 class="text-muted m-b-0">유가(두바이유)</h6>
                                                            </div>
                                                            <div class="col-4 text-right">                                                            	
                                                            	<i class="fa fa-database f-28"></i>                                                               
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-red">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <p class="text-white m-b-0">전일대비 +0.65(+0.87%)</p>
                                                            </div>
                                                            <div class="col-3 text-right">
                                                               	<i class="fa fa-hand-o-up text-white f-16"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                             <div class="col-xl-2 col-md-4">
                                                <div class="card">
                                                    <div class="card-block">
                                                        <div class="row align-items-center">
                                                            <div class="col-8">
                                                                <h4 class="text-c-red">9,275.00</h4>
                                                                <h6 class="text-muted m-b-0">원자재(구리)</h6>
                                                            </div>
                                                            <div class="col-4 text-right">                                                            	
                                                            	<i class="fa fa-cog f-28"></i>                                                        
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-red">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <p class="text-white m-b-0">전일대비 +23.0(+0.25%)</p>
                                                            </div>
                                                            <div class="col-3 text-right">
                                                                <i class="fa fa-hand-o-up text-white f-16"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-2 col-md-4">
                                                <div class="card">
                                                    <div class="card-block">
                                                        <div class="row align-items-center">
                                                            <div class="col-8">
                                                                <h4 class="text-c-red">1,749.70</h4>
                                                                <h6 class="text-muted m-b-0">금속(국제 금)</h6>
                                                            </div>
                                                            <div class="col-4 text-right">                                                            	
                                                            	<i class="fa fa-codepen f-28"></i>                                                      
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-red">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <p class="text-white m-b-0">전일대비 +2.00(+0.11%)</p>
                                                            </div>
                                                            <div class="col-3 text-right">
                                                                <i class="fa fa-hand-o-up text-white f-16"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-xl-2 col-md-4">
                                                <div class="card">
                                                    <div class="card-block">
                                                        <div class="row align-items-center">
                                                            <div class="col-8">
                                                                <h4 class="text-c-purple">15,047.70</h4>
                                                                <h6 class="text-muted m-b-0">나스닥 종합</h6>
                                                            </div>
                                                            <div class="col-4 text-right">                                                                
                                                                <i class="fa fa-line-chart f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-purple">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <p class="text-white m-b-0">전일대비 -4.54(-0.03%)</p>
                                                            </div>
                                                            <div class="col-3 text-right">
                                                                <i class="fa fa-hand-o-down text-white f-16"></i>
                                                            </div>
                                                        </div>
            
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- task, page, download counter  end -->
                                        
                                        	<div class="col-xl-6 col-md-12">
												<div class="card">
													<div class="card-header">
														<h5>하나금융TV 리서피센터 모닝브리프</h5>
														<span class="text-muted">어서오세요! 친절한 거시경제지표 서비스 스톡시그널입니다!</span>
													</div>
													<div class="card-block"
														style="padding-left: 100px">
														<div
															class="row align-items-center">
															<div class="container">
																<iframe width="600" height="315" src="https://www.youtube.com/embed/WV3V0C_5zDw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>																
															</div>
														</div>
													</div>
												</div>
											</div>
                                        	<div class="col-xl-6 col-md-12">
												<div class="card">
													<div class="card-header">
														<h5>하나금융TV 리서피센터 모닝브리프</h5>
														<span class="text-muted">어서오세요! 친절한 거시경제지표 서비스 스톡시그널입니다!</span>
													</div>
													<div class="card-block"
														style="padding-left: 100px">
														<div
															class="row align-items-center">
															<div class="container">
																<iframe width="600" height="315" src="https://www.youtube.com/embed/Pfp4PmLt14w" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>															</div>
														</div>
													</div>
												</div>
											</div>
                                        	
                                        </div>
                                    </div>
                                    <!-- Page-body end -->
                                </div>
                                <div id="styleSelector"> </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
    
    <jsp:include page="/WEB-INF/jsp/include/bottom.jsp"/>
    <!-- index amChart의 js파일 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/pages/dashboard/custom-dashboard.js"></script>
	<script>
		$(document).ready(function() {
			$('#index').attr('class', 'active');
		
		})
	</script>
</body>

</html>
