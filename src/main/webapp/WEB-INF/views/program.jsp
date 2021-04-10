<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="include/header.jsp" %>

	<!-- 각 페이지 내비 -->
          <main class="main">
              <section class="main-top"> 
                  <div class="main-nav">
                      <a href="">PT</a>
                      <a href="">GX</a>
                  </div>
                  <!-- 각 페이지 제목 -->
                  <h2 class="main-title">프로그램</h2>
              </section>
          </main>    

              <!-- 각 페이지 본문 -->
              <section class="main-wrapper">
                  <div class="main-intro">
                     <h3>PT</h3>
                  </div>
                  <div class="main-pic-wrapper">
                            <div class="right-text">
                                <div class="pro">
                                    <img class="" style="width: 100%;" src="resources/images/p_images/propt.jpg" alt="PT 하는 모습">
                                </div>        
                                <div class="pro text">
                                    <div class="ptext-box">
                                        <h4>Personal Training</h4>
                                        <span class="pro-line"></span>
                                        <p>전문 지식을 갖춘 트레이너가 1:1 맞춤 프로그램을 제공합니다.
“웰니스 피트니스 퍼스널트레이닝”

고객의 스케줄에 맞춰 운동효과를 극대화하는 전문 트레이너 1:1 맞춤형 운동 프로그램입니다.

운동과 의학적으로 전문지식을 갖춘 전문 강사 (일반적으로 Personal Trainer로 칭함)가 회원 개개인에게 맞는 건강상담을 실시하고, 이에 맞는 운동 프로그램과 운동방법을 제공, 지도합니다.</p>
                                    </div>
                                </div>
                            </div>
                    </div>
              </section>

               <section class="main-wrapper"  style="margin-bottom: 20%;">
                  <div class="main-intro">
                     <h3>GX</h3>
                  </div>
                  <div class="main-pic-wrapper">
                            <div class="right-text">
                                <div class="pro">
                                    <img class="" style="width: 100%;" src="resources/images/p_images/groupex.jpg" alt="GX 하는 모습">
                                </div>        
                                <div class="pro text">
                                    <div class="ptext-box">
                                        <h4>Group Exercise</h4>
                                        <span class="pro-line"></span>
                                        <p>다양한 그룹 운동으로 개인별 운동 목표를 달성합니다.<br><br>
                                       힐링 요가​​<br>
짧게 반복하고 천천히 늘리는 동작으로 주로 이루어지며 명상과 함께 호흡과 동작이 이루어지는 고요하고 정적인 요가 프로그램입니다.​
<br><br>
​빈야사 요가​​<br>
아쉬탕가, 아엥가, 비니 요가 등 여러 종류의 요가 특징들을 모아 구성된 운동으로 전신을 사용하며 동작의 연결성이 있어 어려운 동작이 없이 누구나 쉽게 따라 할 수 있는 가장 보편적인 요가 프로그램입니다.​
<br><br>
​아쉬탕가 요가​<br>
고난이도의 동작들로 구성되어 있어 다른 요가 프로그램과 달리 요가 운동경력이 있는 분들에게 알맞은 요가 프로그램입니다.
<br><br>
필라테스​​<br>
동양의 요가와 서양의 스트레칭을 조합해 만들어진 운동으로 운동기구 없이도 복부의 코어 근육을 강화하고 팔다리의 유연성을 증가시키는 효과가 있으며, 깊은 흉식호흡과 리듬을 강조하고 반복된 연속 동작운동을 통해 근육을 운동시키며 신체 균형과 체형, 자세 교정까지 통증 없이 강화할 수 있는 운동 프로그램입니다.​
<br><br>
에어로빅<br>
신나는 댄스음악에 맞춰 진행되는 운동으로 복부 및 골반을 많이 움직이는 안무를 통해 복부 주변의 근육 강화와 지방 연소에 큰 도움을 주는 고강도 유산소 프로그램입니다.​
                                        </p>
                                    </div>
                                </div>
                            </div>
                    </div>

                    <h2 style="width: 100%; padding: 10% 0; margin:0 auto; font-size: 3rem; color: #fff; text-align: center;">예약하기</h2>
                        <div class="gx-wrapper" style="height: auto;">
                            
                            <div class="gxbox">
                            <a href=""><img class="yogapro" src="resources/images/p_images/yoga-removebg-preview.png" alt="요가 하는 모습"></a>
                            <!-- <span class="verline"></span> -->
                            <h3 class=""><span>요가</span></h3>
                            
                            </div>
                            <div class="gxbox">
                            <a href=""><img class="prilapro" src="resources/images/p_images/pilapro-removebg-preview.png" alt="필라테스 하는 모습"></a>
                            <!-- <span class="verline"></span> -->
                            <h3 class=""><span>필라테스</span></h3>
                            </div>
                            <div class="gxbox">
                            <a href=""><img class="aeropro" src="resources/images/p_images/aeropro-removebg.png" alt="에어로빅 하는 모습"></a>
                            <!-- <span class="verline"></span> -->
                            <h3 class=""><span>에어로빅</span></h3>
                            </div>
                        </div>

                        <div class="gx-timetable">
                        <h2 style="width: 100%; padding: 170px 0; margin:0 auto; font-size: 3rem; color: #fff; text-align: center;">시간표</h2>
                        </div>
              </section>


<%@ include file="include/footer.jsp" %>