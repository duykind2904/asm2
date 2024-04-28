<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Post Detail</title>
  <%@ include file="base/head.jsp" %>
</head>

<body>
<%@ include file="base/nav.jsp" %>
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
           
            <c:if test="${!fn:contains(pageContext.request.userPrincipal.authorities, 'ROLE_COMPANY')}">
            <div class="col-lg-4">
                <div  class="row">
                    <div class="col-6">
                        <a v-if="!isFollow" @click="folowRecuitment(true)" class="btn btn-block btn-light btn-md"><span class="icon-heart-o mr-2 text-danger"></span>Theo dõi</a>
                        <a v-if="isFollow" @click="folowRecuitment(false)" class="btn btn-block btn-light btn-md"><span class="fa fa-heart mr-2 text-danger"></span>Hủy theo dõi</a>
                    </div>
                    <div class="col-6">
                        <a v-if="!isApply" @click="openModalApplyPost()" class="btn btn-block btn-primary btn-md">Ứng tuyển</a>
                        <a v-if="isApply" class="btn btn-block btn-primary btn-md">Đã ứng tuyển</a>
                    </div>
                </div>
            </div>
            </c:if>
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
<div class="modal fade" :id="'exampleModal'"
	tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">
					Ứng tuyển: <span>{{ rec.title }}</span>
				</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form>
				<div class="modal-body">
					<div class="row">
						<div class="col-12">
							<select class="form-control" v-model="selectionOption"
								aria-label="Default select example">
								<option disabled value="">Chọn phương thức nộp</option>
								<option value="1">Dùng cv đã cập nhật</option>
								<option value="2">Nộp cv mới</option>
							</select>
						</div>

						<div v-if="selectionOption == 1" class="col-12">
								<label for="fileUpload" class="col-form-label"><b>
										Giới thiệu: </b></label>
								<textarea rows="10" cols="3" class="form-control"
									v-model="applyPost.text"></textarea>
							</div>
							<div v-if="selectionOption == 2" class="col-12">
								<label for="fileUpload" class="col-form-label"><b>
										Chọn cv: </b></label> <input type="file" name="file"
									class="form-control" @change="checkPdf($event)" required>
								<label for="fileUpload" class="col-form-label"><b>
										Giới thiệu: </b></label>
								<textarea rows="10" cols="3" class="form-control"
									v-model="applyPost.text"></textarea>
							</div>

						</div>
						<div class="modal-footer">
							<button type="button" @click="handleApplyPost(rec.id)"
								v-if="selectionOption !== ''" data-dismiss="modal" class="btn btn-primary">Nộp</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Đóng</button>
						</div>
					</div>
				</form>


			</div>
		</div>
	</div>
</div>


<c:if test="${fn:contains(pageContext.request.userPrincipal.authorities, 'ROLE_COMPANY')}">
<section class="site-section" id="next">
    <div class="container">

        <div class="row mb-5 justify-content-center">
            <div class="col-md-7 text-center">
                <h2 class="section-title my-4" >Danh sách ứng viên ứng tuyển</h2>
                <!-- <h2 class="section-title my-4" >Những công việc liên quan</h2> --> <%-- th:unless="${applyPosts} --%>
            </div>
        </div>

        <div class="row" >
            <div class="col-lg-12 pr-lg-4">
                <div class="row" >
                    <div class="col-md-6" v-for="(r, index) in listUserApplyPost" :key="index" >
	                    <div style="box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px;" class="mb-4">
	                        <div class="d-md-flex p-4 bg-white">
	                        	<div class="row">
	                        		<img v-if="r.user.image" :src='"${pageContext.request.contextPath}/assets/images/uploads/" + r.user.image' alt="Selected Image"
		                     		class="col-md-2" id="avatar" height="100" width="100" style="border-radius: 50px" >
			                     	<img v-else="r.user.image" class="col-md-2" id="avatar" height="100" width="100" style="border-radius: 50px" >
			                     	
		                            <div class="text pl-md-4 col-md-9">
		                                <H5 class="location mb-0 text-wrap" >{{r.user.fullName}}</H5>
		                                <p style="display: block;color: black" >{{r.user.address}}</p>
		                                <span class="position" style="display: block;color: black" >{{r.user.email}}</span>
		                                <p class="mb-4" style="width: 700px" >{{r.user.description}}</p>
		                                <div class="row">
		                                    <p @click="viewCV(r.user)" class="btn btn-primary">Xem cv</p>
		                                    <p v-if="!r.status" @click="accessCV(r)" style="margin-left: 10px" ><a class="btn btn-outline-primary" >Duyệt</a></p>
		                                    <p v-if="r.status" style="margin-left: 10px;margin-top: 10px"><span style="color: #1e7e34;font-weight: bold" >Đã duyệt</span></p>                    
		                                 </div>
		                            </div>		
	                        	</div>
	                            
	                        </div>
                        </div>
                    </div>
                </div>
                <h2 v-if="listUserApplyPost.length == 0">Chưa có ứng cử viên nào ứng tuyển</h2>
                
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
        </div>
    </div>
</section>
</c:if>
</section>

</body>

<script type="text/javascript">
	window.userId = ${userId};
	window.recruitment = ${recruitment};
	window.applyPost = ${applyPost};
	window.url = '${pageContext.request.contextPath}';
</script>

<script src="<c:url value='/assets/js/export/post_detail.js' /> "></script>


</html>