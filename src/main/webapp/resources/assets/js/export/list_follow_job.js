const app = new Vue({
	el: '#app',
	data: {
		userId: window.userId,
		url: window.url,
		applyPost: window.applyPost,

		recs: [],
		selectionOption: '',
		fileCV: null,

		totalCount: 0,
		pageTotal: 0,
		pageNumber: 1,
		pageSize: 5,
		activeIndex: -1,
		keySearch: '',
	},

	mounted() {
		document.onreadystatechange = async () => {
			if (document.readyState == "complete") {
				app.totalCount = await countByFollow().done();
				if (app.totalCount > 0) {
					await getListByFollow(app.pageNumber, app.pageSize)
						.then((response) => {
							return setRecuiment(response); // Trả về một promise từ hàm setRecuiment
						})
						.then((result) => {
							app.recs = result;
							console.log(11, result);

							this.activeIndex = 1;
							app.pageTotal = Math.floor(app.totalCount / app.pageSize) + (app.totalCount % app.pageSize > 0 ? 1 : 0);
							
						})
						.catch((error) => {
							console.error(error);
						});
				}

			}
		}
	},

	methods: {
		async getPage(index) {
			this.activeIndex = index;
			app.pageNumber = index;
			await getListByFollow(app.pageNumber, app.pageSize).done((response) => {
				setRecuiment(response).then((result) => {
					app.recs = result;
				})
					.catch((error) => {
						console.error(error);
					});

			});
		},
		
		handleJobSearch() {
			window.location.href = this.url + "/post/searchJob?key=" + app.keySearch;
		},

		folowRecuitment(recId, isFollow) {
			if (app.userId > 0) {
				var rec = app.recs.find(item => item.id === recId);
				rec.isFollow = isFollow;
				saveFollowPost(app.userId, rec.id, isFollow);
				if (isFollow) {
					swal("Theo dõi công việc " + rec.title + " thành công");
				} else {
					swal("Hủy theo dõi công việc " + rec.title + " thành công");
				}


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
		

		async openModalApplyPost(rec) {
			if (app.userId > 0) {
				$(`#exampleModal-${recId}`).modal('show');
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

		async handleApplyPost(recId) {
		  if (app.userId > 0) {
			  app.applyPost.userId = app.userId;
			  app.applyPost.recruitmentId = recId;

			  
			  if (app.selectionOption == 1) {
				  let fileNameCV = await getFileNameCV(app.userId).done();
				  if (fileNameCV.trim()) {
					  app.applyPost.nameCV = fileNameCV;
				  } else {
					  swal("Bạn chưa có file CV. Vui lòng cập nhật file CV của bạn");
					  return;
				  }
			  } else {
				  /*if (fileNameCV.trim()) {
					  await deleteFile(fileNameCV);
				  }*/
				  app.applyPost.nameCV = await saveFile(app.fileCV).done();
				  //var OK = updatenameCVToUser(app.userId, app.applyPost.nameCV);
			  }

			  await saveApplyPost(app.applyPost).done();
			  swal("Nộp đơn ứng tuyển thành công");
			  var rec = app.recs.find(item => item.id === recId);
			  rec.isApply = true;

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

/*async function setRecuiment(recs) {
	const processedRecs = await Promise.all(
		recs.map(async (rec) => {
			const response = await checkFollowAndApplyPost(app.userId, rec.id);
			return {
				...rec,
				isFollow: response.follow,
				isApply: response.apply,
			};
		})
	);
	return processedRecs;
}*/

/*function checkFollowAndApplyPost(userId, recId) {
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
}*/

function countByFollow() {
	return $.ajax({
		url: `${window.url}/post/countByFollow.json`,
		cache: false,
		method: 'GET',
		type: 'GET'
	});
}

function getListByFollow(pageNumber, pageSize) {
	return $.ajax({
		url: `${window.url}/post/getListByFollow.json`,
		data: {
			pageNumber: pageNumber,
			pageSize: pageSize,
		},
		cache: false,
		method: 'GET',
		type: 'GET',
	});
}

/*function saveFollowPost(userId, recId, isFollow) {
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
}*/

/*function getFileNameCV(userId) {
	return $.ajax({
		url: `${window.url}/post/getFileNameCVByUserId.json`,
		data: {
			userId: userId,
		},
		cache: false, 
		method: 'GET'
	});
}*/

/*function deleteFile(fileName) {
	return $.ajax({
		url: `${window.url}/file/deleteFile.json`,
		data: {
			fileName: fileName,
		},
		cache: false, 
		method: 'GET'
	});
}*/

/*function saveFile(file) {
	var formData = new FormData();
	formData.append('file', file);
	return $.ajax({
		url: `${window.url}/file/saveFile.json`,
		type: 'POST',
        data: formData, 
        processData: false, 
        contentType: false, 
	});
}*/

/*function updatenameCVToUser(userId, nameCV) {
	return $.ajax({
		url: `${window.url}/post/updatenameCVToUser.json`,
		data: {
			userId: userId,
			nameCV: nameCV,
		},
		cache: false, 
		method: 'GET'
	});
}*/

/*function saveApplyPost(applyPost) {
	return $.ajax({
		url: `${window.url}/applyPost/saveApplyPost.json`, 
		data: JSON.stringify(applyPost),
		cache: false,
		contentType: 'application/json',
		processData: false,
		method: 'POST',
		type: 'POST'
	});	
}*/




