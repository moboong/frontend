<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-xl-7 col-md-12">
	<div class="card">
		<div class="card-header">
			<h5>실시간 데이터 알림 설정</h5>
			<lable>인메모리 영역(실시간)</lable>

		</div>
		<div class="card-block">
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>지표종류</th>
							<th>알림조건</th>
							<th class="text-right">조건 수정</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ requestScope.conditionList }" var="condition"
							varStatus="loop">
						<tr>
							<td>
								<div class="chk-option d-inline-block">
									<div class="checkbox-fade fade-in-primary">
										<label class="check-task"> <input type="checkbox"
											value=""> <span class="cr"> <i
												class="cr-icon fa fa-check txt-default"></i>
										</span>
										</label>
									</div>
								</div>
								<div class="d-inline-block">
										<h5>${ condition.code }</h5>
										<p class="text-muted m-b-0">exchange signal</p>
									</div>
								
							</td>
							<td>
								<h6 style="font-size: 17px;" id="presentCondition">${ condition.top }회차연속 전일대비 ${ condition.var }이상의
								변동을 보일 때</h6>
							</td>
							<td class="text-right">
								<button type="button"
								class="btn waves-effect waves-light btn-primary"
								onclick="editModalShow(${ condition.no });">알림 조건 수정</button>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="card-footer">
			<div class="text-right">
				<hr>
			</div>
		</div>
	</div>
</div>


<div class="col-xl-5 col-md-12">
	<div class="card">
		<div class="card-header">
			<h5>알림 현황</h5>

		</div>
		<div class="card-block">
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>지표종류</th>
							<th>시작시간</th>
							<th>감지 횟수</th>
							<th class="text-right">Priority</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ requestScope.conditionList }" var="condition"
							varStatus="loop">
						<tr>
							<td>
								<div class="d-inline-block">
									<h6>${ condition.code }</h6>
									<p class="text-muted m-b-0">exchange signal</p>
								</div>
							</td>
							<td>
								09:00
							</td>
							<td>5회</td>
							<td class="text-right">
								<label class="label label-success">medium</label>
							</td>
						</tr>
						</c:forEach>
					</tbody>
					<!-- 
					<td class="text-right"><label class="label label-primary">high</label></td>
					<td class="text-right"><label class="label label-success">medium</label></td>
					<td class="text-right"><label class="label label-danger">Low</label></td>
					 -->
				</table>
			</div>
		</div>
		<div class="card-footer">
			<div class="text-right">
				<hr>
			</div>
		</div>
	</div>
</div>