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
<!-- END nav -->

<div class="hero-wrap hero-wrap-2" style="background-image: url('<c:url value='/assets/images/bg_1.jpg' />')" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">
                <p class="breadcrumbs mb-0"><span class="mr-3"><a href="index.html">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span>Chi tiết <span></span></p>
                <h1 class="mb-3 bread">Chi tiết công việc</h1>
            </div>
        </div>
    </div>
</div>
<section id="app">
<section style="margin-top: 10px" class="site-section">
    <div class="container">
        <div class="row align-items-center mb-5">
            <div class="col-lg-8 mb-4 mb-lg-0">
                <div class="d-flex align-items-center">
                    <div class="border p-2 d-inline-block mr-3 rounded">
                        <%-- <img width="100" height="100" th:src="${recruitment.company.logo}" alt="Image"> --%>
                    </div>
                    <div>
                        <h2></h2>
                        <div>
                            <span class="icon-briefcase mr-2"></span><a class="ml-0 mr-2 mb-2"></a>
                            <span  class="icon-room mr-2"></span ><span class="m-2"></span>
                            <span class="icon-clock-o mr-2"></span><span class="m-2"></span>
                        </div>
                        <input type="hidden">
                    </div>
                </div>
            </div>
           
            <div class="col-lg-4">
                <div  class="row">
                    <div class="col-6">
                        <a class="btn btn-block btn-light btn-md"><span class="icon-heart-o mr-2 text-danger"></span>Lưu</a>
                    </div>
                    <div class="col-6">
                        <a data-toggle="modal" class="btn btn-block btn-primary btn-md">Ứng tuyển</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8">
                <div class="mb-5">

                    <h3 class="h5 d-flex align-items-center mb-4 text-primary"><span class="icon-align-left mr-3"></span>Mô tả công việc</h3>
                    <p>{{ rec.description }}</p>
                </div>

            </div>
            <div class="col-lg-4">
                <div class="bg-light p-3 border rounded mb-4">
                    <h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Tóm tắt công việc</h3>
                    <ul class="list-unstyled pl-3 mb-0">
                       <li class="mb-2"> <strong class="text-black">Ngày tạo: </strong> <span>{{ rec.createdAt }}</span> </li>
                        <li class="mb-2"><strong class="text-black">Kiểu công việc: </strong> <span>{{ rec.type }}</span></li>
                        <li class="mb-2"><strong class="text-black">Loại công việc: </strong> <span>{{ rec.type }}</span></li>
                        <li class="mb-2"><strong class="text-black">Kinh nghiệm: </strong> <span>{{ rec.experience }}</span></li>
                        <li class="mb-2"><strong class="text-black">Đại chỉ: </strong> <span>{{ rec.address }}</span></li>
                        <li class="mb-2"><strong class="text-black">Lương: </strong> <span>{{ rec.salary }}</span></li>
                        <li class="mb-2"><strong class="text-black">Số lượng: </strong><span>{{ rec.quantity }}</span></li>
                        <li class="mb-2"><strong class="text-black">Hạn nộp cv: </strong><span>{{ rec.deadline }}</span></li>
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
<!-- Modal -->
<%-- <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ứng tuyển: <span></span></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="post" action="/user/apply-job">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-12">
                            <label for="fileUpload"
                                   class="col-form-label">Chọn cv:</label>
                            <input type="file" class="form-control"
                                   th:id="${'fileUpload'}+${recruitment.id}" name="file"   required>
                            <label for="fileUpload"
                                   class="col-form-label">Giới thiệu:</label>
                            <textarea rows="10" cols="3" class="form-control" >

                                                    </textarea>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        <button type="button" th:onclick="'apply(' +${recruitment.id}+ ')'" class="btn btn-primary">Nộp</button>
                    </div>
                </div>
            </form>


        </div>
    </div>
