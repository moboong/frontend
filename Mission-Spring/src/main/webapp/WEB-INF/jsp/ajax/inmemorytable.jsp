<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table table-hover">
	<thead>
		<tr>
			<th>고시회차</th>
			<th>매매기준율</th>
			<th>전일비</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${ requestScope.exchangeList }" var="exchange"
			varStatus="loop">
			<tr>
				<td>${ exchange.regDate }</td>
				<td>${ exchange.stdRate }</td>
				<td>${ exchange.variation }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>