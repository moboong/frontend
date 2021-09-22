<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="pwcheckModal" class="modal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">비밀번호 확인</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form method="post" class="form-material">
				<div class="modal-body">

					<div class="form-group form-primary">
						<input type="password" name="password" class="form-control"
							required="required"> <span class="form-bar"></span> <label
							class="float-label"><i class="fa fa-search m-r-10"></i>패스워드를
							입력하세요</label>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
					<button type="submit" class="btn btn-primary">입력</button>
				</div>
			</form>
		</div>
	</div>
</div>