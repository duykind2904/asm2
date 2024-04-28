<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Work CV</title>
  <%@ include file="base/head.jsp" %>
</head>

<body>
<%@ include file="base/nav.jsp" %>

<!-- END nav -->
<section id="app">			
<div class="hero-wrap img" style="background-image: url('<c:url value='/assets/images/bg_1.jpg' />')">
    <div class="overlay"></div>
    <div class="container">
        <div class="row d-md-flex no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-10 d-flex align-items-center ">
                <div class="text text-center pt-5 mt-md-5">
                    <p class="mb-4">Tìm việc làm, Cơ hội việc làm và Nghề nghiệp</p>
                    <h1 class="mb-5">Cách dễ dàng nhất để có được công việc mới của bạn</h1>
                    <div class="ftco-counter ftco-no-pt ftco-no-pb">
                        <div class="row">
                            <div class="col-md-4 d-flex justify-content-center counter-wrap ">
                                <div class="block-18">
                                    <div class="text d-flex">
                                        <div class="icon mr-2">
                                            <span class="flaticon-visitor"></span>
                                        </div>
                                        <div class="desc text-left">
                                            <strong class="number" data-number="46" th:text="${numberCandidate}"></strong>
                                            <span>Ứng cử viên</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 d-flex justify-content-center counter-wrap ">
                                <div class="block-18 text-center">
                                    <div class="text d-flex">
                                        <div class="icon mr-2">
                                            <span class="flaticon-visitor"></span>
                                        </div>
                                        <div class="desc text-left">
                                            <strong class="number" data-number="450" th:text="${numberCompany}"></strong>
                                            <span>Công ty</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 d-flex justify-content-center counter-wrap">
                                <div class="block-18 text-center">
                                    <div class="text d-flex">
                                        <div class="icon mr-2">
                                            <span class="flaticon-resume"></span>
                                        </div>
                                        <div class="desc text-left">
                                            <strong class="number" data-number="80000" th:text="${numberRecruitment}"></strong>
                                            <span>Tuyển dụng</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ftco-search my-md-5">
                        <div class="row">
                            <div class="col-md-12 nav-link-wrap">
                                <div class="nav nav-pills text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                    <a class="nav-link active mr-md-1" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true">Tìm công việc</a>

                                    <a class="nav-link" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab" aria-controls="v-pills-2" aria-selected="false">Tìm theo công ty</a>
                                    <a class="nav-link" id="v-pills-3-tab" data-toggle="pill" href="#v-pills-3" role="tab" aria-controls="v-pills-3" aria-selected="false">Tìm theo địa điểm</a>

                                </div>
                            </div>
                            <div class="col-md-12 tab-wrap">

                                <div class="tab-content p-4" id="v-pills-tabContent">

                                    <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="v-pills-nextgen-tab">
                                        <form class="search-job">
                                            <div class="row no-gutters">
                                                <div class="col-md-10 mr-md-2">
                                                    <div class="form-group">
                                                        <div class="form-field">
                                                            <div class="icon"><span class="icon-map-marker"></span></div>
                                                            <input type="text" v-model="keySearch" name="keySearch" class="form-control" placeholder="Tìm kiếm công việc">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md">
                                                    <div class="form-group">
                                                        <div class="form-field">
                                                            <button type="button" @click="handleJobSearch()" class="form-control btn btn-primary">Tìm kiếm</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>

                                    <div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-performance-tab">
                                        <form class="search-job">
                                            <div class="row no-gutters">

                                                <div class="col-md-10 mr-md-2">
                                                    <div class="form-group">
                                                        <div class="form-field">
                                                            <div class="icon"><span class="icon-map-marker"></span></div>
                                                            <input type="text" v-model="keySearch" name="keySearch" class="form-control" placeholder="Tìm kiếm theo công ty">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md">
                                                    <div class="form-group">
                                                        <div class="form-field">
                                                            <button type="button" @click="handleCompanySearch()" class="form-control btn btn-primary">Tìm kiếm</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="tab-pane fade" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-performance-tab">
                                        <form class="search-job">
                                            <div class="row no-gutters">

                                                <div class="col-md-10 mr-md-2">
                                                    <div class="form-group">
                                                        <div class="form-field">
                                                            <div class="icon"><span class="icon-map-marker"></span></div>
                                                            <input type="text" v-model="keySearch" name="keySearch" class="form-control" placeholder="Tìm kiếm theo địa điểm">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md">
                                                    <div class="form-group">
                                                        <div class="form-field">
                                                            <button type="button" @click="handleAddressSearch()" class="form-control btn btn-primary">Tìm kiếm</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<section id="search">
	
