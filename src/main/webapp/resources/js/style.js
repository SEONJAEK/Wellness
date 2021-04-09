// main.html
var didScroll;
var lastScrollTop = 0;
var delta = 5; 

var navbarHeight = $('header, nav').outerHeight();

$(window).scroll(function(event){
    didScroll = true;
});


setInterval(function(){
 if(didScroll){
     hasScrolled();
     didScroll = false;
  }
}, 250);

// 동작을 구현
function hasScrolled() {
 var st = $(this).scrollTop(); 
 if(Math.abs(lastScrollTop - st) <= delta)
    return; 
 if(st > lastScrollTop && st > navbarHeight){
     $('header, nav, #mobile-nav').removeClass('nav-down').addClass('nav-up');
 } else {
     if(st + $(window).height() < $(document).height()) {
         $('header, nav, #mobile-nav').removeClass('nav-up').addClass('nav-down');
     }
 }
 lastScrollTop = st;
}
$(document).ready(function() {
  $(window).scroll(function() {
    if ($(this).scrollTop() <= 300)  {
        $('header').css("background-color", "rgba(45, 80, 148, 0)");
         } 
        else {
      $('header').css("background-color", "rgba(45, 80, 148, 1)");
    }
  });
});

//모바일 토글 버튼
$(document).ready(function(){
  $(".mobile-nav").hide();
  $(".btn-burger").click(function(){
    $(".mobile-nav").slideToggle("fast");
  });
});

//시설 소개 애니메이션
$(".mp").hover(function(){
  $(".mpt.tran").css("display", "block");
}, function(){
  $(".mpt.tran").css("display", "none");
});

//위치 안내 지도
function initMap() {
  const myLatLng = {
    lat: 37.52600709694355,
    lng: 127.04577275675955
  }
  const map = new google.maps.Map(
    document.getElementById('map'),
      {
        center: myLatLng,
        scrollwheel: false,
        zoom: 18
      }
  );
  const marker = new google.maps.Marker({
    position: myLatLng,
    map: map,
    title: 'Wellness'
  });
}

// 슬라이드
var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 5000); // Change image every 2 seconds
}
