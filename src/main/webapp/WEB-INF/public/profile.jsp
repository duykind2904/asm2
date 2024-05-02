<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Profile</title>
  <%@ include file="base/head.jsp" %>
</head>

<body>
<%@ include file="base/nav.jsp" %>
	
<section id = "app">	
	<div class="hero-wrap hero-wrap-2" style="background-image: url('<c:url value='/assets/images/bg_1.jpg' />')" data-stellar-background-ratio="0.5">
	    <div class="overlay"></div>
	    <div class="container">
	        <div class="row no-gutters slider-text align-items-end justify-content-start">
	            <div class="col-md-12 text-center mb-5">
	                <h1 class="mb-3 bread">Hồ sơ </h1>
	                <div class="form-group">
	                    <label class="btn btn-primary btn-md btn-file">
	                        Chọn ảnh<input type="file" name="file" id="fileUpload" hidden @change="checkImage($event)">
	                    </label>
	                </div>
	                <div style="margin-left: 0px" id="divImage" >
	                    <img v-if="user.image && user.image !== ''" :src='"${pageContext.request.contextPath}/assets/images/uploads/" + user.image' alt="Selected Image"
	                     id="avatar" height="100" width="100" style="border-radius: 50px" >
	                     <img v-else="user.image && user.image !== ''" id="avatar" height="100" width="100" style="border-radius: 50px" >
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- HOME -->

	<section v-if="user.role.id === 1" class="site-section" style="margin-top: 10px">
	    <div class="container">
	        <form enctype="multipart/form-data">
	            <div class="row align-items-center mb-5">
	                <div class="col-lg-8 ">
	                    <div class="d-flex align-items-center">
	                        <div class="form-group" style="margin-top: 15px">
	                            <label class="btn btn-primary btn-md btn-file">
	                                Chọn cv (pdf)
	                                <input type="file" name="file" id="fileUpload1" @change="checkPdf($event)" required hidden>
	                            </label>
	                        </div>
	                    </div>
	                    <span class="float-left mr-5 mt-2">{{ cvName }}</span>
	                	<button v-if="cvName" type="button" class="btn btn-info btn-md" id="nameCv" @click="viewCV()">Xem cv</button>
	                	<button v-if="cvName" type="button" class="btn btn-danger btn-md" id="nameCv" @click="deleteCV()">Xóa cv</button>
	                </div>		                
	            </div>
	        </form>
	
	        <form method="post" >
	            <div class="row align-items-center mb-5">
	                <div class="col-lg-8 mb-4 mb-lg-0">
	                    <div class="d-flex align-items-center">
	                        <div>
	                            <h2>Cập nhật thông tin</h2>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-4">
	                    <div class="row">
	
	                        <div class="col-6">
	                            <button type="button" @click="saveUser" class="btn btn-block btn-primary btn-md">Lưu thông tin</button>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="row mb-5">
	                <div class="col-lg-12">
	                    <div class="p-4 p-md-5 border rounded" method="post">
	                        <h3 class="text-black mb-5 border-bottom pb-2">Thông tin chi tiết</h3>
	                        <div class="form-group">
	                            <label for="email">Email</label>
	                            <input type="email" class="form-control inputDisabled" id="email" name="email" v-model="user.email" disabled placeholder="you@yourdomain.com">
	                        </div>
	                        <div class="form-group">
	                            <label for="job-title">Full name</label>
	                            <input type="text" class="form-control" name="fullName" v-model="user.fullName" required id="job-title" placeholder="Full name">
	                        </div>
	                        <div class="form-group">
	                            <label for="job-location">Địa chỉ</label>
	                            <input type="text" name="address" v-model="user.address" class="form-control" id="job-location" required placeholder="e.g. New York">
	                        </div>
	                        <div class="form-group">
	                            <label for="job-location">Số điện thoại</label>
	                            <input type="text" name="phoneNumber" v-model="user.phoneNumber" class="form-control" id="job-location" required placeholder="+ 84">
	                        </div>
	                        <div class="form-group">
	                            <label for="job-location">Mô tả bản thân</label>
	                            <textarea  name="description" v-model="user.description" class="form-control" id="editor" placeholder="Mô tả"></textarea>
	                        </div>
	
	                    </div>
	
	                </div>
	
	            </div>
	        </form>
	    </div>
	</section>
	<!-- Modal -->
	<div class="modal fade"  id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="exampleModalLabel">Bạn có chắc chắn muốn xóa ?</h5>
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">&times;</span>
	                </button>
	            </div>
	            <div class="modal-body">
	                Cv : <span id="cvXoa" ></span>
	                <span th:if="${Cv != null}" th:text="${Cv.fileName}"></span>
	                <form action="/user/deleteCv" method="post">
	                    <div class="modal-footer mt-1">
	                        <input type="hidden"  name="idCv">
	                        <button type="submit" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
	                        <button type="submit" class="btn btn-danger">Xóa</button>
	                    </div>
	                </form>
	            </div>
	
	        </div>
	    </div>
	</div>
	<section v-if="user.role.id === 2" class="site-section" style="margin-top: 10px">
	    <div class="container">
	        <div class="row">
	            <div class="col-lg-6 mb-5">
	                <h2 class="mb-4">Thông tin cá nhân</h2>
	                <form action="/user/update-profile" method="post" >
	
	                    <div class="row mb-5">
	                        <div class="col-lg-12">
	                            <div class="p-4 p-md-5 border rounded" method="post">
	                                <div class="form-group">
	                                    <label for="email">Email</label>
	                                   <input type="email" class="form-control inputDisabled" id="email" name="email" v-model="user.email" disabled placeholder="you@yourdomain.com">
	                                </div>
	                                <div class="form-group">
	                                    <label for="job-title">Họ và tên</label>
	                                    <input type="text" class="form-control" name="fullName" v-model="user.fullName" id="job-title" required placeholder="Full name">
	                                </div>
	                                <div class="form-group">
	                                    <label for="job-location">Địa chỉ</label>
	                                    <input type="text" name="address" v-model="user.address" required class="form-control" id="job-location" placeholder="e.g. New York">
	                                </div>
	                                <div class="form-group">
	                                    <label for="job-location">Số điện thoại</label>
	                                    <input type="text" name="phoneNumber" v-model="user.phoneNumber" required class="form-control" id="job-location" placeholder="+ 84">
	                                </div>
	                                <div class="form-group">
	                                    <label for="job-location">Mô tả bản thân</label>
	                                    <textarea  name="description" v-model="user.description" class="form-control" id="editor" placeholder="Mô tả"></textarea>
	                                </div>
	                                <div class="row form-group">
	                                    <div class="col-md-12">
	                                        <button type="button" value="Lưu thông tin" @click="saveUser" class="btn px-4 btn-primary text-white">Lưu thông tin</button>
	                                    </div>
	                                </div>
	                            </div>
	
	                        </div>
	
	                    </div>
	                </form>
	            </div>
	            <div class="col-lg-6">
	                <h2 class="mb-4">Thông tin công ty</h2>
	                <div class="form-group">
	                    <label for="company-website-tw d-block1">Cập nhật Logo</label> <br>
	                    <label class="btn btn-primary btn-md btn-file">
	                        Chọn logo
	                        
	                        <input type="file" name="file" id="fileUpload" hidden @change="checklogo($event)">
	                    </label>
	                    
	                    <div style="margin-left: 0px" id="divImage" >
		                    <img v-if="company.logo" :src='"${pageContext.request.contextPath}/assets/images/uploads/" + company.logo' alt="Selected Image"
		                     id="avatar" height="100" width="100" style="border-radius: 50px" >
		                     <img v-if="!company.logo" id="avatar" height="100" width="100" style="border-radius: 50px" >
		                </div>
	                </div>
	                
	                <form >
	
	                    <div class="row mb-5">
	                        <div class="col-lg-12">
	                            <div class="p-4 p-md-5 border rounded" method="post">
	                                <div class="form-group">
	                                    <label for="email">Email</label>	
	                                    <input type="email" class="form-control" required id="email1" name="email" v-model="company.email" placeholder="you@yourdomain.com">
	                                </div>
	                               <div class="form-group">
	                                    <label for="job-title">Tên công ty</label>
	                                    <input type="text" class="form-control" name="nameCompany" v-model="company.name" id="job-title"  placeholder="Full name" required>	                                    
	                                </div>
	                                <div class="form-group">
	                                    <label for="job-location">Địa chỉ</label>
	                                    <input type="text" name="address" v-model="company.address" required class="form-control" id="job-location" placeholder="e.g. New York">
	                                </div>
	                                <div class="form-group">
	                                    <label for="job-location">Số điện thoại công ty</label>
	                                    <input type="text" name="phoneNumber" v-model="company.phoneNumber" required class="form-control" id="job-location" placeholder="+ 84">
	                                </div>
	                                <div class="form-group">
	                                    <label for="job-location">Mô tả công ty</label>
	                                    <textarea  name="description" v-model="company.description"  class="form-control" id="editorN" placeholder="Mô tả"></textarea>
	                                </div>
	
									<div style="margin-left: 0px" id="divImage" >
					                    <img v-if="company.logo" :src='"${pageContext.request.contextPath}/assets/images/uploads/" + company.logo' alt="Selected Image"
		                     id="avatar" height="100" width="100" style="border-radius: 50px" >
		                     <img v-if="!company.logo" id="avatar" height="100" width="100" style="border-radius: 50px" >
					                </div>
	                                
	                                <div class="row form-group mt-3" >
	                                    <div class="col-md-12">
	                                        <button type="button" value="Lưu thông tin" @click="saveCompany" class="btn px-4 btn-primary text-white"> Lưu thông tin </label>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </form>
	            </div>
	        </div>
	    </div>
	</section>
</section>

<!-- <footer th:replace="public/fragments :: footer" class="ftco-footer ftco-bg-dark ftco-section"></footer> -->
</body>

<script type="text/javascript">
	window.user = ${user}; 
	window.company = ${company};
	window.url = '${pageContext.request.contextPath}';
</script>

<script src="<c:url value='/assets/js/export/profile.js' /> "></script>

</html>