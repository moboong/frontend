<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<!-- Required Jquery -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-ui/jquery-ui.min.js "></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/popper.js/popper.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap/js/bootstrap.min.js "></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/pages/widget/excanvas.js "></script>
    <!-- waves js -->
    <script src="${pageContext.request.contextPath}/assets/pages/waves/js/waves.min.js"></script>
    <!-- jquery slimscroll js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-slimscroll/jquery.slimscroll.js "></script>
    <!-- modernizr js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/modernizr/modernizr.js "></script>
    <!-- slimscroll js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/SmoothScroll.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.mCustomScrollbar.concat.min.js "></script>
    <!-- Chart js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/chart.js/Chart.js"></script>
    <!-- amchart js -->
    <script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
    <script src="${pageContext.request.contextPath}/assets/pages/widget/amchart/gauge.js"></script>
    <script src="${pageContext.request.contextPath}/assets/pages/widget/amchart/serial.js"></script>
    <script src="${pageContext.request.contextPath}/assets/pages/widget/amchart/light.js"></script>
    <script src="${pageContext.request.contextPath}/assets/pages/widget/amchart/pie.min.js"></script>
    <script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
    <!-- menu js -->
    <script src="${pageContext.request.contextPath}/assets/js/pcoded.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/vertical-layout.min.js "></script>
    <!-- notification js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap-growl.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/pages/notification/notification.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/script.js "></script>

<jsp:include page="/WEB-INF/jsp/modal/msgalert.jsp" />   
<script>
	    if ('${ msg }') {
			$('#msgModalBody').html('${ msg }');
			$('#msgModal').modal('show'); 
		}
</script>    
    
<script>
var socket = null;
$(document).ready(function() {
	connectWS();
});

function connectWS() {
	var ws = new WebSocket("ws://localhost:9999/Mission-Spring/replyEcho");
	socket = ws;
		
	ws.onopen = function() {
		console.log('Info: WebSocket connection opened.');
	};
	
	ws.onmessage = function(event) {
		console.log("RecieveMessage:", event.data + '\n');
		//notify(nFrom, nAlign, nIcons, nType, nAnimIn, nAnimOut, title, message);
		notify("top", "center", "fa fa-comments", "inverse", "animated fadeInRight", "animated fadeOutRight", "<알림> : ", event.data);
		//종 울리기
		$('#bell').attr('class', 'badge bg-c-red')
		//notice 리스트 리로드
		getNotice();
	};
	
	ws.onclose = function(event) {
		console.log('Info: WebSocket connection closed.');
		//setTimeout(function() { connect(); }, 1000); // retry connection!!
	};
	ws.onerror = function(err) {
		console.log('Error: ', err);
	};
};
</script>