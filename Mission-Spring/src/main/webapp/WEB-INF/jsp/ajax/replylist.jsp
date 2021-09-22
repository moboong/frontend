<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h6 class="h6">
	댓글 <label class="badge badge-lg bg-info">${ requestScope.replyList.size() }</label>
</h6>

<input type="hidden" name="writer" value="${ userVO.id }" />
<div class="table-responsive">
	<table class="table table-hover">
		
		<tr>
			<td width="10%">
				<div class="d-inline-block align-middle">
					<img
						src="${pageContext.request.contextPath}/display?fileName=profile/${ userVO.id }.png"
						alt="user image" class="img-radius img-40 align-top m-r-15">
					<div class="d-inline-block">
						<h6>${ userVO.id }</h6>
					</div>
				</div>
			</td>
			<td>
				<div class="col-sm-12">
					<textarea name="content" rows="5" cols="5" class="form-control"
						placeholder="댓글을 작성하세요"></textarea>
				</div>
			</td>
			<td width="15%">
				<button id="send" class="btn btn-info btn-round waves-effect waves-light" onclick="clickBtnReply('C',0)">댓글등록</button>
			</td>
		</tr>

		<c:forEach items="${ requestScope.replyList }" var="reply"
			varStatus="loop">
			<tr>
				<td>
					<div class="d-inline-block align-middle">
						<img
							src="${pageContext.request.contextPath}/display?fileName=profile/${ reply.writer }.png"
							alt="user image" class="img-radius img-40 align-top m-r-15">
						<div class="d-inline-block">
							<h6>${ reply.writer }</h6>
						</div>
					</div>
				</td>
				<td style="max-width: 500px;">
					<div class="col-sm-12">
						<p style="white-space: normal;">${ reply.content }</p>
					</div>
				</td>
				<td>
					<div class="col-sm-12">
						<h6>${ reply.regDate }</h6>
					</div>
					
					<div class="col-sm-12">		
						<button class="btn btn-inverse btn-round btn-mini waves-effect waves-light" onclick="clickBtnReply('R',${reply.no})">답글</button>
						<c:if test="${ sessionScope.userVO.id == reply.writer }">
							<button class="btn btn-primary btn-round btn-mini waves-effect waves-light" onclick="clickBtnReply('U',${reply.no})">수정</button>
							<button class="btn btn-danger btn-round btn-mini waves-effect waves-light" onclick="clickBtnReply('D',${reply.no})">삭제</button>					
						</c:if>
					</div>
				</td>
			</tr>
		</c:forEach>
		
	</table>
</div>