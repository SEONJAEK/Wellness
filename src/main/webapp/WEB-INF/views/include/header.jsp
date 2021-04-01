<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="description"
	content="강남의 중심. 컨템포러리 어반 피트니스센터. 헬스ㅣ GXㅣ 요가 | 필라테스ㅣ 에어로빅" />
<meta name="Keywords" content="압구정역 웰니스 피트니스">
<meta name="Author" content="SPORTA" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>웰니스 피트니스</title>

<!-- <link rel="canonical" href="http://wfitness.co.kr">
    <link rel="favicon" href="favicon.ico">
    <meta property="og:type" content="website">
    <meta property="og:title" content="웰니스 피트니스">
    <meta property="og:site_name" content="웰니스 피트니스"/>
    <meta property="og:description" content="강남의 중심. 컨템포러리 어반 피트니스센터. 헬스ㅣ GXㅣ 요가 | 필라테스ㅣ 에어로빅" />
    <meta property="og:image" content="img_og.png" />
    <meta property="og:url" content="http://wfitness.co.kr">
    <meta name="robots" content="ALL"> -->

<link rel="stylesheet" href="<c:url value="/resources/css/reset.css" />"
	type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/pages.css"/>"
	type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/mobile.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.2/css/all.css"
	integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="<c:url value="/resources/js/style.js"/>"
	type="application/javascript"></script>


</head>

<body>
	<div id="wrapper">
		<!-- 헤더 로고 -->
		<div class="header-wrapper">
			<header class="nav-down">
				<h1 class="logo" title="메인으로 돌아가기">
					<a href="index.html">웰니스 피트니스</a>
				</h1>
				<!-- 토글 메뉴  -->
				<div class="btn-burger open-nav-main">
					<span class="b1"></span> <span class="b2"></span> <span class="b3"></span>
				</div>


				<div class="mobile-nav nav-down">
					<div class="menu-icon">
						<div class="top">
							<!-- <div class="tp"> -->
							<a href="#"><i class="fas fa-dumbbell"></i>
								<p>지점 소개</p></a>
							<!-- </div> -->
							<!-- <div class="tp"> -->
							<a href="#"><i class="fas fa-running"></i>
								<p>프로그램</p></a>
							<!-- </div> -->
						</div>
						<div class="bottom">
							<!-- <div class="bt">     -->
							<a href="#"><i class="far fa-calendar-check"></i>
								<p>GX 예약</p></a>
							<!-- </div> -->
							<!-- <div class="bt"> -->
							<a href="#"><i class="far fa-comments"></i>
								<p>Q &amp; A</p></a>
							<!-- </div> -->
						</div>
					</div>
					<div class="mobile-info">
						<a href="#"><p>로그인</p></a> <a href="#"><p>회원가입</p></a>
					</div>
				</div>

				<!-- PC 버전 메뉴 -->
				<nav class="nav nav-down clearfix">
					<ul class="dropmenu float--left">
						<li class="menu_li"><a class="menu_a" href="#">지점소개</a>
							<ul class="sub_ul">
								<li class="sub_li"><a class="sub_a" href="#">시설소개</a></li>
								<li class="sub_li"><a class="sub_a" href="#">시설방역</a></li>
								<li class="sub_li"><a class="sub_a" href="#">코치소개</a></li>
								<li class="sub_li"><a class="sub_a" href="#">위치안내</a></li>
							</ul></li>
						<li class="menu_li"><a class="menu_a" href="#">프로그램</a>
							<ul class="sub_ul">
								<li class="sub_li"><a class="sub_a" href="#">PT</a></li>
								<li class="sub_li"><a class="sub_a" href="#">GX 프로그램</a></li>
							</ul></li>
						<li class="menu_li"><a class="menu_a" href="#">GX 예약</a>
							<ul class="sub_ul">
								<li class="sub_li"><a class="sub_a" href="#">YOGA</a></li>
								<li class="sub_li"><a class="sub_a" href="#">Pilates</a></li>
								<li class="sub_li"><a class="sub_a" href="#">Aerobic</a></li>
								<li class="sub_li"><a class="sub_a" href="#">PT</a></li>
							</ul></li>
						<li class="menu_li"><a class="menu_a" href="#">Q & A</a></li>
					</ul>

					<section class="info_section float--right">

						<c:choose>
							<c:when test="${not empty sessionScope.userId}">
								<ul class="info_list">
									<li><a href="#">${sessionScope.userId }님</a></li>
									<li><a href="logout.do">로그아웃</a></li>

									<li><a href="#">회원관리 페이지</a></li>
								</ul>
							</c:when>
							<c:otherwise>
								<ul class="info_list">
									<li><a href="#">로그인</a></li>
									<li><a href="#">회원가입</a></li>
								</ul>
							</c:otherwise>
						</c:choose>
					</section>
				</nav>
			</header>
		</div>
	</div>


	<!-- 각 페이지 내비 -->
	<main class="main">
		<section class="main-top">
			<div class="main-nav">
				<a href="">PT</a> <a href="">GX 프로그램</a>
			</div>
			<!-- 각 페이지 제목 -->
			<h2 class="main-title">PROGRAM</h2>
		</section>

		<!-- 각 페이지 본문 -->
		<section class="main-bottom">
			<div class=""></div>
			<div class=""></div>
		</section>
	</main>