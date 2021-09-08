<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Modal -->
<div id="myModal" class="modal fade bd-example-modal-lg" tabindex="-1"
	role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">추가할 지표 목록</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<!--  project and team member start -->
				<div class="col-xl-12 col-md-12">
					<div class="card table-card">
						<div class="card-block">
							<div class="table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>지표이름</th>
											<th>지표유형</th>
											<th>시그널 요약</th>
											<th class="text-right">지표 선택율</th>
											<th class="text-right">상관성 분석</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>
												<div class="chk-option">
													<div class="checkbox-fade fade-in-primary">
														<label class="check-task"> <input type="checkbox"
															value="example1" name="checkbox_add"> <span
															class="cr"> <i
																class="cr-icon fa fa-check txt-default"></i>
														</span>
														</label>
													</div>
												</div>
												<div class="d-inline-block align-middle">

													<div class="d-inline-block">
														<h6>외국인 매도세</h6>
														<p class="text-muted m-b-0"></p>
													</div>
												</div>
											</td>
											<td><i class="fa fa-bar-chart fa-2x"></i></td>
											<td><a href="#!">같이 봐야하는 이유</a></td>
											<td class="text-right">76%</td>
											<td class="text-right"><label class="label label-danger">High</label></td>
										</tr>
										<tr>
											<td>
												<div class="chk-option">
													<div class="checkbox-fade fade-in-primary">
														<label class="check-task"> <input type="checkbox"
															value="example2" name="checkbox_add"> <span
															class="cr"> <i
																class="cr-icon fa fa-check txt-default"></i>
														</span>
														</label>
													</div>
												</div>
												<div class="d-inline-block align-middle">

													<div class="d-inline-block">
														<h6>수출입동향 지표</h6>
														<p class="text-muted m-b-0"></p>
													</div>
												</div>
											</td>
											<td><i class="fa fa-table fa-2x"></i></td>
											<td><a href="#!">같이 봐야하는 이유</a></td>
											<td class="text-right">43%</td>
											<td class="text-right"><label
												class="label label-success">medium</label></td>
										</tr>
										<tr>
											<td>
												<div class="chk-option">
													<div class="checkbox-fade fade-in-primary">
														<label class="check-task"> <input type="checkbox"
															value="example3" name="checkbox_add"> <span
															class="cr"> <i
																class="cr-icon fa fa-check txt-default"></i>
														</span>
														</label>
													</div>
												</div>
												<div class="d-inline-block align-middle">

													<div class="d-inline-block">
														<h6>sample 3</h6>
														<p class="text-muted m-b-0"></p>
													</div>
												</div>
											</td>
											<td><i class="fa fa-bar-chart fa-2x"></i></td>
											<td><a href="#!">같이 봐야하는 이유</a></td>
											<td class="text-right">68%</td>
											<td class="text-right"><label class="label label-danger">High</label></td>
										</tr>
										<tr>
											<td>
												<div class="chk-option">
													<div class="checkbox-fade fade-in-primary">
														<label class="check-task"> <input type="checkbox"
															value="example4" name="checkbox_add"> <span
															class="cr"> <i
																class="cr-icon fa fa-check txt-default"></i>
														</span>
														</label>
													</div>
												</div>
												<div class="d-inline-block align-middle">

													<div class="d-inline-block">
														<h6>sample 4</h6>
														<p class="text-muted m-b-0"></p>
													</div>
												</div>
											</td>
											<td><i class="fa fa-line-chart fa-2x"></i></td>
											<td><a href="#!">같이 봐야하는 이유</a></td>
											<td class="text-right">16%</td>
											<td class="text-right"><label
												class="label label-primary">low</label></td>
										</tr>
										<tr>
											<td>
												<div class="chk-option">
													<div class="checkbox-fade fade-in-primary">
														<label class="check-task"> <input type="checkbox"
															value="example5" name="checkbox_add"> <span
															class="cr"> <i
																class="cr-icon fa fa-check txt-default"></i>
														</span>
														</label>
													</div>
												</div>
												<div class="d-inline-block align-middle">

													<div class="d-inline-block">
														<h6>sample 5</h6>
														<p class="text-muted m-b-0"></p>
													</div>
												</div>
											</td>
											<td><i class="fa fa-pie-chart fa-2x"></i></td>
											<td><a href="#!">같이 봐야하는 이유</a></td>
											<td class="text-right">50%</td>
											<td class="text-right"><label
												class="label label-success">medium</label></td>
										</tr>
										<tr>
											<td>
												<div class="chk-option">
													<div class="checkbox-fade fade-in-primary">
														<label class="check-task"> <input type="checkbox"
															value="example6" name="checkbox_add"> <span
															class="cr"> <i
																class="cr-icon fa fa-check txt-default"></i>
														</span>
														</label>
													</div>
												</div>
												<div class="d-inline-block align-middle">

													<div class="d-inline-block">
														<h6>sample 6</h6>
														<p class="text-muted m-b-0"></p>
													</div>
												</div>
											</td>
											<td><i class="fa fa-bar-chart fa-2x"></i></td>
											<td><a href="#!">같이 봐야하는 이유</a></td>
											<td class="text-right">12%</td>
											<td class="text-right"><label
												class="label label-primary">low</label></td>
										</tr>
										<tr>
											<td>
												<div class="chk-option">
													<div class="checkbox-fade fade-in-primary">
														<label class="check-task"> <input type="checkbox"
															value="example7" name="checkbox_add"> <span
															class="cr"> <i
																class="cr-icon fa fa-check txt-default"></i>
														</span>
														</label>
													</div>
												</div>
												<div class="d-inline-block align-middle">

													<div class="d-inline-block">
														<h6>sample 7</h6>
														<p class="text-muted m-b-0"></p>
													</div>
												</div>
											</td>
											<td><i class="fa fa-line-chart fa-2x"></i></td>
											<td><a href="#!">같이 봐야하는 이유</a></td>
											<td class="text-right">46%</td>
											<td class="text-right"><label
												class="label label-success">medium</label></td>
										</tr>
										<tr>
											<td>
												<div class="chk-option">
													<div class="checkbox-fade fade-in-primary">
														<label class="check-task"> <input type="checkbox"
															value="example8" name="checkbox_add"> <span
															class="cr"> <i
																class="cr-icon fa fa-check txt-default"></i>
														</span>
														</label>
													</div>
												</div>
												<div class="d-inline-block align-middle">

													<div class="d-inline-block">
														<h6>sample 8</h6>
														<p class="text-muted m-b-0"></p>
													</div>
												</div>
											</td>
											<td><i class="fa fa-bar-chart fa-2x"></i></td>
											<td><a href="#!">같이 봐야하는 이유</a></td>
											<td class="text-right">22%</td>
											<td class="text-right"><label
												class="label label-primary">low</label></td>
										</tr>
										<tr>
											<td>
												<div class="chk-option">
													<div class="checkbox-fade fade-in-primary">
														<label class="check-task"> <input type="checkbox"
															value="example9" name="checkbox_add"> <span
															class="cr"> <i
																class="cr-icon fa fa-check txt-default"></i>
														</span>
														</label>
													</div>
												</div>
												<div class="d-inline-block align-middle">

													<div class="d-inline-block">
														<h6>sample 9</h6>
														<p class="text-muted m-b-0"></p>
													</div>
												</div>
											</td>
											<td><i class="fa fa-table fa-2x"></i></td>
											<td><a href="#!">같이 봐야하는 이유</a></td>
											<td class="text-right">6%</td>
											<td class="text-right"><label
												class="label label-primary">low</label></td>
										</tr>

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!--  project and team member end -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" onclick="addGraph()">지표
					추가하기</button>
			</div>
		</div>
	</div>
</div>
<!-- Modal -->