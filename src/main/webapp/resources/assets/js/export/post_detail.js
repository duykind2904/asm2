const app = new Vue({
  el: '#app',
  data: {
	userId: window.userId,
    url: window.url,
    rec: window.recruitment,
    userRole: window.userRole,
    applyPost: window.applyPost,
    
    listUserApplyPost: [],
    totalCount: 0,
    pageTotal: 0,
    pageNumber: 1,
    pageSize: 6,    
    activeIndex: -1,
    
    isFollow: false,
    isApply: false,
    
    selectionOption: '',
	fileCV: null,
    
  },
  
	mounted() {
		document.onreadystatechange = async () => {
			if (document.readyState == "complete") {
				console.log(app.rec);
				
				app.totalCount = await countUserApplyPostByRecId(app.rec.id).done();
				if(app.totalCount > 0) {
					app.listUserApplyPost = await getListUserApplyPostByRecId(app.rec.id, app.pageNumber, app.pageSize).done();
					this.activeIndex = 1;
					app.pageTotal = Math.floor(app.totalCount / app.pageSize) + (app.totalCount % app.pageSize > 0 ? 1 : 0);
				}
				
				if(app.userId > 0) {
					await checkFollowAndApplyPost(app.userId, app.rec.id).then((response) => {
						if(response) {
							app.isFollow = response.follow;
							app.isApply = response.apply;
						}
					});					
				}
			}
		}
	},

	methods: {
		async getPage(index) {
			this.activeIndex = index;
			app.pageNumber = index;
			app.listUserApplyPost = await getListUserApplyPostByRecId(app.rec.id, app.pageNumber, app.pageSize).done();
		},
		
		viewCV(user) {
			if(user.cvName) {
				const cvUrl = `${this.url}/assets/images/uploads/${user.cvName}`;
		    	window.open(cvUrl, '_blank');
			} else {
				swal('Không có CV cho ứng viên ' + user.fullName);
			}
			
		},
		
		accessCV(applyPost) {
			updateStatusApplyPost(applyPost.userId, applyPost.recruitmentId, true);			
			
			const index = app.listUserApplyPost.findIndex(item => item.userId === applyPost.userId);
			if (index !== -1) {
			    app.listUserApplyPost[index].status = true;
			}
			
		},
		
		folowRecuitment(check) {
			if (app.userId > 0) {
				saveFollowPost(app.userId, app.rec.id, check);
				app.isFollow = check;
			} else {
				swal({
					title: "Bạn chưa đăng nhập",
					text: "Đến trang đăng nhập?",
					icon: "warning",
					buttons: {
						cancel: "Hủy",
						confirm: "OK"
					},
				}).then((value) => {
					if (value) {
						window.location.href = this.url + "/auth/login";
					}
				});
			}
		},
		
		openModalApplyPost() {
			if (app.userId > 0) {
				$('#exampleModal').modal('show');
			} else {
				swal({
					title: "Bạn chưa đăng nhập",
					text: "Đến trang đăng nhập?",
					icon: "warning",
					buttons: {
						cancel: "Hủy",
						confirm: "OK"
					},
				}).then((value) => {
					if (value) {
						window.location.href = this.url + "/auth/login";
					}
				});
			}
		},
		
		checkPdf(event) {
			const file = event.target.files[0];

			if (file.type === 'application/pdf') {
				app.fileCV = file;
			} else {
				swal("Vui lòng chọn một tập tin PDF.");
			}
		},
		
		async handleApplyPost() {
		  if (app.userId > 0) {
			  app.applyPost.userId = app.userId;
			  app.applyPost.recruitmentId = app.rec.id;

			  
			  if (app.selectionOption == 1) {
				  let fileNameCV = await getFileNameCV(app.userId).done();
				  if (fileNameCV.trim()) {
					  app.applyPost.nameCV = fileNameCV;
				  } else {
					  swal("Bạn chưa có file CV. Vui lòng cập nhật file CV của bạn");
					  return;
				  }
			  } else {
				  app.applyPost.nameCV = await saveFile(app.fileCV).done();
			  }

			  await saveApplyPost(app.applyPost).done();
			  swal("Nộp đơn ứng tuyển thành công");
			  app.isApply = true;

		  } else {
			  swal({
				  title: "Bạn chưa đăng nhập",
				  text: "Đến trang đăng nhập?",
				  icon: "warning",
				  buttons: {
					  cancel: "Hủy",
					  confirm: "OK"
				  },
			  }).then((value) => {
				  if (value) {
					  window.location.href = this.url + "/auth/login";
				  }
			  });
		  }

		}
	}, 
   
});

function countUserApplyPostByRecId(recId) {
	return $.ajax({
		url: `${window.url}/post/countUserApplyPostByRecId.json`,
		data: {
			recId: recId,
		},
		cache: false,
		method: 'GET',
		type: 'GET'
	});
}

function getListUserApplyPostByRecId(recId, pageNumber, pageSize) {
	return $.ajax({
		url: `${window.url}/post/getListUserApplyPostByRecId.json`,
		data: {
			recId: recId,
			pageNumber: pageNumber,
			pageSize: pageSize,
		},
		cache: false,
		method: 'GET',
		type: 'GET'
	});
}

function updateStatusApplyPost(userId, recId, isStatus) {
	return $.ajax({
		url: `${window.url}/applyPost/updateStatusApplyPost.json`,
		data: {
			userId: userId,
			recId: recId,
			isStatus: isStatus,
		},
		cache: false,
		method: 'GET',
		type: 'GET'
	});	
}

function checkFollowAndApplyPost(userId, recId) {
	return $.ajax({
		url: `${window.url}/post/checkFollowAndApplyPost.json`,
		data: {
			userId: userId,
			recId: recId,
		},
		cache: false,
		method: 'GET',
		type: 'GET'
	});
}

function saveFollowPost(userId, recId, isFollow) {
	return $.ajax({
		url: `${window.url}/post/handleFollowPost.json`,
		data: {
			userId: userId,
			recId: recId,
			isFollow: isFollow,
		},
		cache: false,
		method: 'GET',
		type: 'GET'
	});
}

function getFileNameCV(userId) {
	return $.ajax({
		url: `${window.url}/post/getFileNameCVByUserId.json`,
		data: {
			userId: userId,
		},
		cache: false, 
		method: 'GET'
	});
}

function saveFile(file) {
	var formData = new FormData();
	formData.append('file', file);
	return $.ajax({
		url: `${window.url}/file/saveFile.json`,
		type: 'POST',
        data: formData, 
        processData: false, 
        contentType: false, 
	});
}

function saveApplyPost(applyPost) {
	return $.ajax({
		url: `${window.url}/applyPost/saveApplyPost.json`, 
		data: JSON.stringify(applyPost),
		cache: false,
		contentType: 'application/json',
		processData: false,
		method: 'POST',
		type: 'POST'
	});	
}











