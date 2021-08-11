<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark" style="width: 250px;">
    <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
      <svg class="bi me-2" width="40" height="32"><use href="#bootstrap"/></svg>
      <span class="fs-4">Sidebar</span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item">
        <a id="exchange" href="${pageContext.request.contextPath}/signal/exchange.do" class="nav-link text-white btn-success" aria-current="page">
          <svg class="bi me-2" width="16" height="16"><use href="#home"/></svg>
          환율 시그널
        </a>
      </li>
      
      
      
      <li>
        <a id="rate" href="${pageContext.request.contextPath}/signal/rate.do" class="nav-link text-white">
          <svg class="bi me-2" width="16" height="16"><use href="#speedometer2"/></svg>
          금리 시그널
        </a>
      </li>
      <li>
        <a id="oil" href="${pageContext.request.contextPath}/signal/oil.do" class="nav-link text-white">
          <svg class="bi me-2" width="16" height="16"><use href="#table"/></svg>
          유가 시그널
        </a>
      </li>
      <li>
        <a id="commodity" href="${pageContext.request.contextPath}/signal/commodity.do" class="nav-link text-white">
          <svg class="bi me-2" width="16" height="16"><use href="#grid"/></svg>
          원자재 시그널
        </a>
      </li>
      <li>
        <a id="metal" href="${pageContext.request.contextPath}/signal/metal.do" class="nav-link text-white">
          <svg class="bi me-2" width="16" height="16"><use href="#people-circle"/></svg>
          금속 시그널
        </a>
      </li>
      <li>
        <a id="market" href="${pageContext.request.contextPath}/signal/market.do" class="nav-link text-white">
          <svg class="bi me-2" width="16" height="16"><use href="#people-circle"/></svg>
          주가지수 시그널
        </a>
      </li>
    </ul>
    <hr>
    <div class="dropdown">
      <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
        <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
        <strong>홍길동</strong>
      </a>
      <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
        <li><a class="dropdown-item" href="#">마이페이지</a></li>
        <li><a class="dropdown-item" href="#">캘린더</a></li>
        <li><a class="dropdown-item" href="#">내가 쓴 게시글</a></li>
        <li><hr class="dropdown-divider"></li>
        <li><a class="dropdown-item" href="#">로그아웃</a></li>
      </ul>
    </div>
</div>