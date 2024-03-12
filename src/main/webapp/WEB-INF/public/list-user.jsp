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
  <script src="<c:url value='/assets/js/aos.js' /> "></script>
  <script src="<c:url value='/assets/js/jquery.animateNumber.min.js' /> "></script>
  <script src="<c:url value='/assets/js/scrollax.min.js' /> "></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="<c:url value='/assets/js/google-map.js' /> "></script>
  <script src="<c:url value='/assets/js/main.js' /> "></script>
  <script src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<body>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid px-md-4	">
      <a class="navbar-brand" href="/">Work CV</a>
  
      <div class="collapse navbar-collapse" id="ftco-nav">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active"><a href="/" class="nav-link">Trang chủ</a></li>
          <li class="'nav-item"><a href="/" class="nav-link">Công việc</a></li>
          <li class="nav-item"><a href="/" class="nav-link">Ứng cử viên</a></li>
            <ul class="dropdown">
              <li><a href="/">Hồ Sơ</a></li>
              <li ><a href="/save-job/get-list" >Công việc đã lưu</a></li>
              <li ><a href="/user/list-post" >Danh sách bài đăng</a></li>
              <li ><a href="/user/get-list-apply" >Công việc đã ứng tuyển</a></li>
              <li ><a href="/user/get-list-company" >Công ty đã theo dõi</a></li>
              <li><a href="/auth/logout" >Đăng xuất</a></li>
            </ul>
            <li></li>
            <li class="nav-item cta mr-md-1"><a href="/recruitment/post" class="nav-link">Đăng tuyển</a></li>
          <li class="nav-item cta cta-colored"><a href="/auth/login" class="nav-link">Đăng nhập</a></li>
        </ul>
      </div>
    </div>
  </nav>
<!-- END nav -->
<div th:if="${success}" class="toast" data-delay="2000" style="position:fixed;top: 100PX; right: 10PX;z-index: 2000;width: 300px">
  <script>
    swal({
      title: 'Ứng cử viên này chưa cập nhật cv!',
      /* text: 'Redirecting...', */
      icon: 'error',
      timer: 3000,
      buttons: true,
      type: 'error'
    })
  </script>
</div>
<!-- END nav -->
<div class="hero-wrap hero-wrap-2" style="background-image: url('user/assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
  <div class="overlay"></div>
  <div class="container">
    <div class="row no-gutters slider-text align-items-end justify-content-start">
      <div class="col-md-12 text-center mb-5">
        <p class="breadcrumbs mb-0"><span class="mr-3"><a href="/">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span>Công việc <span></span></p>
        <h1 class="mb-3 bread">Danh sách ứng cử viên</h1>
      </div>
    </div>
  </div>
</div>
<section class="ftco-section bg-light">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 pr-lg-5">
        <div class="row">
          <th:block th:each="applyPost : ${list.content}">
            <div class="col-md-12" style="box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px;margin: 20px auto;">
              <div class="team d-md-flex p-4 bg-white">
                <IMG style="margin-top: 10px" class="img" th:src="${applyPost.image != null ? applyPost.image : 'https://st.quantrimang.com/photos/image/072015/22/avatar.jpg'}"></IMG>
                <div class="text pl-md-4">
                  <H5 class="location mb-0" th:text="${applyPost.fullName}"></H5>
                  <p style="display: block;color: black" th:text="${applyPost.address}"></p>
                  <span class="position" style="display: block;color: black" th:text="${applyPost.email}"></span>
                  <p class="mb-4" style="width: 700px" th:utext="${applyPost.description}">.</p>
                  <div th:if="${applyPost.cv != null}" style="margin-left: 1px" class="row">
                    <p><a th:href="${'/user/getCv/'}+${applyPost.id}"  class="btn btn-primary">Xem cv</a></p>
                  </div>
                </div>
              </div>
            </div>
          </th:block>
          <div  style="text-align: center" th:if="${list.totalPages == 0}">
            <p style="color: red">Không có kết quả nào</p>
          </div>
        </div>
        <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
                <li th:if="${numberPage>0}"><a th:href="@{'/user/list-candidate/'(page = ${list.number - 1})}">&lt;</a></li>
                <th:block th:each="recruitment,state  : ${recruitmentList}">
                  <li th:class="${numberPage == state.index  ? 'active' : null }"><a th:href="@{'/user/list-candidate/'(page = ${state.index})}" th:text="${state.index + 1}"></a></li>
                </th:block>
                <li th:if="${numberPage<list.totalPages - 1}"><a th:href="@{'/user/list-candidate/' (page = ${list.number + 1})}">&gt;</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
