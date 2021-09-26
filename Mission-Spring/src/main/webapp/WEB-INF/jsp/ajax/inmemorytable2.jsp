<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table table-hover">
	<thead>
		<tr>
			<th>시간</th>
			<th>종가</th>
			<th>전일비</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${ requestScope.kospiList }" var="kospi"
			varStatus="loop">
			<tr>
				<td>${ kospi.regDate }</td>
				<td>${ kospi.endPrice }</td>
				<td>${ kospi.variation }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>