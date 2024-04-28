<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login</title>
  <%@ include file="base/head.jsp" %>
</head>

<body>
<%-- <%@ include file="base/nav.jsp" %> --%>

<section id="app">
	<nav class="header_menu" class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container-fluid px-md-4	">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/">Work CV</a>
		</div>
	</nav>

	<div class="hero-wrap hero-wrap-2" style="background-image: url('<c:url value='/assets/images/bg_1.jpg' />')" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-start">
				<div class="col-md-12 text-center mb-5">
					<p class="breadcrumbs mb-0">
						<span class="mr-3"><a href="index.html">Trang chủ <i
								class="ion-ios-arrow-forward"></i></a></span> đăng nhập<span></span>
					</p>
					<h1 class="mb-3 bread">Đăng nhập / Đăng kí</h1>
				</div>
			</div>
		</div>
	</div>

	<!-- HOME -->

	<section class="site-section">
		<div class="container mt-4">
			<div class="row">
				<div class="col-lg-6 mb-5">
					<h2 class="mb-4">Đăng kí</h2>
					<form class="p-4 border rounded">
						<div class="row form-group">
							<div class="col-md-12 mb-3 mb-md-0">
								<label class="text-black" for="fname">Email</label> <span class="errorLogin"> {{ emailMsg }}</span>							
								<input type="text" id="email" name="email" class="form-control" placeholder="Email">
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12 mb-3 mb-md-0">
								<label class="text-black" for="fname">Họ và tên</label> <span class="errorLogin"> {{ fullNameMsg }}</span>
								<input type="text" id="fullName" name="fullName" class="form-control" placeholder="Họ và tên">
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12 mb-3 mb-md-0">
								<label class="text-black" for="fname">Mật khẩu </label> <span class="errorLogin"> {{ passwordMsg }}</span>
								<input :type="passwordVisible1 ? 'password' : 'text'" id="" name="password" class="form-control password-container" placeholder="Mật khẩu" v-model="password1">
								<i class="toggle-password" @click="togglePassword1" :class="passwordVisible1 ? 'fa fa-eye-slash' : 'fa fa-eye'"></i>
							</div>
						</div>
						<div class="row form-group mb-4">
							<div class="col-md-12 mb-3 mb-md-0">
								<label class="text-black" for="fname">Nhập lại mật khẩu</label> <span class="errorLogin"> {{ rePasswordMsg }}</span>
								<input :type="passwordVisible2 ? 'password' : 'text'" id="fname" name="rePassword" class="form-control" placeholder="Nhập lại mật khẩu" v-model="password2">
								<i class="toggle-password" @click="togglePassword2" :class="passwordVisible2 ? 'fa fa-eye-slash' : 'fa fa-eye'"></i>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12 mb-3 mb-md-0">
								<label class="text-black" for="fname">Vai trò</label> <span class="errorLogin"> {{ roleMsg }}</span>
								<select class="form-control" id="role" name="role_id" aria-label="Default select example">
									<option value=0 selected disabled>Chọn vai trò</option>
									<option value=1>Ứng cử viên</option>
									<option value=2>Công ty</option>
								</select>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<input type="button" @click="handleregister" value="Đăng kí" class="btn px-4 btn-primary text-white">
							</div>
						</div>
					</form>
				</div>
				<div class="col-lg-6">
					<h2 class="mb-4">Đăng nhập</h2>
					<form @submit="handleLogin" action="${pageContext.request.contextPath}/authenticate"
						method="post" class="p-4 border rounded">

						<div class="row form-group">
							<div class="col-md-12 mb-3 mb-md-0">
								<label class="text-black" for="fname">Email</label> <span class="errorLogin"> {{ emailLoginMsg }}</span>
								<input type="text" id="emailLogin" name="email" class="form-control"
									placeholder="Email">
							</div>
						</div>
						<div class="row form-group mb-4">
							<div class="col-md-12 mb-3 mb-md-0">
								<label class="text-black" for="fname">Mật khẩu</label> <span class="errorLogin"> {{ passwordLoginMsg }}</span>
								<input type="password" id="passwordLogin" name="password"
									class="form-control" placeholder="Mật khẩu">
							</div>
						</div>
						<div class="errorLogin" v-if="errorLogin === false" > 
							<span >Email hoặc password không đúng.</span>
						</div>
						<div class="row form-group mt-2">
							<div class="col-md-12">
								<input type="submit" value="Đăng nhập"
									class="btn px-4 btn-primary text-white">
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>
	</section>

</section>
</body>

<script type="text/javascript">
	window.user = ${not empty user ? user : 'null'};
	window.url = '${pageContext.request.contextPath}';
	window.a = ${not empty a ? a : 'null'};
</script>
<script src="<c:url value='/assets/js/export/login.js' /> "></script>


</html>