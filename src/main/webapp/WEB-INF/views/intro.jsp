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
                     <!-- <a href="">시설소개</a>
                      <a href="">시설방역</a>
                      <a href="">코치소개</a>
                      <a href="">위치안내</a> -->
                  </div> 
			  <!-- 각 페이지 제목 -->
                  <h2 class="main-title">지점소개</h2>
              </section>
			  </main>
			
				<!-- 각 페이지 본문 -->
              <section class="main-wrapper">
                  <div class="main-intro">
                     <h3 >시설방역</h3>
                    <div class="split_content_wrap">
                            <span class="first-letter" area-hidden="true">웰</span>
                            <div class="split_content_inner">
                                <p>
                                    <span class="first-letter-hidden" area-hidden="true">웰</span>
                                    <span class="remaining">
                                    니스 피트니스는 회원님의 안전을 최우선으로 생각하여
                                    질병관리본부청의 행정명령 준수 하에 체온 측정, 환기 시스템, 소독을 통해 코로나 감염 위험에 철저히 대비합니다.                              
                                    </span>
                                </p>
                            </div>
                        </div>
                  
                  </div>
              </section>	
				
			  <!-- 시설방역   -->
              <section id="covid" class="main-wrapper" style="justify-content: center;">
                    <div class="main-pic-wrapper" style="background: #f5f5f5;  padding:100px 0;">    
                        <div class="c-wrapper">
                            <div class="cbox">
                            <p><i class="far fa-check-square"></i>&nbsp;체온 측정</p>
                            <img class="covidpic" src="resources/images/p_images/covid4.png" alt="체온계">
                            <p>입구에 배치된 열 감지 스캔 시스템으로 직접 접촉하지 않고도
                            신속하게 체온을 측정합니다.</p> 
                            </div>

                            <div class="cbox">
                            <p><i class="far fa-check-square"></i>&nbsp;환기 시스템</p>
                            <img class="covidpic" src="resources/images/p_images/covid1.png" alt="환풍기">
                            <p>공기나 표면의 세균이 최소 1시간마다 박멸되게 유지합니다.</p> 
                            </div>

                            <div class="cbox">
                            <p><i class="far fa-check-square"></i>&nbsp;소독</p>
                            <img class="covidpic" src="resources/images/p_images/covid3.png" alt="소독기">
                            <p>살균 소독 전문 업체와 웰니스 피트니스 직원이 하루 3번 센터 전체를 소독합니다.</p> 
                            </div>
                        </div>      
                  </div>
              </section>

              <!-- 코치소개   -->
              <section id="coach" class="main-wrapper">
                  <div class="main-intro">
                     <h3>코치소개</h3>
                  </div>

                  <div class="main-pic-wrapper" style="background: #1c1c1c;">
                    <div class="i-wrapper">
                            <div class="ibox text-right">
                                <img class="ipic" src="resources/images/p_images/instructor1.png" alt="">
                                <div class="itext">
                                    <h2 style="float: left;">PT</h2>
                                    <ul class="career">
                                    <li>생활체육지도자 1급</li>
                                    <li>바디발란스 대체의학 수료</li>
                                    <li>웰니스 피트니스 퍼스널트레이너</li>
                                    <li>라이프 스포츠 퍼스널트레이너</li>
                                    </ul>
                                    <p class="moto">
                                    "끝까지 버티는 정신력, 무너졌을 때 일어서는 힘, 다정함을 나누는 여유 모두
                                    결국은 체력에서 나오는 것이라 믿습니다."
                                    </p>
                                </div> 
                              <!-- <span class="iname alex">ALEX</span> -->
                            </div>

                            <div class="ibox text-left">
                            <div class="itext">
                                     <h2 style="text-align: right; float: right;">요가</h2>
                                    <ul class="career" style="text-align: right;">
                                    <li>생활체육지도자 1급</li>
                                    <li>바디발란스 대체의학 수료</li>
                                    <li>웰니스 피트니스 퍼스널트레이너</li>
                                    <li>라이프 스포츠 퍼스널트레이너</li>
                                    </ul>
                                    <p class="moto" style="text-align: right;">
                                    "끝까지 버티는 정신력, 무너졌을 때 일어서는 힘, 다정함을 나누는 여유 모두
                                    결국은 체력에서 나오는 것이라 믿습니다."
                                    </p>
                                </div>
                            <img class="ipic" src="resources/images/p_images/instructor2.png" alt="" style="height:600px;">
                            <!--  <span class="iname jen">JEN</span> -->
                            </div>

                            <div class="ibox text-right">
                            <img class="ipic" src="resources/images/p_images/coach33-removebg-preview.png" style= "max-width: 400px;" alt="">
                            <div class="itext">
                                    <h2 style="float: left;">필라테스</h2>
                                    <ul class="career">
                                    <li>생활체육지도자 1급</li>
                                    <li>바디발란스 대체의학 수료</li>
                                    <li>웰니스 피트니스 퍼스널트레이너</li>
                                    <li>라이프 스포츠 퍼스널트레이너</li>
                                    </ul>
                                    <p class="moto">
                                    "끝까지 버티는 정신력, 무너졌을 때 일어서는 힘, 다정함을 나누는 여유 모두
                                    결국은 체력에서 나오는 것이라 믿습니다."
                                    </p>
                                </div>
                           <!-- <span class="iname mia">MIA</span> -->
                            </div>

                            <div class="ibox text-left">
                            <div class="itext">
                                    <h2 style="text-align: right; float: right;">에어로빅</h2>
                                    <ul class="career"  style="text-align: right;">
                                    <li>생활체육지도자 1급</li>
                                    <li>바디발란스 대체의학 수료</li>
                                    <li>웰니스 피트니스 퍼스널트레이너</li>
                                    <li>라이프 스포츠 퍼스널트레이너</li>
                                    </ul>
                                    <p class="moto" style="text-align: right;">
                                    "끝까지 버티는 정신력, 무너졌을 때 일어서는 힘, 다정함을 나누는 여유 모두
                                    결국은 체력에서 나오는 것이라 믿습니다."
                                    </p>
                                </div>
                            <img class="ipic" src="resources/images/p_images/aerocoach-removebg-preview.png" alt="">
                            <!-- <span class="iname tina">TINA</span>  -->
                            </div>                  
                        </div>                     
                  </div>    
              </section>

              <!-- 위치안내 -->
              <section id="location" class="main-wrapper" >
                  <div class="main-intro">
                     <h3>위치안내</h3>
                  </div>

                  <div class="main-pic-wrapper">
                    <div class="l-wrapper">
                    <div id="map"></div>
                    <div class="ltext">                    
                        <p>웰니스 피트니스</p>
                        <p>서울 강남구 압구정로 99길 웰니스빌딩 3층</p>
                        <p style="margin-top: 40px;">영업 시간</p>
                        <p>월-금: 06:00-23:30
                        <br>토, 일, 공휴일: 09:00-18:00
                        <br>2주, 4주 일요일 휴무</p>
                    </div>             
                  </div>
                  </div>
                  
              </section>
    </div>      

  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTQIlxBn5AfKGvsfJiormAE1esN3fcCkg&callback=initMap" async defer></script>
 <%@ include file="include/footer.jsp" %>  