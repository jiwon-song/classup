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
					<h1 class="mt-4">클래스 목록</h1>
					
					<form action="class_insert.so" method="post" enctype="multipart/form-data" onsubmit="return check()">
						<table class="table table-borderless w-50">
							<tr>
								<td class="col-4">
									<div class="input-group input-group-default">
										<span class="input-group-text w-25 text-center" id="inputGroup-sizing-default">클래스명</span>
										<input <c:if test = '${class_id==0}' >disabled </c:if> 
												type="text" name="class_name" class="form-control" 
												aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
												placeholder="클래스명" >
									</div>
								</td>
								<td class="col-4">
									<button type="submit" <c:if test = '${class_id==0}' >disabled </c:if>  class="btn col-10 hong_btn_blue">클래스 추가</button>
								</td>
							</tr>


						</table>
					</form>
			
					<div class="card">
						<div class="card-body">
							<table id="datatablesSimple" class="hong_vam hongtable">
								<!--  이거때문에 자동 페이징처리? -->
								<thead>
									<tr>
										<th>클래스 이름</th>
										<th class='col-3'>학생수</th>
										<th class='col-3'>클래스 아이디</th>
										<th class='col-2'>수정 / 삭제</th>
									</tr> 
								</thead>
								<tbody>
									<c:forEach items="${list}" var="vo">
										<tr>
											<td><a class="text-decoration-none text-reset">${vo.class_name}</a></td>
											<td><a class="text-decoration-none text-reset">${vo.stu_num}</a></td>
											<td><a class="text-decoration-none text-reset">${vo.class_id}</a></td>
											<td>
												<form class="col-6 d-inline-block" action="class_modify.so" method="post">
													<input type="hidden" name='class_id' value='${vo.class_id}' />
													<input type="hidden" name='class_name' value='${vo.class_name}' />
													<input type="hidden" name='page' value='${cri.page}' />
													<input type="hidden" name='perPageNum' value='${cri.perPageNum}' />
													<%-- <input type="hidden" name='stu_num' value='${vo.stu_num}' /> --%>
													<button type="submit" class="btn hong_btn_blue col-10">수정</button>
												</form>
												<form class="col-5 d-inline-block" action="class_delete.so" method="post">
													<input type="hidden" name='class_id' value='${vo.class_id}' />
													<input type="hidden" name='class_name' value='${vo.class_name}' />
													<%-- <input type="hidden" name='stu_num' value='${vo.stu_num}' /> --%>
													<button class="btn hong_btn_red col-12" onclick="if(confirm('${vo.class_name} 을(를) 삭제하시겠습니까?')){type='submit'}else{type='button'} ">삭제</button>
												</form>
										
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</main>
			<!--  여기까지가 콘텐츠 -->


			<%@include file="../include/footer.jsp"%>

		</div>

<script>
var table = $('#datatablesSimple').DataTable();

//Sort by column 1 and then re-draw
table
 .order( [[ 1, 'asc' ]] )
 .draw( false );
</script>

</body>
</html>










