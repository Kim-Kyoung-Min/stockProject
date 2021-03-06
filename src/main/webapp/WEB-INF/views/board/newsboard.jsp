<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>newsboard</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="resources/css/newboard.css">
<link rel="stylesheet" href="resources/css/newsA.css">
  <link rel="stylesheet" href="/resources/css/sidebar.css">

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".newsboard-nav-item").each(function() {
			$(this).click(function() {
				$(this).addClass("selected"); //클릭된 부분을 상단에 정의된 CCS인 selected클래스로 적용
				$(this).siblings().removeClass("selected"); //siblings:형제요소들,    removeClass:선택된 클래스의 특성을 없앰
			});
		});
/* 		$(function() {
			var sBtn = $("ul > li"); //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
			sBtn.find("a").click(function() { // sBtn에 속해 있는  a 찾아 클릭 하면.
				sBtn.removeClass("active"); // sBtn 속에 (active) 클래스를 삭제 한다.
				$(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
			})
		}) */
		$(function() {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : 35,
				visiblePages : 5,
				onPageClick : function(event, page) {
					console.info(page + ' (from options)');
				}
			}).on('page', function(event, page) {
				console.info(page + ' (from event listening)');
			});
		});
	});
</script>

<!-- <script type="text/javascript">
	var date = new Date();
	date.setDate(date.getDate());
	//var todayCnt = 0;
	var $datepick;
	$(document).ready(function() {
		$('.calendar').datepicker({
			format : 'yyyy.mm.dd',
			clearBtn : true,
			language : "ko",
			orientation : "bottom auto",
			autoclose : true,
			todayBtn : "linked",
			endDate : date,
		}).on('changeDate', function(ev) {
			//alert(ev)
			//console.log(ev.format())
			_year = ev.date.getFullYear()
			_month = ev.date.getMonth()
			_day = ev.date.getDate()
			_date = ev.format()
			console.log("changeDate() _date : " + _date)
			//console.log("test _date : " + endDate)
			//console.log(ev.format())
			$('#test-date').html(_date)

			showHideTomorrowBtn(ev.date, new Date());
		});

		setToday();
	});

	function showHideTomorrowBtn(checkDate, nowDate) {
		if (nowDate.getFullYear() > checkDate.getFullYear()) {
			$("#btn-tomorrow").show();
		} else {
			if (nowDate.getMonth() > checkDate.getMonth()) {
				$("#btn-tomorrow").show();
			} else {
				if (nowDate.getDate() > checkDate.getDate()) {
					$("#btn-tomorrow").show();
				} else {
					$("#btn-tomorrow").hide();
				}
			}
		}

	}

	function setToday() {
		console.log("setToday()")
		$('.calendar').datepicker('setDate', 'today');
		//$("#btn-tomorrow").hide();
		//todayCnt = 0;
		//showHideTomorrow();
		var nowDate = $(".calendar").datepicker('getDate');
		showHideTomorrowBtn(nowDate, nowDate);
	}
	function setTomorrow() {
		var nowDate = $(".calendar").datepicker('getDate');
		console.log("nowDate: " + nowDate)
		var tomorrowDate = new Date(nowDate.getFullYear(), nowDate.getMonth(),
				nowDate.getDate() + 1);
		$(".calendar").datepicker('setDate', tomorrowDate)
		//todayCnt++;
		//showHideTomorrow();
		showHideTomorrowBtn(tomorrowDate, new Date());
	}
	function setYesterday() {
		var nowDate = $(".calendar").datepicker('getDate');
		console.log("nowDate: " + nowDate)
		var yesterdayDate = new Date(nowDate.getFullYear(), nowDate.getMonth(),
				nowDate.getDate() - 1);
		$(".calendar").datepicker('setDate', yesterdayDate)
		//todayCnt--;

		//showHideTomorrow();
		showHideTomorrowBtn(yesterdayDate, new Date());
	}
</script> -->

</head>
<style>
.newsboard-nav-tab li{
	border-bottom: 1px solid #eaeaea;
	
}

