<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="pcoded-navbar">
	<div class="sidebar_toggle">
		<a href="#"><i class="icon-close icons"></i></a>
	</div>
	<div class="pcoded-inner-navbar main-menu">
		<div class="">
			<div class="main-menu-header">
				<!-- 위는 디폴트 사진 or 회원 사진  -->
				<img class="img-80 img-radius"
					src="${pageContext.request.contextPath}/display?fileName=profile/${ userVO.id }.png"
					alt="User-Profile-Image">
				<!-- 위는 디폴트 사진 or 회원 사진  -->
				<!-- 밑은 로그인 해주세요 문구 -->
				<div class="user-details">
					<c:choose>
						<c:when test="${ not empty userVO }">
							<span id="more-details">${ userVO.name }<i class="fa fa-caret-down"></i></span>
						</c:when>
						<c:otherwise>
							<h6><a style="color: white;" href="${pageContext.request.contextPath}/login">로그인 해주세요</a></h6>
						</c:otherwise>
					</c:choose>
				</div>
				<!-- 밑은 로그인 해주세요 문구 -->
			</div>

			<div class="main-menu-content">
				<ul>
					<li class="more-details"><a href="${pageContext.request.contextPath}/mypage"><i
							class="ti-user"></i>프로필</a> <a href="${pageContext.request.contextPath}"><i
							class="ti-settings"></i>설정</a> <a
						href="${pageContext.request.contextPath}/logout"><i
							class="ti-layout-sidebar-left"></i>로그아웃</a></li>
				</ul>
			</div>
		</div>
		<div class="p-15 p-b-0">
			<form class="form-material">
				<div class="form-group form-primary">
					<input type="text" name="footer-email" class="form-control"
						required="required"> <span class="form-bar"></span> <label
						class="float-label"><i class="fa fa-search m-r-10"></i>지표 검색하기</label>
				</div>
			</form>
		</div>
		<div class="pcoded-navigation-label"
			data-i18n="nav.category.navigation">개인 서비스</div>
		<ul class="pcoded-item pcoded-left-item">
			<li id="index" class=""><a href="${pageContext.request.contextPath}"
				class="waves-effect waves-dark"> <span class="pcoded-micon"><i
						class="ti-home"></i><b>D</b></span> <span class="pcoded-mtext"
					data-i18n="nav.dash.main">메인페이지</span> <span
					class="pcoded-mcaret"></span>
			</a></li>
			<li class="pcoded-hasmenu"><a href="javascript:void(0)"
				class="waves-effect waves-dark"> <span class="pcoded-micon"><i
						class="ti-layout-grid2-alt"></i></span> <span class="pcoded-mtext"
					data-i18n="nav.basic-components.main">사용자 기능</span> <span
					class="pcoded-mcaret"></span>
			</a>
				<ul class="pcoded-submenu">
				
					<c:if test="${ null eq userVO }">
					<li class=" "><a href="${pageContext.request.contextPath}/signup"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext"
							data-i18n="nav.basic-components.alert">회원가입</span> <span
							class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href="${pageContext.request.contextPath}/login"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext"
							data-i18n="nav.basic-components.breadcrumbs">로그인</span> <span
							class="pcoded-mcaret"></span>
					</a></li>
					</c:if>
					
					<c:if test="${ null ne userVO }">
					<li class=" "><a href="${pageContext.request.contextPath}/logout"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext"
							data-i18n="nav.basic-components.alert">로그아웃</span> <span
							class="pcoded-mcaret"></span>
					</a></li>
					</c:if>
					
					<li class=" "><a href="${pageContext.request.contextPath}/board"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext"
							data-i18n="nav.basic-components.breadcrumbs">지표토론실</span> <span
							class="pcoded-mcaret"></span>
					</a></li>

				</ul></li>
		</ul>
		<div class="pcoded-navigation-label" data-i18n="nav.category.forms">시장&#149;경제지표</div>
		<ul class="pcoded-item pcoded-left-item">
			<li id="exchange"><a href="${pageContext.request.contextPath}/signal/exchange"
				class="waves-effect waves-dark"> <span class="pcoded-micon"><i
						class="ti-layers"></i><b>FC</b></span> <span class="pcoded-mtext"
					data-i18n="nav.form-components.main">환율</span> <span
					class="pcoded-mcaret"></span>
			</a></li>
			<li id="rate"><a href="${pageContext.request.contextPath}/signal/rate"
				class="waves-effect waves-dark"> <span class="pcoded-micon"><i
						class="ti-layers"></i><b>FC</b></span> <span class="pcoded-mtext"
					data-i18n="nav.form-components.main">금리</span> <span
					class="pcoded-mcaret"></span>
			</a></li>
			<li id="oil"><a href="${pageContext.request.contextPath}/signal/oil"
				class="waves-effect waves-dark"> <span class="pcoded-micon"><i
						class="ti-layers"></i><b>FC</b></span> <span class="pcoded-mtext"
					data-i18n="nav.form-components.main">유가</span> <span
					class="pcoded-mcaret"></span>
			</a></li>
			<li id="commodity"><a
				href="${pageContext.request.contextPath}/signal/commodity"
				class="waves-effect waves-dark"> <span class="pcoded-micon"><i
						class="ti-layers"></i><b>FC</b></span> <span class="pcoded-mtext"
					data-i18n="nav.form-components.main">원자재</span> <span
					class="pcoded-mcaret"></span>
			</a></li>
			<li id="metal"><a href="${pageContext.request.contextPath}/signal/metal"
				class="waves-effect waves-dark"> <span class="pcoded-micon"><i
						class="ti-layers"></i><b>FC</b></span> <span class="pcoded-mtext"
					data-i18n="nav.form-components.main">금속</span> <span
					class="pcoded-mcaret"></span>
			</a></li>
			<li id="market"><a href="${pageContext.request.contextPath}/signal/market"
				class="waves-effect waves-dark"> <span class="pcoded-micon"><i
						class="ti-layers"></i><b>FC</b></span> <span class="pcoded-mtext"
					data-i18n="nav.form-components.main">주가지수</span> <span
					class="pcoded-mcaret"></span>
			</a></li>
		</ul>
		
		<c:if test="${ userVO.id == 'admin' }">
		<div class="pcoded-navigation-label" data-i18n="nav.category.forms">관리자 기능</div>
		<ul class="pcoded-item pcoded-left-item">
			<%-- <li><a href="${pageContext.request.contextPath}" class="waves-effect waves-dark"> <span
					class="pcoded-micon"><i class="ti-layout-grid2-alt"></i><b>FC</b></span> <span
					class="pcoded-mtext" data-i18n="nav.form-components.main">룰 추가 (알림 주기)</span>
					<span class="pcoded-mcaret"></span>
			</a></li> --%>
			<li class="pcoded-hasmenu"><a href="javascript:void(0)"
				class="waves-effect waves-dark"> <span class="pcoded-micon"><i
						class="ti-layout-grid2-alt"></i></span> <span class="pcoded-mtext"
					data-i18n="nav.basic-components.main">룰 수정</span> <span
					class="pcoded-mcaret"></span>
			</a>
				<ul class="pcoded-submenu">
					<li class=" "><a href="${pageContext.request.contextPath}/admin"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext"
							data-i18n="nav.basic-components.alert">알림 주기</span> <span
							class="pcoded-mcaret"></span>
					</a></li>
					<li class=" "><a href="${pageContext.request.contextPath}"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext"
							data-i18n="nav.basic-components.breadcrumbs">지표추천 : 전문가 픽</span> <span
							class="pcoded-mcaret"></span>
					</a></li>
				</ul></li>

		</ul>
		</c:if>
		
	</div>
</nav>