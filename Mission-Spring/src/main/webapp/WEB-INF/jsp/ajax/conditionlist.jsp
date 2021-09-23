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

			<c:forEach items="${ requestScope.conditionList }" var="condition"
				varStatus="loop">
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">${ condition.code }</label>
					<div class="col-sm-10">
						<h5 id="presentCondition">${ condition.top }회차연속전일대비${ condition.var }이상의
							변동을 보일 때</h5>
						<button type="button"
							class="btn waves-effect waves-light btn-primary"
							onclick="editModalShow(${ condition.no });">조건 수정 모달 on
						</button>

						<button type="button" id="${ condition.no }"
							onclick="insertAndCheck(${ condition.type },${ condition.top },${ condition.var });"
							class="btn waves-effect waves-light btn-primary">
							삽입-체크하기(insertOne)</button>
					</div>
				</div>
			</c:forEach>

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
			<div class="align-middle m-b-30">
				<img src="/Mission-Spring/assets/images/avatar-2.jpg"
					alt="user image" class="img-radius img-40 align-top m-r-15">
				<div class="d-inline-block">
					<h6>David Jones</h6>
					<p class="text-muted m-b-0">Developer</p>
				</div>
			</div>
			<div class="align-middle m-b-30">
				<img src="/Mission-Spring/assets/images/avatar-1.jpg"
					alt="user image" class="img-radius img-40 align-top m-r-15">
				<div class="d-inline-block">
					<h6>David Jones</h6>
					<p class="text-muted m-b-0">Developer</p>
				</div>
			</div>
			<div class="align-middle m-b-30">
				<img src="/Mission-Spring/assets/images/avatar-3.jpg"
					alt="user image" class="img-radius img-40 align-top m-r-15">
				<div class="d-inline-block">
					<h6>David Jones</h6>
					<p class="text-muted m-b-0">Developer</p>
				</div>
			</div>
			<div class="align-middle m-b-30">
				<img src="/Mission-Spring/assets/images/avatar-4.jpg"
					alt="user image" class="img-radius img-40 align-top m-r-15">
				<div class="d-inline-block">
					<h6>David Jones</h6>
					<p class="text-muted m-b-0">Developer</p>
				</div>
			</div>
			<div class="align-middle m-b-10">
				<img src="/Mission-Spring/assets/images/avatar-5.jpg"
					alt="user image" class="img-radius img-40 align-top m-r-15">
				<div class="d-inline-block">
					<h6>David Jones</h6>
					<p class="text-muted m-b-0">Developer</p>
				</div>
			</div>
			<div class="text-center">
				<a href="#!" class="b-b-primary text-primary">View all Projects</a>
			</div>
		</div>
		<div class="card-footer">
			<div class="text-right">
				<hr>
			</div>
		</div>
	</div>
</div>