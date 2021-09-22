"use strict";
/* 메뉴 수정 후 구조 DB저장 */
var arr = [];
var idx = 0;

/* 나중에 다 분산 시키기 */
function updateMenu() {
	
	/* 모달 초기화 */
	$.ajax({
		type: 'GET',
		async: true,
		url: '/Mission-Spring/custom/pickrate',
		success: function(data) {
			$('#myModal').remove();
			$("body").append(data);
			console.log('GET 비동기 모달 로드 성공')
		},
		error: function() {
			console.log('GET 비동기 모달값 넣기 실패')
		}
	})
	/* 모달 초기화 */
	
	var icons = $("#custompage .card-header-right");

	if (icons.css('display') == 'none' || $("#btnCust").text() == '수정하기') {
		$("#btnAdd").css('display', 'inline-block');
		$("#btnCust").text('저장하기');
		icons.css('display', 'inline-block');
		$("#custompage").sortable({
			opacity: 0.5,
			distance: 50,
			//containment: "parent",
			cursor: "grabbing"
		});
		$("#custompage").sortable("option", "disabled", false);
		$("#custompage").disableSelection();
	} else {
		let yes = confirm('저장하시겠습니까?');
		if (yes == true) {
			$("#btnAdd").css('display', 'none');
			$("#btnCust").text('수정하기');
			icons.css('display', 'none');
			$("#custompage").sortable('disable');

			let resultList = new Array();
			let leng = $(".custcard").length
			for (let i = 0; i < leng; i++) {
				let str1 = $(".custcard").eq(i).attr('id');
				let str2 = $(".custcard").eq(i).attr('class');
				let data = new Object();
				data.no = str1;
				data.size = str2.substring(7, 9).trim();
				resultList.push(data);
			}
			let struct = JSON.stringify(resultList);
			console.log(struct);

			$.ajax({
				url: '/Mission-Spring/custom/userpage',
				type: 'POST',
				dataType: 'json',
				data: {
					"struct": struct
				}
				,
				success: function(msg) {
					alert(msg)
				}, error: function() {
					alert('POST 커스텀 메뉴 저장실패')
				}
			})
			
		}
	}
}

/* 나중에 다 분산 시키기 */
/* 그래프 추가 함수 */
function addGraph() {

	let graph = $('.custcard');
	let leng = graph.length;
	let value = $('input[name="checkbox_add"]:checked').val();
	let gid = value.substring(7, value.length);

	let bool = true;

	for (let i = 0; i < leng; i++) {
		if (gid == graph.eq(i).attr('id')) {
			bool = false;
		}
	}

	if (bool) {

		$.get("/Mission-Spring/custom/graph/" + value, function(data) {

			$("#custompage").append(data);

			/* 그래프 추가 후에 버튼 리스너 활성화 -> 리로드 겁나 비효율 */
			$("#" + gid + " .card-header-right").css('display', 'inline-block');
			$("#" + gid + " .card-header-right .plussize-card").on('click', function() {
				var $this = $(this);
				var size = $this.parents('.custcard');
				var str = size.attr('class');
				var num = Number(str.substring(7, 9));
				if (num < 12) {
					num += 2;
				}
				size.attr('class', 'col-xl-' + num + ' col-md-12 custcard');
			});
			$("#" + gid + " .card-header-right .minussize-card").on('click', function() {
				var $this = $(this);
				var size = $this.parents('.custcard');
				var str = size.attr('class');
				var num = Number(str.substring(7, 9));

				if (num > 4) {
					num -= 2;
				}
				size.attr('class', 'col-xl-' + num + ' col-md-12 custcard');
			});

			$("#" + gid + " .card-header-right .close-card").on('click', function() {
				var $this = $(this);
				$this.parents('.custcard').animate({
					'opacity': '0',
					'-webkit-transform': 'scale3d(.3, .3, .3)',
					'transform': 'scale3d(.3, .3, .3)'
				});

				setTimeout(function() {
					$this.parents('.custcard').remove();
				}, 800);
			});
			/* 리로드 */

		});

		$('#myModal').modal('hide')

	} else {

		alert('이미 추가한 지표입니다.');
	}

}

/* 나중에 다 분산 시키기 */
/* 뉴스 가져오기 함수 */
function getNews(pk, pp) {

	let keyword = pk;
	let page = pp;

	$.ajax({
		type: 'GET',
		async: true,
		url: '/Mission-Spring/news/' + keyword + '/' + page,
		success: function(data) {
			$("#news-table-body").html(data);
			console.log('GET 비동기 뉴스 받기 성공');
		},
		error: function() {
			console.log('GET 비동기 뉴스 받기 실패');
		}
	});

}

/* 나중에 다 분산 시키기 */
/* 뉴스 추가 모달 */
function showModal() {
	$('#newsModal').modal('show');
	$('input[name="keyword"]').val("");
}

