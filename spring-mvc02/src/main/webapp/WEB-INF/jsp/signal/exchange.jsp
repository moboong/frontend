<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en" class="h-100">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>환율 페이지</title>
	<jsp:include page="../include/head.jsp" />

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/css/dashboard.css" rel="stylesheet">
    
 
    <!-- 네이버금융 -->
    <script type="text/javascript" src="https://ssl.pstatic.net/imgstock/static.pc/20210813130554/js/info/jindo.min.ns.1.5.3.euckr.js"></script>
	<script type="text/javascript" src="https://ssl.pstatic.net/imgstock/static.pc/20210813130554/js/jindo.1.5.3.element-text-patch.js"></script>
    
    
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		$(document).ready(function() {
			$('#signals').attr('class','nav-link dropdown-toggle active')
			$('#exchange').attr('class','nav-link active')
		})
		
		
		jindo.$Fn(function () {
        	jindo.$$('title')[0].innerHTML = "미국 달러 : 네이버 금융";
    	}).attach(document, "domready");

		// 선 차트 노출
	    function showChart(target) {
			
			$('button[name=btnDate]').attr('class','nav-link')
			$('#' + target).attr('class','nav-link active');
			
	        jindo.$A(jindo.$$("dl.line dd ul li")).forEach(function (v) {
	            if (jindo.$Element(v).className() == target) {
	                jindo.$Element(v).child()[0].addClass("on");
	                var welChart = jindo.$Element(jindo.$$.getSingle("div.flash_area img"));
	                welChart.attr("src", "https://ssl.pstatic.net/imgfinance/chart/marketindex/area/" + target + "/FX_USDKRW.png?sidcode=" + jindo.$Date(new Date()).format("Ymd"));
	            } else {
	                jindo.$Element(v).child()[0].removeClass("on");
	            }
	        });
	    }
		
	 	// 외국인 그래프
	    function changeChart(type) {
	 		
	    	$('#tab > li > a').attr('class','nav-link')
			$('#' + type + 'Tab > a').attr('class','nav-link active');
	    		
	    	jindo.$Element("dayGraph").hide();
	    	jindo.$Element("weekGraph").hide();
	    	jindo.$Element("oneMonthGraph").hide();
	    	jindo.$Element("threeMonthGraph").hide();

	    	jindo.$Element(type + "Graph").show();

	    }
	 	// 기준시 1990-08-26 21:48:00
		
	 	
	 	function switchImg(target) {
	 		$('button[name=btnNews]').attr('class','nav-link')
			$('#' + target).attr('class','nav-link active');
	 		$('#newsImg').attr('src', 'http://localhost:9999/spring-mvc02/img/exchange/' + target + '.png')
	 		
		}
	 	
	 	function switchGraph(target) {
	 		$('button[name=btnKospi]').attr('class','nav-link')
			$('#' + target + 'Ko').attr('class','nav-link active');
	 		$('#kospiImg').attr('src', 'http://localhost:9999/spring-mvc02/img/exchange/' + target + '.png')
	 		
		}
	 	
	 	
	 	let page = 1;
	 	
	 	function back() {
	 		if(page != 1){
	 			page = page - 1
	 		}
	 		$('button[name=btnSignal]').attr('class','nav-link')
			$('#back').attr('class','nav-link active');
	 		$('#signalImg').attr('src', 'http://localhost:9999/spring-mvc02/img/exchange/signal/' + page + '.png')
		}
	 	
	 	function forward() {
	 		if(page != 13){
	 			page = page + 1
	 		}
	 		$('button[name=btnSignal]').attr('class','nav-link')
			$('#forward').attr('class','nav-link active');
	 		$('#signalImg').attr('src', 'http://localhost:9999/spring-mvc02/img/exchange/signal/' + page + '.png')
		}
	</script>
    
  </head>
  <body class="d-flex flex-column h-100 bg-light">
  
  <header>
	<jsp:include page="../include/top.jsp" />
  </header>
	
	<main class="flex-shrink-0" style="margin-top: 56px">
		<button class="navbar-toggler position-fixed d-md-none collapsed navbar-light" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation" style="background-color: white-space; z-index: 100">
    		<span class="navbar-toggler-icon"></span>
  		</button>
		<div class="container-fluid" style="z-index: 1">
		  <div class="row">
		    
		    <jsp:include page="../include/sidebar.jsp" />
		
		    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
		      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		        <h1 class="h2">환율 시그널</h1>
		        <div class="btn-toolbar mb-2 mb-md-0">
		          <div class="btn-group me-2">
		            <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
		            <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
		          </div>
		          <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
		            <span data-feather="calendar"></span>
		            This week
		          </button>
		        </div>
		      </div>
		
		      
			<div class="container" style="padding-top: 0px;">
				<h4 class="h4">환율 시그널 살펴보기</h4>
				<div class="chart_control_area">
		            <dl class="line">
		                <dd>
		                    <ul class="nav nav-tabs" role="tablist">
		                        <li class="back" role="presentation"><button id="back" name="btnSignal" class="nav-link" onclick="back();">앞</button></li>
		                        <li class="forward" role="presentation"><button id="forward" name="btnSignal" class="nav-link" onclick="forward();">뒤</button></li>
		                    </ul>
		                </dd>
		            </dl>
		        </div>
		      
		        <div class="flash_area">
            		<img id="signalImg" src="${pageContext.request.contextPath}/img/exchange/signal/1.png" width="600" alt="">
       	 		</div>
       	 	</div>
			
			<!-- 네이버 금융 -->	
			<div class="container">
				<h4 class="h4">원/달러 환율</h4>
				
				
				<div class="chart_control_area">
		            <dl class="line">
		                <dd>
		                    <ul class="nav nav-tabs" role="tablist">
		                        <li class="month" role="presentation"><button id="month" name="btnDate" class="nav-link" onclick="showChart('month');">1개월</button></li>
		                        <li class="month3" role="presentation"><button id="month3" name="btnDate" class="nav-link active" onclick="showChart('month3');">3개월</button></li>
		                        <li class="year" role="presentation"><button id="year" name="btnDate" class="nav-link" onclick="showChart('year');">1년</button></li>
		                        <li class="year3" role="presentation"><button id="year3" name="btnDate" class="nav-link" onclick="showChart('year3');">3년</button></li>
		                        <li class="year5" role="presentation"><button id="year5" name="btnDate" class="nav-link" onclick="showChart('year5');">5년</button></li>
		                        <li class="year10" role="presentation"><button id="year10" name="btnDate" class="nav-link" onclick="showChart('year10');">10년</button></li>             
		                    </ul>
		                </dd>
		            </dl>
		        </div>
		      
		        <div class="flash_area">
		        	<c:set var="now" value="<%=new java.util.Date()%>" />
		       	  	<c:set var="sysDate"><fmt:formatDate value="${now}" pattern="yyyyMMdd" /></c:set>
            		<img src="https://ssl.pstatic.net/imgfinance/chart/marketindex/area/month3/FX_USDKRW.png?sidcode=<c:out value="${sysDate}" />" width="700" alt="차트" onerror="this.src='https://ssl.pstatic.net/imgstock/chart3/world2008/error_700x243.gif'">
       	 		</div>
       	 	</div>
       	 	<!-- 네이버 금융 -->
       	 		
       	 	<!-- 네이버 금융 -->
       	 	<div class="container">
				<h4 class="h4">투자자매매동향(외국인 매도수 현황)</h4>
				<div class="box_top_sub">
					<div id="type_0">
						<img src="https://ssl.pstatic.net/imgstock/images5/blank.gif" alt="" class="rb"><img src="https://ssl.pstatic.net/imgstock/images5/blank.gif" alt="" class="lb"><img src="https://ssl.pstatic.net/imgstock/images5/blank.gif" alt="" class="rt"><img src="https://ssl.pstatic.net/imgstock/images5/blank.gif" alt="" class="lt">
						<div class="subtop_sise_graph2">
							<div class="tab_toptit">
								<ul id="tab" class="nav nav-tabs" role="tablist">
									<li id="dayTab"><a class="nav-link active" href="javascript:changeChart('day');"><span>1일(1분)</span></a></li>
									<li id="weekTab"><a class="nav-link" href="javascript:changeChart('week');"><span>1주일</span></a></li>
									<li id="oneMonthTab"><a class="nav-link" href="javascript:changeChart('oneMonth');"><span>1개월</span></a></li>
									<li id="threeMonthTab"><a class="nav-link" href="javascript:changeChart('threeMonth');"><span>3개월</span></a></li>
								</ul>
							</div>
														
							<c:set var="nowTime" value="<%=new java.util.Date().getTime() %>" />
							<c:set var="stdTime" value="<%=new java.util.Date(651678500000L).getTime() %>" />
		       	  			<fmt:parseNumber var="time" value="${ (nowTime - stdTime) / 1000 / 60 * 100000}" integerOnly="false" />
		       	  			<c:set var="interval"><fmt:formatNumber value="${time}" pattern=" "/></c:set>

							<div id="dayGraph" class="subtop_graph" style="margin-top:15px"><img src="https://ssl.pstatic.net/imgfinance/chart/sise/trendUitradeDayKOSPI.png?sid=<c:out value="${interval}" />" border="0" alt="그래프"></div>
							<div id="weekGraph" class="subtop_graph" style="margin-top:15px;display:none"><img src="https://ssl.pstatic.net/imgfinance/chart/sise/trendUitradeWeekKOSPI.png?sid=<c:out value="${interval}" />" border="0" alt="그래프"></div>
							<div id="oneMonthGraph" class="subtop_graph" style="margin-top:15px;display:none"><img src="https://ssl.pstatic.net/imgfinance/chart/sise/trendUitradeOneMonthKOSPI.png?sid=<c:out value="${interval}" />" border="0" alt="그래프"></div>
							<div id="threeMonthGraph" class="subtop_graph" style="margin-top:15px;display:none"><img src="https://ssl.pstatic.net/imgfinance/chart/sise/trendUitradeThreeMonthKOSPI.png?sid=<c:out value="${interval}" />" border="0" alt="그래프"></div>
						</div>
					</div>
				</div>
			</div>
       	 	<!-- 네이버 금융 -->
       	 	
       	 	
       	 	<div class="container">
				<h4 class="h4">코스피</h4>
				<div class="chart_control_area">
		            <dl class="line">
		                <dd>
		                    <ul class="nav nav-tabs" role="tablist">
		                        <li class="day" role="presentation"><button id="dayKo" name="btnKospi" class="nav-link active" onclick="switchGraph('day');">1일</button></li>
		                        <li class="day5" role="presentation"><button id="day5Ko" name="btnKospi" class="nav-link" onclick="switchGraph('day5');">5일</button></li>
		                        <li class="month" role="presentation"><button id="monthKo" name="btnKospi" class="nav-link" onclick="switchGraph('month');">1개월</button></li>
		                        <li class="month6" role="presentation"><button id="month6Ko" name="btnKospi" class="nav-link" onclick="switchGraph('month6');">6개월</button></li>
								<li class="year" role="presentation"><button id="yearKo" name="btnKospi" class="nav-link" onclick="switchGraph('year');">연중</button></li>
		                    </ul>
		                </dd>
		            </dl>
		        </div>
		      
		        <div class="flash_area">
            		<img id="kospiImg" src="${pageContext.request.contextPath}/img/exchange/day.png" width="700" alt="">
       	 		</div>
       	 	</div>
       	 	
       	 	<div class="container">
				<h4 class="h4">환율시그널 관련 뉴스</h4>
				<div class="chart_control_area">
		            <dl class="line">
		                <dd>
		                    <ul class="nav nav-tabs" role="tablist">
		                        <li class="exch" role="presentation"><button id="exch" name="btnNews" class="nav-link active" onclick="switchImg('exch');">환율</button></li>
		                        <li class="fori" role="presentation"><button id="fori" name="btnNews" class="nav-link" onclick="switchImg('fori');">외국인 매매동향</button></li>
		                        <li class="expo" role="presentation"><button id="expo" name="btnNews" class="nav-link" onclick="switchImg('expo');">수출입 동향</button></li>
		                        <li class="" role="presentation"><button id="" name="btnNews" class="nav-link"><span data-feather="plus-circle"></button></li>
		                    </ul>
		                </dd>
		            </dl>
		        </div>
		      
		        <div class="flash_area">
            		<img id="newsImg" src="${pageContext.request.contextPath}/img/exchange/exch.png" width="700" alt="">
       	 		</div>
       	 	</div>
       	 	
       	 	
       	 				      
       	 	<canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>			      
       	 	
       	 				      
       	 				   
		      <h2>Section title</h2>
		      <div class="table-responsive">
		        <table class="table table-striped table-sm">
		          <thead>
		            <tr>
		              <th scope="col">#</th>
		              <th scope="col">Header</th>
		              <th scope="col">Header</th>
		              <th scope="col">Header</th>
		              <th scope="col">Header</th>
		            </tr>
		          </thead>
		          <tbody>
		            <tr>
		              <td>1,001</td>
		              <td>random</td>
		              <td>data</td>
		              <td>placeholder</td>
		              <td>text</td>
		            </tr>
		            <tr>
		              <td>1,002</td>
		              <td>placeholder</td>
		              <td>irrelevant</td>
		              <td>visual</td>
		              <td>layout</td>
		            </tr>
		            <tr>
		              <td>1,003</td>
		              <td>data</td>
		              <td>rich</td>
		              <td>dashboard</td>
		              <td>tabular</td>
		            </tr>
		            <tr>
		              <td>1,003</td>
		              <td>information</td>
		              <td>placeholder</td>
		              <td>illustrative</td>
		              <td>data</td>
		            </tr>
		            <tr>
		              <td>1,004</td>
		              <td>text</td>
		              <td>random</td>
		              <td>layout</td>
		              <td>dashboard</td>
		            </tr>
		            <tr>
		              <td>1,005</td>
		              <td>dashboard</td>
		              <td>irrelevant</td>
		              <td>text</td>
		              <td>placeholder</td>
		            </tr>
		            <tr>
		              <td>1,006</td>
		              <td>dashboard</td>
		              <td>illustrative</td>
		              <td>rich</td>
		              <td>data</td>
		            </tr>
		            <tr>
		              <td>1,007</td>
		              <td>placeholder</td>
		              <td>tabular</td>
		              <td>information</td>
		              <td>irrelevant</td>
		            </tr>
		            <tr>
		              <td>1,008</td>
		              <td>random</td>
		              <td>data</td>
		              <td>placeholder</td>
		              <td>text</td>
		            </tr>
		            <tr>
		              <td>1,009</td>
		              <td>placeholder</td>
		              <td>irrelevant</td>
		              <td>visual</td>
		              <td>layout</td>
		            </tr>
		            <tr>
		              <td>1,010</td>
		              <td>data</td>
		              <td>rich</td>
		              <td>dashboard</td>
		              <td>tabular</td>
		            </tr>
		            <tr>
		              <td>1,011</td>
		              <td>information</td>
		              <td>placeholder</td>
		              <td>illustrative</td>
		              <td>data</td>
		            </tr>
		            <tr>
		              <td>1,012</td>
		              <td>text</td>
		              <td>placeholder</td>
		              <td>layout</td>
		              <td>dashboard</td>
		            </tr>
		            <tr>
		              <td>1,013</td>
		              <td>dashboard</td>
		              <td>irrelevant</td>
		              <td>text</td>
		              <td>visual</td>
		            </tr>
		            <tr>
		              <td>1,014</td>
		              <td>dashboard</td>
		              <td>illustrative</td>
		              <td>rich</td>
		              <td>data</td>
		            </tr>
		            <tr>
		              <td>1,015</td>
		              <td>random</td>
		              <td>tabular</td>
		              <td>information</td>
		              <td>text</td>
		            </tr>
		          </tbody>
		        </table>
		      </div>
			  <jsp:include page="../include/bottom.jsp" />
		    </main>
		  </div>
		</div>

	</main>
	
	
	<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/js/dashboard.js"></script>
	
  </body>
</html>
