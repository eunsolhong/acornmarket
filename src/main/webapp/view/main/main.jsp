<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="zxx">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>도토리 마켓</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
</head>
<body>
    <!-- slider_area_start -->
    <div class="slider_area">
        <div class="single_slider slider_bg_1 d-flex align-items-center">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5 col-md-6">
                        <div class="slider_text" style="position: absolute; top: 50%; transform: translateY(-50%);">
                            <h3>우리 동네 <br><span>중고 직거래</span> 마켓</h3>
                            <p>동네 주민들과 가깝고 따뜻한 거래를 지금 경험해보세요.</p>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-6">
                    </div>
                    <div class="col-lg-5 col-md-6 fcan">
                    	<canvas id="myChart1" width="400" height="250"></canvas>
                    	<canvas id="myChart2" width="400" height="250"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="service_area">
        <div class="container">
            <div class="row justify-content-center ">
                <div class="col-lg-7 col-md-10">
                    <div class="section_title text-center mb-95">
                        <h3>도토리 마켓은 이런점이 달라요.</h3>
                        <p>동네 주민들과 가깝고 따듯한 거래를 지금 경험해보세요.</p>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-4 col-md-6">
                    <div class="single_service">
                         <div class="service_thumb service_icon_bg_1 d-flex align-items-center justify-content-center">
                             <div class="service_icon">
                                 <img src="img/service/acorn1.png" alt="">
                             </div>
                         </div>
                         <div class="service_content text-center">
                            <h3>거래 장소 지정</h3>
                            <p>거래할 장소를 직접 선택 가능해요.</p>
                         </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single_service active">
                         <div class="service_thumb service_icon_bg_2 d-flex align-items-center justify-content-center">
                             <div class="service_icon">
                                 <img src="img/service/acorn2.png" alt="">
                             </div>
                         </div>
                         <div class="service_content text-center">
                            <h3>거래 매너 온도</h3>
                            <p>거래 후 당신의 온도를 올려보세요.</p>
                         </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single_service">
                         <div class="service_thumb service_icon_bg_3 d-flex align-items-center justify-content-center">
                             <div class="service_icon">
                                 <img src="img/service/acorn3.png" alt="">
                             </div>
                         </div>
                         <div class="service_content text-center">
                            <h3>채팅하고 쪽지 보내기</h3>
                            <p>채팅과 쪽지로 의사소통을 진행하세요.</p>
                         </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    
    
    
    