/* 나중에 다 분산 시키기 */
/* 뉴스 키워드 메뉴 추가 */
function addKeyword() {
	
	let kw = $('input[name="keyword"]').val();
	if(kw == ""){
		alert('키워드를 입력하세요')
	} else {

		let bool = confirm('정말 저장하시겠습니까?');
		if(bool){
			$('#plusNav').remove();
				
			$('#newsNav').append('<li class="nav-item"><a class="nav-link" data-toggle="tab" href="javascript:void(0);" role="tab" onclick="getNews(\''+ kw +'\',1);">'+ kw +'</a><div class="slide"></div></li><li id="plusNav" class="nav-item"><a class="nav-link" data-toggle="tab" href="javascript:void(0);" role="tab" onclick="showModal();"><i class="fa fa-plus-square" aria-hidden="true"></i></a><div class="slide"></div></li>');
		}
		
		$('#newsModal').modal('hide')
		
	}
	
}

/* 이건 여기있기 전체 적용이니까, 이거랑 소켓 같은거 */
/* notice 가져오기 */
function getNotice() {
	
	$.ajax({
		type: 'GET',
		url: '/Mission-Spring/reply/notice',
		success: function(data) {
			$("#signalnotice").html(data);
			console.log('GET 비동기 notice 로드 성공')
		},
		error: function() {
			console.log('GET 비동기 notice 넣기 실패')
		}
	});
	
};


/* 나중에 다 분산 시키기 */
/* pw 체크 모달 */
function showPwcheckModal() {
	$('#pwcheckModal').modal('show');
	$('input[name="password"]').val("");
}



