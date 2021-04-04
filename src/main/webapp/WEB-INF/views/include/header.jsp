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
 

  
</head>

<body>
	<div id="wrapper">
 		<!-- 헤더 -->
        <div class="header-wrapper">
            <header class="nav-down">
                    <!-- 모바일 메뉴 버튼   -->
                    <h1 class="logo" title="메인으로 돌아가기"><a href="${pageContext.request.contextPath}/index.do">웰니스 피트니스</a></h1>
                     <div class="btn-burger">
                        <span class="b1"></span>
                        <span class="b2"></span>
                        <span class="b3"></span>
                    </div>

                    <!-- 모바일 내비 -->
                    <div class="mobile-nav nav-down">
                        <div class="menu-icon">
                            <div class="top">               
                                <a href="#"><i class="fas fa-dumbbell"></i>
                                <p>지점 소개</p></a>
                                <a href="#"><i class="fas fa-running"></i>
                                <p>프로그램</p></a>     
                            </div>
                            <div class="bottom">
                                <a href="#"><i class="far fa-calendar-check"></i>
                                <p>GX 예약</p></a>
                                <a href="#"><i class="far fa-comments"></i>
                                <p>Q &amp; A</p></a>
                            </div>    
                        </div>
                        <div class="mobile-info">
                        			<c:choose>
					            	<c:when test="${id eq null}">
					            		<a href="${pageContext.request.contextPath}/login.do"><p>로그인</p></a>
					            	</c:when>
					            	<c:otherwise>
					            		<a href="${pageContext.request.contextPath}/index.do"><p>로그아웃</p></a>
					            	</c:otherwise>
					               </c:choose>
					               
					               <c:choose>
					            	<c:when test="${id eq null}">
					            		<a href="${pageContext.request.contextPath}/join.do"><p>회원가입</p></a>
					            	</c:when>
					            	<c:otherwise>
					            		<a href="${pageContext.request.contextPath}/joinupd.do"><p>내 정보</p></a>
					            	</c:otherwise>
					               </c:choose>
					               <c:if test="${id != null && (isAdmin==1 || isCoach==1)}">
	                                <a href=""><p>회원 관리 페이지</p></a>
	                                </c:if>
	                                <c:if test="${id != null && isAdmin==0 && isCoach==0}">
						             <a href=""><p>내 정보</p></a>
	                                </c:if>
                        </div>
                    </div>

                     <!-- PC 내비 -->
                    <nav class="nav nav-down clearfix">     
                            <ul class="dropmenu float--left">
                                <li class="menu_li"><a class="menu_a" href="${pageContext.request.contextPath}/intro.do">지점소개</a>
                                    <ul class="sub_ul">
                                        <li class="sub_li"><a class="sub_a" href="#">시설소개</a></li>
                                        <li class="sub_li"><a class="sub_a" href="#">시설방역</a></li>
                                        <li class="sub_li"><a class="sub_a" href="#">코치소개</a></li>
                                        <li class="sub_li"><a class="sub_a" href="#">위치안내</a></li>
                                    </ul> 
                                </li>
                                <li class="menu_li"><a class="menu_a" href="${pageContext.request.contextPath}/program.do">프로그램</a>
                                    <ul class="sub_ul">
                                        <li class="sub_li"><a class="sub_a" href="#">PT</a></li>
                                        <li class="sub_li"><a class="sub_a" href="#">GX 프로그램</a></li>
                                    </ul>
                                </li>
                                <li class="menu_li"><a class="menu_a" href="#">GX 예약</a>
                                    <ul class="sub_ul">
                                        <li class="sub_li"><a class="sub_a" href="#">요가</a></li>
                                        <li class="sub_li"><a class="sub_a" href="#">필라테스</a></li>
                                        <li class="sub_li"><a class="sub_a" href="#">에어로빅</a></li>
                                        <li class="sub_li"><a class="sub_a" href="#">PT</a></li>
                                    </ul>    
                                </li>
                                <li class="menu_li"><a class="menu_a" href="#">Q & A</a></li>
                                <c:if test="${id != null && (isAdmin==1 || isCoach==1)}">
                                <li class="menu_li"><a class="menu_a" href="#">회원 관리 페이지</a>
                                    <ul class="sub_ul">
                                        <li class="sub_li"><a class="sub_a" href="#">회원 분석</a></li>
                                        <li class="sub_li"><a class="sub_a" href="#">회원 목록</a></li>
                                        <li class="sub_li"><a class="sub_a" href="#">예약 현황</a></li>
                                    </ul>    
                                </li>
                                </c:if>
                                <c:if test="${id != null && isAdmin==0 && isCoach==0}">
					            <li class="menu_li"><a class="menu_a" href="#">내 예약</a>
                                </li>
                                </c:if>
                            </ul>
                        
                            <!-- 인포 영역 -->
                            <section class="info_section float--right">
                                <ul class="info_list">
                                    <c:choose>
					            	<c:when test="${id eq null}">
					            		<li><a href="${pageContext.request.contextPath}/login.do">로그인</a></li>
					            	</c:when>
					            	<c:otherwise>
					            		<li><a href="${pageContext.request.contextPath}/index.do">로그아웃</a></li>
					            	</c:otherwise>
					               </c:choose>
					               
					               <c:choose>
					            	<c:when test="${id eq null}">
					            		<li><a href="${pageContext.request.contextPath}/join.do">회원가입</a></li>
					            	</c:when>
					            	<c:otherwise>
					            		<li><a href="${pageContext.request.contextPath}/joinupd.do">내 정보</a></li>
					            	</c:otherwise>
					               </c:choose>
                                </ul>
                            </section>
                    </nav>  
            </header>
			

        </div> <!--// 헤더 -->
	


	<!-- 각 페이지 내비 -->
	<!--  <main class="main">
		<section class="main-top">
			<div class="main-nav">
				<a href="">PT</a> <a href="">GX 프로그램</a>
			</div> -->
			<!-- 각 페이지 제목 -->
		<!--	<h2 class="main-title">PROGRAM</h2>
		</section> -->

		<!-- 각 페이지 본문 -->
		<!--<section class="main-bottom">
			<div class=""></div>
			<div class=""></div>
		</section>
	</main> -->