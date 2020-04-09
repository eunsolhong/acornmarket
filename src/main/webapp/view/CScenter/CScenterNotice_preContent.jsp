<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 | 도토리 마켓</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/CScenterNotice_contentForm.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/store_common.css" />
</head>
<body>
	<form name="form" id="form" role="form" method="post">
		<input type="hidden" name="readCount" value="${article.readcount }"> <input type="hidden" name="readCount" value="${regdate }"> <input type="hidden" name="subject" value="${article.subject }"> <input type="hidden" name="content" value="${article.content }"> <input type="hidden" name="adminId" value="${article.adminId }"> <input type="hidden" name="category" value="${article.category }"> <input type="hidden" name="passwd" value="${article.passwd }">
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
				<div class="right_area page_notice_view">
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
						<!-- 공지사항 본문 -->

						<div class="notice_contents">
							<h3 class="txt_tit_notice">${article.subject }</h3>
							<span>${regdate } / View : ${article.readcount } </span>
							<div class="box_contents">
								<p>${article.content }</p>
							</div>
						</div>

						<!-- //공지사항 본문 -->
							<button onclick=mySubmit(1) class="plain-btn btn" style="margin-top: 20px;">저장</button>
							<button onclick=mySubmit(2) class="plain-btn btn" style="margin-top: 20px;">수정</button>
							<a href="${pageContext.request.contextPath}/CScenter/CScenterNotice?page=${page}" class="plain-btn btn" style="margin-top: 20px;">취소</a>
					</div>
					<!--// 컨텐츠 영역 -->
				</div>
			</div>
		</div>
	</form>
</body>
<script>
	function mySubmit(index) {

		if (index == 1) {

			document.form.action = '${pageContext.request.contextPath}/CScenter/CScenter_write';

		}
		if (index == 2) {

			document.form.action = '${pageContext.request.contextPath}/CScenter/CScenter_modifyForm?type=write&page=${page}';

		}
		document.form.submit();

	}
</script>
</html>