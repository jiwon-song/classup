<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="ko">
<%@ include file="../include/head.jsp"%>

<body class="sb-nav-fixed">

	<!-- 여기가 헤더부분 -->
	<%@ include file="../include/header.jsp"%>


	<div id="layoutSidenav">

		<!--  사이드 메뉴부분 include 함 -->
		<%@ include file="../include/sidemenu.jsp"%>


		<!--  여기부터 콘텐츠 부분 -->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">${class_name}</h1>
					<div class="card">
						<div class="card-body">
						<form action="student_update.so">
							<table id="datatablesSimple"  class="hong_vam hongtable">
								<!--  이거때문에 자동 페이징처리? -->
								<thead>
									<tr>
										<th class='col-1'>학생이름</th>
										<th class='col-1'>학생아이디</th>
										<th class='col-2'>학생비밀번호</th>
										<th class='col-1'>학년</th>
										<th class='col-2'>학교</th>
										<th>보호자 전화번호</th>
										<th>학생 전화번호</th>
										<th class='col-2'>확인 / 취소</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${stu_list}" var="vo">
										<tr>
											<td>
												<c:if test ='${student_id eq vo.student_id}'>
													<input class="form-control" type="text" value="${vo.student_name}" name="student_name"/>
												</c:if>
												<c:if test='${student_id ne vo.student_id}'>
													${vo.student_name}
												</c:if>
												
											</td>
											<td><a class="text-decoration-none text-reset">${vo.student_id}</a></td>
											<td>
												<c:if test ='${student_id eq vo.student_id}'>
													<input class="form-control" type="text" value="${vo.student_pw}" name="student_pw"
															maxlength="11"/>
												</c:if>
												<c:if test='${student_id ne vo.student_id}'>
													**********
												</c:if>
											</td>
											<td>
												<c:if test ='${student_id eq vo.student_id}'>
													<input class="form-control" type="text" value="${vo.grade}" name="grade"/>
												</c:if>
												<c:if test='${student_id ne vo.student_id}'>
													${vo.grade}
												</c:if>
											</td>
											<td><a class="text-decoration-none text-reset">${vo.school_name}</a></td>
											<td>
												<c:if test ='${student_id eq vo.student_id}'>
													<input class="form-control" type="text" value="${vo.parent_phone}" name="parent_phone"
															maxlength="13"/>
												</c:if>
												<c:if test='${student_id ne vo.student_id}'>
													${vo.parent_phone}
												</c:if>
											</td>
											<td>
												<c:if test ='${student_id eq vo.student_id}'>
													<input class="form-control" type="text" value="${vo.student_phone}" name="student_phone"
															maxlength="13"/>
												</c:if>
												<c:if test='${student_id ne vo.student_id}'>
													${vo.student_phone}
												</c:if>
											</td>
											<td>
												<c:if test='${student_id eq vo.student_id}'>
													<input type="hidden" name='class_id' value='${class_id}' />
													<input type="hidden" name='class_name' value='${class_name}' />
													<input type="hidden" name='student_id' value='${vo.student_id}' />
													<div class="col-6 d-inline-block">
														<button type="submit" class="btn hong_btn_blue col-10">확인</button>
													</div>
												</c:if>
												<c:if test='${student_id eq vo.student_id}'>
													<div class="col-5 d-inline-block">
														<a class="btn hong_btn_red col-12" onclick='history.go(-1)'>취소</a>
													</div>
												</c:if>
										
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							</form>
						</div>
					</div>
					
				</div>
			</main>
			<!--  여기까지가 콘텐츠 -->


			<%@include file="../include/footer.jsp"%>

		</div>
</body>
</html>
