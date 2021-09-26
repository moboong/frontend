<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 1번 컨텐츠 -->
<div id="1" class="col-xl-6 col-md-12 custcard">
	<div class="card">
		<div class="card-header">
			<h5>투자자별 매매동향</h5>
			<span class="text-muted">여기서 외국인 매도세에 주목해보세요!</span>
			<div class="card-header-right" style="display: none;">
				<i class="fa fa-plus plussize-card"></i> <i
					class="fa fa-minus minussize-card"></i> <i
					class="fa fa-trash close-card"></i>
			</div>
		</div>
		<div class="card-block">
			<div class="col-xl-12 col-md-12">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs md-tabs" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="javascript:void(0);" onclick="changeImg01('Day');" role="tab">1일(1분)</a>
						<div class="slide"></div></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="javascript:void(0);" onclick="changeImg01('Week');"  role="tab">1주일</a>
						<div class="slide"></div></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="javascript:void(0);" onclick="changeImg01('OneMonth');" role="tab">1개월</a>
						<div class="slide"></div></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="javascript:void(0);" onclick="changeImg01('ThreeMonth');" role="tab">3개월</a>
						<div class="slide"></div></li>
				</ul>
			</div>
			<div style="max-height: 500px;" class="row align-items-center">
				<div class="container">
					<img id="graph01"
						src="https://ssl.pstatic.net/imgfinance/chart/sise/trendUitradeDayKOSPI.png? />"
						border="0" alt="그래프" width="100%"
						class="card-img rounded mx-auto d-block"
						style="max-height: 700px; max-width: 700px;">
				</div>
			</div>
		</div>
	</div>
</div>