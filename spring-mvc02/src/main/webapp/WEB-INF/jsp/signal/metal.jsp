<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en" class="h-100">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>금속 페이지</title>
	<jsp:include page="../include/head.jsp" />

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/css/sidebars.css" rel="stylesheet">
    
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		$(document).ready(function() {
			$('#navbarDropdown').attr('class','nav-link dropdown-toggle active')
			$('#metal').attr('class','nav-link active')
			$('#metal').css({"background-color" : "#198754"})
		})
		
	</script>    
    
  </head>
  <body class="d-flex flex-column h-100 bg-light">
  
  
	<jsp:include page="../include/top.jsp" />
	
	
	<div id="sidebar">
		<jsp:include page="../include/sidebar.jsp" />
	</div>
	
	
	<main class="flex-shrink-0" style="margin-left: 250px">
		<div class="container" style="height: 2000px;">
			<h1>금속</h1><h1>금속</h1><h1>금속</h1><h1>금속</h1><h1>금속</h1><h1>금속</h1><h1>금속</h1><h1>금속</h1><h1>금속</h1><h1>금속</h1><h1>금속</h1><h1>금속</h1><h1>금속</h1><h1>금속</h1>
		</div>
	
		<jsp:include page="../include/bottom.jsp" />
	</main>
	
	
	<script src="${pageContext.request.contextPath}/js/sidebars.js"></script>
  </body>
</html>
