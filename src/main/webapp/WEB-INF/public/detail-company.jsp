<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head">
    <title>Work CV</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700&display=swap" rel="stylesheet">

  <!-- CSS -->
  <link rel="stylesheet" href="<c:url value='/assets/css/open-iconic-bootstrap.min.css' /> ">
  <link rel="stylesheet" href="<c:url value='/assets/css/animate.css' /> ">
  <link rel="stylesheet" href="<c:url value='/assets/css/owl.carousel.min.css' /> ">
  <link rel="stylesheet" href="<c:url value='/assets/css/owl.theme.default.min.css' /> ">
  <link rel="stylesheet" href="<c:url value='/assets/css/magnific-popup.css' /> ">
  <link rel="stylesheet" href="<c:url value='/assets/css/owl.carousel.min.css' /> ">
  <link rel="stylesheet" href="<c:url value='/assets/css/owl.theme.default.min.css' /> ">
  <link rel="stylesheet" href="<c:url value='/assets/css/aos.css' /> ">
  <link rel="stylesheet" href="<c:url value='/assets/css/ionicons.min.css' /> ">
  <link rel="stylesheet" href="<c:url value='/assets/css/bootstrap-datepicker.css' /> ">
  <link rel="stylesheet" href="<c:url value='/assets/css/jquery.timepicker.css' /> ">
  <link rel="stylesheet" href="<c:url value='/assets/css/css/bootstrap-reboot.css' /> ">
  <link rel="stylesheet" href="<c:url value='/assets/css/css/mixins/_text-hide.css' /> ">
  <link rel="stylesheet" href="<c:url value='/assets/css/flaticon.css' /> ">
  <link rel="stylesheet" href="<c:url value='/assets/css/icomoon.css' /> ">
  <link rel="stylesheet" href="<c:url value='/assets/css/style.css' /> ">
  <link rel="stylesheet" href="<c:url value='/assets/css/bootstrap/bootstrap-grid.css' /> ">
  <link rel="stylesheet" href="<c:url value='/assets/css/bootstrap/bootstrap-reboot.css' /> ">

  <!-- JS -->
  <script src="<c:url value='/assets/js/jquery.min.js' /> "></script>
  <script src="<c:url value='/assets/js/jquery-migrate-3.0.1.min.js' /> "></script>
  <script src="<c:url value='/assets/js/popper.min.js' /> "></script>
  <script src="<c:url value='/assets/js/bootstrap.min.js' /> "></script>
  <script src="<c:url value='/assets/js/jquery.easing.1.3.js' /> "></script>
  <script src="<c:url value='/assets/js/jquery.waypoints.min.js' /> "></script>
  <script src="<c:url value='/assets/js/jquery.stellar.min.js' /> "></script>
  <script src="<c:url value='/assets/js/owl.carousel.min.js' /> "></script>
  <script src="<c:url value='/assets/js/jquery.magnific-popup.min.js' /> "></script>
  <%-- <script src="<c:url value='/assets/js/aos.js' /> "></script> --%>
  <script src="<c:url value='/assets/js/jquery.animateNumber.min.js' /> "></script>
  <script src="<c:url value='/assets/js/scrollax.min.js' /> "></script>
  <%-- <script src="<c:url value='/assets/js/main.js' /> "></script> --%>
  <!-- <script src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script> -->
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  
  <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid px-md-4	">
			<a class="navbar-brand" href="/">Work CV</a>				
			<div class="collapse navbar-collapse" id="ftco-nav">     
				<ul class="navbar-nav ml-auto">				
					<c:if test="${pageContext.request.userPrincipal != null}">
						<li class="nav-item cta mr-md-1" style="position: relative;">
							<a class="dropdown-toggle nav-link pr-5" data-toggle="dropdown" href="#">${pageContext.request.userPrincipal.name}</a>            
							<ul class="dropdown-menu">
								<li class="nav-link dropdown-item"><a class="text-dark" href="${pageContext.request.contextPath}/profile/home">Hồ Sơ</a></li>
								<li class="nav-link dropdown-item"><a class="text-dark" href="/save-job/get-list" >Công việc đã lưu</a></li>
								<li class="nav-link dropdown-item"><a class="text-dark" href="/user/list-post" >Danh sách bài đăng</a></li>
								<li class="nav-link dropdown-item"><a class="text-dark" href="/user/get-list-apply" >Công việc đã ứng tuyển</a></li>
								<li class="nav-link dropdown-item"><a class="text-dark" href="/user/get-list-company" >Công ty đã theo dõi</a></li>
								<li class="nav-link dropdown-item"><a class="text-dark" href="${pageContext.request.contextPath}/logout" >Đăng xuất</a></li>
							</ul>
						</li>
					</c:if>
						
					<c:if test="${pageContext.request.userPrincipal == null}">
						<li class="nav-item cta cta-colored"><a href="${pageContext.request.contextPath}/auth/login" class="nav-link">Đăng nhập</a></li>
					</c:if>
					
				</ul>
			</div>
	    
		</div>
	</nav>

