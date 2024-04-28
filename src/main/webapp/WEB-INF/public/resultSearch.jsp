<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Search</title>
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
												<strong class="number" data-number="46" th:text="${numberCandidate}"></strong> <span>Ứng cử viên</span>
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
												<strong class="number" data-number="450" th:text="${numberCompany}"></strong> <span>Công ty</span>
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
												<strong class="number" data-number="80000" th:text="${numberRecruitment}"></strong> <span>Tuyển dụng</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="ftco-search my-md-5">
							<div class="row">
								<div class="col-md-12 nav-link-wrap">
									<div class="nav nav-pills text-center" id="v-pills-tab"
										role="tablist" aria-orientation="vertical">
										<a class="nav-link active mr-md-1" id="v-pills-1-tab"
											data-toggle="pill" href="#v-pills-1" role="tab"
											aria-controls="v-pills-1" aria-selected="true">Tìm công việc</a>
									</div>
								</div>
								<div class="col-md-12 tab-wrap">
									<div class="tab-content p-4" id="v-pills-tabContent">
										<div class="tab-pane fade show active" id="v-pills-1"
											role="tabpanel" aria-labelledby="v-pills-nextgen-tab">
											<form class="search-job">
												<div class="row no-gutters">
													<div class="col-md-10 mr-md-2">
														<div class="form-group">
															<div class="form-field">
																<div class="icon">
																	<span class="icon-map-marker"></span>
																</div>
																<input type="text" v-model="keySearch" name="keySearch"
																	class="form-control" placeholder="Tìm kiếm công việc">
															</div>
														</div>
													</div>
													<div class="col-md">
														<div class="form-group">
															<div class="form-field">
																<button type="button" @click="handleJobSearch()"
																	class="form-control btn btn-primary">Tìm kiếm</button>
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

	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row">
				<div v-if="totalCount > 0" class="col-lg-12 pr-lg-12">
					<div class="row justify-content-center pb-3">
						<div class="col-md-12 heading-section ">
							<h2 class="mb-4">
								Kết quả tìm kiếm cho "<span>{{key}}</span> "
							</h2>
						</div>
					</div>
					<button class="btn btn-success m-3">{{totalCount}} kết quả  </button>
					<div v-for="(rec, index) in recs" :key="index">
						<div class="col-md-12 ">
							<div
								class="job-post-item p-4 d-block d-lg-flex align-items-center">
								<div class="one-third mb-4 mb-md-0">
									<div class="job-post-item-header align-items-center">
										<span class="subadge">{{rec.type}}</span>
										<h2 class="mr-3 text-black">
											<a :href="`${pageContext.request.contextPath}/post/detail?id=` + rec.id">{{rec.title}}</a>
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
									<a v-if="rec.isApply == false" @click="openModalApplyPost(rec.id)"
										class="btn btn-primary py-2">Ứng tuyển</a>
									<a v-if="rec.isApply == true"
										class="btn btn-secondary disabled py-2">Đã ứng tuyển</a>
								</div>
							</div>
						</div>
						<!-- end -->
						<!-- Modal -->
						<div class="modal fade" :id="'exampleModal-' + rec.id"
							tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">
											Ứng tuyển: <span>{{ rec.title }}</span>
										</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
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
													<label for="fileUpload" class="col-form-label"><b>Giới thiệu: </b></label>
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
												<button type="button" @click="handleApplyPost(rec.id)"
													v-if="selectionOption !== ''" data-dismiss="modal" class="btn btn-primary">Nộp</button>
												<button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
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
					<h2 class = "text-primary"> Không có kết quả tìm kiếm nào cho từ khóa " {{key}} "</h2>
				</div>
			</div>
		</div>
	</section>
</section>
<script type="text/javascript">
	window.userId = ${userId};
	window.key = ${key};
	window.applyPost = ${applyPost};
	window.url = '${pageContext.request.contextPath}';
</script>
<script src="<c:url value='/assets/js/export/resultSearch.js' /> "></script>
<script src="<c:url value='/assets/js/export/commons.js' /> "></script>

</body>
</html>