<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<link href="https://fonts.googleapis.com/css?family=Monoton&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lobster&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Abril+Fatface&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Comfortaa:400,700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Notable&display=swap" rel="stylesheet">
	<!--  헤더 부분  -->
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-sclass">
		<!-- Navbar Brand-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"	id="sidebarToggle" href="#!">
			<i class="fs-5 fas fa-bars"></i>
		</button>
		<a class="navbar-brand ps-3" href="<c:url value='/main'/>">
			<p class="headimg" style="display:inline-block">CLASS UP</p>
			<div class="neon_effect">
			  <p class="headp" style="display:none">CLASS UP</p>
			</div>
		</a>
		<p class="text-white fs-5 hong_vam"> ${loginInfo.teacher_name}님 어서오세요</p>
		<!-- Sidebar Toggle-->
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				
			</div>
		</form>
		
	
		
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<c:if test = "${teacher_id eq 'admin'}">
				<li class="nav-item">
					<a class="nav-link playmode">
						<i class="fa-solid fa-play"></i>
					</a>
				</li>
			</c:if>
			<li class="nav-item">
				<a class="nav-link darkmode">
					<img height="20px" src="img/darkmoon.png" class="moon" id="moon" /></a>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					<i class="fs-5 fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="myinfo">마이페이지</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="logout">로그아웃</a></li>
				</ul>
			</li>
		</ul>
	</nav>
	<!-- 여기까지가 헤더부분 -->

