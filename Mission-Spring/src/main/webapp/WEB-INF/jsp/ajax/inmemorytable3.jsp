<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table table-hover">
	<thead>
		<tr>
			<th>시간</th>
			<th>개인투자자</th>
			<th>외국인투자자</th>
			<th>기관투자자</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${ requestScope.foreignList }" var="foreign"
			varStatus="loop">
			<tr>
				<td>${ foreign.regDate }</td>
				<td>${ foreign.retail }</td>
				<td>${ foreign.foreigns }</td>
				<td>${ foreign.institutional }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>