<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Detail Company</title>
  <%@ include file="base/head.jsp" %>
</head>

<body>
<%@ include file="base/nav.jsp" %>

<div class="hero-wrap hero-wrap-2" style="background-image: url('<c:url value='/assets/images/bg_1.jpg' />')" data-stellar-background-ratio="0.5">
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
                        <img v-if="company.logo" :src='"${pageContext.request.contextPath}/assets/images/uploads/" + company.logo' alt="Selected Image"
		                     id="avatar" height="100" width="100" style="border-radius: 50px" >
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