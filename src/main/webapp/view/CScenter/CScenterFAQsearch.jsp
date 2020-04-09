<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자주묻는질문(FAQ) | 도토리 마켓</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/CScenterFAQsearch.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/store_common.css" />
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
			<div class="right_area">
				<!-- 컨텐츠 영역 -->
				<!-- 타이틀 -->
				<div class="right_contents">
					<h2 class="title-page">CS Center</h2>
				</div>
				<!-- //타이틀 -->
				<!-- CS Center 탭버튼 -->
				<div class="cs_center_tap">
					<ul>
						<li class="hover_effect_none"><span class="title">Tel. 1544-7199</span> <span>평일 9:00~18:00(점심 12:00~13:00)</span></li>
						<li class=""><a href="/app/cs/counsel"> <span class="title">1:1 Q&amp;A</span> <span>질문 전 FAQ(자주 묻는 질문)을 먼저 확인해 주세요.</span>
						</a></li>
						<li class="active"><a href="/app/cs/faq"> <span class="title">FAQ</span> <span>자주 묻는 질문</span>
						</a></li>
					</ul>
				</div>
				<!-- //CS Center 탭버튼 -->
				<!-- 고객센터 콘텐츠 -->
				<div class="right_contents faq_contents">
					<form id="search_form" method="get" action="/app/cs/faq">
						<h3 class="title_cs font-mss">FAQ</h3>
						<input class="faq_search_txt" name="q" type="text"> <a class="plain-btn btn search_again_btn faq_search_btn"><input type="submit" value="검색"></a>
					</form>
					<div class="faq_select_option">
						<span class="keyword_selected"> <a href="/app/cs/faq"> ㅇㅇ <span class="delete-btn-red">X</span>
						</a>
						</span>
					</div>
					<!-- 탭버튼 -->
					<ul class="mypage_type">
						<li><a href="/app/cs/faq/15">회원 관련</a></li>
						<li><a href="/app/cs/faq/16">기타</a></li>
					</ul>
					<!-- //탭버튼 -->
					<!-- 콘텐츠 -->
					<table class="table_basic table_faq_cs">
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
							<tr>
								<td colspan="2" align="center" style="padding: 10px 0;">등록된 faq가 없습니다.</td>
							</tr>
						</tbody>
					</table>
					<!-- //콘텐츠 -->
				</div>
				<!-- //고객센터 콘텐츠 -->
				<!--// 컨텐츠 영역 -->
			</div>
		</div>
	</div>
</body>
</html>