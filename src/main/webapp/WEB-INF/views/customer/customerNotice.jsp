<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>공지게시판</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- CSS파일 -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
	<link rel="stylesheet" href="/resources/css/free-board.css">
	<link rel="stylesheet" href="/resources/css/sidebar.css">	
</head>


<body>

	<%@include file="../mainheader.jsp" %>
	<div class="all-dim"></div>
	<div class="containerNew">
		<div class="board-page">
			<div class="row">
				<div class="col-md-2">
				
					<div class="sidebar sticky" id="cssmenu" style="position: relative;">
						<ul>
							<li class="mid"><a href="/customer"><span>고객센터</span></a></li>
							<li class="selected mid"><a href="/customerNotice"><span>공지사항</span></a></li>
							<li class="mid"><a href="/customerQna"><span>도움말</span></a></li>
							<li class="mid"><a href="/customerClaim/write"><span>1:1문의</span></a></li>
							<li><a href="/customerClaim/list"><span>Q&amp;A</span></a></li>
						</ul>
					</div>
					
					
					
				</div>
				<div class="col-md-10">
					<div class="free-board">
 							<div class="drop-nav">
								<h1 class="tit-h1 line">공지사항</h1>
							</div>
							<div class="m-drop-nav">
								<h1 class="m-drop-tit-title line" style="cursor: pointer;">공지사항 <i class="fas fa-angle-down"></i></h1>
							</div>
							<div class="m-drop-down">
								<h1 class="m-drop-tit-body first line" style="cursor: pointer;">
									<a href="/customer">고객센터</a>
								</h1>
								<h1 class="m-drop-tit-body line" style="cursor: pointer;">
									<a href="/customerNotice">공지사항</a>
								</h1>
								<h1 class="m-drop-tit-body line" style="cursor: pointer;">
									<a href="/customerQna">도움말</a>
								</h1>
								<h1 class="m-drop-tit-body line" style="cursor: pointer;">
									<a href="/customerClaim/write">1:1문의</a>
								</h1>														
								<h1 class="m-drop-tit-body line" style="cursor: pointer;">
									<a href="/customerClaim/list">Q&amp;A</a>
								</h1>
							</div>	

						<div class="board-type">
							<div class="board-free-nav">
									<c:if test="${loginUser.point le -1}">
										<p class="right"><a href="/customerNotice/write" class="board-write-btn fantasy">글쓰기</a></p>
									</c:if>										
							</div>
							<div class="tab-content" id="pills-tabContent">
								<!-- 전체글 -->
								<table class="board-free-table">
									<colgroup>
										<col width="8%">
										<col width="55%">
										<col width="10%">
										<col width="6%">
										<col width="6%">
										<col width="10%">
									</colgroup>
									<thead>
										<tr>
											<th class="no" scope="col">N0</th>
											<th class="title" scope="col">제목</th>
											<th class="writer" scope="col">작성자</th>
											<th class="views" scope="col">조회</th>
											<th class="likes" scope="col">추천</th>
											<th class="date" scope="col">작성일</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${boardList}" var="board">

											<c:if test="${board.bno eq 'customerNotice'}">
												<tr>
													<td class="board-no notice-icon"><span>공지</span></td>
													<!-- 글번호 -->

													<c:choose>
														<c:when test="${board.commentCount ne 0}">
															<td class="board-title"><a href="/customerNotice/detail?pno=${board.pno}">${board.title}</a>
															<b class="comment-num comment-num-web"><i class="far fa-comment-dots"></i>&nbsp;${board.commentCount}</b>
															</td>
															<td class="comment-num-m"><b class="comment-num"><i class="far fa-comment-dots"></i>&nbsp;${board.commentCount}</b></td>
															<!-- 글 제목 -->
														</c:when>
														<c:otherwise>
															<td class="board-title"><a href="/customerNotice/detail?pno=${board.pno}">${board.title}</a>
															</td>
														</c:otherwise>
													</c:choose>

													<td class="board-writer">${board.nickname}</td>
													<!-- 글쓴이 -->
													<td class="board-views"><span>조회 </span>${board.views}</td>
													<!-- 조회수 -->
													<td class="board-likes"><span>추천 </span>${board.likes}</td>
													<!-- 추천수 -->
													<fmt:formatDate value="${board.bdateTime}" var="time" pattern="MM/dd HH:mm" />
													<td class="board-date">${time}</td>
													<!-- 날짜 -->
												</tr>
											</c:if>
										</c:forEach>

									</tbody>
								</table>

								<!-- 페이징 -->
								<div class="paging">
									<c:if test="${loginUser.point le -1}">
										<p class="right"><a href="/customerNotice/write" class="board-write-btn fantasy">글쓰기</a></p>
									</c:if>								
									<div class="paging-body">
										<nav aria-label="..." class="pagination">
											<ul class="pagination">

												<c:if test="${boardPage.nowPage != 1}">
													<!-- << 버튼 -->
													<li>
														<a class="page-link" href="/customerNotice?bnowPage=1" tabindex="-1" aria-disabled="true">
															<i class="fas fa-angle-double-left"></i>
														</a>
													</li>
													<!-- 1페이지에서 < 버튼 눌렀을 때 -->
													<c:if test="${boardPage.nowPage == 1}">
														<li>
															<a class="page-link" href="/customerNotice?bnowPage=${boardPage.nowPage}" tabindex="-1"
																aria-disabled="true">
																<i class="fas fa-angle-left"></i>
															</a>
														</li>
													</c:if>
												</c:if>

												<!-- 1페이지가 아닌 페이지에서 < 버튼 눌렀을 때 -->
												<c:if test="${boardPage.nowPage != 1}">
													<li>
														<a class="page-link" href="/customerNotice?bnowPage=${boardPage.nowPage-1}" tabindex="-1"
															aria-disabled="true">
															<i class="fas fa-angle-left"></i>
														</a>
													</li>
												</c:if>

												<!-- 한번에 5개 페이지 보여줌 -->
												<c:forEach begin="${boardPage.startPage }" end="${boardPage.endPage }" var="p">
													<c:choose>
														<c:when test="${p == boardPage.nowPage}">
															<li class="page-item active" aria-current="page">
																<a class="page-link" href="#">${p}
																	<span class="sr-only">(current)</span>
																</a>
															</li>
														</c:when>
														<c:when test="${p != boardPage.nowPage}">
															<li class="page-item">
																<a class="page-link" href="/customerNotice?bnowPage=${p}">${p}</a>
															</li>
														</c:when>
													</c:choose>
												</c:forEach>



												<c:if test="${boardPage.nowPage != boardPage.lastPage}">
													<!-- 현재 페이지가 마지막 페이지일 경우 > 버튼을 눌렀을 때 -->
													<c:if test="${boardPage.nowPage == boardPage.lastPage}">
														<li>
															<a class="page-link" href="/customerNotice?bnowPage=${boardPage.nowPage}" tabindex="+1"
																aria-disabled="true">
																<i class="fas fa-angle-right"></i>
															</a>
														</li>
													</c:if>

													<!-- 현재 페이지가 마지막 페이지가 아닐 경우에 > 버튼을 눌렀을 때 -->
													<c:if test="${boardPage.nowPage != boardPage.lastPage}">
														<li>
															<a class="page-link" href="/customerNotice?bnowPage=${boardPage.nowPage+1}" tabindex="+1"
																aria-disabled="true" data-ajax="false">
																<i class="fas fa-angle-right"></i>
															</a>
														</li>
													</c:if>

													<!-- >> 버튼 -->
													<li>
														<a class="page-link" href="/customerNotice?bnowPage=${boardPage.lastPage}" tabindex="-1"
															aria-disabled="true">
															<i class="fas fa-angle-double-right"></i>
														</a>
													</li>

												</c:if>
											</ul>
										</nav>
									</div>
								</div>

								<div class="search-area">
									<div class="search-area-body">
										<form class="form-inline my-2 my-lg-0 underSearchForm" action="/customerNotice">
											<!-- <a class="nav-link dropdown-toggle" href="#" id="dropdown01"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">제목</a> -->
											<select class="dropdown-toggle-board" name="searchStyle">
												<option class="nav-link dropdown-toggle board-item" id="dropdown01" data-toggle="dropdown"
													aria-haspopup="true" aria-expanded="false" value="" <c:if test='${searchStyle eq ""}'>selected
													</c:if>>전체</option>
												<option class="dropdown-item board-item" value="search_title" <c:if
													test='${searchStyle eq "search_title"}'>selected</c:if>>제목</option>
												<option class="dropdown-item board-item" value="search_content" <c:if
													test='${searchStyle eq "search_content"}'>selected</c:if>>내용</option>
												<option class="dropdown-item board-item" value="search_title_content" <c:if
													test='${searchStyle eq "search_title_content"}'>selected</c:if>>제목 + 내용</option>
											</select>
											<span class="input-style">
											<input type="search" placeholder="검색어 입력"
												aria-label="Search" name="keyword">
											<button class="search" type="submit">
												<i class="fas fa-search"></i>
											</button>
											</span>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$(document).ready(
					function() {
						console.log("document ready!");

						var $sticky = $('.sticky');
						var $stickyrStopper = $('.search-area');
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
	</div>

	<!-- article end -->
	<%@include file="../mainfooter.jsp" %>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="/resources/jpaginate/jquery.twbsPagination.js" type="text/javascript"></script>

</html>