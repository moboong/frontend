<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 4번 컨텐츠 -->
<div id="4" class="col-xl-6 col-md-12 custcard">
	<div class="card">
		<div class="card-header">
			<h5>4번 컨텐츠</h5>
			<span class="text-muted">환율이 내 주식에 어떤 영향을 미치는 걸까?</span>
			<div class="card-header-right" style="display: none;">
				<i class="fa fa-plus plussize-card"></i> <i
					class="fa fa-minus minussize-card"></i> <i
					class="fa fa-trash close-card"></i>
			</div>
		</div>
		<div class="card-block"
			style="min-height: 400px; background-color: #D3F1EC">
			<div style="max-height: 500px;" class="row align-items-center">
				<div class="container">
					<img id="signalImg" src="${pageContext.request.contextPath}/assets/images/exchange/6.png"
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