.newsboard-nav-tab li.selected {
    z-index: 3;
    background: #fff;
    line-height: 50px;
    color: #5a6268 !important;
    border-bottom: 2px solid #1e78ff;
    font-weight: 600;
}
.newsboard-nav-tab li {
    width: 33.333%;
    letter-spacing: 1px;
}
@media only screen and (max-width: 979px) {
.newsboard-area {

    margin-bottom: 0;

}

} 
</style>
<body>
	
	<%@include file="../mainheader.jsp" %> 

	<!-- 전체메뉴 백그라운드-->
	<div class="all-dim"></div>


	<div class="containerNew">
		<div class="contents">
		<div class="row">
				<div class="col-md-2">
					<div class="sidebar sticky" id="cssmenu" style="position: relative;">
						<ul>	
							<li class="mid"><a href="/board/free"><span>자유게시판</span></a></li>
							<li><a href="/board/portfolio"><span>포트폴리오</span></a></li>
							<li class="selected last"><a href="/news"><span>오늘의 뉴스</span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-10">
				<div class="newsboard-area">
						<div class="drop-nav">
							<h1 class="tit-h1 line">오늘의 뉴스</h1>
						</div>
						<div class="m-drop-nav">
							<h1 class="m-drop-tit-title line" style="cursor: pointer;">오늘의 뉴스 <i class="fas fa-angle-down"></i></h1>
						</div>
						<div class="m-drop-down">
							<h1 class="m-drop-tit-body first line" style="cursor: pointer;">
								<a href="/board/free">자유게시판</a>
							</h1>
							<h1 class="m-drop-tit-body line" style="cursor: pointer;">
								<a href="/board/portfolio">포트폴리오</a>
							</h1>
							<h1 class="m-drop-tit-body line" style="cursor: pointer;">
								<a href="/news">오늘의 뉴스</a>
							</h1>
						</div>
				<div class="newsboard-nav">
					<ul class="nav newsboard-nav-tab" id="pills-tab" role="tablist">
						<li class="newsboard-nav-item selected" role="presentation"><a
							class="nav-link" id="top-nav-font" data-toggle="pill"
							href="#pills-home" role="tab" aria-controls="pills-home"
							aria-selected="true">실시간 속보</a></li>
						<li class="newsboard-nav-item" role="presentation"><a
							class="nav-link" id="top-nav-font" data-toggle="pill"
							href="#pills-profile" role="tab" aria-controls="pills-profile"
							aria-selected="false">시황 전망</a></li>
						<li class="newsboard-nav-item" role="presentation"><a
							class="nav-link" id="top-nav-font" data-toggle="pill"
							href="#pills-contact" role="tab" aria-controls="pills-contact"
							aria-selected="false" style="border-right: none;">기업 종목분석</a></li>
					</ul>
				</div>

<!-- 				<div class="board-calendar">
					
					<div class="week ">
						<p class="date">
							<button onclick="setYesterday();" class="prev-week">어제</button>
							<strong id="test-date" value="setToday();"></strong>
							<span class="input-group-addon"> <button type="button" class="calendar add-on">달력보기</button></span>
							<button type="button" onclick="setToday();" class="btn-s">오늘</button>
							<button onclick="setTomorrow();" class="next-week" id="btn-tomorrow">내일</button>
						</p>
					</div>
					//week
				</div> -->
				<!-- //board-calendar -->


				<div class="tab-content" id="pills-tabContent">
					<div class="tab-pane fade show active" id="pills-home"
						role="tabpanel" aria-labelledby="pills-home-tab">
						<ul class="realtimeNewsList" id="news1">
							<li class="newsList top"></li>
						</ul>
					
				</div>
					<div class="tab-pane fade" id="pills-profile" role="tabpanel"
							aria-labelledby="pills-profile-tab">
							<ul class="realtimeNewsList" id="news2">
								<li></li>
							</ul>
					</div>
				<div class="tab-pane fade" id="pills-contact" role="tabpanel"
						aria-labelledby="pills-contact-tab">
						<ul class="realtimeNewsList" id="news3">
							<li></li>
						</ul>
				</div>	
			</div>
		</div>
	</div>
	</div>
	</div>
</div>
				
	<%@include file="../mainfooter2.jsp"%>
