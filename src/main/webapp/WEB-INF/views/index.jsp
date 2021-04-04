<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="include/header.jsp" %>
            <h2 class="display-text">FIND<br>YOUR<br>ENERGY</h2>
            
            <!-- 슬라이더  -->
            <div class="slideshow-container">
                <div class="mySlides fade">
                <img src="resources/images/p_images/mainweight.jpg" alt="슬라이드사진1">
                </div>
                <div class="mySlides fade">
                <img src="resources/images/p_images/mainyoga.jpg" alt="슬라이드사진2">
                </div>
                <div class="mySlides fade">
                <img src="resources/images/p_images/dumbell.png" alt="슬라이드사진3">
                </div>
                <div class="mySlides fade">
                <img src="resources/images/p_images/cycles.jpg" alt="슬라이드사진4">
                </div>
                <div class="mySlides fade">
                <img src="resources/images/p_images/weights.jpg" alt="슬라이드사진5">
                </div>
            	<div class="dots">
                    <span class="dot"></span>
                    <span class="dot"></span>
                    <span class="dot"></span>
                    <span class="dot"></span>
                    <span class="dot"></span>
                </div>
            </div> 
            <!-- 도입부 -->
                <section class="main-wrapper">
                    <!-- 도입부 텍스트 -->
                    <div class="main-intro"> 
                        <h3>WELLNESS</h3>
                        <div class="split_content_wrap">
                            <span class="first-letter" area-hidden="true">웰</span>
                            <div class="split_content_inner">
                                <p>
                                    <span class="first-letter-hidden" area-hidden="true">웰</span>
                                    <span class="remaining">
                                    니스는 웰빙과 피트니스의 합성어로 건강을 기반으로 
                                    풍요로운 인생을 목표로 하는 뜻이 담겼습니다.
                                    운동을 일상 생활에 적절히 도입해 건강하게 하루하루 보내는 삶을 지향합니다.
                                    
                                    </span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- 도입부 텍스트+사진 -->
                    <div class="main-pic-wrapper">
                        <div class="intro-wrapper">
                            <div class="intro-text">          
                                <p style="color: #de3726">웰니스 피트니스</p>
                                <p>서울 강남구 압구정로 99길 웰니스빌딩 3층</p>    
                                <p style="color: #de3726">영업 시간</p>
                                <p>월-금: 06:00-23:30
                                <br>토, 일, 공휴일: 09:00-18:00
                                <br>2주, 4주 일요일 휴무</p>   
                            </div>
                                <!-- 웰니스 건물 -->
                                <img class="intro-pic" src="resources/images/p_images/redbuilding.jpg" alt="웰니스 건물">        
                        </div>
                    </div>
                </section>


                <!-- 시설 소개 -->
                <section class="main-wrapper">
                    <!-- 시설 소개 텍스트 -->
                    <div class="main-intro">
                        <h3>FACILITY</h3>
                        <div class="split_content_wrap">
                            <span class="first-letter" area-hidden="true">고</span>
                            <div class="split_content_inner">
                                <p>
                                    <span class="first-letter-hidden" area-hidden="true">고</span>
                                    <span class="remaining">
                                    객 한 분 한 분의 높은 취향과 건강하고 즐거운 삶, 품격과 운동, 그리고 휴식을 위해 최적화된 공간 디자인,
                                    몸과 마음에 활기를 불어넣는 도심 속 휴식 공간,
                                    첨단 기능을 갖춘 세계적인 이탈리아 테크노짐사를 비롯해 60여대의 장비가 효과적인 운동법을 제안합니다.
                                    </span>
                                </p>
                            </div>
                        </div>
                    </div>

					<!-- 시설 소개 사진 -->
                    <div class="main-contents-wrapper">
                        <div class="main-pic-wrapper" style="overflow: hidden;">  
                            <div class="fac-container">
                                <img class="mp" src="resources/images/p_images/freeweight.jpg" alt="프리 웨이트 룸">
                                <div class="overlay overlayRight">
                                        <p class="category">프리 웨이트 룸<i class="fas fa-angle-double-right"></i></p>			
                                </div>
                            </div>
                            <div class="fac-container">
                                <img class="mp" src="resources/images/p_images/yogaroom.jpg" alt="요가 룸">
                                <div class="overlay overlayRight">
                                        <p class="category">요가 룸<i class="fas fa-angle-double-right"></i></p>			
                                </div>
                            </div>
                            <div class="fac-container">
                                <img class="mp" src="resources/images/p_images/pilates.jpg" alt="필라테스 룸">
                                <div class="overlay overlayRight">
                                        <p class="category">필라테스 룸<i class="fas fa-angle-double-right"></i></p>			
                                </div>
                            </div>
                            <div class="fac-container">
                                <img class="mp" src="resources/images/p_images/machineweight.jpg" alt="머신 웨이트 룸">
                                <div class="overlay overlayRight">
                                        <p class="category">머신 웨이트 룸<i class="fas fa-angle-double-right"></i></p>			
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- 프로그램 -->
                <section class="main-wrapper">
                    <!-- 프로그램 소개 텍스트 -->
                    <div class="main-intro"> 
                        <h3>PROGRAM</h3>
                        <div class="split_content_wrap">
                            <span class="first-letter" area-hidden="true">다</span>
                            <div class="split_content_inner">
                                <p style="width: auto;">
                                    <span class="first-letter-hidden" area-hidden="true">다</span>
                                    <span class="remaining">
                                    양한 프로그램과 편리한 시설을 자랑하는
                                    접근성 최고의 웰니스 피트니스를 만나보세요.
                                    양한 프로그램과 편리한 시설을 자랑하는
                                    접근성 최고의 웰니스 피트니스를 만나보세요.
                                    양한 프로그램과 편리한 시설을 자랑하는
                                    접근성 최고의 웰니스 피트니스를 만나보세요.
                                    </span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- 프로그램 소개 사진 -->
                    <div class="main-contents-wrapper">
                        <div class="main-pic-wrapper">
                            <div class="right-text">
                                <div class="pro">
                                    <img class="" style="" src="https://kinective.com/wp-content/uploads/2019/11/home-personal-training@2x.jpg" alt="PT 하는 모습">
                                </div>        
                                <div class="pro text">
                                    <div class="ptext-box">
                                        <h4 style="font-size: 4rem;">Personal Training</h4>
                                        <span class="pro-line"></span>
                                        <p>운동 강습이 절실하게 필요한 회원님께 50분 동안 제공해드리는 개인 지도입니다.</p>
                                        <a href="#" class="bg-red-btn"><span>더 알아보기</span></a>
                                    </div>
                                </div>
                            </div>
                            <div class="left-text">                 
                                <div class="pro text">
                                    <div class="ptext-box">
                                        <h4 style="font-size: 4rem;">Group Exercise</h4>
                                        <span class="pro-line"></span>
                                        <p>요가, 필라테스, 에어로빅 그룹 운동을 통해 개인별 운동 목표를 달성합니다.</p>
                                        <a href="#" class="bg-red-btn"><span>더 알아보기</span></a>
                                    </div>
                                </div>
                                <div class="pro">
                                    <img class="" src="resources/images/p_images/group.jpg" style="min-height:260px;" alt="">
                                </div>
                            </div>
                        </div>
                    </div>

                <!-- 3GX 시스템 소개 -->
                <section class="main-wrapper">
                    <!-- 3GX 시스템 텍스트 -->
                     <div class="main-intro">
                        <h3>3GX SYSTEM</h3>
                        <div class="split_content_wrap">
                            <span class="first-letter" area-hidden="true">웰</span>
                            <div class="split_content_inner">
                                <p style="width: auto;">
                                    <span class="first-letter-hidden" area-hidden="true">웰</span>
                                    <span class="remaining">
                                   니스 피트니스는 운동을 처음 시작할 때부터 회원권 종료 시까지 회원님의 건강과 아름다움을 위해 운동방법을 제시하는 것은 물론, &nbsp;<br>
                                   지속적으로 지도와 상담 등을 통해 회원님의 피트니스 목표를 달성할 수 있도록 최선을 다합니다.
                                    </span>
                                </p>
                            </div>
                        </div>
                    </div>

                   <!-- 3GX 시스템 사진 -->
                    <div class="main-pic-wrapper" style="margin-bottom: 10%;">
                            <div class="gx3-wrapper">
                                <div class="gx3-container">
                                    <img class="gx3-pic" src="resources/images/p_images/gxyoga.jpg" alt="그룹 요가 수업 모습">
                                    <div class="gx3-text">
                                        <h2 class="gx3-title">요가</h2>
                                        <a href="gx3-rsv">예약하기</a>			
                                    </div>
                                </div>
                                <div class="gx3-container">
                                    <img class="gx3-pic" src="resources/images/p_images/gxps.jpg" alt="그룹 필라테스 수업 모습">
                                    <div class="gx3-text">
                                        <h2 class="gx3-title">필라테스</h2>
                                        <a href="gx3-rsv">예약하기</a>
                                    </div>
                                </div>
                                <div class="gx3-container">
                                    <img class="gx3-pic" src="resources/images/p_images/gxar.jpg" alt="그룹 에어로빅 수업 모습">       
                                    <div class="gx3-text">
                                        <h2 class="gx3-title">에어로빅</h2>
                                        <a href="gx3-rsv">예약하기</a>		
                                    </div>
                                </div>
                            </div>
                    </div>
                </section>
    </div><!--wrapper 끝-->
    
    
 <%@ include file="include/footer.jsp" %>  