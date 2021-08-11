<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en" class="h-100">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>로그인</title>
    <jsp:include page="../include/head.jsp" />
    
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/css/signin.css" rel="stylesheet">
    
    <style>
    	/* 수정용 */
		.btn-success {
			background-color: rgb(17, 163, 142);
			border-color: rgb(17, 163, 142);
		}
    </style>
    
   	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		$(document).ready(function() {
			$('#login').attr('class','nav-link active')
		})
	</script>
  </head>
  <body class="d-flex flex-column h-100">
    
    
	<jsp:include page="../include/top.jsp" />
	
	
	<!-- Begin page content -->
	<main class="form-signin">
	  <form>
	    <img class="d-block mx-auto mb-4" src="${pageContext.request.contextPath}/img/logoinlogo.png" alt="" width="200">	  	
	    <h1 class="h3 mb-3 fw-normal"></h1>
	
	    <div class="form-floating">
	      <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
	      <label for="floatingInput">Email 아이디</label>
	    </div>
	    <div class="form-floating">
	      <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
	      <label for="floatingPassword">비밀번호</label>
	    </div>
	
	    <div class="checkbox mb-3">
	      <label>
	        <input type="checkbox" value="remember-me"> 아이디 기억하기
	      </label>
	    </div>
	    <button class="w-100 btn btn-lg btn-success" type="submit">로그인</button>
	    <p class="mt-5 mb-3 text-muted">&copy; 2021</p>
	  </form>
	</main>
	
	
	<%-- <jsp:include page="../include/bottom.jsp" /> --%>
  
  
  </body>
</html>
