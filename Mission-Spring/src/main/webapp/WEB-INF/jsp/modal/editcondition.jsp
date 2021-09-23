<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="editModal" class="modal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">조건 변경</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form class="form-material">
				<div class="modal-body">
					<input type="hidden" name="no">
					<div class="form-group form-primary">
						<input type="number" name="top" class="form-control"
							required="required"> <span class="form-bar"></span> <label
							class="float-label"><i class="fa fa-search m-r-10"></i>몇회차 이상 지속될 시에 알림을 보내겠습니까?</label>
					</div>
					<div class="form-group form-primary">
						<input type="number" name="var" class="form-control"
							required="required"> <span class="form-bar"></span> <label
							class="float-label"><i class="fa fa-search m-r-10"></i>얼마 이상의 수치를 위험으로 간주할까요?
							</label>
					</div>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
					<button type="button" onclick="editCondition();" class="btn btn-primary">입력</button>
				</div>
			</form>
		</div>
	</div>
</div>