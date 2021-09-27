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
														<label class="check-task"> <input type="radio"
															value="example1" name="checkbox_add" <c:if test="${ corelateVO.g1 == -1 }">disabled="disabled"</c:if>> <span
															class="cr" <c:if test="${ corelateVO.g1 == -1 }">style="border-color: #EEEEEE"</c:if>> <i
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
											<td class="text-right">
												<c:choose>
													<c:when test="${ corelateVO.g1 == -1 }">
														<label class="label label-inverse">이미 추가됨</label>
													</c:when>
													<c:when test="${ pickrateVO.g1 <= 30 }">
														${ pickrateVO.g1 }% <label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ pickrateVO.g1 > 30 and pickrateVO.g1 <= 70 }">
														${ pickrateVO.g1 }% <label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														${ pickrateVO.g1 }% <label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose></td>
											<td class="text-right">
												<c:choose>
													<c:when test="${ corelateVO.g1 == -1 }">														
														<label class="label label-inverse">이미 추가됨</label>
													</c:when>
													<c:when test="${ corelateVO.g1 <= 30 }">
														<c:out value="${ corelateVO.g1 }"/>%
														<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ corelateVO.g1 > 30 and corelateVO.g1 <= 70 }">
														<c:out value="${ corelateVO.g1 }"/>%
														<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														<c:out value="${ corelateVO.g1 }"/>%
														<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td>
												<div class="chk-option">
													<div class="checkbox-fade fade-in-primary">
														<label class="check-task"> <input type="radio"
															value="example2" name="checkbox_add" <c:if test="${ corelateVO.g2 == -1 }">disabled="disabled"</c:if>> <span
															class="cr" <c:if test="${ corelateVO.g2 == -1 }">style="border-color: #EEEEEE"</c:if>> <i
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
											<td class="text-right">
												<c:choose>
													<c:when test="${ corelateVO.g2 == -1 }">														
														<label class="label label-inverse">이미 추가됨</label>
													</c:when>
													<c:when test="${ pickrateVO.g2 <= 30 }">
														${ pickrateVO.g2 }%<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ pickrateVO.g2 > 30 and pickrateVO.g2 <= 70 }">
														${ pickrateVO.g2 }%<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														${ pickrateVO.g2 }%<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
											<td class="text-right">
												<c:choose>
													<c:when test="${ corelateVO.g2 == -1 }">														
														<label class="label label-inverse">이미 추가됨</label>
													</c:when>
													<c:when test="${ corelateVO.g2 <= 30 }">
														<c:out value="${ corelateVO.g2 }"/>%
														<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ corelateVO.g2 > 30 and corelateVO.g2 <= 70 }">
														<c:out value="${ corelateVO.g2 }"/>%
														<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														<c:out value="${ corelateVO.g2 }"/>%
														<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td>
												<div class="chk-option">
													<div class="checkbox-fade fade-in-primary">
														<label class="check-task"> <input type="radio"
															value="example3" name="checkbox_add" <c:if test="${ corelateVO.g3 == -1 }">disabled="disabled"</c:if>> <span
															class="cr" <c:if test="${ corelateVO.g3 == -1 }">style="border-color: #EEEEEE"</c:if>> <i
																class="cr-icon fa fa-check txt-default"></i>
														</span>
														</label>
													</div>
												</div>
												<div class="d-inline-block align-middle">

													<div class="d-inline-block">
														<h6>국고채(3년) 금리 지표</h6>
														<p class="text-muted m-b-0"></p>
													</div>
												</div>
											</td>
											<td><i class="fa fa-bar-chart fa-2x"></i></td>
											<td><a href="#!">같이 봐야하는 이유</a></td>
											<td class="text-right">
												<c:choose>
													<c:when test="${ corelateVO.g3 == -1 }">														
														<label class="label label-inverse">이미 추가됨</label>
													</c:when>
													<c:when test="${ pickrateVO.g3 <= 30 }">
														${ pickrateVO.g3 }%<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ pickrateVO.g3 > 30 and pickrateVO.g3 <= 70 }">
														${ pickrateVO.g3 }%<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														${ pickrateVO.g3 }%<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
											<td class="text-right">
												<c:choose>
													<c:when test="${ corelateVO.g3 == -1 }">														
														<label class="label label-inverse">이미 추가됨</label>
													</c:when>
													<c:when test="${ corelateVO.g3 <= 30 }">
														<c:out value="${ corelateVO.g3 }"/>%
														<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ corelateVO.g3 > 30 and corelateVO.g3 <= 70 }">
														<c:out value="${ corelateVO.g3 }"/>%
														<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														<c:out value="${ corelateVO.g3 }"/>%
														<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td>
												<div class="chk-option">
													<div class="checkbox-fade fade-in-primary">
														<label class="check-task"> <input type="radio"
															value="example4" name="checkbox_add" <c:if test="${ corelateVO.g4 == -1 }">disabled="disabled"</c:if>> <span
															class="cr" <c:if test="${ corelateVO.g4 == -1 }">style="border-color: #EEEEEE"</c:if>> <i
																class="cr-icon fa fa-check txt-default"></i>
														</span>
														</label>
													</div>
												</div>
												<div class="d-inline-block align-middle">

													<div class="d-inline-block">
														<h6>회사채(3년) 금리 지표</h6>
														<p class="text-muted m-b-0"></p>
													</div>
												</div>
											</td>
											<td><i class="fa fa-line-chart fa-2x"></i></td>
											<td><a href="#!">같이 봐야하는 이유</a></td>
											<td class="text-right">
												<c:choose>
													<c:when test="${ corelateVO.g4 == -1 }">														
														<label class="label label-inverse">이미 추가됨</label>
													</c:when>
													<c:when test="${ pickrateVO.g4 <= 30 }">
														${ pickrateVO.g4 }%<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ pickrateVO.g4 > 30 and pickrateVO.g4 <= 70 }">
														${ pickrateVO.g4 }%<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														${ pickrateVO.g4 }%<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
											<td class="text-right">
												<c:choose>
													<c:when test="${ corelateVO.g4 == -1 }">														
														<label class="label label-inverse">이미 추가됨</label>
													</c:when>
													<c:when test="${ corelateVO.g4 <= 30 }">
														<c:out value="${ corelateVO.g4 }"/>%
														<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ corelateVO.g4 > 30 and corelateVO.g4 <= 70 }">
														<c:out value="${ corelateVO.g4 }"/>%
														<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														<c:out value="${ corelateVO.g4 }"/>%
														<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td>
												<div class="chk-option">
													<div class="checkbox-fade fade-in-primary">
														<label class="check-task"> <input type="radio"
															value="example5" name="checkbox_add" <c:if test="${ corelateVO.g5 == -1 }">disabled="disabled"</c:if>> <span
															class="cr" <c:if test="${ corelateVO.g5 == -1 }">style="border-color: #EEEEEE"</c:if>> <i
																class="cr-icon fa fa-check txt-default"></i>
														</span>
														</label>
													</div>
												</div>
												<div class="d-inline-block align-middle">

													<div class="d-inline-block">
														<h6>KODEX 200선물인버스2X</h6>
														<p class="text-muted m-b-0"></p>
													</div>
												</div>
											</td>
											<td><i class="fa fa-pie-chart fa-2x"></i></td>
											<td><a href="#!">같이 봐야하는 이유</a></td>
											<td class="text-right">
												<c:choose>
													<c:when test="${ corelateVO.g5 == -1 }">														
														<label class="label label-inverse">이미 추가됨</label>
													</c:when>
													<c:when test="${ pickrateVO.g5 <= 30 }">
														${ pickrateVO.g5 }%<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ pickrateVO.g5 > 30 and pickrateVO.g5 <= 70 }">
														${ pickrateVO.g5 }%<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														${ pickrateVO.g5 }%<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
											<td class="text-right">
												<c:choose>
													<c:when test="${ corelateVO.g5 == -1 }">														
														<label class="label label-inverse">이미 추가됨</label>
													</c:when>
													<c:when test="${ corelateVO.g5 <= 30 }">
														<c:out value="${ corelateVO.g5 }"/>%
														<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ corelateVO.g5 > 30 and corelateVO.g5 <= 70 }">
														<c:out value="${ corelateVO.g5 }"/>%
														<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														<c:out value="${ corelateVO.g5 }"/>%
														<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td>
												<div class="chk-option">
													<div class="checkbox-fade fade-in-primary">
														<label class="check-task"> <input type="radio"
															value="example6" name="checkbox_add" <c:if test="${ corelateVO.g6 == -1 }">disabled="disabled"</c:if>> <span
															class="cr" <c:if test="${ corelateVO.g6 == -1 }">style="border-color: #EEEEEE"</c:if>> <i
																class="cr-icon fa fa-check txt-default"></i>
														</span>
														</label>
													</div>
												</div>
												<div class="d-inline-block align-middle">

													<div class="d-inline-block">
														<h6>일본JPY(100엔)</h6>
														<p class="text-muted m-b-0"></p>
													</div>
												</div>
											</td>
											<td><i class="fa fa-bar-chart fa-2x"></i></td>
											<td><a href="#!">같이 봐야하는 이유</a></td>
											<td class="text-right">
												<c:choose>
													<c:when test="${ corelateVO.g6 == -1 }">														
														<label class="label label-inverse">이미 추가됨</label>
													</c:when>
													<c:when test="${ pickrateVO.g6 <= 30 }">
														${ pickrateVO.g6 }%<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ pickrateVO.g6 > 30 and pickrateVO.g6 <= 70 }">
														${ pickrateVO.g6 }%<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														${ pickrateVO.g6 }%<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
											<td class="text-right">
												<c:choose>
													<c:when test="${ corelateVO.g6 == -1 }">														
														<label class="label label-inverse">이미 추가됨</label>
													</c:when>
													<c:when test="${ corelateVO.g6 <= 30 }">
														<c:out value="${ corelateVO.g6 }"/>%
														<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ corelateVO.g6 > 30 and corelateVO.g6 <= 70 }">
														<c:out value="${ corelateVO.g6 }"/>%
														<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														<c:out value="${ corelateVO.g6 }"/>%
														<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td>
												<div class="chk-option">
													<div class="checkbox-fade fade-in-primary">
														<label class="check-task"> <input type="radio"
															value="example7" name="checkbox_add" <c:if test="${ corelateVO.g7 == -1 }">disabled="disabled"</c:if>> <span
															class="cr" <c:if test="${ corelateVO.g7 == -1 }">style="border-color: #EEEEEE"</c:if>> <i
																class="cr-icon fa fa-check txt-default"></i>
														</span>
														</label>
													</div>
												</div>
												<div class="d-inline-block align-middle">

													<div class="d-inline-block">
														<h6>유럽연합EUR</h6>
														<p class="text-muted m-b-0"></p>
													</div>
												</div>
											</td>
											<td><i class="fa fa-line-chart fa-2x"></i></td>
											<td><a href="#!">같이 봐야하는 이유</a></td>
											<td class="text-right">
												<c:choose>
													<c:when test="${ corelateVO.g7 == -1 }">														
														<label class="label label-inverse">이미 추가됨</label>
													</c:when>
													<c:when test="${ pickrateVO.g7 <= 30 }">
														${ pickrateVO.g7 }%<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ pickrateVO.g7 > 30 and pickrateVO.g7 <= 70 }">
														${ pickrateVO.g7 }%<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														${ pickrateVO.g7 }%<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
											<td class="text-right">
												<c:choose>
													<c:when test="${ corelateVO.g7 == -1 }">														
														<label class="label label-inverse">이미 추가됨</label>
													</c:when>
													<c:when test="${ corelateVO.g7 <= 30 }">
														<c:out value="${ corelateVO.g7 }"/>%
														<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ corelateVO.g7 > 30 and corelateVO.g7 <= 70 }">
														<c:out value="${ corelateVO.g7 }"/>%
														<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														<c:out value="${ corelateVO.g7 }"/>%
														<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td>
												<div class="chk-option">
													<div class="checkbox-fade fade-in-primary">
														<label class="check-task"> <input type="radio"
															value="example8" name="checkbox_add" <c:if test="${ corelateVO.g8 == -1 }">disabled="disabled"</c:if>> <span
															class="cr" <c:if test="${ corelateVO.g8 == -1 }">style="border-color: #EEEEEE"</c:if>> <i
																class="cr-icon fa fa-check txt-default"></i>
														</span>
														</label>
													</div>
												</div>
												<div class="d-inline-block align-middle">

													<div class="d-inline-block">
														<h6>중국CNY</h6>
														<p class="text-muted m-b-0"></p>
													</div>
												</div>
											</td>
											<td><i class="fa fa-bar-chart fa-2x"></i></td>
											<td><a href="#!">같이 봐야하는 이유</a></td>
											<td class="text-right">
												<c:choose>
													<c:when test="${ corelateVO.g8 == -1 }">														
														<label class="label label-inverse">이미 추가됨</label>
													</c:when>
													<c:when test="${ pickrateVO.g8 <= 30 }">
														${ pickrateVO.g8 }%<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ pickrateVO.g8 > 30 and pickrateVO.g8 <= 70 }">
														${ pickrateVO.g8 }%<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														${ pickrateVO.g8 }%<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
											<td class="text-right">
												<c:choose>
													<c:when test="${ corelateVO.g8 == -1 }">														
														<label class="label label-inverse">이미 추가됨</label>
													</c:when>
													<c:when test="${ corelateVO.g8 <= 30 }">
														<c:out value="${ corelateVO.g8 }"/>%
														<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ corelateVO.g8 > 30 and corelateVO.g8 <= 70 }">
														<c:out value="${ corelateVO.g8 }"/>%
														<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														<c:out value="${ corelateVO.g8 }"/>%
														<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td>
												<div class="chk-option">
													<div class="checkbox-fade fade-in-primary">
														<label class="check-task"> <input type="radio"
															value="example9" name="checkbox_add" <c:if test="${ corelateVO.g9 == -1 }">disabled="disabled"</c:if>> <span
															class="cr" <c:if test="${ corelateVO.g9 == -1 }">style="border-color: #EEEEEE"</c:if>> <i
																class="cr-icon fa fa-check txt-default"></i>
														</span>
														</label>
													</div>
												</div>
												<div class="d-inline-block align-middle">

													<div class="d-inline-block">
														<h6>콜금리</h6>
														<p class="text-muted m-b-0"></p>
													</div>
												</div>
											</td>
											<td><i class="fa fa-table fa-2x"></i></td>
											<td><a href="#!">같이 봐야하는 이유</a></td>
											<td class="text-right">
												<c:choose>
													<c:when test="${ corelateVO.g9 == -1 }">														
														<label class="label label-inverse">이미 추가됨</label>
													</c:when>
													<c:when test="${ pickrateVO.g9 <= 30 }">
														${ pickrateVO.g9 }%<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ pickrateVO.g9 > 30 and pickrateVO.g9 <= 70 }">
														${ pickrateVO.g9 }%<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														${ pickrateVO.g9 }%<label class="label label-danger">High</label>
													</c:otherwise>
												</c:choose>
											</td>
											<td class="text-right">
												<c:choose>
													<c:when test="${ corelateVO.g9 == -1 }">														
														<label class="label label-inverse">이미 추가됨</label>
													</c:when>
													<c:when test="${ corelateVO.g9 <= 30 }">
														<c:out value="${ corelateVO.g9 }"/>%
														<label class="label label-primary">low</label>
													</c:when>
													<c:when test="${ corelateVO.g9 > 30 and corelateVO.g9 <= 70 }">
														<c:out value="${ corelateVO.g9 }"/>%
														<label class="label label-success">medium</label>
													</c:when>
													<c:otherwise>
														<c:out value="${ corelateVO.g9 }"/>%
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