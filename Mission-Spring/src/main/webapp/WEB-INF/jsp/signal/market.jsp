<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>주가지수 시그널</title>
    <jsp:include page="/WEB-INF/jsp/include/head.jsp"></jsp:include>

      <script>
      
        let page = 1;
	 	
	 	function back() {
	 		if(page != 1){
	 			page = page - 1
	 		}
	 		$('#signalImg').attr('src', '${pageContext.request.contextPath}/assets/images/exchange/' + page + '.png')
		}
	 	function forward() {
	 		if(page != 14){
	 			page = page + 1
	 		}
	 		$('#signalImg').attr('src', '${pageContext.request.contextPath}/assets/images/exchange/' + page + '.png')
		}

        // 외국인 그래프
	    function changeChart(type) {
	 		
	    	$('#tab > li > a').attr('class','nav-link')
			$('#' + type + 'Tab > a').attr('class','nav-link active');
	    		
	    	jindo.$Element("dayGraph").hide();
	    	jindo.$Element("weekGraph").hide();
	    	jindo.$Element("oneMonthGraph").hide();
	    	jindo.$Element("threeMonthGraph").hide();

	    	jindo.$Element(type + "Graph").show();

	    }
	 	// 기준시 1990-08-26 21:48:00

      </script>
  </head>

  <body>
  <!-- Pre-loader start -->
  <jsp:include page="/WEB-INF/jsp/include/preloader.jsp"/>
  <!-- Pre-loader end -->
  <div id="pcoded" class="pcoded">
      <div class="pcoded-overlay-box"></div>
      <div class="pcoded-container navbar-wrapper">
          <!-- nav-top start -->
          <jsp:include page="/WEB-INF/jsp/include/navtop.jsp"/>
		  <!-- nav-top end -->
          <div class="pcoded-main-container">
              <div class="pcoded-wrapper">
                  <!-- nav-side start -->
                  <jsp:include page="/WEB-INF/jsp/include/navside.jsp"/>
                  <!-- nav-side end -->
                  
                  <!-- 해당 페이지 시작 -->
                  <div class="pcoded-content">
                      <!-- Page-header start -->
                      <div class="page-header">
                          <div class="page-block">
                              <div class="row align-items-center">
                                  <div class="col-md-8">
                                      <div class="page-header-title">
                                          <h5 class="m-b-10">주가지수 시그널</h5>
                                          <p class="m-b-0">Market Signal</p>
                                      </div>
                                  </div>
                                  <div class="col-md-4">
                                      <ul class="breadcrumb-title">
                                          <li class="breadcrumb-item">
                                              <a href="${pageContext.request.contextPath}"> <i class="fa fa-home"></i> </a>
                                          </li>
                                          <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/signal/market">주가지수시그널</a>
                                          </li>
                                      </ul>
                                  </div>
                              </div>
                          </div>
                      </div>
                      <!-- Page-header end -->
                        <div class="pcoded-inner-content">
                            <!-- Main-body start -->
                            <div class="main-body">
                                <div class="page-wrapper">
                                    <!-- Page-body start -->
                                    <div class="page-body">
                                        <!-- Inverse-color Breadcrumb card start -->
                                        <div class="card borderless-card">
                                            <div class="card-block inverse-breadcrumb">
                                                <div class="breadcrumb-header">
                                                    <h5>STEP 1 : 주가지수와 주가에 어떤 관계가 있는지 알아보기</h5>
                                                    <span>Stock Signal With Market</span>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Inverse-color Breadcrumb card end -->
                                        <div class="row">                                         
                                            <%-- <!--  sale analytics start -->
                                            <div class="col-xl-5 col-md-12">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h5>주가지수 시그널</h5>
                                                        <span class="text-muted">주가지수가 내 주식에 어떤 영향을 미치는 걸까?</span>
                                                        <div class="card-header-right">
                                                            <i class="fa fa-window-maximize full-card"></i>
                                                            <i class="fa fa-minus minimize-card"></i>
                                                            <i class="fa fa-refresh reload-card"></i>
                                                        </div>
                                                    </div>
                                                    <div class="card-block" style="min-height:400px; background-color:#D3F1EC">
                                                        <div style="max-height:500px;" class="row align-items-center">
                                                            <div class="container">
                                                                <img id="signalImg" src="${pageContext.request.contextPath}/assets/images/exchange/1.png" class="card-img rounded mx-auto d-block" style="max-height:500px; max-width:500px;">
                                                            </div>
                                                        </div>
                                                        <div style="position:absolute; top:55%; left:3%"><button class="btn waves-effect waves-dark btn-inverse btn-outline-inverse btn-icon" onclick="back();"><i class="ti-angle-double-left"></i></button></div>
                                                        <div style="position:absolute; top:55%; right:3%"><button class="btn waves-effect waves-dark btn-inverse btn-outline-inverse btn-icon" onclick="forward();"><i class="ti-angle-double-right"></i></button></div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- LINE CHART start -->
                                            <div class="col-xl-7 col-md-12">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h5>주가지수 - 코스피 상관관계</h5>
                                                        <span class="text-muted">실제 주가지수와 주가는 어떤 관계가 있는가?</span>
                                                        <div class="card-header-right">
                                                            <i class="fa fa-window-maximize full-card"></i>
                                                            <i class="fa fa-minus minimize-card"></i>
                                                            <i class="fa fa-refresh reload-card"></i>
                                                        </div>
                                                    </div>
                                                    <div class="card-block">
                                                        <div id="line-example"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- LINE CHART Ends --> --%>
                                        </div>

                                                    
                                        <!-- Inverse-color Breadcrumb card start -->
                                        <div class="card borderless-card">
                                            <div class="card-block inverse-breadcrumb">
                                                <div class="breadcrumb-header">
                                                    <h5>STEP 2 : 주가지수 실시간 동향 파악</h5>
                                                    <span>Stock Signal With Market</span>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Inverse-color Breadcrumb card end -->
                                        <div class="row">                                 

                                        </div>
                                        
                                        
                                        <!-- Inverse-color Breadcrumb card start 커스터마이징 시작 -->
                                        <div class="card borderless-card">
                                            <div class="card-block inverse-breadcrumb">
                                                <div class="breadcrumb-header">
                                                    <h5>STEP 3 : 주가지수와 함께 봐야할 시그널 지표들</h5>
                                                    <span>Stock Signal With Market</span> 
                                                </div>                                              
                                                <div class="col align-self-end" align="right" >
                                                    <button class="btn btn-primary btn-round waves-effect waves-light" type="button" id="btnAdd" data-toggle="modal" data-target=".bd-example-modal-lg" style="display:none;">지표 추가하기</button>                                                                                           
                                                    <button class="btn btn-primary btn-round waves-effect waves-light" id="btnCust" onclick="updateMenu();">수정하기</button>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Inverse-color Breadcrumb card end -->
                                        <div id="custompage" class="row">
                                        	
                                        </div>
                                    </div>
                                    <!-- Page-body end -->
                                </div>
                                <div id="styleSelector"> </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
	<jsp:include page="/WEB-INF/jsp/include/bottom.jsp"/>
	
	<script>
		$(document).ready(function() {
			$('#market').attr('class', 'active');
		})
	</script>
</body>

</html>