<!-- 
    pet_care_area_start 
    <div class="pet_care_area">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-5 col-md-6">
                    <div class="pet_thumb">
                        <img src="img/about/pet_care.png" alt="">
                    </div>
                </div>
                <div class="col-lg-6 offset-lg-1 col-md-6">
                    <div class="pet_info">
                        <div class="section_title">
                            <h3><span>We care your pet </span> <br>
                                As you care</h3>
                            <p>Lorem ipsum dolor sit , consectetur adipiscing elit, sed do <br> iusmod tempor incididunt ut labore et dolore magna aliqua. <br> Quis ipsum suspendisse ultrices gravida. Risus commodo <br>
                                viverra maecenas accumsan.</p>
                            <a href="about.html" class="boxed-btn3">About Us</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    pet_care_area_end 

    adapt_area_start 
    <div class="adapt_area">
        <div class="container">
            <div class="row justify-content-between align-items-center">
                <div class="col-lg-5">
                    <div class="adapt_help">
                        <div class="section_title">
                            <h3><span>We need your</span>
                                help Adopt Us</h3>
                            <p>Lorem ipsum dolor sit , consectetur adipiscing elit, sed do iusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices.</p>
                            <a href="contact.html" class="boxed-btn3">Contact Us</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="adapt_about">
                        <div class="row align-items-center">
                            <div class="col-lg-6 col-md-6">
                                <div class="single_adapt text-center">
                                    <img src="img/adapt_icon/1.png" alt="">
                                    <div class="adapt_content">
                                        <h3 class="counter">452</h3>
                                        <p>Pets Available</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <div class="single_adapt text-center">
                                    <img src="img/adapt_icon/3.png" alt="">
                                    <div class="adapt_content">
                                        <h3><span class="counter">52</span>+</h3>
                                        <p>Pets Available</p>
                                    </div>
                                </div>
                                <div class="single_adapt text-center">
                                    <img src="img/adapt_icon/2.png" alt="">
                                    <div class="adapt_content">
                                        <h3><span class="counter">52</span>+</h3>
                                        <p>Pets Available</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    adapt_area_end 

    testmonial_area_start 
    <div class="testmonial_area">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <div class="textmonial_active owl-carousel">
                        <div class="testmonial_wrap">
                            <div class="single_testmonial d-flex align-items-center">
                                <div class="test_thumb">
                                    <img src="img/testmonial/1.png" alt="">
                                </div>
                                <div class="test_content">
                                    <h4>Jhon Walker</h4>
                                    <span>Head of web design</span>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exerci.</p>
                                </div>
                            </div>
                        </div>
                        <div class="testmonial_wrap">
                            <div class="single_testmonial d-flex align-items-center">
                                <div class="test_thumb">
                                    <img src="img/testmonial/1.png" alt="">
                                </div>
                                <div class="test_content">
                                    <h4>Jhon Walker</h4>
                                    <span>Head of web design</span>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exerci.</p>
                                </div>
                            </div>
                        </div>
                        <div class="testmonial_wrap">
                            <div class="single_testmonial d-flex align-items-center">
                                <div class="test_thumb">
                                    <img src="img/testmonial/1.png" alt="">
                                </div>
                                <div class="test_content">
                                    <h4>Jhon Walker</h4>
                                    <span>Head of web design</span>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exerci.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    testmonial_area_end 

    team_area_start 
    <div class="team_area">
        <div class="container">
            <div class="row justify-content-center ">
                <div class="col-lg-6 col-md-10">
                    <div class="section_title text-center mb-95">
                        <h3>Our Team</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.</p>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-4 col-md-6">
                    <div class="single_team">
                        <div class="thumb">
                            <img src="img/team/1.png" alt="">
                        </div>
                        <div class="member_name text-center">
                            <div class="mamber_inner">
                                <h4>Rala Emaia</h4>
                                <p>Senior Director</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single_team">
                        <div class="thumb">
                            <img src="img/team/2.png" alt="">
                        </div>
                        <div class="member_name text-center">
                            <div class="mamber_inner">
                                <h4>jhon Smith</h4>
                                <p>Senior Director</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single_team">
                        <div class="thumb">
                            <img src="img/team/3.png" alt="">
                        </div>
                        <div class="member_name text-center">
                            <div class="mamber_inner">
                                <h4>Rala Emaia</h4>
                                <p>Senior Director</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    team_area_start 

    <div class="contact_anipat anipat_bg_1">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="contact_text text-center">
                        <div class="section_title text-center">
                            <h3>Why go with Anipat?</h3>
                            <p>Because we know that even the best technology is only as good as the people behind it. 24/7 tech support.</p>
                        </div>
                        <div class="contact_btn d-flex align-items-center justify-content-center">
                            <a href="contact.html" class="boxed-btn4">Contact Us</a>
                            <p>Or  <a href="#"> +880 4664 216</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
-->
    <footer class="footer">
        <div class="footer_top">
            <div class="container">
                <div class="row">
                    <div class="col-xl-4 col-md-8 col-lg-4">
                        <div class="footer_widget">
                            <h3 class="footer_title">Introduction</h3>
                            <ul class="address_line">
                                <li>+880 4664 216</li>
                                <li><a href="#"></a></li>
                                <li>132, Teheran-ro, Gangnam-gu, Seoul, Republic of Korea</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xl-4  col-md-8 col-lg-4">
                        <div class="footer_widget">
                            <h3 class="footer_title">Service</h3>
                            <ul class="links">
                                <li><a href="#" onclick="return false;">거래 온도</a></li>
                                <li><a href="#" onclick="return false;">거래 게시판</a></li>
                                <li><a href="#" onclick="return false;">거래 장소 설정</a></li>
                                <li><a href="#" onclick="return false;">쪽지 채팅</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xl-4  col-md-8 col-lg-4">
                        <div class="footer_widget">
                            <h3 class="footer_title">Project Member</h3>
                            <ul class="links">
                                <li><a href="#" onclick="return false;">Song Jinhoon</a></li>
                                <li><a href="#" onclick="return false;">Kim Sunho</a></li>
                                <li><a href="#" onclick="return false;">Kim Ensole</a></li>
                                <li><a href="#" onclick="return false;">Kim Yurim</a></li>
                            </ul>
                        </div>
                    </div>
