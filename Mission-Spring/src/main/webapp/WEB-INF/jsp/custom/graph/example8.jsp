<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 8번 컨텐츠 -->
<div id="8" class="col-xl-6 col-md-12 custcard">
	<div class="card">
		<div class="card-header">
			<h5>중국CNY</h5>
			<span class="text-muted">중국 환율도 주목하기!</span>
			<div class="card-header-right" style="display: none;">
				<i class="fa fa-plus plussize-card"></i> <i
					class="fa fa-minus minussize-card"></i> <i
					class="fa fa-trash close-card"></i>
			</div>
		</div>
		<div class="card-block">
			<img 
			class="card-img rounded mx-auto d-block"
			border="0" alt="그래프" width="100%"
			src="https://ssl.pstatic.net/imgfinance/chart/marketindex/area/month3/FX_CNYKRW.png" alt="차트" onerror="this.src='https://ssl.pstatic.net/imgstock/chart3/world2008/error_700x243.gif'">
		</div>
	</div>
</div>