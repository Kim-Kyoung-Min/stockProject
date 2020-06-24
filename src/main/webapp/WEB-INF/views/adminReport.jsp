 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
  <meta name="generator" content="Jekyll v4.0.1">
  <title>관리자페이지</title>




    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
   <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/dashboard/">
<script src="http://code.jquery.com/jquery-latest.min.js" ></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<!-- 데이터테이블스타일 -->
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
 
<!--  스타일-->
  <link href="/resources/css/datatable.css" rel="stylesheet" />
        
<!-- 통합관리자 -->
 <link rel="stylesheet" href="/resources/css/admin.css">


  <style type="text/css">

  </style>

</head>

<body class="sb-nav-fixed">



    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!--    로고들어감 -->
        			<a href="/mainPage" class="navbar-logo">
			<img class="" id="logo"
				src="/resources/img/finalogo.png">
				</a> 
        <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i
                class="fas fa-bars"></i></button>




        <!-- Navbar 모바일 미디어 드롭메뉴- 사람아이콘 누르면 -->
        <ul class="navbar-nav ml-auto mr-md-0">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                    <a class="dropdown-item" href="/mainPage">로그아웃</a>
                </div>
            </li>
        </ul>



    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark"">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <a class="nav-link" href="/admin/main">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
             			               관리자페이지
                        </a>

                        <a class="nav-link" href="/admin/qna">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
         				                   문의
                        </a>
                        <a class="nav-link" href="/admin/report">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                         		   신고
                        </a>
                    </div>
                </div>
                

                
                
                
            </nav>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid">


                    <div class="card mb-4 tableBox">
                        <div class="card-header tableTitle ">
                        <h4>신고관리</h4>
                        
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">

                                
                                <!-- 신고테이블 시작 -->
                  
                                <table class="table table-bordered" width="100%" cellspacing="0">
                                    <!-- 테이블 데이터 헤더 -->
                                    <thead>
                                        <tr>
                                            <th class="center" style="width: 10%;">신고 종류</th>
                                            <th class="center"style="width: 10%">처리현황</th>
                                            <th style="width: 25%">제목</th>
                                            <th style="width: 35%">내용</th>
                                            <th class="center" style="width: 10%">신고자 아이디</th>
                                            <th class="center" style="width: 10%">신고 일시</th>
                                        </tr>
                                    </thead>
                                    <!--  데이터값 들어가는 곳 -->
                                    <tbody>
                                       <c:forEach items="${reportList}" var="re" varStatus="status">
	                                       <tr>
	                                       		<c:if test="${re.rtype eq 'RP001'}"><td class="center">광고</td></c:if>
	                                       		<c:if test="${re.rtype eq 'RP002'}"><td class="center">욕설</td></c:if>
	                                       		<c:if test="${re.rtype eq 'RP003'}"><td class="center">허위루머</td></c:if>
	                                       		<c:if test="${re.rtype eq 'RP004'}"><td class="center">타종목추천</td></c:if>
	                                       		<c:if test="${re.rtype eq 'RP005'}"><td class="center">도배</td></c:if>
	                                       		<c:if test="${re.rtype eq 'RP006'}"><td class="center">명예훼손</td></c:if>
	                                       		<c:if test="${re.rtype eq 'RP007'}"><td class="center">주제무관</td></c:if>
	                                       		<c:if test="${re.rtype eq 'RP008'}"><td class="center">위조변조</td></c:if>
	                                       		<c:if test="${re.rtype eq 'RP009'}"><td class="center">음란</td></c:if>
	                                       		<c:if test="${re.rtype eq 'RP010'}"><td class="center">지역감정</td></c:if>
	                                       		<c:if test="${re.rtype eq 'RP011'}"><td class="center">기타</td></c:if>
	                                            <td class="center">???</td>
	                                            <td><p class="content">${re.title}</p></td>
	                                            <td><p class="content">${re.rcontent}</p></td>
	                                            <td class="center">${re.nickname}</td>
	                                            <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${re.rdatetime}"/></td>
	                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <!-- 신고테이블끝 -->
								<!-- 페이징 -->
								<div class="paging">
									<c:if test="${reportPage.total gt 10}">
										<div class="paging-body">
											<nav aria-label="..." class="pagination">
												<ul class="pagination">
													<c:if test="${reportPage.nowPage != 1}">
														<!-- << 버튼 -->
														<li><a class="page-link"
															href="/admin/report?bnowPage=1" tabindex="-1"
															aria-disabled="true"> <i
																class="fas fa-angle-double-left"></i>
														</a></li>
														<!-- 1페이지에서 < 버튼 눌렀을 때 -->
														<c:if test="${reportPage.nowPage == 1}">
															<li><a class="page-link"
																href="/admin/report?bnowPage=${boardPage.nowPage}"
																tabindex="-1" aria-disabled="true"> <i
																	class="fas fa-angle-left"></i>
															</a></li>
														</c:if>
													</c:if>

													<!-- 1페이지가 아닌 페이지에서 < 버튼 눌렀을 때 -->
													<c:if test="${reportPage.nowPage != 1}">
														<li><a class="page-link"
															href="/admin/report?bnowPage=${reportPage.nowPage-1}"
															tabindex="-1" aria-disabled="true"> <i
																class="fas fa-angle-left"></i>
														</a></li>
													</c:if>

													<!-- 한번에 5개 페이지 보여줌 -->
													<c:forEach begin="${reportPage.startPage }"
														end="${reportPage.endPage }" var="p">
														<c:choose>
															<c:when test="${p == reportPage.nowPage}">
																<li class="page-item active" aria-current="page"><a
																	class="page-link" href="#">${p} <span
																		class="sr-only">(current)</span>
																</a></li>
															</c:when>
															<c:when test="${p != reportPage.nowPage}">
																<li class="page-item"><a class="page-link"
																	href="/admin/report?bnowPage=${p}">${p}</a></li>
															</c:when>
														</c:choose>
													</c:forEach>



													<c:if test="${reportPage.nowPage != reportPage.lastPage}">
														<!-- 현재 페이지가 마지막 페이지일 경우 > 버튼을 눌렀을 때 -->
														<c:if test="${reportPage.nowPage == reportPage.lastPage}">
															<li><a class="page-link"
																href="/admin/report?bnowPage=${reportPage.nowPage}"
																tabindex="+1" aria-disabled="true"> <i
																	class="fas fa-angle-right"></i>
															</a></li>
														</c:if>

														<!-- 현재 페이지가 마지막 페이지가 아닐 경우에 > 버튼을 눌렀을 때 -->
														<c:if test="${reportPage.nowPage != reportPage.lastPage}">
															<li><a class="page-link"
																href="/admin/report?bnowPage=${reportPage.nowPage+1}"
																tabindex="+1" aria-disabled="true" data-ajax="false">
																	<i class="fas fa-angle-right"></i>
															</a></li>
														</c:if>

														<!-- >> 버튼 -->
														<li><a class="page-link"
															href="/admin/report?bnowPage=${reportPage.lastPage}"
															tabindex="-1" aria-disabled="true"> <i
																class="fas fa-angle-double-right"></i>
														</a></li>

													</c:if>
												</ul>
											</nav>
										</div>
									</c:if>
								</div>
								<div class="search-area">
									<div class="search-area-body">
										<form class="form-inline my-2 my-lg-0 underSearchForm"
											action="/admin/report">
											<select class="dropdown-toggle-board" name="searchStyle">
												<option class="nav-link dropdown-toggle board-item"
													id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" value=""
													<c:if test='${searchStyle eq ""}'>selected</c:if>>전체</option>
												<option class="dropdown-item board-item" value="search_title"
													<c:if test='${searchStyle eq "search_title"}'>selected</c:if>>제목</option>
												<option class="dropdown-item board-item" value="search_content"
													<c:if test='${searchStyle eq "search_content"}'>selected</c:if>>내용</option>
												<option class="dropdown-item board-item" value="search_title_content"
													<c:if test='${searchStyle eq "search_title_content"}'>selected</c:if>>제목
													+ 내용</option>
											</select> <input class="form-control mr-sm-2 board-search"
												type="search" name="keyword" placeholder="검색어 입력"
												aria-label="Search">
											<button
												class="btn btn-outline-secondary my-2 my-sm-0 board-search-btn" type="submit">
												<i class="fas fa-search"></i>
											</button>
										</form>
									</div>
								</div>
                            </div>
                        </div>
                    </div>





                </div>
            </main>
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Copyright ⓒ 2020 - 2020 fantasy stock. All rights reserved.</div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" ></script>
    <script src="/resources/js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" ></script>
    <script src="/resources/js/chart-area-demo.js"></script>
    <script src="/resources/js/chart-bar-demo.js"></script>
    <script src="/resources/js/datatables-demo.js"></script>    
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
</body>

</html>