</section>

<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center mb-5">

            <div style="display: block" class="col-md-7 heading-section text-center">
                <span class="subheading">Danh mục công việc</span>
                <h2 class="mb-0">Top Danh Mục</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3" v-for="(c, index) in categories" :key="index">
                <ul class="category text-center">
                    <li>
                    	<a style="text-decoration: none !important;" href="#"> 
                    		<p> {{c.name}}</p>
                    		<span class="number">{{c.number}}</span> <span>Vị trí</span>
                    		<i class="ion-ios-arrow-forward"></i>
                    	</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section services-section">
    <div class="container">
        <div class="row d-flex">
            <div class="col-md-3 d-flex align-self-stretch ">
                <div class="media block-6 services d-block">
                    <div class="icon"><span class="flaticon-resume"></span></div>
                    <div class="media-body">
                        <h3 class="heading mb-3">Tìm kiếm hàng triệu việc làm</h3>
                        <p>Một con sông nhỏ tên là Duden chảy qua nơi ở và nguồn cung cấp của họ.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 d-flex align-self-stretch ">
                <div class="media block-6 services d-block">
                    <div class="icon"><span class="flaticon-team"></span></div>
                    <div class="media-body">
                        <h3 class="heading mb-3">Dễ dàng quản lý công việc</h3>
                        <p>Một con sông nhỏ tên là Duden chảy qua nơi ở và nguồn cung cấp của họ.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 d-flex align-self-stretch ">
                <div class="media block-6 services d-block">
                    <div class="icon"><span class="flaticon-career"></span></div>
                    <div class="media-body">
                        <h3 class="heading mb-3">Top Nghề nghiệp</h3>
                        <p>Một con sông nhỏ tên là Duden chảy qua nơi ở và nguồn cung cấp của họ.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 d-flex align-self-stretch ">
                <div class="media block-6 services d-block">
                    <div class="icon"><span class="flaticon-employees"></span></div>
                    <div class="media-body">
                        <h3 class="heading mb-3">Ứng viên Chuyên gia Tìm kiếm</h3>
                        <p>Một con sông nhỏ tên là Duden chảy qua nơi ở và nguồn cung cấp của họ.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-9 pr-lg-5">
                <div class="row justify-content-center pb-3">
                    <div class="col-md-12 heading-section ">
                        <span class="subheading">CÔNG VIỆC ĐƯỢC NHIỀU NGƯỜI ỨNG TUYỂN</span>
                        <h2 class="mb-4">Các bài đăng về việc làm nổi bật</h2>

                    </div>
                </div>
                <!-- <div class="row"> -->
					<div v-for="(rec, index) in recs" :key="index">
                        <div class="col-md-12 ">
                            <div class="job-post-item p-4 d-block d-lg-flex align-items-center">
                                <div class="one-third mb-4 mb-md-0">
                                    <div class="job-post-item-header align-items-center">
                                        <span class="subadge">{{rec.type}}</span>
                                        <h2 class="mr-3 text-black" >
                                        	<a :href="`${pageContext.request.contextPath}/post/detail?id=` + rec.id">{{rec.title}}</a>
                                        </h2>
                                    </div>
                                    <div class="job-post-item-body d-block d-md-flex">
                                        <div class="mr-3"><span class="icon-layers">
                                        	</span> <a href="#">{{rec.companyName}}</a>
                                        </div>
                                        <div><span class="icon-my_location"></span> <span>{{rec.address}}</span></div>
                                    </div>
                                </div>
                                <div  class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
                                    <div >
                                        <div v-if="rec.isFollow == false" @click="folowRecuitment(rec.id, true)" class=" text-center d-flex justify-content-center align-items-center icon mr-2">
                                            <span class="icon-heart"></span>
                                        </div>
                                        <div v-if="rec.isFollow == true" @click="folowRecuitment(rec.id, false)" class=" text-center d-flex justify-content-center align-items-center iconShow mr-2">
                                            <span class="icon-heart"></span>
                                        </div>
                                    </div>
                                    <a v-if="rec.isApply == false" @click="openModalApplyPost(rec.id)" class="btn btn-primary py-2">Ứng tuyển</a>
                                    <a v-if="rec.isApply == true" class="btn btn-secondary disabled py-2">Đã ứng tuyển</a>
                                </div>
                            </div>
                        </div><!-- end -->
                        <!-- Modal -->
                        <div class="modal fade" :id="'exampleModal-' + rec.id" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Ứng tuyển: <span>{{ rec.title }}</span></h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form>
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col-12">
                                                    <select  class="form-control" v-model="selectionOption" aria-label="Default select example">
                                                        <option disabled value="">Chọn phương thức nộp</option>
                                                        <option value="1">Dùng cv đã cập nhật</option>
                                                        <option value="2">Nộp cv mới</option>
                                                    </select>
                                                </div>
                                                
                                                <div  v-if="selectionOption == 1" class="col-12">
                                                	<!-- <label for="fileUpload" class="col-form-label">CV: </label>
                                                    <input type="text" class="form-control" name="file" value="CV name"> -->
                                                    <label for="fileUpload" class="col-form-label"><b> Giới thiệu: </b></label>
                                                    <textarea rows="10" cols="3" class="form-control" v-model="applyPost.text"></textarea>
                                                </div>
                                                <div v-if="selectionOption == 2" class="col-12">
                                                    <label for="fileUpload" class="col-form-label"><b> Chọn cv: </b></label>
                                                    <input type="file" name="file" class="form-control" @change="checkPdf($event)" required>
                                                    <label for="fileUpload" class="col-form-label"><b> Giới thiệu: </b></label>
                                                    <textarea rows="10" cols="3" class="form-control" v-model="applyPost.text"></textarea>
                                                </div>

                                            </div>
                                            <div class="modal-footer">
                                            	<button type="button" @click="handleApplyPost(rec.id)" v-if="selectionOption !== ''" data-dismiss="modal" class="btn btn-primary">Nộp</button>
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                            </div>
                                        </div>
                                    </form>


                                </div>
                            </div>
                        </div>
                  	</div>

                <!-- </div> -->
            </div>
            <div class="col-lg-3 sidebar">
                <div class="row justify-content-center pb-3">
                    <div class="col-md-12 heading-section ">
                        <h2 class="mb-4">Công ty nổi bật</h2>
                    </div>
                </div>
                <div v-for="(c, index) in companies" :key="index">
                <div class="sidebar-box">
                    <div class="">
                        <a href="#" class="company-wrap">
                        <img :src="'${pageContext.request.contextPath}/assets/images/uploads/' + c.logo" height="100" width="100" class="img-fluid" alt="Colorlib Free Template"></a>
                        <div class="text p-3">
                            <h3><a :href="`${pageContext.request.contextPath}/company/detail?id=` + c.id">{{c.name}}</a></h3>
                            <p><span class="number" style="color: black">{{c.countRecruitmenting}}</span> <span class="ml-1">Vị trí ứng tuyển</span></p>
                        </div>
                    </div>
                </div>
                </div>
            </div>
        </div>
    </div>
</section>
</section>	
<script type="text/javascript">
	window.userId = ${userId};
	window.applyPost = ${applyPost}; 
	window.url = '${pageContext.request.contextPath}';
</script>
<script src="<c:url value='/assets/js/export/home.js' /> "></script>
<script src="<c:url value='/assets/js/export/commons.js' /> "></script>

</body>
</html>