<script type="text/javascript">
   $( document ).ready(function() {
	  console.log( "document ready!" );
			  
	  $.ajax({
			type : 'GET',
			url : '${pageContext.request.contextPath}/newsAjax',
			dataType : 'json',
			contentType : "application/x-www-form-urlencoded;chartset=UTF-8",
			success : function(data){ 
				var news1 = "";
				
				for(var i=0; i<data.news1.title.length; i++){
					
	
					news1 += 	'<dt class="thumb">'
					
					if(data.news1.img[i] != null) {
						news1 += "<a href='https://finance.naver.com"+data.news1.url[i]+"'>"
						news1 += 	"<img src='"+data.news1.img[i]+"'>"
						}
					else if(data.news1.img[i] == null){
						news1 += "<a href='https://finance.naver.com"+data.news1.url[i]+"'>"
					}
					
					news1 += '</a>'
					news1 += '</dt>'
					
	
					news1 += '<dd class="articleSubject">'
					news1 += 	"<a href='https://finance.naver.com"+data.news1.url[i]+"'>"+data.news1.title[i]+"</a>"	
					news1 += 	'</dd>'
					news1 += '<dd class="articleSummary">'
					news1 += 		data.news1.content[i]
					news1 += 		'<span class="press">'+data.news1.writer[i]+'</span>'
					news1 += 		'<span class="bar">|</span>'
					news1 += 		'<span class="wdate">'+data.news1.time[i]+'</span>'
					news1 += 	'</dd>'
				
				
				
				}
				$("#news1").html(news1);
				
				
				
				var news2 = "";
				
				for(var i=0; i<data.news2.title.length; i++){
					
	
					news2 += 	'<dt class="thumb">'
					
					if(data.news2.img[i] != null) {
						news2 += "<a href='https://finance.naver.com"+data.news2.url[i]+"'>"
						news2 += 	"<img src='"+data.news2.img[i]+"'>"
						}
					else if(data.news2.img[i] == null){
						news2 += "<a href='https://finance.naver.com"+data.news2.url[i]+"'>"
					}
					
					news2 += '</a>'
					news2 += '</dt>'
					
	
					news2 += '<dd class="articleSubject">'
					news2 += 	"<a href='https://finance.naver.com"+data.news2.url[i]+"'>"+data.news2.title[i]+"</a>"	
					news2 += 	'</dd>'
					news2 += '<dd class="articleSummary">'
					news2 += 		data.news2.content[i]
					news2 += 		'<span class="press">'+data.news2.writer[i]+'</span>'
					news2 += 		'<span class="bar">|</span>'
					news2 += 		'<span class="wdate">'+data.news2.time[i]+'</span>'
					news2 += 	'</dd>'
				
				
				
				}
				$("#news2").html(news2);
				
				
				var news3 = "";
				
				for(var i=0; i<data.news3.title.length; i++){
					
	
					news3 += 	'<dt class="thumb">'
					
					if(data.news3.img[i] != null) {
						news3 += "<a href='https://finance.naver.com"+data.news3.url[i]+"'>"
						news3 += 	"<img src='"+data.news3.img[i]+"'>"
						}
					else if(data.news3.img[i] == null){
						news3 += "<a href='https://finance.naver.com"+data.news3.url[i]+"'>"
					}
					
					news3 += '</a>'
					news3 += '</dt>'
					
	
					news3 += '<dd class="articleSubject">'
					news3 += 	"<a href='https://finance.naver.com"+data.news3.url[i]+"'>"+data.news3.title[i]+"</a>"	
					news3 += 	'</dd>'
					news3 += '<dd class="articleSummary">'
					news3 += 		data.news3.content[i]
					news3 += 		'<span class="press">'+data.news3.writer[i]+'</span>'
					news3 += 		'<span class="bar">|</span>'
					news3 += 		'<span class="wdate">'+data.news3.time[i]+'</span>'
					news3 += 	'</dd>'
				
				
				
				}
				$("#news3").html(news3);
				
				
			}
	  })
	  
	  
	  
		

	  
	  
	  
		  /* 
	  

	  $("#news2").html(`${news2}`);
	  var naverNewsLink2 = $("#news2 a").attr("href")
	  $("#news2 a").attr("href", "https://finance.naver.com"+naverNewsLink2)
	  $("#news2 a").attr("target", "_blank")
	  
	  $("#news3").html(`${news3}`);
	  var naverNewsLink3 = $("#news3 a").attr("href")
	  $("#news3 a").attr("href", "https://finance.naver.com"+naverNewsLink3)
	  $("#news3 a").attr("target", "_blank") */
	});
  </script>
  		<script type="text/javascript">
			$(document).ready(
					function() {
						console.log("document ready!");

						var $sticky = $('.sticky');
						var $stickyrStopper = $('.footer');
						if (!!$sticky.offset()) { // make sure ".sticky" element exists

							var generalSidebarHeight = $sticky.innerHeight();
							var stickyTop = $sticky.offset().top;
							var stickOffset = 0;
							var stickyStopperPosition = $stickyrStopper
									.offset().top;
							var stopPoint = stickyStopperPosition
									- generalSidebarHeight - stickOffset;
							var diff = stopPoint + stickOffset;

							$(window).scroll(
									function() { // scroll event
										var windowTop = $(window).scrollTop(); // returns number

										if (stopPoint < windowTop) {
											$sticky.css({
												position : 'relative',
												top : diff
											});
										} else if (stickyTop < windowTop
												+ stickOffset) {
											$sticky.css({
												position : 'fixed',
												top : stickOffset
											});
										} else {
											$sticky.css({
												position : 'relative',
												top : 'initial'
											});
										}
									});

						}
						$(".m-drop-nav").click(function() {
							$(".m-drop-down").slideToggle("slow");
						});
					});
		</script>
	<script src="resources/jpaginate/jquery.twbsPagination.js"></script>
	<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
	<script src="resources/js/bootstrap-datepicker.ko.min.js"></script>
	<!-- paginate -->
	<script src="resources/jpaginate/jquery.twbsPagination.js" type="text/javascript"></script>
	<!-- paginate -->
</body>
</html>