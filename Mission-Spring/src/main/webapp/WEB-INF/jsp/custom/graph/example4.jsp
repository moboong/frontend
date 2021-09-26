<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 4번 컨텐츠 -->
<div id="4" class="col-xl-6 col-md-12 custcard">
	<div class="card">
		<div class="card-header">
			<h5>회사채(3년)금리 지표</h5>
			<span class="text-muted">환율이 내 주식에 어떤 영향을 미치는 걸까?</span>
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
						data-toggle="tab" href="javascript:void(0);" onclick="changeImg04('month');" role="tab">1개월</a>
						<div class="slide"></div></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="javascript:void(0);" onclick="changeImg04('month3');" role="tab">3개월</a>
						<div class="slide"></div></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="javascript:void(0);" onclick="changeImg04('year');" role="tab">1년</a>
						<div class="slide"></div></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="javascript:void(0);" onclick="changeImg04('year3');" role="tab">3년</a>
						<div class="slide"></div></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="javascript:void(0);" onclick="changeImg04('year5');" role="tab">5년</a>
						<div class="slide"></div></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="javascript:void(0);" onclick="changeImg04('year10');" role="tab">10년</a>
						<div class="slide"></div></li>
				</ul>
			</div>
			<div style="max-height: 500px;" class="row align-items-center">
				<div class="container">
					<img id="graph04" 
					class="card-img rounded mx-auto d-block"
					border="0" alt="그래프" width="100%"
					src="https://ssl.pstatic.net/imgfinance/chart/marketindex/area/month/IRR_CORP03Y.png?" width="700" alt="차트">
				</div>
			</div>
		</div>
	</div>
</div>