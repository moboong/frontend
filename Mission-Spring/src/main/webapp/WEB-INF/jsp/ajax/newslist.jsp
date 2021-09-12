<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="card-block" style="max-height: 650px; overflow-y: auto;">
	<div class="table-responsive">
		<table class="table table-hover">			
			
			<thead>
				<tr>
					<th>최근 업데이트 시간 : </th>
					<th><c:out value="${ requestScope.latestTime }"/></th>
				</tr>
			</thead>
			<tbody>
			
				<c:forEach items="${ requestScope.newsList }" var="news" varStatus="loop">
					<tr>
						<td><img
							src="<c:out value="${ news.imgSrc }"/>"
							alt="user image" class="img-100 align-top m-r-15"></td>
						<td>
							<div class="d-inline-block align-middle">
								<div class="d-inline-block">
									<h4>
										<a href="<c:out value="${ news.link }"/>" target="_blank">
											<c:out value="${ news.title }"/>
										</a>
									</h4>					
									<p class="text-muted m-b-0"><c:out value="${ news.contents }"/></p>
								</div>
							</div>
						</td>
					</tr>
				</c:forEach>
			
			</tbody>
		</table>
	</div>
</div>
<div class="card-footer">
	<div class="text-center">
		<a href="javascript:void(0);" class="b-b-primary text-primary" onclick="getNews('<c:out value="${ requestScope.keyword }"/>',1)">1</a>
		<a href="javascript:void(0);" class="b-b-primary text-primary" onclick="getNews('<c:out value="${ requestScope.keyword }"/>',2)">2</a>
		<a href="javascript:void(0);" class="b-b-primary text-primary" onclick="getNews('<c:out value="${ requestScope.keyword }"/>',3)">3</a>
		<a href="javascript:void(0);" class="b-b-primary text-primary" onclick="getNews('<c:out value="${ requestScope.keyword }"/>',4)">4</a>
		<a href="javascript:void(0);" class="b-b-primary text-primary" onclick="getNews('<c:out value="${ requestScope.keyword }"/>',5)">5</a>
	</div>
</div>