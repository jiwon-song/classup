<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="ko">
<%@ include file="../include/head.jsp"%>
<style>
.pwbtn{
	position: absolute; 
	right: 8px; 
	top: 8px;" 
}

.pwshow {display:none;}

</style>


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
							<table id="datatablesSimple" class="hong_vam hongtable">
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
										<th class='col-2'>수정 / 삭제</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${stu_list}" var="vo">
										<tr>
											<td><a class="text-decoration-none text-reset" href="student_detail.so?dis=1&class_name=${class_name}&student_id=${vo.student_id}&class_id=${class_id}">${vo.student_name}</a></td>
											<td><a class="text-decoration-none text-reset">${vo.student_id}</a></td>
											<td style="position:relative"><a class="text-decoration-none text-reset shap">********</a><a class="text-decoration-none text-reset pwshow">${vo.student_pw}</a><button class="btn hong_btn_blue pwbtn">비번확인</button></td>
											<td><a class="text-decoration-none text-reset">${vo.grade}</a></td>
											<td><a class="text-decoration-none text-reset">${vo.school_name}</a></td>
											<td><a class="text-decoration-none text-reset">${vo.parent_phone}</a></td>
											<td><a class="text-decoration-none text-reset">${vo.student_phone}</a></td>
											<td>
												<form class="col-6 d-inline-block" action="student_modify.so" method="post">
													<input type="hidden" name='class_id' value='${class_id}' />
													<input type="hidden" name='class_name' value='${class_name}' />
													<input type="hidden" name='student_id' value='${vo.student_id}' />
													<input type="hidden" name='dis' value='1' />
													<button type="submit" class="btn hong_btn_blue col-10">수정</button>
												</form>
												<form class="col-5 d-inline-block" action="student_delete.so" method="post">
													<input type="hidden" name='class_id' value='${class_id}' />
													<input type="hidden" name='class_name' value='${class_name}' />
													<input type="hidden" name='student_id' value='${vo.student_id}' />
													<button class="btn hong_btn_red col-12" onclick="if(confirm('${vo.student_name} 을(를) 삭제하시겠습니까?')){type='submit'}else{type='button'} ">삭제</button>
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
		$(document).on('click', 'button.pwbtn', function(){
			var $shap = $(this).siblings('a.shap');
			var $pwshow = $(this).siblings('a.pwshow');
			$shap.css('display', $shap.css('display')=='none' ? 'inline-block' : 'none'); 
			$pwshow.css('display', $pwshow.css('display')=='none' ? 'inline-block' : 'none'); 
		});
		
/* 		let cnt = 0 ;
		function pwbtn(){
			
			cnt++;
			if(cnt%2 !=0){
				$(".pwbtn").siblings().css('display','inline-block')
				$(".shap").css('display','none')		
			}else{
				$(".pwbtn").siblings().css('display','none')
				$(".shap").css('display','inline-block')						
			}
			
		}
		 */
		
		
		
		</script>
</body>
</html>

