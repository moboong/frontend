<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
  <!-- Fixed navbar -->
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <div class="container-fluid">
      <a style="height: 40px;padding: 0px;" class="navbar-brand " href="${pageContext.request.contextPath}"><img height="42px" alt="" src="${pageContext.request.contextPath}/img/logobar2.png"></a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav me-auto mb-2 mb-md-0">
          <li class="nav-item">
            <a class="nav-link" id="home" aria-current="page" href="${pageContext.request.contextPath}">메인페이지</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="login" href="${pageContext.request.contextPath}/member/login.do">로그인</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="signup" href="${pageContext.request.contextPath}/member/signup.do">회원가입</a>
          </li>
          
          <li class="nav-item dropdown">
	         <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            스톡 시그널
	         </a>
	         <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
	           <li><a class="dropdown-item" href="${pageContext.request.contextPath}/signal/exchange.do">환율 시그널</a></li>
	           <li><a class="dropdown-item" href="${pageContext.request.contextPath}/signal/rate.do">금리 시그널</a></li>
	           <li><a class="dropdown-item" href="${pageContext.request.contextPath}/signal/oil.do">유가 시그널</a></li>
	           <li><a class="dropdown-item" href="${pageContext.request.contextPath}/signal/commodity.do">원자재 시그널</a></li>
	           <li><a class="dropdown-item" href="${pageContext.request.contextPath}/signal/metal.do">금속 시그널</a></li>
	           <li><a class="dropdown-item" href="${pageContext.request.contextPath}/signal/market.do">주가지수 시그널</a></li>
	           <li><hr class="dropdown-divider"></li>
	           <li><a class="dropdown-item" href="#">for admin) add signal</a></li>
	         </ul>
          </li>
          
          <li class="nav-item">
            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">개발중</a>
          </li>
        </ul>
        <form class="d-flex">
          <input class="form-control me-2" type="search" placeholder="검색하기" aria-label="Search">
          <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
      </div>
    </div>
  </nav>
</header>