<!--                     <div class="col-xl-3 col-md-6 col-lg-3 ">
                        <div class="footer_widget">
                            <div class="footer_logo">
                                <a href="#">
                                    <img src="img/logo.png" alt="">
                                </a>
                            </div>
                           	<p class="address_text">Spring MVC Project Market Site</p>
                            <div class="socail_links">
                                <ul>
                                    <li>
                                        <a href="#">
                                            <i class="ti-facebook"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="ti-pinterest"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-google-plus"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-linkedin"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div> -->
                </div>
            </div>
        </div>
        <div class="copy-right_text">
            <div class="container">
                <div class="bordered_1px"></div>
                <div class="row">
                    <div class="col-xl-12">
                        <p class="copy_right text-center">
                        	동네 주민들과 함께 하는 사이트 도토리 마켓
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </footer>


    <!-- JS here -->
    <script src="${pageContext.request.contextPath}/js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/isotope.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/ajax-form.js"></script>
    <script src="${pageContext.request.contextPath}/js/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.counterup.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/imagesloaded.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/scrollIt.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.scrollUp.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.slicknav.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
    <script src="${pageContext.request.contextPath}/js/gijgo.min.js"></script>

    <!--contact js-->
    <script src="${pageContext.request.contextPath}/js/contact.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.ajaxchimp.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/mail-script.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
    <script>
    	var webNote;
    	console.log(webNote);
        
    	$(document).ready(function(){

 			$.ajax({
	            url: "http://localhost:8080${pageContext.request.contextPath}/main/chart1",
	            type: "GET",
	            success: function(user){
	            	/* chart1 정의 */            	
	            	var ctx = document.getElementById('myChart1');
					var myChart = new Chart(ctx, {
					    type: 'bar',
					    data: {
					        labels: [user[0].userid, user[1].userid,'Yellow', 'Green', 'Purple', 'Orange'],
					        datasets: [{
					            label: '도토리인 Top 6',
					            data: [user[0].userscore, user[1].userscore, 3, 5, 2, 3],
					            backgroundColor: [
					                'rgba(255, 99, 132, 0.2)',
					                'rgba(54, 162, 235, 0.2)',
					                'rgba(255, 206, 86, 0.2)',
					                'rgba(75, 192, 192, 0.2)',
					                'rgba(153, 102, 255, 0.2)',
					                'rgba(255, 159, 64, 0.2)'
					            ],
					            borderColor: [
					                'rgba(255, 99, 132, 1)',
					                'rgba(54, 162, 235, 1)',
					                'rgba(255, 206, 86, 1)',
					                'rgba(75, 192, 192, 1)',
					                'rgba(153, 102, 255, 1)',
					                'rgba(255, 159, 64, 1)'
					            ],
					            borderWidth: 1
					        }]
					    },
					    options: {
					        scales: {
					            yAxes: [{
					                ticks: {
					                    beginAtZero: true
					                }
					            }]
					        }
					    }
					});
	    
	            },
	            
	            error: function(){
	                alert("serialize err");
	            }
	        });
 			
 			$.ajax({
	            url: "http://localhost:8080${pageContext.request.contextPath}/main/chart2",
	            type: "GET",
	            success: function(data){
	            	alert(data);
	            	/* chart2 정의 */          
	        		var ctx = document.getElementById('myChart2');
	        		var myChart = new Chart(ctx, {
	        		    type: 'pie',
	        		    data: {
	        		        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
	        		        datasets: [{
	        		            label: '# of Votes',
	        		            data: [12, 19, 3, 5, 2, 3],
	        		            backgroundColor: [
	        		                'rgba(255, 99, 132, 0.2)',
	        		                'rgba(54, 162, 235, 0.2)',
	        		                'rgba(255, 206, 86, 0.2)',
	        		                'rgba(75, 192, 192, 0.2)',
	        		                'rgba(153, 102, 255, 0.2)',
	        		                'rgba(255, 159, 64, 0.2)'
	        		            ],
	        		            borderColor: [
	        		                'rgba(255, 99, 132, 1)',
	        		                'rgba(54, 162, 235, 1)',
	        		                'rgba(255, 206, 86, 1)',
	        		                'rgba(75, 192, 192, 1)',
	        		                'rgba(153, 102, 255, 1)',
	        		                'rgba(255, 159, 64, 1)'
	        		            ],
	        		            borderWidth: 1
	        		        }]
	        		    },
	        		    options: {
	        		        scales: {
	        		            yAxes: [{
	        		                ticks: {
	        		                    beginAtZero: true
	        		                }
	        		            }]
	        		        }
	        		    }
	        		});
	            },
	            
	            error: function(){
	                alert("serialize err");
	            }
	        });
    	})
    
    
    
        $('#datepicker').datepicker({
            iconsLibrary: 'fontawesome',
            disableDaysOfWeek: [0, 0],
        //     icons: {
        //      rightIcon: '<span class="fa fa-caret-down"></span>'
        //  }
        });
        
        $('#datepicker2').datepicker({
            iconsLibrary: 'fontawesome',
            icons: {
             rightIcon: '<span class="fa fa-caret-down"></span>'
         }

        });
        var timepicker = $('#timepicker').timepicker({
        	format: 'HH.MM'
     	});
        
    </script>
</body>
</html>