</section>
<script>
  function save(id){
    var name = "#idRe" +id;
    var idRe = $(name).val();
    var formData = new FormData();
    formData.append('idRe', idRe);
    $.ajax(
            {
              type: 'POST',
              url: '/save-job/save/',
              contentType: false,
              processData: false,
              data: formData,
              success: function (data) {
                console.log(data);
                if(data == "false"){
                  swal({
                    title: 'Bạn cần phải đăng nhập!',
                    /* text: 'Redirecting...', */
                    icon: 'error',
                    timer: 3000,
                    buttons: true,
                    type: 'error'
                  })
                }else if(data == "true"){
                  swal({
                    title: 'Lưu thành công!',
                    /* text: 'Redirecting...', */
                    icon: 'success',
                    timer: 3000,
                    buttons: true,
                    type: 'success'
                  })
                }else{
                  swal({
                    title: 'Bạn đã lưu bài này rồi!',
                    /* text: 'Redirecting...', */
                    icon: 'error',
                    timer: 3000,
                    buttons: true,
                    type: 'error'
                  })
                }
              },
              error: function (err) {
                alert(err);
              }
            }
    )
  }

  function apply(id){
    var name = "#idRe" +id;
    var nameModal = "#exampleModal" +id;
    var nameFile = "#fileUpload"+id;
    var nameText = "#text" +id;
    var idRe = $(name).val();
    var textvalue = $(nameText).val();
    var fileUpload = $(nameFile).get(0);
    var files = fileUpload.files;
    var formData = new FormData();
    formData.append('file', files[0]);
    formData.append('idRe', idRe);
    formData.append('text', textvalue);
    if(files[0] == null){
      swal({
        title: 'Bạn cần phải chọn cv!',
        /* text: 'Redirecting...', */
        icon: 'error',
        timer: 3000,
        buttons: true,
        type: 'error'
      })
    } else {
      $.ajax(
              {
                type: 'POST',
                url: '/user/apply-job/',
                contentType: false,
                processData: false,
                data: formData,
                success: function (data) {
                  if(data == "false"){
                    swal({
                      title: 'Bạn cần phải đăng nhập!',
                      /* text: 'Redirecting...', */
                      icon: 'error',
                      timer: 3000,
                      buttons: true,
                      type: 'error'
                    })
                  }else if(data == "true"){
                    swal({
                      title: 'Ứng tuyển thành công!',
                      /* text: 'Redirecting...', */
                      icon: 'success',
                      timer: 3000,
                      buttons: true,
                      type: 'success'
                    })
                    $(nameModal).modal('hide');
                    $('#fileUpload').val("");
                  }else{
                    swal({
                      title: 'Bạn đã ứng tuyển công việc này!',
                      /* text: 'Redirecting...', */
                      icon: 'error',
                      timer: 3000,
                      buttons: true,
                      type: 'error'
                    })
                    $(nameModal).modal('hide');
                    $('#fileUpload').val("");
                  }
                },
                error: function (err) {
                  alert(err);
                }
              }
      )
    }

  }
</script>



<footer th:replace="public/fragments :: footer" class="ftco-footer ftco-bg-dark ftco-section">

</footer>


<!-- loader -->
<!--<div th:replace="public/fragments :: loading" id="ftco-loader" class="show fullscreen"></div>-->

</body>
</html>