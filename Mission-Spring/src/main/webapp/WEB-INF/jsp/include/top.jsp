<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <!-- Fixed navbar -->
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark shadow">
    <div class="container-fluid">
      <a style="height: 40px;padding: 0px;" class="navbar-brand " href="${pageContext.request.contextPath}"><img height="42px" alt="" src="${pageContext.request.contextPath}/resources/img/logobar2.png"></a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav me-auto mb-2 mb-md-0">
          
        <c:if test="${ empty userVO }">
			<li class="nav-item dropdown">
	        	<a class="nav-link dropdown-toggle" href="#" id="login-signup" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            	로그인/회원가입
	         	</a>
	         	<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
	           		<li><a class="dropdown-item" href="${pageContext.request.contextPath}/login">로그인</a></li>
	           		<li><a class="dropdown-item" href="${pageContext.request.contextPath}/signup">회원가입</a></li>
	         	</ul>
          	</li>
		</c:if>
		<c:if test="${ not empty userVO }">
			<li class="nav-item dropdown">
	        	<a class="nav-link dropdown-toggle" href="#" id="mypage" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            	마이페이지
	         	</a>
	         	<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
	         		<li><a class="dropdown-item" href="#">내 정보 보기</a></li>
	           		<li><a class="dropdown-item" href="#">내 캘린더</a></li>
	           		<li><a class="dropdown-item" href="${ pageContext.request.contextPath }/logout">로그아웃</a></li>
	         	</ul>
          	</li>
		</c:if>
          
          
          <li class="nav-item dropdown">
	         <a class="nav-link dropdown-toggle" href="#" id="signals" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            	스톡 시그널
	         </a>
	         <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
	           <li><a class="dropdown-item" href="${pageContext.request.contextPath}/signal/exchange">환율 시그널</a></li>
	           <li><a class="dropdown-item" href="${pageContext.request.contextPath}/signal/rate">금리 시그널</a></li>
	           <li><a class="dropdown-item" href="${pageContext.request.contextPath}/signal/oil">유가 시그널</a></li>
	           <li><a class="dropdown-item" href="${pageContext.request.contextPath}/signal/commodity">원자재 시그널</a></li>
	           <li><a class="dropdown-item" href="${pageContext.request.contextPath}/signal/metal">금속 시그널</a></li>
	           <li><a class="dropdown-item" href="${pageContext.request.contextPath}/signal/market">주가지수 시그널</a></li>
	           <li><hr class="dropdown-divider"></li>
	           <li><a class="dropdown-item" href="#">for admin) add signal</a></li>
	         </ul>
          </li>
          
          <!-- 
          <li class="nav-item">
            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">개발중</a>
          </li>
          -->
        </ul>
        <form class="d-flex">
          <input class="form-control me-2" type="search" placeholder="검색하기" aria-label="Search">
          <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
      </div>
    </div>
  </nav>