</div> --%>
<section class="site-section" id="next">
    <div class="container">

        <div class="row mb-5 justify-content-center">
            <div class="col-md-7 text-center">
                <h2 class="section-title my-4" >Danh sách ứng viên ứng tuyển</h2>
                <h2 class="section-title my-4" >Những công việc liên quan</h2> <%-- th:unless="${applyPosts} --%>
            </div>
        </div>

        <div class="row"><%--  th:if="${applyPosts != null}" --%>
            <div class="col-lg-12 pr-lg-4">
                <div class="row">
                   <%--  <th:block th:if="${applyPosts.size() != 0}" th:each="applyPost : ${applyPosts}"> --%>
                        <div class="col-md-12" style="box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px;margin: 20px auto;">
                            <div class="team d-md-flex p-4 bg-white">
                                <%-- <IMG class="img" th:src="${applyPost.user.image != null ? applyPost.user.image : 'https://st.quantrimang.com/photos/image/072015/22/avatar.jpg'}"></IMG> --%>
                                <div class="text pl-md-4">
                                    <H5 class="location mb-0" ></H5> <%-- th:text="${applyPost.user.fullName}" --%>
                                    <p style="display: block;color: black" ></p> <%-- th:text="${applyPost.user.address}" --%>
                                    <span class="position" style="display: block;color: black" ></span> <%-- th:text="${applyPost.user.email}" --%>
                                    <p class="mb-4" style="width: 700px" >.</p> <%-- th:utext="${applyPost.user.description}" --%>
                                    <div class="row">
                                        <p><a href="#"  class="btn btn-primary"  >Xem cv</a></p> <%-- th:if="${applyPost.nameCv != null}" th:href="${'http://localhost:8080/resources/uploads/'} +${applyPost.nameCv}" --%>
                                        <p  style="margin-left: 10px"><a class="btn btn-outline-primary"  >Duyệt</a></p> <%-- th:if="${applyPost.status == 0}" href="${'/user/approve/'} +${applyPost.user.id} +${'/'} +${recruitment.id}" --%>
                                        <p  style="margin-left: 10px;margin-top: 15px"><span style="color: #1e7e34;font-weight: bold" >Đã duyệt</span></p> <%-- th:if="${applyPost.status == 1}" --%>
                                    </div>

                                </div>
                            </div>
                        </div>
                   <!--  </th:block> -->
                    <p>Chưa có ứng cử viên nào ứng tuyển</p>


                </div>
            </div>

            <div class="col-lg-4 sidebar">
                <div class="sidebar-box bg-white p-4 ftco-animate">
                    <h3 class="heading-sidebar">Browse Category</h3>
                    <form action="#" class="search-form mb-3">
                        <div class="form-group">
                            <span class="icon icon-search"></span>
                            <input type="text" class="form-control" placeholder="Search...">
                        </div>
                    </form>
                    <form action="#" class="browse-form">
                        <label for="option-job-1"><input type="checkbox" id="option-job-1" name="vehicle" value="" checked> Website &amp; Software</label><br>
                        <label for="option-job-2"><input type="checkbox" id="option-job-2" name="vehicle" value=""> Education &amp; Training</label><br>
                        <label for="option-job-3"><input type="checkbox" id="option-job-3" name="vehicle" value=""> Graphics Design</label><br>
                        <label for="option-job-4"><input type="checkbox" id="option-job-4" name="vehicle" value=""> Accounting &amp; Finance</label><br>
                        <label for="option-job-5"><input type="checkbox" id="option-job-5" name="vehicle" value=""> Restaurant &amp; Food</label><br>
                        <label for="option-job-6"><input type="checkbox" id="option-job-6" name="vehicle" value=""> Health &amp; Hospital</label><br>
                    </form>
                </div>

                <div class="sidebar-box bg-white p-4 ftco-animate">
                    <h3 class="heading-sidebar">Select Location</h3>
                    <form action="#" class="search-form mb-3">
                        <div class="form-group">
                            <span class="icon icon-search"></span>
                            <input type="text" class="form-control" placeholder="Search...">
                        </div>
                    </form>
                    <form action="#" class="browse-form">
                        <label for="option-location-1"><input type="checkbox" id="option-location-1" name="vehicle" value="" checked> Sydney, Australia</label><br>
                        <label for="option-location-2"><input type="checkbox" id="option-location-2" name="vehicle" value=""> New York, United States</label><br>
                        <label for="option-location-3"><input type="checkbox" id="option-location-3" name="vehicle" value=""> Tokyo, Japan</label><br>
                        <label for="option-location-4"><input type="checkbox" id="option-location-4" name="vehicle" value=""> Manila, Philippines</label><br>
                        <label for="option-location-5"><input type="checkbox" id="option-location-5" name="vehicle" value=""> Seoul, South Korea</label><br>
                        <label for="option-location-6"><input type="checkbox" id="option-location-6" name="vehicle" value=""> Western City, UK</label><br>
                    </form>
                </div>

                <div class="sidebar-box bg-white p-4 ftco-animate">
                    <h3 class="heading-sidebar">Job Type</h3>
                    <form action="#" class="browse-form">
                        <label for="option-job-type-1"><input type="checkbox" id="option-job-type-1" name="vehicle" value="" checked> Partime</label><br>
                        <label for="option-job-type-2"><input type="checkbox" id="option-job-type-2" name="vehicle" value=""> Fulltime</label><br>
                        <label for="option-job-type-3"><input type="checkbox" id="option-job-type-3" name="vehicle" value=""> Intership</label><br>
                        <label for="option-job-type-4"><input type="checkbox" id="option-job-type-4" name="vehicle" value=""> Temporary</label><br>
                        <label for="option-job-type-5"><input type="checkbox" id="option-job-type-5" name="vehicle" value=""> Freelance</label><br>
                        <label for="option-job-type-6"><input type="checkbox" id="option-job-type-6" name="vehicle" value=""> Fixed</label><br>
                    </form>
                </div>
            </div>
        </div>
        <%-- <th:block  th:each="recruitment : ${listRelated}"> --%>
           <%--  <div th:unless="${applyPosts}" class="col-md-12 ">
                <div class="job-post-item p-4 d-block d-lg-flex align-items-center">
                    <div class="one-third mb-4 mb-md-0">
                        <div class="job-post-item-header align-items-center">
                            <span class="subadge" th:text="${recruitment.type}"></span>
                            <h2 class="mr-3 text-black" ><a th:text="${recruitment.title}" th:href="${'/recruitment/detail/'} +${recruitment.id}"></a></h2>
                        </div>
                        <div class="job-post-item-body d-block d-md-flex">
                            <div class="mr-3"><span class="icon-layers"></span> <a href="#" th:text="${recruitment.Company.nameCompany}" ></a></div>
                            <div><span class="icon-my_location"></span> <span th:text="${recruitment.address}"></span></div>
                        </div>
                    </div>

                    <input type="hidden" th:id="${'idRe'}+${recruitment.id}" th:value="${recruitment.id}">
                    <div th:if="${session.user}" class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
                        <div th:if="${session.user.role.id == 1}">
                            <a  th:onclick="'save(' +${recruitment.id}+ ')'" class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
                                <span class="icon-heart"></span>
                            </a>
                        </div>
                        <a th:if="${session.user.role.id == 1}" data-toggle="modal" th:data-target="${'#exampleModal'}+${recruitment.id}" class="btn btn-primary py-2">Apply Job</a>
                    </div>
                    <div th:unless="${session.user}" class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
                        <div >
                            <a  th:onclick="'save(' +${recruitment.id}+ ')'" class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
                                <span class="icon-heart"></span>
                            </a>
                        </div>
                        <a  data-toggle="modal" th:data-target="${'#exampleModal'}+${recruitment.id}" class="btn btn-primary py-2">Apply Job</a>
                    </div>
                </div>
            </div><!-- end --> --%>
       <!--  </th:block> -->
    </div>
</section>
</section>

</body>

<script type="text/javascript">
	window.recruitment = ${recruitment}; 
	window.url = '${pageContext.request.contextPath}';
</script>

<script src="<c:url value='/assets/js/export/post_detail.js' /> "></script>

</html>