<div class="hero-wrap hero-wrap-2" style="background-image: url('/assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">
                <p class="breadcrumbs mb-0"><span class="mr-3"><a href="index.html">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span>Chi tiết <span></span></p>
                <h1 class="mb-3 bread">Chi tiết công ty</h1>
            </div>
        </div>
    </div>
</div>

<section id="app" style="margin-top: 10px" class="site-section">
    <div class="container">
        <div class="row align-items-center mb-5">
            <div class="col-lg-8 mb-4 mb-lg-0">
                <div class="d-flex align-items-center">
                    <div class="border p-2 d-inline-block mr-3 rounded">
                        <img width="100" height="100"  alt="Image">
                    </div>
                    <div>
                        <h2>{{company.name}}</h2>
                        <div>
                            <span class="icon-briefcase mr-2"></span><span  class="ml-0 mr-2 mb-2">{{company.email}}</span>
                            <span  class="icon-room mr-2"></span ><span class="m-2">{{company.address}}</span>

                        </div>
                        <input type="hidden" id="idCompany">
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="row">
                <div class="col-3">
                    </div>
                    <div  class="col-6">
                        <a @click="followCompany" v-if="!isFollowCompany" class="btn btn-block btn-light btn-md"><span class="icon-heart-o mr-2 text-danger"></span>Theo dõi</a>
                        <a @click="followCompany" v-if="isFollowCompany" class="btn btn-block btn-light btn-md"><span class="fa fa-heart mr-2 text-danger"></span>Bỏ theo dõi</a>
                    </div>
                    
                    <div class="col-3">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8">
                <div class="mb-5">

                    <h3 class="h5 d-flex align-items-center mb-4 text-primary"><span class="icon-align-left mr-3"></span>Mô tả công việc</h3>
                    <p>{{company.description}}</p>
                </div>

            </div>
            <div class="col-lg-4">
                <div class="bg-light p-3 border rounded mb-4">
                    <h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Tóm tắt công việc</h3>
                    <ul class="list-unstyled pl-3 mb-0">

                        <li class="mb-2"><strong class="text-black">Email công ty: </strong> <span>{{company.email}}</span></li>
                        <li class="mb-2"><strong class="text-black">Số điện thoại: </strong> <span>{{company.phoneNumber}}</span></li>
                        <li class="mb-2"><strong class="text-black">Địa chỉ: </strong> <span>{{company.address}}</span></li>
                    </ul>
                </div>

                <div class="bg-light p-3 border rounded">
                    <h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Share</h3>
                    <div class="px-3">
                        <a href="#" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-facebook"></span></a>
                        <a href="#" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-twitter"></span></a>
                        <a href="#" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-linkedin"></span></a>
                        <a href="#" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-pinterest"></span></a>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>

<script type="text/javascript">
	window.userId = ${userId};
	window.company = ${company};
	window.url = '${pageContext.request.contextPath}';
</script>

<script src="<c:url value='/assets/js/export/company_detail.js' /> "></script>
</body>
</html>