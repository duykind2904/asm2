<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Follow Job</title>
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
                <h1 class="mb-3 bread">Danh sách công việc đã theo dõi</h1>
            </div>
        </div>
    </div>
</div>

<section id="app" class="ftco-section bg-light">
	<div class="container">
		<div class="row">
			<div v-if="totalCount > 0" class="col-lg-12 pr-lg-12">
				<button class="btn btn-success m-3">{{totalCount}} kết quả  </button>
				<div v-for="(rec, index) in recs" :key="index">
					<div class="col-md-12 ">
						<div class="job-post-item p-4 d-block d-lg-flex align-items-center">
							<div class="one-third mb-4 mb-md-0">
								<div class="job-post-item-header align-items-center">
									<span class="subadge">{{rec.type}}</span>
									<h2 class="mr-3 text-black">
										<a
											:href="`${pageContext.request.contextPath}/post/detail?id=` + rec.id">{{rec.title}}</a>
									</h2>
								</div>
								<div class="job-post-item-body d-block d-md-flex">
									<div class="mr-3">
										<span class="icon-layers"> </span> <a href="#">{{rec.companyName}}</a>
									</div>
									<div>
										<span class="icon-my_location"></span> <span>{{rec.address}}</span>
									</div>
								</div>
							</div>
							<div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0" style="width: 330px !important;">
								<div>
									<div v-if="rec.isFollow == false"
										@click="folowRecuitment(rec.id, true)"
										class=" text-center d-flex justify-content-center align-items-center icon mr-2">
										<span class="icon-heart"></span>
									</div>
									<div v-if="rec.isFollow == true"
										@click="folowRecuitment(rec.id, false)"
										class=" text-center d-flex justify-content-center align-items-center iconShow mr-2">
										<span class="icon-heart"></span>
									</div>
								</div>
								<a v-if="rec.isApply == false"
											@click="openModalApplyPost(rec.id)"
											class="btn btn-primary py-2">Ứng tuyển</a> <a
											v-if="rec.isApply == true"
											class="btn btn-secondary disabled py-2">Đã ứng tuyển</a>
							</div>
						</div>
					</div>
					<!-- end -->
					<!-- Modal -->
					<div class="modal fade" :id="'exampleModal-' + rec.id"
						tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">
										Cập nhật: <span>{{ rec.title }}</span>
									</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<form>
									<div class="modal-body">
										<div class="row">
											<div class="col-12 mb-4">
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
				<h2 class = "text-primary"> Bạn chưa theo dõi công việc nào</h2>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript">
	window.userId = ${userId};
	window.applyPost = ${applyPost};
	window.url = '${pageContext.request.contextPath}';
</script>
<script src="<c:url value='/assets/js/export/list_follow_job.js' /> "></script>
<script src="<c:url value='/assets/js/export/commons.js' /> "></script>

</body>
</html>