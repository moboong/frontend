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
																<br>
																<br>
																<br>																
																<iframe width="600" height="315" src="https://www.youtube.com/embed/6JmzHdqhsBc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>																
															</div>
														</div>
													</div>
													<div class="card-footer">
														<hr>
													</div>
												</div>
											</div>
                                        	<div class="col-xl-6 col-md-12">
												<div class="card">
											<div class="card-header">
												<h5>환율 지표 토론실</h5>
												<span>환율에 대한 다양한 의견들을 <code>공유</code>해봐요!</span>												
											</div>
											<div class="card-block table-border-style">
												<div class="table-responsive" style="max-height: 679px; overflow-y: auto;">
													<table class="table table-hover">
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
															
																<tr>
																	<td>662</td>
																	<td><a href="/Mission-Spring/board/662">
																			환율 질문 올립니다.
																		</a>&nbsp;
																		
																			<label class="badge badge-success">
																				4
																			</label>
																		
																	</td>
																	<td>son07</td>
																	<td>12</td>
																	<td>2021-09-24</td>
																</tr>
															
																<tr>
																	<td>661</td>
																	<td><a href="/Mission-Spring/board/661">
																			환율관련 질문 올립니다.
																		</a>&nbsp;
																		
																	</td>
																	<td>son07</td>
																	<td>1</td>
																	<td>2021-09-24</td>
																</tr>
															
																<tr>
																	<td>631</td>
																	<td><a href="/Mission-Spring/board/631">
																			질문이요
																		</a>&nbsp;
																		
																			<label class="badge badge-success">
																				3
																			</label>
																		
																	</td>
																	<td>messi10</td>
																	<td>11</td>
																	<td>2021-09-23</td>
																</tr>
															
																<tr>
																	<td>601</td>
																	<td><a href="/Mission-Spring/board/601">
																			미국달러 환율 관련해서 질문 올립니다.
																		</a>&nbsp;
																		
																			<label class="badge badge-success">
																				5
																			</label>
																		
																	</td>
																	<td>messi10</td>
																	<td>90</td>
																	<td>2021-09-22</td>
																</tr>
															
																<tr>
																	<td>584</td>
																	<td><a href="/Mission-Spring/board/584">
																			test4
																		</a>&nbsp;
																		
																			<label class="badge badge-success">
																				3
																			</label>
																		
																	</td>
																	<td>ronaldo07</td>
																	<td>21</td>
																	<td>2021-09-20</td>
																</tr>
															
																<tr>
																	<td>583</td>
																	<td><a href="/Mission-Spring/board/583">
																			test3
																		</a>&nbsp;
																		
																			<label class="badge badge-success">
																				3
																			</label>
																		
																	</td>
																	<td>ronaldo07</td>
																	<td>5</td>
																	<td>2021-09-20</td>
																</tr>
															
																<tr>
																	<td>582</td>
																	<td><a href="/Mission-Spring/board/582">
																			test2
																		</a>&nbsp;
																		
																	</td>
																	<td>mbappe07</td>
																	<td>0</td>
																	<td>2021-09-20</td>
																</tr>
															
																<tr>
																	<td>581</td>
																	<td><a href="/Mission-Spring/board/581">
																			test
																		</a>&nbsp;
																		
																	</td>
																	<td>mbappe07</td>
																	<td>0</td>
																	<td>2021-09-20</td>
																</tr>
															
																<tr>
																	<td>580</td>
																	<td><a href="/Mission-Spring/board/580">
																			업로드 테스트
																		</a>&nbsp;
																		
																	</td>
																	<td>son07</td>
																	<td>0</td>
																	<td>2021-09-20</td>
																</tr>
															
																<tr>
																	<td>579</td>
																	<td><a href="/Mission-Spring/board/579">
																			사진업로드테스트2
																		</a>&nbsp;
																		
																	</td>
																	<td>son07</td>
																	<td>0</td>
																	<td>2021-09-20</td>
																</tr>
															
																<tr>
																	<td>577</td>
																	<td><a href="/Mission-Spring/board/577">
																			손흥민 테스트
																		</a>&nbsp;
																		
																			<label class="badge badge-success">
																				4
																			</label>
																		
																	</td>
																	<td>son07</td>
																	<td>0</td>
																	<td>2021-09-20</td>
																</tr>
															
																<tr>
																	<td>575</td>
																	<td><a href="/Mission-Spring/board/575">
																			이미지 파일 업로드
																		</a>&nbsp;
																		
																	</td>
																	<td>messi10</td>
																	<td>11</td>
																	<td>2021-09-20</td>
																</tr>
															
																<tr>
																	<td>572</td>
																	<td><a href="/Mission-Spring/board/572">
																			파일업로드 테스트
																		</a>&nbsp;
																		
																	</td>
																	<td>messi10</td>
																	<td>2</td>
																	<td>2021-09-20</td>
																</tr>
															
																<tr>
																	<td>571</td>
																	<td><a href="/Mission-Spring/board/571">
																			환율이 내려가는게 먼저인가요?
																		</a>&nbsp;
																		
																			<label class="badge badge-success">
																				3
																			</label>
																		
																	</td>
																	<td>messi10</td>
																	<td>13</td>
																	<td>2021-09-20</td>
																</tr>
															
																<tr>
																	<td>541</td>
																	<td><a href="/Mission-Spring/board/541">
																			이거 되냐?
																		</a>&nbsp;
																		
																	</td>
																	<td>messi10</td>
																	<td>1</td>
																	<td>2021-09-18</td>
																</tr>
															
																<tr>
																	<td>511</td>
																	<td><a href="/Mission-Spring/board/511">
																			새글 등록이요
																		</a>&nbsp;
																		
																			<label class="badge badge-success">
																				2
																			</label>
																		
																	</td>
																	<td>messi10</td>
																	<td>0</td>
																	<td>2021-09-18</td>
																</tr>
															
																<tr>
																	<td>483</td>
																	<td><a href="/Mission-Spring/board/483">
																			asd
																		</a>&nbsp;
																		
																			<label class="badge badge-success">
																				14
																			</label>
																		
																	</td>
																	<td>asd</td>
																	<td>5</td>
																	<td>2021-08-25</td>
																</tr>
															
																<tr>
																	<td>451</td>
																	<td><a href="/Mission-Spring/board/451">
																			넥스트 레블
																		</a>&nbsp;
																		
																			<label class="badge badge-success">
																				25
																			</label>
																		
																	</td>
																	<td>messi10</td>
																	<td>13</td>
																	<td>2021-08-25</td>
																</tr>
															
																<tr>
																	<td>422</td>
																	<td><a href="/Mission-Spring/board/422">
																			asd 삽입2...
																		</a>&nbsp;
																		
																			<label class="badge badge-success">
																				3
																			</label>
																		
																	</td>
																	<td>ronaldo07</td>
																	<td>0</td>
																	<td>2021-08-18</td>
																</tr>						
																															
														</tbody>
													</table>								
												</div>
											</div>
											<div class="card-footer">
												<div class="text-center">	
													<hr>												
													
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
