const app = new Vue({
  el: '#app',
  data: {
	userId: window.userId,
	applyPost: window.applyPost,
	url: window.url,
    recs: [],
    companies: [],
    categories: [],
    keySearch: '',
    
    selectionOption: '',
    fileCV: null,
  },
  
  mounted() {
		document.onreadystatechange = async () => {
			if (document.readyState == "complete") {
				await getRecruitmentOutstanding().done((response) => {
					setRecuiment(response).then((result) => {
						app.recs = result;
				        console.log('recs = ', result);
				    })
				    .catch((error) => {
				        console.error(error);
				    });				
				});
				
				await getCompanyOutstanding().done((response) => {
					app.companies = response;
					console.log('companies = ', app.companies);
				});
				
				await findCategoriesWithRecruitmentCount().done((response) => {
					app.categories = response;
				});
			}
		}
	},
  
  
  methods: {
	  handleJobSearch() {
		  window.location.href = this.url + "/post/searchJob?key=" + app.keySearch;
	  },

	  handleCompanySearch() {
		  window.location.href = this.url + "/post/searchCompany?key=" + app.keySearch;
	  },

	  handleAddressSearch() {
		  window.location.href = this.url + "/post/searchAddress?key=" + app.keySearch;
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

	  openModalApplyPost(recId) {
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

function getRecruitmentOutstanding() {
	return $.ajax({
		url: `${window.url}/getRecruitmentOutstanding.json`,
		cache: false, 
		method: 'GET'
	});
}

function getCompanyOutstanding() {
	return $.ajax({
		url: `${window.url}/getCompanyOutstanding.json`,
		cache: false, 
		method: 'GET'
	});
}

function findCategoriesWithRecruitmentCount() {
	
	return $.ajax({
		url: `${window.url}/category/findCategoriesWithRecruitmentCount.json`,
		cache: false, 
		method: 'GET'
	});
}

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






