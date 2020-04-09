<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1:1 Q&A | 도토리 마켓</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/CScenterQ&A.css" />
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
			<div class="right_area container-cs-counsel">

				<!-- 타이틀 -->
				<div class="right_contents">
					<h2 class="title-page">
						<a href="${pageContext.request.contextPath}/CScenter/CScenter">CS Center</a>
					</h2>
				</div>
				<!-- /타이틀 -->

				<!-- CS Center 탭버튼 -->
				<div class="cs_center_tap">
					<ul>
						<li class="hover_effect_none"><span class="title">Tel.1544-7199</span> <span>평일 9:00~18:00(점심 12:00~13:00)</span></li>

						<li class="active"><a href="${pageContext.request.contextPath}/CScenter/CScenterQ&A"> <span class="title">1:1 Q&A</span> <span>질문 전 FAQ(자주 묻는 질문)을 먼저 확인해 주세요.</span>
						</a></li>

						<li class><a href="${pageContext.request.contextPath}/CScenter/CScenterFAQ"> <span class="title">FAQ</span> <span>자주 묻는 질문</span>
						</a></li>
					</ul>
				</div>
				<!-- /CS Center 탭버튼 -->

				<form name="f1" id="f1" method="post" action="">
					<input type="hidden" name="">
					<!-- 고객센터 콘텐츠 -->
					<div class="right_contents">
						<h3 class="title_cs font-mss">1:1 Q&A</h3>
						<ul class="n-info-txt">
							<li class="txt-danger">제품 사용, 오염, 전용 박스 손상, 라벨 제거, 사은품 및 부속 사용/분실 시, 교환/환불이 불가능 합니다.</li>
							<li class="txt-danger">교환을 원하시는 상품(사이즈)의 재고가 부족 시, 교환이 불가합니다.</li>
							<li class="txt-danger">반품 접수는 반드시 택배사를 통해 직접 접수 해주셔야 합니다.</li>
							<li>고객님의 주문내역을 선택, 질문이 필요한 상품을 선택하시면 1:1상담이 가능합니다.</li>
							<li>"주문취소/교환/환불은 <a href="" class="n-txt-link">마이페이지>주문내역</a>에서 신청하실 수 있습니다.
							</li>
							<li>1:1문의 처리 내역은 <a href="" class="n-txt-link">마이페이지>1:1문의</a>를 통해 확인하실 수 있습니다.
							</li>
							<li>상품 정보(사이즈, 실측, 예상 배송일 등) 관련 문의는 해당 상품 문의에 남기셔야 빠른 답변이 가능합니다.</li>
						</ul>
						<div class="section_form">
							<!-- 주문확인 -->
							<div class="harf_area">
								<header class="n-section-title">
								<h2 class="tit">문의 작성</h2>
								</header>
								<table class="n-table table-row">
									<tbody>
										<tr>
											<th scope="row">문의유형</th>
											<td>
												<div class="bg-select">
													<select name="qa_kind">
														<option value>문의유형 선택</option>
														<option value="faq1">회원 관련</option>
														<option value="faq2">기타 문의</option>
														<option value="17">신고</option>
													</select>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row">작성자</th>
											<td>
												<input type="text" class="n-input" name="user_nm" value="김선호">
											</td>
										</tr>
										<tr class="n-same-row">
											<th scope="row">휴대전화</th>
											<td>
												<input type="text" class="n-input" name="mobile" value="010-4042-4699">
											</td>
										</tr>
										<tr class="n-same-row">
											<th scope="row">이메일</th>
											<td>
												<input type="text" class="n-input" name="email" value="sunho2343@naver.com">
											</td>
										</tr>
										<tr>
											<th scope="row">제목</th>
											<td>
												<input type="text" class="n-input" name="subject" value placeholder="제목을 입력해주세요.">
											</td>
										</tr>
										<tr class="n-same-row">
											<th scope="row">문의내용</th>
											<td>
												<textarea name="qa_msg" cols="100" rows="100" class="n-input" placeholder="내용을 입력해주세요."></textarea>
											</td>
										</tr>
										<tr class="n-same-row">
											<th scope="row">사진</th>
											<td class="file-upload">
												<ul class="file_show" id="file_show"></ul>
												<button type="button" class="btn-file" onclick="$('#Filedata').click();">파일 선택</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- /주문확인 -->
							<!-- faq 오른쪽 -->
							<div id="faq_list" class="harf_area">
								<div class="box_faq_list">
									<header class="n-section-title">
									<h2 class="tit">FAQ</h2>
									<span class="txt_type font-mss">자주 묻는 질문</span> <a class="n-link" href="${pageContext.request.contextPath}/CScenter/CScenterFAQ">전체</a> </header>
								</div>
								<!-- faq -->
								<c:forEach var="article" items="${li}">
									<div class="cs-faq-list">
										<ul>
											<li>
												<dl onclick="viewContent('faq_127', '', ''); return false;">
													<dt class="font-mss">${article.num }</dt>
													<dd>${article.subject }</dd>
												</dl>
												<div id="faq_127" class="answer" style="display: none;">
													<!-- ※질문 클릭시 노출 -->
													<p>${article.content }</p>
												</div>
											</li>
										</ul>
									</div>
								</c:forEach>
								<!-- /faq -->
							</div>
							<!-- /faq 오른쪽 -->
						</div>
						<!-- 버튼 -->
						<div class="n-btn-group">
							<a href="javascript:void(0)" onclick="cancel(); return false;" class="n-btn btn-lighter">취소</a> <a href="javascript:void(0)" onclick="qna_add(); return false;" class="n-btn btn-accent">작성하기</a>
						</div>
						<!-- /버튼 -->
					</div>
					<!-- /고객센터 콘텐츠 -->
				</form>
			</div>
		</div>
	</div>
</body>
</html>