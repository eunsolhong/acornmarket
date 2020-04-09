<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 | 도토리 마켓</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/CScenterNotice.css" />
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
			<div class="right_area page_cs_notice">
				<!-- 컨텐츠 영역 -->
				<!-- 타이틀 -->
				<div class="right_contents">
					<h2 class="title-page">
						<a href="${pageContext.request.contextPath}/CScenter/CScenter">CS Center</a>
					</h2>
				</div>
				<!-- //타이틀 -->
				<!-- CS Center 탭버튼 -->
				<div class="cs_center_tap">
					<ul>
						<li class="hover_effect_none"><span class="title">Tel. 1544-7199</span> <span>평일 9:00~18:00(점심 12:00~13:00)</span></li>
						<li class=""><a href="${pageContext.request.contextPath}/CScenter/CScenterQ&A"> <span class="title">1:1 Q&amp;A</span> <span>질문 전 FAQ(자주 묻는 질문)을 먼저 확인해 주세요.</span>
						</a></li>
						<li class=""><a href="${pageContext.request.contextPath}/CScenter/CScenterFAQ"> <span class="title">FAQ</span> <span>자주 묻는 질문</span>
						</a></li>
					</ul>
				</div>
				<!-- //CS Center 탭버튼 -->
				<div class="right_contents">
					<h2 class="title-page">Notice</h2>
					<table class="table_basic">
						<colgroup>
							<col width="8%">
							<col width="*">
							<col width="15%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">내용</th>
								<th scope="col">등록일</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty li }">
								<tr>
									<td>1</td>
									<td class="tit_contents_td">
										<a href=>글이 없습니다.</a>
									</td>
									<td></td>
								</tr>
							</c:if>
							<c:if test="${!empty li }">
							<c:forEach   var="article"  items="${li}">
								<tr>
									<td>${number }<c:set var="number"  value= "${number-1 }"/></td>
									<td class="tit_contents_td">
										<a href="${pageContext.request.contextPath}/CScenter/CScenterNotice_contentForm?num=${article.num}&type=read&page=${page}">${article.subject }</a>
									</td>
									<td>${article.regdate }</td>
								</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
					<div class="boxed-list-wrapper">
						<div class="pagingNumber-box box">
							<span class="pagingNumber"> <span class="totalPagingNum"> ${endPage} </span>페이지 중 <span class="currentPagingNum">${page}</span> 페이지
							</span>
						</div>
						<!-- 하단 페이징 -->
						<div class="pagination-box box">
							<div class="pagination">
								<a href="${pageContext.request.contextPath}/CScenter/CScenter_writeForm?category=n&page=${page}" class="plain-btn btn search_again_btn faq_search_btn">글쓰기</a>
								<div class="wrapper">
									<a href="${pageContext.request.contextPath}/CScenter/CScenterNotice?page=1" class="fa fa-angle-double-left paging-btn btn first"></a>
									<c:if test="${page > 1}"> 
									<a href="${pageContext.request.contextPath}/CScenter/CScenterNotice?page=${page-1}" class="fa fa-angle-left paging-btn btn prev"></a>
									</c:if> 
									<c:forEach var="i" begin="${startPage}"  end="${endPage}">
									<a href="${pageContext.request.contextPath}/CScenter/CScenterNotice?page=${i}" class="paging-btn btn active">${i}</a> 
									</c:forEach>
									<c:if test="${page < endPage}"> 
									<a href="${pageContext.request.contextPath}/CScenter/CScenterNotice?page=${page+1}" class="fa fa-angle-right paging-btn btn next"></a>
									</c:if>
									<a href="${pageContext.request.contextPath}/CScenter/CScenterNotice?page=${tempEndPage}" class="fa fa-angle-double-right paging-btn btn last"></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--// 컨텐츠 영역 -->
			</div>
		</div>
	</div>
</body>
</html>