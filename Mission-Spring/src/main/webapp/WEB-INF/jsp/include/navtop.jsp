<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar header-navbar pcoded-header">
	<div class="navbar-wrapper">
		<div class="navbar-logo">
			<a class="mobile-menu waves-effect waves-light" id="mobile-collapse"
				href="#!"> <i class="ti-menu"></i>
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
				src="${pageContext.request.contextPath}/assets/images/logo.png"
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
				<li><a href="#!" onclick="javascript:toggleFullScreen()"
					class="waves-effect waves-light"> <i class="ti-fullscreen"></i>
				</a></li>
			</ul>
			<ul class="nav-right">
				<li class="header-notification"><a href="#!"
					class="waves-effect waves-light"> <i class="ti-bell"></i> <span
						class="bg-c-red"></span> <!-- class="bg-c-red"  -->
				</a>
					<ul class="show-notification">
						<li>
							<h6>Notifications</h6> <label class="label label-danger">New</label>
						</li>
						<li class="waves-effect waves-light">
							<div class="media">
								<img class="d-flex align-self-center img-radius"
									src="${pageContext.request.contextPath}/assets/images/avatar-2.jpg"
									alt="Generic placeholder image">
								<div class="media-body">
									<h5 class="notification-user">이기찬</h5>
									<p class="notification-msg">내 게시글에 댓글을 달았습니다.</p>
									<span class="notification-time">30분 전</span>
								</div>
							</div>
						</li>
						<li class="waves-effect waves-light">
							<div class="media">
								<img class="d-flex align-self-center img-radius"
									src="${pageContext.request.contextPath}/assets/images/avatar-4.jpg"
									alt="Generic placeholder image">
								<div class="media-body">
									<h5 class="notification-user">제라드</h5>
									<p class="notification-msg">내 게시글에 좋아요를 눌렀습니다.</p>
									<span class="notification-time">30 minutes ago</span>
								</div>
							</div>
						</li>
						<li class="waves-effect waves-light">
							<div class="media">
								<img class="d-flex align-self-center img-radius"
									src="${pageContext.request.contextPath}/assets/images/avatar-3.jpg"
									alt="Generic placeholder image">
								<div class="media-body">
									<h5 class="notification-user">드록바</h5>
									<p class="notification-msg">내 게시글에 댓글을 달았습니다.</p>
									<span class="notification-time">1시간 전</span>
								</div>
							</div>
						</li>
						<li class="waves-effect waves-light">
							<div class="media">
								<img class="d-flex align-self-center img-radius"
									src="${pageContext.request.contextPath}/assets/images/avatar-2.jpg"
									alt="Generic placeholder image">
								<div class="media-body">
									<h5 class="notification-user">안성재</h5>
									<p class="notification-msg">내 게시글에 댓글을 달았습니다.</p>
									<span class="notification-time">3시간</span>
								</div>
							</div>
						</li>
					</ul></li>
				<li class="user-profile header-notification"><a href="#!"
					class="waves-effect waves-light"> <img
						src="${pageContext.request.contextPath}/assets/images/avatar-4.jpg"
						class="img-radius" alt="User-Profile-Image"> <span>황준호</span>
						<i class="ti-angle-down"></i>
				</a>
					<ul class="show-notification profile-notification">
						<li class="waves-effect waves-light"><a href="#!"> <i
								class="ti-settings"></i> 설정
						</a></li>
						<li class="waves-effect waves-light"><a
							href="${pageContext.request.contextPath}"> <i class="ti-user"></i> 프로필
						</a></li>
						<li class="waves-effect waves-light"><a
							href="${pageContext.request.contextPath}"> <i class="ti-email"></i> 채팅하기
						</a></li>
						<li class="waves-effect waves-light"><a
							href="${pageContext.request.contextPath}/logout"> <i
								class="ti-layout-sidebar-left"></i> 로그아웃
						</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</nav>