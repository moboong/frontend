$(document).ready(function() {

	/* 환율-코스피 데이터 */
	var exchangeKospiData
	$.ajax({
		type: 'GET',
		async: false,
		url: '/Mission-Spring/show/exchange',
		success: function(data) {
			exchangeKospiData = JSON.parse(data)
			console.log('ready: GET 환-코 전체 성공')
		}, 'error': function() {
			console.log('ready: GET 환-코 전체 실패')
		}
	});
	
	/* 환율 데이터 */
	var exchangeData
	$.ajax({
		type: 'GET',
		async: false,
		url: '/Mission-Spring/show/exchange/year',
		success: function(data) {
			exchangeData = JSON.parse(data);
			console.log('ready: GET 환율1년 성공');
		}, 'error': function() {
			console.log('ready: GET 환율1년 실패');
		}
	});


	/* 환율-코스피 그래프 */
	var chart = AmCharts.makeChart("exko-chart", {
		"type": "serial",
		"theme": "light",
		"hideCredits": true,
		"marginRight": 80,
		"marginLeft": 80,
		"autoMarginOffset": 20,
		"dataDateFormat": "YYYY-MM-DD",
		"valueAxes": [{
			"title": "코스피",
			"id": "v1",
			"axisColor": "#FF6600",
			"axisThickness": 2,
			"axisAlpha": 1,
			"position": "left",
			"ignoreAxisWidth": true
		}, {
			"title": "미국달러",
			"id": "v2",
			"axisColor": "#30c15b",
			"axisThickness": 2,
			"axisAlpha": 1,
			"position": "right",
			"ignoreAxisWidth": true
		}],
		"balloon": {
			"borderThickness": 1,
			"shadowAlpha": 0
		},
		"graphs": [{
			"title": "미국달러-코스피",
			"id": "g1",
			"valueAxis": "v1",
			"balloon": {
				"drop": true,
				"adjustBorderColor": false,
				"color": "#ffffff",
				"type": "smoothedLine"
			},
			"fillAlphas": 0.1,
			"bullet": "round",
			"bulletBorderAlpha": 1,
			"bulletColor": "#FFFFFF",
			"lineColor": "#FF6600",
			"bulletSize": 5,
			"hideBulletsCount": 50,
			"lineThickness": 1.5,
			"title": "코스피",
			"useLineColorForBulletBorder": true,
			"valueField": "endPrice",
			"balloonText": "<span style='font-size:18px;'>[[value]]</span>"
		}, {
			"id": "g2",
			"valueAxis": "v2",
			"balloon": {
				"drop": true,
				"adjustBorderColor": false,
				"color": "#ffffff",
				"type": "smoothedLine"
			},
			"fillAlphas": 0.2,
			"bullet": "round",
			"bulletBorderAlpha": 1,
			"bulletColor": "#FFFFFF",
			"lineColor": "#30c15b",
			"bulletSize": 5,
			"hideBulletsCount": 50,
			"lineThickness": 1.5,
			"title": "미국달러환율",
			"useLineColorForBulletBorder": true,
			"valueField": "stdRate",
			"balloonText": "<span style='font-size:18px;'>[[value]]</span>"
		}],
		"chartCursor": {
			"valueLineEnabled": true,
			"valueLineBalloonEnabled": true,
			"cursorAlpha": 0,
			"zoomable": false,
			"valueZoomable": true,
			"valueLineAlpha": 0.5,
			"categoryBalloonDateFormat": "YYYY-MM-DD"
		},
		"chartScrollbar": {
			"autoGridCount": true,
			"graph": "g2",
			"oppositeAxis": true,
			"scrollbarHeight": 90
		},
		"categoryField": "regDate",
		"categoryAxis": {
			"parseDates": true,
			"dateFormats": [{ "period": "YYYY", "format": "YYYY" }, { "period": 'MM', "format": 'YYYY/MM' }, { "period": "DD", "format": "MM/DD" }],
			"equalSpacing": true,
			"dashLength": 1,
			"minorGridEnabled": true
		},
		"export": {
			"enabled": true
		},
		 "legend": {
    		"useGraphSettings": true
  		},
		"dataProvider": exchangeKospiData
	});
	console.log('변수 chart (환-코차트) : ', chart)


	/* 환율 단독 그래프 */
	var chart2 = AmCharts.makeChart("exchange-chart", {
		"type": "serial",
		"theme": "light",
		"hideCredits": true,
		"marginRight": 40,
		"marginLeft": 60,
		"autoMarginOffset": 20,
		"dataDateFormat": "YYYY-MM-DD",
		"valueAxes": [{
			"id": "v1",
			"axisAlpha": 0,
			"position": "left",
			"ignoreAxisWidth": true
		}],
		"balloon": {
			"borderThickness": 1,
			"shadowAlpha": 0
		},
		"graphs": [{
			"id": "g1",
			"balloon": {
				"drop": true,
				"adjustBorderColor": false,
				"color": "#ffffff",
				"type": "smoothedLine"
			},
			"fillAlphas": 0.5,
			"bullet": "round",
			"bulletBorderAlpha": 1,
			"bulletColor": "#FFFFFF",
			"lineColor": "#11c15b",
			"bulletSize": 5,
			"hideBulletsCount": 50,
			"lineThickness": 3,
			"title": "red line",
			"useLineColorForBulletBorder": true,
			"valueField": "stdRate",
			"balloonText": "<span style='font-size:18px;'>[[value]]</span>"
		}],
		"chartCursor": {
			"valueLineEnabled": true,
			"valueLineBalloonEnabled": true,
			"cursorAlpha": 0,
			"zoomable": false,
			"valueZoomable": true,
			"valueLineAlpha": 0.5,
			"categoryBalloonDateFormat": "YYYY-MM-DD"
		},
		"chartScrollbar": {
			"autoGridCount": true,
			"graph": "g1",
			"oppositeAxis": true,
			"scrollbarHeight": 90
		},
		"categoryField": "regDate",
		"categoryAxis": {
			"parseDates": true,
			"dateFormats": [{ "period": "YYYY", "format": "YYYY" }, { "period": 'MM', "format": 'YYYY/MM' }, { "period": "DD", "format": "MM/DD" }],
			"equalSpacing": true,
			"dashLength": 1,
			"minorGridEnabled": true
		},
		"export": {
			"enabled": true
		},
		"dataProvider": exchangeData
	});
	console.log('변수 chart2 (환율차트) : ', chart2)


});