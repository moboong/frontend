<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block sidebar collapse"
	style="z-index: 1; top: 56px; background-color: white;">
	<div class="position-sticky pt-3">
		<ul class="nav flex-column">
			<li class="nav-item">
				<a class="nav-link disabled" href="#">
					<strong style="font-size: 17px">거시경제지표</strong>
				</a>
				<hr width="80%">
			</li>
			
			<li class="nav-item"><a id="exchange" class="nav-link"
				aria-current="page"
				href="${pageContext.request.contextPath}/signal/exchange"> <span
					data-feather="dollar-sign"> </span> 환율 시그널
			</a></li>
			<li class="nav-item"><a id="rate" class="nav-link"
				href="${pageContext.request.contextPath}/signal/rate"> <span
					data-feather="percent"></span> 금리 시그널
			</a></li>
			<li class="nav-item"><a id="oil" class="nav-link"
				href="${pageContext.request.contextPath}/signal/oil"> <span
					data-feather="database"></span> 유가 시그널
			</a></li>
			<li class="nav-item"><a id="commodity" class="nav-link"
				href="${pageContext.request.contextPath}/signal/commodity"> <span
					data-feather="tool"></span> 원자재 시그널
			</a></li>
			<li class="nav-item"><a id="metal" class="nav-link"
				href="${pageContext.request.contextPath}/signal/metal"> <span
					data-feather="hexagon"></span> 금속 시그널
			</a></li>
			<li class="nav-item"><a id="market" class="nav-link"
				href="${pageContext.request.contextPath}/signal/market"> <span
					data-feather="trending-up"></span> 주가지수 시그널
			</a>
			<hr width="80%">
			</li>
		</ul>

		<h6
			class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
			<span>지표별 부가서비스</span> <span data-feather="plus-circle"></span>
		</h6>
		<ul id="innerbar" class="nav flex-column mb-2">
			<li style="display: none;" class="nav-item exchangebar"><a class="nav-link" href="#"> <span
					data-feather="file-text"></span>환율 계산기
			</a></li>
			<li style="display: none;" class="nav-item exchangebar"><a class="nav-link" href="#"> <span
					data-feather="file-text"></span>은행별 환율 비교
			</a></li>
			<li style="display: none;" class="nav-item ratebar"><a class="nav-link" href="#"> <span
					data-feather="file-text"></span>은행별 금리 비교
			</a></li>
			<li style="display: none;" class="nav-item oilbar"><a class="nav-link" href="#"> <span
					data-feather="file-text"></span>시도별 최저가 주유소
			</a></li>
			<li style="display: none;" class="nav-item commoditybar"><a class="nav-link" href="#"> <span
					data-feather="file-text"></span>원자재 펀드 수익률 비교
			</a></li>
			<li style="display: none;" class="nav-item metalbar"><a class="nav-link" href="#"> <span
					data-feather="file-text"></span>금 계산기
			</a></li>
			<li style="display: none;" class="nav-item marketbar"><a class="nav-link" href="#"> <span
					data-feather="file-text"></span>주식 수익률 계산기
			</a></li>
			<li style="display: none;" class="nav-item marketbar"><a class="nav-link" href="#"> <span
					data-feather="file-text"></span>증권사별 수수료 비교
			</a></li>
		</ul>
	</div>
</nav>

