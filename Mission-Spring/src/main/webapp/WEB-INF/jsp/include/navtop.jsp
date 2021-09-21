<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar header-navbar pcoded-header">
	<div class="navbar-wrapper">
		<div class="navbar-logo">
			<a class="mobile-menu waves-effect waves-light" id="mobile-collapse"
				href="javascript:void(0)"> <i class="ti-menu"></i>
			</a>
			<div class="mobile-search waves-effect waves-light">
				<div class="header-search">
					<div class="main-search morphsearch-search">
						<div class="input-group">
							<span class="input-group-addon search-close"><i
								class="ti-close"></i></span> <input type="text" class="form-control"
								placeholder="Enter Keyword"> <span
								class="input-group-addon search-btn"><i class="ti-search"></i></span>
						</div>
					</div>
				</div>
			</div>
			<a href="${pageContext.request.contextPath}"> <img
				class="img-fluid"
				src="${pageContext.request.contextPath}/assets/images/logo6.png"
				alt="Theme-Logo" />
			</a> <a class="mobile-options waves-effect waves-light"> <i
				class="ti-more"></i>
			</a>
		</div>

		<div class="navbar-container container-fluid">
			<ul class="nav-left">
				<li>
					<div class="sidebar_toggle">
						<a href="javascript:void(0)"><i class="ti-menu"></i></a>
					</div>
				</li>
				<li class="header-search">
					<div class="main-search morphsearch-search">
						<div class="input-group">
							<span class="input-group-addon search-close"><i
								class="ti-close"></i></span> <input type="text" class="form-control">
							<span class="input-group-addon search-btn"><i
								class="ti-search"></i></span>
						</div>
					</div>
				</li>
				<li><a href="javascript:void(0)" onclick="javascript:toggleFullScreen()"
					class="waves-effect waves-light"> <i class="ti-fullscreen"></i>
				</a></li>
			</ul>
			<!-- 비로그인시 없어 -->
			<c:if test="${ not empty sessionScope.userVO }">
				<ul class="nav-right">
					<li class="header-notification"><a href="javascript:void(0);"
						class="waves-effect waves-light"> <i class="ti-bell"></i> 
						<span id="bell" class="bg-c-red"></span>
					</a>
						<ul id="signalnotice" class="show-notification">
							
						</ul></li>
					<li class="user-profile header-notification"><a
						href="javascript:void(0)" class="waves-effect waves-light"> <img
							src="${pageContext.request.contextPath}/display?fileName=profile/${ userVO.id }.png"
							class="img-radius" alt="User-Profile-Image"> <span>${ userVO.name }</span>
							<i class="ti-angle-down"></i>
					</a>
						<ul class="show-notification profile-notification">
							<li class="waves-effect waves-light"><a
								href="${pageContext.request.contextPath}"> <i
									class="ti-settings"></i> 설정
							</a></li>
							<li class="waves-effect waves-light"><a
								href="${pageContext.request.contextPath}/mypage"> <i class="ti-user"></i>
									프로필
							</a></li>
							<li class="waves-effect waves-light"><a
								href="${pageContext.request.contextPath}/logout"> <i
									class="ti-layout-sidebar-left"></i> 로그아웃
							</a></li>
						</ul></li>
				</ul>
			</c:if>
			<!-- 비로그인시 없어 -->
		</div>
	</div>
</nav>