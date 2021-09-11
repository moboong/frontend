<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>환율 시그널</title>
<jsp:include page="../include/head2.jsp"></jsp:include>

<script>
	if ('${ msg }') {
		alert('${ msg }')
	}

	let page = 1;

	function back() {
		if (page != 1) {
			page = page - 1
		}
		$('#signalImg').attr(
				'src',
				'${pageContext.request.contextPath}/assets/images/exchange/'
						+ page + '.png')
	}
	function forward() {
		if (page != 14) {
			page = page + 1
		}
		$('#signalImg').attr(
				'src',
				'${pageContext.request.contextPath}/assets/images/exchange/'
						+ page + '.png')
	}

	// 외국인 그래프
	function changeChart(type) {

		$('#tab > li > a').attr('class', 'nav-link')
		$('#' + type + 'Tab > a').attr('class', 'nav-link active');

		jindo.$Element("dayGraph").hide();
		jindo.$Element("weekGraph").hide();
		jindo.$Element("oneMonthGraph").hide();
		jindo.$Element("threeMonthGraph").hide();

		jindo.$Element(type + "Graph").show();

	}
	// 기준시 1990-08-26 21:48:00
</script>
</head>

<body>
	<!-- Pre-loader start -->
	<jsp:include page="../include/preloader.jsp" />
	<!-- Pre-loader end -->
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">
			<!-- nav-top start -->
			<jsp:include page="../include/navtop.jsp" />
			<!-- nav-top end -->
			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">
					<!-- nav-side start -->
					<jsp:include page="../include/navside.jsp" />
					<!-- nav-side end -->

					<!-- 해당 페이지 시작 -->
					<div class="pcoded-content">
						<!-- Page-header start -->
						<div class="page-header">
							<div class="page-block">
								<div class="row align-items-center">
									<div class="col-md-8">
										<div class="page-header-title">
											<h5 class="m-b-10">환율 시그널</h5>
											<p class="m-b-0">Exchange Signal</p>
										</div>
									</div>
									<div class="col-md-4">
										<ul class="breadcrumb-title">
											<li class="breadcrumb-item"><a href="index.html"> <i
													class="fa fa-home"></i>
											</a></li>
											<li class="breadcrumb-item"><a href="#!">환율시그널</a></li>
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
										<!-- Inverse-color Breadcrumb card start -->
										<div class="card borderless-card">
											<div class="card-block inverse-breadcrumb">
												<div class="breadcrumb-header">
													<h5>STEP 1 : 환율과 주가에 어떤 관계가 있는지 알아보기</h5>
													<span>Stock Signal With Exchange</span>
												</div>
											</div>
										</div>
										<!-- Inverse-color Breadcrumb card end -->
										<div class="row">
											<!-- task, page, download counter  start -->

											<!-- task, page, download counter  end -->

											<!--  sale analytics start -->
											<div class="col-xl-5 col-md-12">
												<div class="card">
													<div class="card-header">
														<h5>환율 시그널</h5>
														<span class="text-muted">환율이 내 주식에 어떤 영향을 미치는 걸까?</span>
														<div class="card-header-right">
															<i class="fa fa-window-maximize full-card"></i> <i
																class="fa fa-minus minimize-card"></i> <i
																class="fa fa-refresh reload-card"></i>
														</div>
													</div>
													<div class="card-block"
														style="min-height: 400px; background-color: #D3F1EC">
														<div style="max-height: 500px;"
															class="row align-items-center">
															<div class="container">
																<img id="signalImg"
																	src="${pageContext.request.contextPath}/assets/images/exchange/1.png"
																	class="card-img rounded mx-auto d-block"
																	style="max-height: 500px; max-width: 500px;">
															</div>
														</div>
														<div style="position: absolute; top: 55%; left: 3%">
															<button
																class="btn waves-effect waves-dark btn-inverse btn-outline-inverse btn-icon"
																onclick="back();">
																<i class="ti-angle-double-left"></i>
															</button>
														</div>
														<div style="position: absolute; top: 55%; right: 3%">
															<button
																class="btn waves-effect waves-dark btn-inverse btn-outline-inverse btn-icon"
																onclick="forward();">
																<i class="ti-angle-double-right"></i>
															</button>
														</div>
													</div>
												</div>
											</div>

											<!-- LINE CHART start -->
											<div class="col-xl-7 col-md-12">
												<div class="card">
													<div class="card-header">
														<h5>달러환율 - 코스피 상관관계</h5>
														<span class="text-muted">실제 환율과 주가는 어떤 관계가 있는가?</span>
														<div class="card-header-right">
															<i class="fa fa-window-maximize full-card"></i> <i
																class="fa fa-minus minimize-card"></i> <i
																class="fa fa-refresh reload-card"></i>
														</div>
													</div>
													<div class="card-block">
														<div id="exko-chart" style="height: 400px;"></div>
														<!-- <div id="line-example"></div> -->
													</div>
												</div>
											</div>
											<!-- LINE CHART Ends -->
										</div>


										<!-- Inverse-color Breadcrumb card start -->
										<div class="card borderless-card">
											<div class="card-block inverse-breadcrumb">
												<div class="breadcrumb-header">
													<h5>STEP 2 : 환율 실시간 동향 파악</h5>
													<span>Stock Signal With Exchange</span>
												</div>
											</div>
										</div>
										<!-- Inverse-color Breadcrumb card end -->
										<div class="row">
											<div class="col-xl-7 col-md-12">
												<div class="card">
													<div class="card-header">
														<h5>미국 USD 환율</h5>
														<span class="text-muted">2021.09.01 14:57 하나은행 |
															고시회차 323회</span>


														<div class="card-header-right">
															<i class="fa fa-window-maximize full-card"></i> <i
																class="fa fa-minus minimize-card"></i> <i
																class="fa fa-refresh reload-card"></i>
														</div>
													</div>
													<div class="card-block">
														<!-- Nav tabs -->
														<div class="col-xl-12 col-md-12">
															<ul class="nav nav-tabs md-tabs" role="tablist">
																<li class="nav-item"><a class="nav-link active"
																	data-toggle="tab" href="#home3" role="tab">미국달러</a>
																	<div class="slide"></div></li>
																<li class="nav-item"><a class="nav-link"
																	data-toggle="tab" href="#profile3" role="tab">중국위안</a>
																	<div class="slide"></div></li>
																<li class="nav-item"><a class="nav-link"
																	data-toggle="tab" href="#messages3" role="tab">일본엔</a>
																	<div class="slide"></div></li>
																<li class="nav-item"><a class="nav-link"
																	data-toggle="tab" href="#settings3" role="tab">유럽유로</a>
																	<div class="slide"></div></li>
																<li class="nav-item"><a class="nav-link"
																	data-toggle="tab" href="#settings3" role="tab">영국파운드</a>
																	<div class="slide"></div></li>
																<li class="nav-item"><a class="nav-link"
																	data-toggle="tab" href="#settings3" role="tab">+</a>
																	<div class="slide"></div></li>
															</ul>
														</div>
														<!-- Nav tabs -->
														<!-- <div id="line-example"></div> -->
														<div id="exchange-chart" style="height: 400px;"></div>
													</div>
												</div>
											</div>
											<!--  sale analytics end -->

											<!--  project and team member start -->
											<div class="col-xl-5 col-md-12">
												<div class="card table-card">
													<div class="card-header">
														<h5>환율시그널 관련 뉴스</h5>
														<span class="text-muted">최근 업데이트 시간 : ${ latestTime }</span>
														<div class="card-header-right">
															<i class="fa fa-window-maximize full-card"></i> <i
																class="fa fa-minus minimize-card"></i> <i
																class="fa fa-refresh reload-card"></i>
														</div>
													</div>
													<div class="card-block" style="max-height: 500px; overflow-y: auto;">
														<!-- Nav tabs -->
														<div class="col-xl-12 col-md-12">
															<ul class="nav nav-tabs md-tabs" role="tablist">
																<li class="nav-item"><a class="nav-link active"
																	data-toggle="tab" href="#home3" role="tab">환율</a>
																	<div class="slide"></div></li>
																<li class="nav-item"><a class="nav-link"
																	data-toggle="tab" href="#profile3" role="tab">수출입동향</a>
																	<div class="slide"></div></li>
																<li class="nav-item"><a class="nav-link"
																	data-toggle="tab" href="#messages3" role="tab">외국인매매</a>
																	<div class="slide"></div></li>
																<li class="nav-item"><a class="nav-link"
																	data-toggle="tab" href="#settings3" role="tab"><i
																		class="fa fa-plus-square" aria-hidden="true"></i></a>
																	<div class="slide"></div></li>
															</ul>
														</div>
														<!-- Nav tabs -->
														<div class="table-responsive">
															<table class="table table-hover">
																<thead>
																	<tr>
																		<th>사진</th>
																		<th>환율 기사</th>																		
																	</tr>
																</thead>
																<tbody id="news-table-body">
																	
																	
																</tbody>
															</table>
															<div class="text-center">
                                                            	<a href="#!" class="b-b-primary text-primary">View all Projects</a>
                                                        	</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!--  project and team member end -->

									</div>
									<!-- Inverse-color Breadcrumb card start 커스터마이징 시작 -->
									<div class="card borderless-card">
										<div class="card-block inverse-breadcrumb">
											<div class="breadcrumb-header">
												<h5>STEP 3 : 환율과 함께 봐야할 시그널 지표들</h5>
												<span>Stock Signal With Exchange</span>
											</div>
											<div class="col align-self-end" align="right">
												<button
													class="btn btn-primary btn-round waves-effect waves-light"
													type="button" id="btnAdd" data-toggle="modal"
													data-target=".bd-example-modal-lg" style="display: none;">지표
													추가하기</button>
												<button
													class="btn btn-primary btn-round waves-effect waves-light"
													id="btnCust" onclick="updateMenu();">수정하기</button>
											</div>
										</div>
									</div>
									<!-- Inverse-color Breadcrumb card end -->
									<div id="custompage" class="row"></div>

									<!-- Inverse-color Breadcrumb card start -->
									<div class="card borderless-card">
										<div class="card-block inverse-breadcrumb">
											<div class="breadcrumb-header">
												<h5>STEP 4 : 전문가의 이론(룰)과 현실 비교하기</h5>
												<span>Stock Signal With Exchange</span>
											</div>
										</div>
									</div>
									<!-- Inverse-color Breadcrumb card end -->

									<!-- Simple Breadcrumb card start -->
									<div class="card">
										<div class="card-block">
											<h5>Expert`s Theory : 전문가의 환율과 주가에 대한 이론 (트리플 약세)</h5>
										</div>
									</div>
									<!-- Simple Breadcrumb card start -->

									<div class="row">

										<!-- task, page, download counter  start -->
										<div class="col-xl-3 col-md-6">
											<div class="card">
												<div class="card-block">
													<div class="row align-items-center">
														<div class="col-12">
															<h6 class="text-c-red">환율 상승 = 원화가치 하락</h6>
														</div>

													</div>
												</div>
												<div class="card-footer bg-c-red">
													<div class="row align-items-center">
														<div class="col-9">
															<p class="text-white m-b-0">환율 상승</p>
														</div>
														<div class="col-3 text-right">
															<i class="fa fa-level-up text-white f-20"></i>
														</div>
													</div>
												</div>

											</div>
										</div>

										<div class="col-xl-3 col-md-6">
											<div class="card">
												<div class="card-block">
													<div class="row align-items-center">
														<div class="col-12">
															<h6 class="text-c-purple">환율 상승의 원인이 외국인투자 감소?</h6>
														</div>

													</div>
												</div>
												<div class="card-footer bg-c-purple">
													<div class="row align-items-center">
														<div class="col-9">
															<p class="text-white m-b-0">외국인 매수세 감소</p>
														</div>
														<div class="col-3 text-right">
															<i class="fa fa-level-down text-white f-20"></i>
														</div>
													</div>

												</div>
											</div>
										</div>

										<div class="col-xl-3 col-md-6">
											<div class="card">
												<div class="card-block">
													<div class="row align-items-center">
														<div class="col-12">
															<h6 class="text-c-purple">환율 상승 = 원화가치 하락</h6>
														</div>

													</div>
												</div>
												<div class="card-footer bg-c-purple">
													<div class="row align-items-center">
														<div class="col-9">
															<p class="text-white m-b-0">원화가치 하락</p>
														</div>
														<div class="col-3 text-right">
															<i class="fa fa-level-down text-white f-20"></i>
														</div>
													</div>

												</div>
											</div>
										</div>

										<div class="col-xl-3 col-md-6">
											<div class="card">
												<div class="card-block">
													<div class="row align-items-center">
														<div class="col-12">
															<h6 class="text-c-purple">트리플 약세는 주가하락 신호</h6>
														</div>

													</div>
												</div>
												<div class="card-footer bg-c-purple">
													<div class="row align-items-center">
														<div class="col-9">
															<p class="text-white m-b-0">코스피 하락</p>
														</div>
														<div class="col-3 text-right">
															<i class="fa fa-level-down text-white f-20"></i>
														</div>
													</div>

												</div>
											</div>
										</div>
										<!-- task, page, download counter  end -->
									</div>


									<!-- Simple Breadcrumb card start -->
									<div class="card">
										<div class="card-block">
											<h5>Reality : 현실에서는?</h5>
										</div>
									</div>
									<!-- Simple Breadcrumb card start -->
									<div class="row">

										<!-- task, page, download counter  start -->
										<div class="col-xl-3 col-md-6">
											<div class="card">
												<div class="card-block">
													<div class="row align-items-center">
														<div class="col-8">
															<h4 class="text-c-red">+0.16%</h4>
															<h6 class="text-muted m-b-0">전일 대비 USD 환율</h6>
														</div>
														<div class="col-4 text-right">
															<i class="fa fa-money f-28"></i>
														</div>
													</div>
												</div>
												<div class="card-footer bg-c-red">
													<div class="row align-items-center">
														<div class="col-9">
															<p class="text-white m-b-0">환율 상승</p>
														</div>
														<div class="col-3 text-right">
															<i class="fa fa-level-up text-white f-20"></i>
														</div>
													</div>
												</div>
											</div>
										</div>

										<div class="col-xl-3 col-md-6">
											<div class="card">
												<div class="card-block">
													<div class="row align-items-center">
														<div class="col-8">
															<h4 class="text-c-purple">-2,229억</h4>
															<h6 class="text-muted m-b-0">전일 외국인매도세</h6>
														</div>
														<div class="col-4 text-right">
															<i class="fa fa-line-chart f-28"></i>
														</div>
													</div>
												</div>
												<div class="card-footer bg-c-purple">
													<div class="row align-items-center">
														<div class="col-9">
															<p class="text-white m-b-0">외국인 매수세 감소</p>
														</div>
														<div class="col-3 text-right">
															<i class="fa fa-level-down text-white f-20"></i>
														</div>
													</div>

												</div>
											</div>
										</div>
										<div class="col-xl-3 col-md-6">
											<div class="card">
												<div class="card-block">
													<div class="row align-items-center">
														<div class="col-8">
															<h4 class="text-c-green">-</h4>
															<h6 class="text-muted m-b-0">전년 동기 대비 수출입동향</h6>
														</div>
														<div class="col-4 text-right">
															<i class="fa fa-file-text-o f-28"></i>
														</div>
													</div>
												</div>
												<div class="card-footer bg-c-green">
													<div class="row align-items-center">
														<div class="col-9">
															<p class="text-white m-b-0">수출입지수 변화없음</p>
														</div>
														<div class="col-3 text-right">
															<i class="fa fa-window-minimize text-white f-16"></i>
														</div>
													</div>
												</div>
											</div>
										</div>

										<div class="col-xl-3 col-md-6">
											<div class="card">
												<div class="card-block">
													<div class="row align-items-center">
														<div class="col-8">
															<h4 class="text-c-purple">-0.77%</h4>
															<h6 class="text-muted m-b-0">전일 대비 KOSPI 지수</h6>
														</div>
														<div class="col-4 text-right">
															<i class="fa fa-line-chart f-28"></i>
														</div>
													</div>
												</div>
												<div class="card-footer bg-c-purple">
													<div class="row align-items-center">
														<div class="col-9">
															<p class="text-white m-b-0">코스피 하락</p>
														</div>
														<div class="col-3 text-right">
															<i class="fa fa-level-down text-white f-20"></i>
														</div>
													</div>

												</div>
											</div>
										</div>
										<!-- task, page, download counter  end -->
									</div>

								</div>
								<!-- Page-body end -->
							</div>
							<div id="styleSelector"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	

	<!-- 지표 추가 Modal -->
	<%-- <jsp:include page="../modal/addgraph.jsp" /> --%>
	<!-- 지표 추가 Modal -->

	<jsp:include page="../include/bottom2.jsp" />
	<script>
		$(document).ready(function() {
							//지표 선택율 받아오기
							$.ajax({
										type : 'GET',
										async : true,
										url : '${pageContext.request.contextPath}/custom/pickrate',
										success : function(data) {
											$("body").append(data);
											console.log('GET 모달 로드 성공')
										},
										error : function() {
											console.log('GET 비동기 모달값 넣기 실패')
										}
									})

							$('#exchange').attr('class', 'active');

							//개인 커스텀 메뉴 받아오기
							$.ajax({
										type : 'GET',
										async : false,
										url : '${pageContext.request.contextPath}/custom/userpage',
										success : function(data) {
											$("#custompage").append(data);
											for (var i = 0; i < arr.length; i++) {
												$(".custcard")
														.eq(i)
														.attr(
																'class',
																'col-xl-'
																		+ arr[i]
																		+ ' col-md-12 custcard');
											}
											console
													.log('GET 커스텀 메뉴 성공 or 비로그인(공백)')
										},
										error : function() {
											console.log('GET 커스텀 메뉴 실패')
										}
									})

							/* 그래프 추가 후에 버튼 리스너 활성화 -> 리로드 겁나 비효율 */
							$(".card-header-right .plussize-card").on(
									'click',
									function() {
										var $this = $(this);
										var size = $this.parents('.custcard');
										var str = size.attr('class');
										var num = Number(str.substring(7, 9));
										if (num < 12) {
											num += 2;
										}
										size.attr('class', 'col-xl-' + num
												+ ' col-md-12 custcard');
									});
							$(".card-header-right .minussize-card").on(
									'click',
									function() {
										var $this = $(this);
										var size = $this.parents('.custcard');
										var str = size.attr('class');
										var num = Number(str.substring(7, 9));
										if (num > 4) {
											num -= 2;
										}
										size.attr('class', 'col-xl-' + num
												+ ' col-md-12 custcard');
									});

							$(".card-header-right .close-card").on(
											'click',
											function() {
												var $this = $(this);
												$this
														.parents('.custcard')
														.animate(
																{
																	'opacity' : '0',
																	'-webkit-transform' : 'scale3d(.3, .3, .3)',
																	'transform' : 'scale3d(.3, .3, .3)'
																});

												setTimeout(function() {
													$this.parents('.custcard')
															.remove();
												}, 800);
											});
							/* 리로드 끝 */
							
							
							/* 뉴스 받아오기 */
								$.ajax({
										type : 'GET',
										async : true,
										url : '${pageContext.request.contextPath}/news/exchange',
										success : function(data) {
											$("#news-table-body").html(data);
											console.log('GET 비동기 뉴스 받기 성공')
										},
										error : function() {
											console.log('GET 비동기 뉴스 받기 실패')
										}
								})
							
						});
	</script>

</body>

</html>