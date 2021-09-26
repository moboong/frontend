<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 2번 컨텐츠 -->
<div id="2" class="col-xl-6 col-md-12 custcard">
	<div class="card">
		<div class="card-header">
			<h5>수출입동향 지표</h5>
			<span class="text-muted">환율이 내 주식에 어떤 영향을 미치는 걸까?</span>
			<div class="card-header-right" style="display: none;">
				<i class="fa fa-plus plussize-card"></i> <i
					class="fa fa-minus minussize-card"></i> <i
					class="fa fa-trash close-card"></i>
			</div>
		</div>
		<div class="card-block">
			<iframe title="수출입실적" src="https://www.index.go.kr/potal/stts/idxMain/selectPoSttsIdxFullPopup.do?chartTitle=%EC%88%98%EC%B6%9C%EC%9E%85%EC%8B%A4%EC%A0%81&HeadStts_cd=0&tbl_idx_cd=1066&stts_cd=106601&seq=1" id="nv00_chart" name="nv00_chart" width="100%" height="400px"></iframe>
		</div>
	</div>
</div>