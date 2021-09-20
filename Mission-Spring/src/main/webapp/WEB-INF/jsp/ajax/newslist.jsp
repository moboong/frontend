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
		<a href="javascript:void(0);" onclick="getNews('<c:out value="${ requestScope.keyword }"/>',6)"><i class="ti-angle-left"></i> </a>
		<a href="javascript:void(0);" onclick="getNews('<c:out value="${ requestScope.keyword }"/>',1)"><label class="badge badge-inverse-info">1</label></a>
		<a href="javascript:void(0);" onclick="getNews('<c:out value="${ requestScope.keyword }"/>',2)"><label class="badge badge-inverse-info">2</label></a>
		<a href="javascript:void(0);" onclick="getNews('<c:out value="${ requestScope.keyword }"/>',3)"><label class="badge badge-inverse-info">3</label></a>
		<a href="javascript:void(0);" onclick="getNews('<c:out value="${ requestScope.keyword }"/>',4)"><label class="badge badge-inverse-info">4</label></a>
		<a href="javascript:void(0);" onclick="getNews('<c:out value="${ requestScope.keyword }"/>',5)"><label class="badge badge-inverse-info">5</label></a>
		<a href="javascript:void(0);" onclick="getNews('<c:out value="${ requestScope.keyword }"/>',7)"> <i class="ti-angle-right"></i></a>
	</div>
</div>