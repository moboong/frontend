<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="newsModal" class="modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">키워드 입력</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
	        <form class="form-material">
	           	<div class="form-group form-primary">
	              	<input type="text" name="keyword" class="form-control" required="required">
	              	<span class="form-bar"></span>
	              	<label class="float-label"><i class="fa fa-search m-r-10"></i>키워드를 입력하세요</label>
	           	</div>
	        </form>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" onclick="addKeyword()">저장하기</button>
      </div>
    </div>
  </div>
</div>