/* 핵심 중추 온레디 함수 */
$(document).ready(function() {
	
	//페이지 시작시 notice로드
	getNotice();
	//종 이벤트 등록 	
	$("#bell").on('click', function(){
		let $bell = $("#bell");
		if($bell.attr('class') == 'badge bg-c-red'){
			$bell.attr('class', 'bg-c-red');
		}
	});
	// card js start

	$(".card-header-right .close-card").on('click', function() {
		var $this = $(this);
		$this.parents('.custcard').animate({
			'opacity': '0',
			'-webkit-transform': 'scale3d(.3, .3, .3)',
			'transform': 'scale3d(.3, .3, .3)'
		});

		setTimeout(function() {
			$this.parents('.custcard').remove();
		}, 800);
	});
	$(".card-header-right .reload-card").on('click', function() {
		var $this = $(this);
		$this.parents('.card').addClass("card-load");
		$this.parents('.card').append('<div class="card-loader"><i class="fa fa-spinner rotate-refresh"></div>');
		setTimeout(function() {
			$this.parents('.card').children(".card-loader").remove();
			$this.parents('.card').removeClass("card-load");
		}, 3000);
	});
	$(".card-header-right .card-option .open-card-option").on('click', function() {
		var $this = $(this);
		if ($this.hasClass('fa-times')) {
			$this.parents('.card-option').animate({
				'width': '30px',
			});
			$(this).removeClass("fa-times").fadeIn('slow');
			$(this).addClass("fa-wrench").fadeIn('slow');
		} else {
			$this.parents('.card-option').animate({
				'width': '140px',
			});
			$(this).addClass("fa-times").fadeIn('slow');
			$(this).removeClass("fa-wrench").fadeIn('slow');
		}
	});
	$(".card-header-right .minimize-card").on('click', function() {
		var $this = $(this);
		var port = $($this.parents('.card'));
		var card = $(port).children('.card-block').slideToggle();
		$(this).toggleClass("fa-minus").fadeIn('slow');
		$(this).toggleClass("fa-plus").fadeIn('slow');
	});
	$(".card-header-right .full-card").on('click', function() {
		var $this = $(this);
		var port = $($this.parents('.card'));
		port.toggleClass("full-card");
		$(this).toggleClass("fa-window-restore");
	});

	$(".card-header-right .icofont-spinner-alt-5").on('mouseenter mouseleave', function() {
		$(this).toggleClass("rotate-refresh").fadeIn('slow');
	});
	$("#more-details").on('click', function() {
		$(".more-details").slideToggle(500);
	});
	$(".mobile-options").on('click', function() {
		$(".navbar-container .nav-right").slideToggle('slow');
	});
	$(".search-btn").on('click', function() {
		$(".main-search").addClass('open');
		$('.main-search .form-control').animate({
			'width': '200px',
		});
	});
	$(".search-close").on('click', function() {
		$('.main-search .form-control').animate({
			'width': '0',
		});
		setTimeout(function() {
			$(".main-search").removeClass('open');
		}, 300);
	});
	// $(".header-notification").on('click', function() {
	//     $(this).children('.show-notification').slideToggle(500);
	//     $(this).toggleClass('active');
	//
	// });

	$(document).ready(function() {
		$(".header-notification").click(function() {
			$(this).find(".show-notification").slideToggle(500);
			$(this).toggleClass('active');
		});
	});
	$(document).on("click", function(event) {
		var $trigger = $(".header-notification");
		if ($trigger !== event.target && !$trigger.has(event.target).length) {
			$(".show-notification").slideUp(300);
			$(".header-notification").removeClass('active');
		}
	});

	// card js end
	$.mCustomScrollbar.defaults.axis = "yx";
	$("#styleSelector .style-cont").slimScroll({
		setTop: "1px",
		height: "calc(100vh - 520px)",
	});
	$(".main-menu").mCustomScrollbar({
		setTop: "1px",
		setHeight: "calc(100% - 56px)",
	});
	/*chatbar js start*/
	/*chat box scroll*/
	var a = $(window).height() - 80;
	$(".main-friend-list").slimScroll({
		height: a,
		allowPageScroll: false,
		wheelStep: 5,
		color: '#1b8bf9'
	});

	// search
	$("#search-friends").on("keyup", function() {
		var g = $(this).val().toLowerCase();
		$(".userlist-box .media-body .chat-header").each(function() {
			var s = $(this).text().toLowerCase();
			$(this).closest('.userlist-box')[s.indexOf(g) !== -1 ? 'show' : 'hide']();
		});
	});

	// open chat box
	$('.displayChatbox').on('click', function() {
		var my_val = $('.pcoded').attr('vertical-placement');
		if (my_val == 'right') {
			var options = {
				direction: 'left'
			};
		} else {
			var options = {
				direction: 'right'
			};
		}
		$('.showChat').toggle('slide', options, 500);
	});

	//open friend chat
	$('.userlist-box').on('click', function() {
		var my_val = $('.pcoded').attr('vertical-placement');
		if (my_val == 'right') {
			var options = {
				direction: 'left'
			};
		} else {
			var options = {
				direction: 'right'
			};
		}
		$('.showChat_inner').toggle('slide', options, 500);
	});
	//back to main chatbar
	$('.back_chatBox').on('click', function() {
		var my_val = $('.pcoded').attr('vertical-placement');
		if (my_val == 'right') {
			var options = {
				direction: 'left'
			};
		} else {
			var options = {
				direction: 'right'
			};
		}
		$('.showChat_inner').toggle('slide', options, 500);
		$('.showChat').css('display', 'block');
	});
	$('.back_friendlist').on('click', function() {
		var my_val = $('.pcoded').attr('vertical-placement');
		if (my_val == 'right') {
			var options = {
				direction: 'left'
			};
		} else {
			var options = {
				direction: 'right'
			};
		}
		$('.p-chat-user').toggle('slide', options, 500);
		$('.showChat').css('display', 'block');
	});
	// /*chatbar js end*/

	$('[data-toggle="tooltip"]').tooltip();

	// wave effect js
	Waves.init();
	Waves.attach('.flat-buttons', ['waves-button']);
	Waves.attach('.float-buttons', ['waves-button', 'waves-float']);
	Waves.attach('.float-button-light', ['waves-button', 'waves-float', 'waves-light']);
	Waves.attach('.flat-buttons', ['waves-button', 'waves-float', 'waves-light', 'flat-buttons']);
});
$(document).ready(function() {
	$(".theme-loader").animate({
		opacity: "0"
	}, 1000);
	setTimeout(function() {
		$(".theme-loader").remove();
	}, 800);
});

// toggle full screen
function toggleFullScreen() {
	var a = $(window).height() - 10;

	if (!document.fullscreenElement && // alternative standard method
		!document.mozFullScreenElement && !document.webkitFullscreenElement) { // current working methods
		if (document.documentElement.requestFullscreen) {
			document.documentElement.requestFullscreen();
		} else if (document.documentElement.mozRequestFullScreen) {
			document.documentElement.mozRequestFullScreen();
		} else if (document.documentElement.webkitRequestFullscreen) {
			document.documentElement.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT);
		}
	} else {
		if (document.cancelFullScreen) {
			document.cancelFullScreen();
		} else if (document.mozCancelFullScreen) {
			document.mozCancelFullScreen();
		} else if (document.webkitCancelFullScreen) {
			document.webkitCancelFullScreen();
		}
	}
}

$('body').append('' +
	'<div class="fixed-button">' +
	'<a href="/Mission-Spring/board/write" class="btn btn-md btn-primary">' +
	'<i class="fa fa-commenting-o" aria-hidden="true"></i> 질문하러 가기' +
	'</a> ' +
	'</div>' +
	'');
var $window = $(window);
var nav = $('.fixed-button');
$window.scroll(function() {
	if ($window.scrollTop() >= 200) {
		nav.addClass('active');
	} else {
		nav.removeClass('active');
	}
});