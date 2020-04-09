<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객센터 | 도토리 마켓</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/CScenter.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/store_common.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/CScenter.js"></script>
</head>
<body>
	<div class="row">
		<div class="col-sm-2">
			<!-- Category -->
			<div class="single category">
				<h3 class="side-title">카테고리</h3>
				<ul class="list-unstyled">
					<li><a href="" title="">디지털/가전</a></li>
					<li><a href="" title="">가구/인테리어</a></li>
					<li><a href="" title="">여성패션/잡화 </a></li>
					<li><a href="" title="">남성패션/잡화 </a></li>
					<li><a href="" title="">뷰티/미용</a></li>
					<li><a href="" title="">반려동물용품</a></li>
					<li><a href="" title="">기타중고물품</a></li>
				</ul>
			</div>
		</div>
		<div class="col-sm-9">
			<div class="right_area page_cs_main">

				<!-- 타이틀 -->
				<div class="page_box">
					<h2 class="title-page">
						<a href="${pageContext.request.contextPath}/CScenter/CScenter">CS Center</a>
					</h2>
					<div class="section_search">
						<form method="get" name="faq_search" action="${pageContext.request.contextPath}/CScenter/CScenterFAQsearch">
							<input class="input_cs" name="q" type="text"> <a href="javascript:void(0)" class="btn_black_basic">FAQ 검색</a>
							<p class="box_reference_cs">※ 대부분의 질문은 검색을 통해 답변을 얻으실 가능성이 높습니다.</p>
						</form>
					</div>
				</div>
				<!-- //타이틀 -->

				<!-- 고객센터 메뉴 -->
				<div class="right_contents_pd10">
					<div class="cs_center">
						<p class="cs_number font-mss">
							<span>TEL.</span>1544-7199
						</p>
						<div class="txt_time_cs">
							- 평일 9:00~18:00 (점심 12:00~13:00) <br> - 토, 일, 공휴일 휴무
						</div>
					</div>
					<div class="cs_menu">
						<ul>
							<li><a href="${pageContext.request.contextPath}/CScenter/CScenterQ&A"><span class="font-mss">1:1 Q&amp;A</span>1:1문의하기</a></li>
							<li><a href="${pageContext.request.contextPath}/CScenter/CScenterFAQ"><span class="font-mss">FAQ</span>자주 묻는 질문</a></li>
							<li><a href=><span class="font-mss">My Order</span>내 주문</a></li>
							<li><a href="${pageContext.request.contextPath}/CScenter/CScenterNotice?page=1"><span class="font-mss">Notice</span>공지사항</a></li>
							<li><a href=><span class="font-mss">My Question</span>내 질문</a></li>
							<li><a onclick="window.open('https://www.musinsa.com/?r=home&amp;mod=idpass&amp;page=idpwsearch','','statusbar=no,scrollbars=yes,toolbar=no');" title="비밀번호찾기" href="javascript:void(0)"><span class="font-mss">Find ID</span>아이디 찾기</a></li>
							<li class="last"><a onclick="window.open('https://www.musinsa.com/?r=home&amp;mod=idpass&amp;page=idpwsearch&amp;ftype=auth','','statusbar=no,scrollbars=yes,toolbar=no');" title="비밀번호찾기" href="javascript:void(0)"><span class="font-mss">Find PASS</span>비밀번호 찾기</a></li>
						</ul>
					</div>
				</div>
				<!-- //고객센터 메뉴 -->

				<!-- 고객센터 콘텐츠 -->
				<div class="right_contents section_contents">
					<h3 class="title_cs font-mss">
						FAQ <span>자주 묻는 질문</span>
					</h3>
					<!-- 탭버튼 -->
					<ul class="mypage_type">
						<li><a href="${pageContext.request.contextPath}/CScenter/CScenterFAQ?category=faq1">회원 관련</a></li>
						<li><a href="${pageContext.request.contextPath}/CScenter/CScenterFAQ?category=faq2">기타</a></li>
					</ul>
					<!-- //탭버튼 -->
					<!-- 콘텐츠 -->
					<table class="table_basic">
						<colgroup>
							<col width="8%">
							<col width="">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">내용</th>
							</tr>
						</thead>
						<tbody>

							<c:if test="${empty li2 }">
								<tr>
									<td>1</td>
									<td class="txt_contents">
										<a href="javascript:void(0)" onclick="viewContent1();">글이 없습니다.</a>
									</td>
								</tr>
							</c:if>

							<c:if test="${!empty li2 }">
								<c:forEach var="article" items="${li2}">
									<tr>
										<td>${article.num }</td>
										<td class="txt_contents">
											<a href="javascript:void(0)" onclick="viewContent1();">${article.subject }</a>
										</td>
									</tr>
									<tr id="faq1" style="display: none;">
										<td class="faq_q">답변</td>
										<td class="faq_a">
											<p>
												${article.content }
											</p>
										</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
					<!-- //콘텐츠 -->
				</div>
				<!-- //고객센터 콘텐츠 -->

				<!-- 공지사항 & 이용방법 -->
				<div class="cell_cs_main">
					<h3 class="title_cs font-mss">
						Notice <span>공지사항</span>
					</h3>
					<div class="cs_notice">
						<c:if test="${empty li1 }">
							<ul>
								<li><a href="">글이없습니다.</a></li>
							</ul>
						</c:if>
						<c:if test="${!empty li1 }">
							<c:forEach var="article" items="${li1}">
								<ul>
									<li><a href="${pageContext.request.contextPath}/CScenter/CScenterNotice_contentForm?num=${article.num}&type=read">${article.subject }</a></li>
								</ul>
							</c:forEach>
						</c:if>
					</div>
				</div>
				<!-- //공지사항 & 이용방법 -->

				<!--// 컨텐츠 영역 -->
			</div>
		</div>
	</div>

</body>

</html>