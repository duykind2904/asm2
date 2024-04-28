<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid px-md-4	">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/">Work CV</a>				
		<div class="collapse navbar-collapse" id="ftco-nav">     
			<ul class="navbar-nav ml-auto">				
				<c:if test="${pageContext.request.userPrincipal != null}">
					<li class="nav-item cta mr-md-1" style="position: relative;">
						<a class="dropdown-toggle nav-link pr-5" data-toggle="dropdown" href="#">${pageContext.request.userPrincipal.name}</a>            
						<ul class="dropdown-menu">
							<li class="nav-link dropdown-item"><a class="text-dark" href="${pageContext.request.contextPath}/profile/home">Hồ Sơ</a></li>
							
							<c:if test="${fn:contains(pageContext.request.userPrincipal.authorities, 'ROLE_COMPANY')}">
							<li class="nav-link dropdown-item"><a class="text-dark" href="${pageContext.request.contextPath}/post/list" >Danh sách bài đăng</a></li>
							</c:if>
							
							<c:if test="${fn:contains(pageContext.request.userPrincipal.authorities, 'ROLE_USER')}">
							<li class="nav-link dropdown-item"><a class="text-dark" href="${pageContext.request.contextPath}/applyPost/list" >Công việc đã ứng tuyển</a></li>
							</c:if>
							
							<li class="nav-link dropdown-item"><a class="text-dark" href="${pageContext.request.contextPath}/follow/job" >Công việc đã lưu</a></li>
							<li class="nav-link dropdown-item"><a class="text-dark" href="${pageContext.request.contextPath}/follow/company">Công ty đã theo dõi</a></li>
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