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
  <%-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="<c:url value='/assets/js/google-map.js' /> "></script> --%>
  <%-- <script src="<c:url value='/assets/js/main.js' /> "></script> --%>
  <!-- <script src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script> -->
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  
  <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
</head>
<body>
<section>
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
	
	<div class="hero-wrap hero-wrap-2" style="background-image: url('<c:url value='/assets/images/bg_1.jpg' />')" data-stellar-background-ratio="0.5" th:if="${session.user.role.id == 2 }">
    <div class="overlay"></div>
	    <div class="container">
	        <div class="row no-gutters slider-text align-items-end justify-content-start">
	            <div class="col-md-12 text-center mb-5">
	                <p class="breadcrumbs mb-0"><span class="mr-3"><a href="index.html">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span> Đăng bài<span></span></p>
	                <h1 class="mb-3 bread">Đăng bài tuyển dụng</h1>
	            </div>
	        </div>
	    </div>
	</div>

<!-- HOME -->
	<section class="section-hero overlay inner-page bg-image" style="background-image: url('<c:url value='/assets/images/bg_1.jpg' />')" id="home-section" th:if="${session.user.role.id == 2 }">
	    <div class="container">
	        <div class="row">
	            <div class="col-md-7">
	                <h1 class="text-white font-weight-bold">Đăng bài</h1>
	                <div class="custom-breadcrumbs">
	                    <a href="#">Trang chủ</a> <span class="mx-2 slash">/</span>
	                    <span class="text-white"><strong>Đăng bài tuyển dụng</strong></span>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>
	
	
    <section id="app" class="site-section">
    	<h1 v-if="!isCompany" class="text-center "> Cần cập nhật thông tin công ty</h1>
        <div class="container" v-else>
            <form >
                <div class="row align-items-center mb-5">
                    <div class="col-lg-8 mb-4 mb-lg-0">
                        <div class="d-flex align-items-center">
                            <div>
                                <h2>Đăng bài</h2>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="row">
                            <div class="col-6">
                                <a href="#" class="btn btn-block btn-light btn-md"></a>
                            </div>
                            <div class="col-6">
                                <button type="button" @click="submit" class="btn btn-block btn-primary btn-md">Đăng</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mb-5">
                    <div class="col-lg-12">
                        <div class="p-4 p-md-5 border rounded" method="post">
                            <h3 class="text-black mb-5 border-bottom pb-2">Chi tiết bài tuyển dụng</h3>

                             <div class="form-group">
                        <label for="email">Tiêu đề</label><span class="color-red"> *</span>
                        <span class="color-red" v-if="validator.title"> ( {{ validator.title }} )</span>
                        <input type="text" v-model="recruitment.title" class="form-control" id="email" name="title"  required placeholder="Tiêu đề">
                    </div>
                    <div class="form-group">
                        <label for="job-location">Mô tả công việc</label><span class="color-red"> *</span>
                        <span class="color-red" v-if="validator.description"> ( {{ validator.description }} )</span>
                        <textarea  name="description"  v-model="recruitment.description" class="form-control" id="editorN" placeholder="Mô tả"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="job-title">Kinh nghiệm</label><span class="color-red"> *</span>
                        <span class="color-red" v-if="validator.experience"> ( {{ validator.experience }} )</span>
                        <input type="text" v-model="recruitment.experience" class="form-control" id="job-title" name="experience" placeholder="Kinh nghiệm">
                    </div>
                    <div class="form-group">
                        <label for="job-title">Số người cần tuyển</label><span class="color-red"> *</span>
                        <span class="color-red" v-if="validator.quantity"> ( {{ validator.quantity }} )</span>
                        <input type="number" v-model="recruitment.quantity" class="form-control" id="job-title" name="quantity" placeholder="Số người cần tuyển">
                    </div>
                    <div class="form-group">
                        <label for="job-location">Địa chỉ</label><span class="color-red"> *</span>
                        <span class="color-red" v-if="validator.address"> ( {{ validator.address }} )</span>
                        <input type="text" v-model="recruitment.address" class="form-control" id="job-location"  name="address" placeholder="Địa chỉ công ty">
                    </div>
                    <div class="form-group">
                        <label for="job-location">Hạn ứng tuyển</label><span class="color-red"> *</span>
                        <span class="color-red" v-if="validator.deadline"> ( {{ validator.deadline }} )</span>
                        <input type="date" v-model="recruitment.deadline" class="form-control" id="job-location"  name="deadline" placeholder="Địa chỉ công ty">
                    </div>
                    <div class="form-group">
                        <label for="job-location">Lương</label><span class="color-red"> *</span>
                        <span class="color-red" v-if="validator.salary"> ( {{ validator.salary }} )</span>
                        <input type="text" v-model="recruitment.salary" class="form-control" id="job-location" name="salary" placeholder="Mức lương">
                    </div>

                    <div class="form-group">
                        <label for="job-region">Loại công việc</label><span class="color-red"> *</span>
                        <span class="color-red" v-if="validator.type"> ( {{ validator.type }} )</span>
                        <select class="form-control" v-model="recruitment.type" name="type" aria-label="Default select example" required>
                            <option selected disabled>Chọn loại công việc</option>
                            <option value="Part time">Part time</option>
                            <option value="Full time">Full time</option>
                            <option value="Freelancer">Freelancer</option>
                        </select>

                    </div>
                    <div class="form-group">
                        <label for="job-region">Danh mục công việc</label> <span class="color-red"> *</span> 
                        <span class="color-red" v-if="validator.categorySelected"> ( {{ validator.categorySelected }} )</span>
                        <span class="color-red" >  {{ id }} </span>
                        
                         <select class="form-control" v-model="recruitment.categorySelected" aria-label="Default select example" required>
				            <option selected disabled >Chọn danh mục công việc</option>
				            <option v-for="cat in list_category" :value="cat.id">{{ cat.name }}</option>
				        </select>

                    </div>

                        </div>
                    </div>

                </div>
                <div class="row align-items-center mb-5">

                    <div class="col-lg-4 ml-auto">
                        <div class="row">
                            <div class="col-6">
                                <a href="#" class="btn btn-block btn-light btn-md"></a>
                            </div>
                            <div class="col-6">
                                <button type="button" @click="submit" class="btn btn-block btn-primary btn-md">Đăng tuyển</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>
</section>
</body>

<script type="text/javascript">
	window.recruitment = ${recruitment}; 
	window.url = '${pageContext.request.contextPath}';
</script>

<script src="<c:url value='/assets/js/export/post_create.js' /> "></script>

</html>