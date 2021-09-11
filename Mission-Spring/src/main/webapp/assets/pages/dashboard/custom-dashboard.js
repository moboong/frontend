'use strict';
$(document).ready(function() {

	var exchangeKospiData
	$.ajax({
		type: 'GET',
		async: false,
		url: '/Mission-Spring/show/exchange',
		success: function(data) {
			exchangeKospiData = JSON.parse(data)
			console.log('GET 환-코 전체 성공')
		}, 'error': function() {
			console.log('GET 환-코 전체 실패')
		}
	});
	
	var exchangeData
	$.ajax({
		type: 'GET',
		async: false,
		url: '/Mission-Spring/show/exchange/year',
		success: function(data) {
			exchangeData = JSON.parse(data);
			console.log('GET 환율1년 성공');
		}, 'error': function() {
			console.log('GET 환율1년 실패');
		}
	});


	/* 환율-코스피 그래프 */
	var chart = AmCharts.makeChart("exko-chart", {
		"type": "serial",
		"theme": "light",
		"hideCredits": true,
		"marginRight": 60,
		"marginLeft": 60,
		"autoMarginOffset": 20,
		"dataDateFormat": "YYYY-MM-DD",
		"valueAxes": [{
			"id": "v1",
			"axisColor": "#FF6600",
			"axisThickness": 2,
			"axisAlpha": 1,
			"position": "left",
			"ignoreAxisWidth": true
		}, {
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
			"id": "g1",
			"valueAxis": "v1",
			"balloon": {
				"drop": true,
				"adjustBorderColor": false,
				"color": "#ffffff",
				"type": "smoothedLine"
			},
			"fillAlphas": 0,
			"bullet": "round",
			"bulletBorderAlpha": 1,
			"bulletColor": "#FFFFFF",
			"lineColor": "#FF6600",
			"bulletSize": 5,
			"hideBulletsCount": 50,
			"lineThickness": 1.5,
			"title": "red line",
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
			"fillAlphas": 0,
			"bullet": "round",
			"bulletBorderAlpha": 1,
			"bulletColor": "#FFFFFF",
			"lineColor": "#30c15b",
			"bulletSize": 5,
			"hideBulletsCount": 50,
			"lineThickness": 1.5,
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
			"valueLineAlpha": 0.5
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
		"dataProvider": exchangeKospiData
	});


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
			"valueLineAlpha": 0.5
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


	var ctx = document.getElementById('this-month').getContext("2d");
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: avgvalchart('#11c15b', [30, 15, 25, 35, 30, 20, 25, 30, 15, 1], '#11c15b'),
		options: buildchartoption(),
	});
	function avgvalchart(a, b, f) {
		if (f == null) {
			f = "rgba(0,0,0,0)";
		}
		return {
			labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October"],
			datasets: [{
				label: "",
				borderColor: a,
				borderWidth: 2,
				hitRadius: 30,
				pointHoverRadius: 4,
				pointBorderWidth: 50,
				pointHoverBorderWidth: 12,
				pointBackgroundColor: Chart.helpers.color("#000000").alpha(0).rgbString(),
				pointBorderColor: Chart.helpers.color("#000000").alpha(0).rgbString(),
				pointHoverBackgroundColor: a,
				pointHoverBorderColor: Chart.helpers.color("#000000").alpha(.1).rgbString(),
				fill: true,
				backgroundColor: f,
				data: b,
			}]
		};
	}
	function buildchartoption() {
		return {
			title: {
				display: !1
			},
			tooltips: {
				position: 'nearest',
				mode: 'index',
				intersect: false,
				yPadding: 10,
				xPadding: 10,
			},
			legend: {
				display: !1,
				labels: {
					usePointStyle: !1
				}
			},
			responsive: !0,
			maintainAspectRatio: !0,
			hover: {
				mode: "index"
			},
			scales: {
				xAxes: [{
					display: !1,
					gridLines: !1,
					scaleLabel: {
						display: !0,
						labelString: "Month"
					}
				}],
				yAxes: [{
					display: !1,
					gridLines: !1,
					scaleLabel: {
						display: !0,
						labelString: "Value"
					},
					ticks: {
						beginAtZero: !0
					}
				}]
			},
			elements: {
				point: {
					radius: 4,
					borderWidth: 12
				}
			},
			layout: {
				padding: {
					left: 0,
					right: 0,
					top: 0,
					bottom: 0
				}
			}
		};
	}
	// sale analytics end


});
