<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav id="sidebarMenu"
	class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse"
	style="z-index: 1; top: 56px;">
	<div class="position-sticky pt-3">
		<ul class="nav flex-column">
			<li class="nav-item"><a id="exchange" class="nav-link"
				aria-current="page"
				href="${pageContext.request.contextPath}/signal/exchange.do"> <span
					data-feather="dollar-sign"> </span> 환율 시그널
			</a></li>
			<li class="nav-item"><a id="rate" class="nav-link"
				href="${pageContext.request.contextPath}/signal/rate.do"> <span
					data-feather="percent"></span> 금리 시그널
			</a></li>
			<li class="nav-item"><a id="oil" class="nav-link"
				href="${pageContext.request.contextPath}/signal/oil.do"> <span
					data-feather="database"></span> 유가 시그널
			</a></li>
			<li class="nav-item"><a id="commodity" class="nav-link"
				href="${pageContext.request.contextPath}/signal/commodity.do"> <span
					data-feather="tool"></span> 원자재 시그널
			</a></li>
			<li class="nav-item"><a id="metal" class="nav-link"
				href="${pageContext.request.contextPath}/signal/metal.do"> <span
					data-feather="hexagon"></span> 금속 시그널
			</a></li>
			<li class="nav-item"><a id="market" class="nav-link"
				href="${pageContext.request.contextPath}/signal/market.do"> <span
					data-feather="trending-up"></span> 주가지수 시그널
			</a></li>
		</ul>

		<h6
			class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
			<span>시그널 관련 부가 서비스</span> <span data-feather="plus-circle"></span>
		</h6>
		<ul id="innerbar" class="nav flex-column mb-2">
			
		</ul>
	</div>
</nav>

