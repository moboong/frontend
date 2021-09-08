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
											<th class="text-right">연관성 분석</th>
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
											<td class="text-right">${ pickrateVO.g1 }% 
												<c:choose>
													<c:when test="${ pickrateVO.g1 <= 30 }">
														<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ pickrateVO.g1 > 30 and pickrateVO.g1 <= 70 }">
														<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose></td>
											<td class="text-right">??%
												<c:choose>
													<c:when test="${ pickrateVO.g1 <= 30 }">
														<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ pickrateVO.g1 > 30 and pickrateVO.g1 <= 70 }">
														<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
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
											<td class="text-right">${ pickrateVO.g2 }%
												<c:choose>
													<c:when test="${ pickrateVO.g2 <= 30 }">
														<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ pickrateVO.g2 > 30 and pickrateVO.g2 <= 70 }">
														<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
											<td class="text-right">??%
												<c:choose>
													<c:when test="${ pickrateVO.g2 <= 30 }">
														<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ pickrateVO.g2 > 30 and pickrateVO.g2 <= 70 }">
														<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
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
											<td class="text-right">${ pickrateVO.g3 }%
												<c:choose>
													<c:when test="${ pickrateVO.g3 <= 30 }">
														<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ pickrateVO.g3 > 30 and pickrateVO.g3 <= 70 }">
														<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
											<td class="text-right">??%
												<c:choose>
													<c:when test="${ pickrateVO.g3 <= 30 }">
														<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ pickrateVO.g3 > 30 and pickrateVO.g3 <= 70 }">
														<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
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
											<td class="text-right">${ pickrateVO.g4 }%
												<c:choose>
													<c:when test="${ pickrateVO.g4 <= 30 }">
														<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ pickrateVO.g4 > 30 and pickrateVO.g4 <= 70 }">
														<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
											<td class="text-right">??%
												<c:choose>
													<c:when test="${ pickrateVO.g4 <= 30 }">
														<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ pickrateVO.g4 > 30 and pickrateVO.g4 <= 70 }">
														<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
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
											<td class="text-right">${ pickrateVO.g5 }%
												<c:choose>
													<c:when test="${ pickrateVO.g5 <= 30 }">
														<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ pickrateVO.g5 > 30 and pickrateVO.g5 <= 70 }">
														<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
											<td class="text-right">??%
												<c:choose>
													<c:when test="${ pickrateVO.g5 <= 30 }">
														<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ pickrateVO.g5 > 30 and pickrateVO.g5 <= 70 }">
														<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
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
											<td class="text-right">${ pickrateVO.g6 }%
												<c:choose>
													<c:when test="${ pickrateVO.g6 <= 30 }">
														<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ pickrateVO.g6 > 30 and pickrateVO.g6 <= 70 }">
														<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
											<td class="text-right">??%
												<c:choose>
													<c:when test="${ pickrateVO.g6 <= 30 }">
														<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ pickrateVO.g6 > 30 and pickrateVO.g6 <= 70 }">
														<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
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
											<td class="text-right">${ pickrateVO.g7 }%
												<c:choose>
													<c:when test="${ pickrateVO.g7 <= 30 }">
														<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ pickrateVO.g7 > 30 and pickrateVO.g7 <= 70 }">
														<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
											<td class="text-right">??%
												<c:choose>
													<c:when test="${ pickrateVO.g7 <= 30 }">
														<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ pickrateVO.g7 > 30 and pickrateVO.g7 <= 70 }">
														<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
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
											<td class="text-right">${ pickrateVO.g8 }%
												<c:choose>
													<c:when test="${ pickrateVO.g8 <= 30 }">
														<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ pickrateVO.g8 > 30 and pickrateVO.g8 <= 70 }">
														<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
											<td class="text-right">??%
												<c:choose>
													<c:when test="${ pickrateVO.g9 <= 30 }">
														<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ pickrateVO.g9 > 30 and pickrateVO.g9 <= 70 }">
														<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
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
											<td class="text-right">${ pickrateVO.g9 }%
												<c:choose>
													<c:when test="${ pickrateVO.g9 <= 30 }">
														<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ pickrateVO.g9 > 30 and pickrateVO.g9 <= 70 }">
														<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
											<td class="text-right">??%
												<c:choose>
													<c:when test="${ pickrateVO.g9 <= 30 }">
														<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ pickrateVO.g9 > 30 and pickrateVO.g9 <= 70 }">
														<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
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