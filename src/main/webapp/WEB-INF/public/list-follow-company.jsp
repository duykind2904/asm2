<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Follow Company</title>
  <%@ include file="base/head.jsp" %>
</head>

<body>
<%@ include file="base/nav.jsp" %>
	<!-- END nav -->

<div class="hero-wrap hero-wrap-2" style="background-image: url('<c:url value='/assets/images/bg_1.jpg' />')" data-stellar-background-ratio="0.5" th:if="${session.user.role.id == 2 }">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">
                <p class="breadcrumbs mb-0"><span class="mr-3"><a href="index.html">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span>Danh sách <span></span></p>
                <h1 class="mb-3 bread">Danh sách công ty đã theo dõi</h1>
            </div>
        </div>
    </div>
</div>

<section id="app" class="ftco-section bg-light">
    <div class="container">
        <div class="row">
            <div v-if="totalCount > 0" class="col-lg-12 pr-lg-5">
                <button class="btn btn-success m-3">{{totalCount}} kết quả  </button>
				<div v-for="(c, index) in companies" :key="index">
                     <div class="col-md-12 ">
                         <div class="job-post-item p-4 d-block d-lg-flex align-items-center">
                             <div class="one-third mb-4 mb-md-0">
                                 <div class="job-post-item-header align-items-center">
<!--                                        <span class="subadge" th:text="${saveJob.com.type}"></span>-->
                                     <h2 class="mr-3 text-black" ><a> {{c.name}}</a></h2>
                                 </div>
                                 <div class="job-post-item-body d-block d-md-flex">
                                     <div class="mr-3"><span class="icon-layers"></span> <a href="#">{{c.email}}</a></div>
                                     <div class="mr-3"><span class="icon-my_location"></span> <span>{{c.address}}</span></div>
                                     <div style="margin-left: 10"><span class="icon-my_location"></span> <span>{{c.phoneNumber}}</span></div>
                                 </div>
                             </div>
                             <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0" style="width:370px !important;">
                             	<div>
	                                 <div v-if="c.isFollow == false" @click="folowCompany(c.id, true)" class=" text-center d-flex justify-content-center align-items-center icon mr-2">
	                                     <span class="icon-delete"></span>
	                                 </div>
	                                 <div v-if="c.isFollow == true" @click="folowCompany(c.id, false)" class=" text-center d-flex justify-content-center align-items-center iconShow mr-2">
	                                     <span class="icon-delete"></span>
	                                 </div>
                             	</div>
                                 
                                 <a :href="'${pageContext.request.contextPath}/company/detail?id=' + c.id" class="btn btn-primary py-2">Chi tiết</a>
                                 <a :href="'${pageContext.request.contextPath}/post/list?companyId=' + c.id" class="btn btn-warning py-2 ml-1">Danh sách bài đăng</a>
                             </div>
                         </div>
                     </div><!-- end -->
             

                </div>
                <%-- <div style="text-align: center" th:if="${saveJobList.totalPages < 1}">
                    <p style="color:red;">Danh sách trống</p>
                </div> --%>
                
                <div class="row mt-5" v-if="pageTotal>0">
                    <div class="col text-center">
                        <div class="block-27">
                            <ul>   
                            	<li v-if="pageNumber>1" @click="getPage(pageNumber-1)"><a>&lt;</a></li>   
                            	                       
                                <li v-for="i in pageTotal" :key="i">
                                	<a class="mx-1" :class="{ 'btn-info': i === activeIndex }" @click="getPage(i)"> {{ i }}</a> 
                                </li>
                               
                                <li v-if="pageNumber < pageTotal" @click="getPage(pageNumber+1)"><a>&gt;</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            
            <div v-if="totalCount == 0" class="col-lg-12 pr-lg-12">
				<h2 class = "text-primary"> Bạn chưa theo dõi công ty nào</h2>
			</div>

        </div>
    </div>
</section>

<script type="text/javascript">
	window.userId = ${userId};
	window.url = '${pageContext.request.contextPath}';
</script>
<script src="<c:url value='/assets/js/export/list_follow_company.js' /> "></script>


</body>
</html>