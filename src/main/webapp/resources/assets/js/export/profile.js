const app = new Vue({
	el: '#app',
	data: {
		user: window.user,
		url: window.url,
		
		cvName: null,
		company: window.company,
		
	},

	created() {
		console.log(this.user);
	},


	mounted() {
		document.onreadystatechange = async () => {
			if (document.readyState == "complete") {
				if (app.user) {					
					if(app.user.cvName) {
						app.cvName = app.user.cvName;
					}
					
					
				}
			}
		}
	},

	methods: {
		async checkImage(event) {
			const file = event.target.files[0];
			if (file.type.startsWith('image/')) {
				if(app.user.image) {
					let checkdeleteFile = await deleteFile(app.user.image).done();
				} 
				app.user.image = await saveFile(file);
				this.$forceUpdate(); 
			} else {
				swal("Vui lòng chọn một tập tin hình ảnh.");
				event.target.value = '';
			}
		},
		
		async checklogo(event) {
			const file = event.target.files[0];
			if (file.type.startsWith('image/')) {
				if(app.company.logo) {
					let checkdeleteFile = deleteFile(app.user.image).done();
				}
				app.company.logo = await saveFile(file).done();
			} else {
				swal("Vui lòng chọn một tập tin hình ảnh.");
				event.target.value = '';
			}
		},

		async checkPdf(event) {
			const file = event.target.files[0];

			if (file.type === 'application/pdf') {
				if(app.user.cvName) {
					let checkdeleteFile = deleteFile(app.user.cvName);
				}
				app.cvName = file.name.trim();
				app.user.cvName = await saveFile(file).done();

			} else {
				swal("Vui lòng chọn một tập tin PDF.");		
			}
			//event.target.value = '';
		},

		viewCV() {
			const cvUrl = `${this.url}/assets/images/uploads/${app.user.cvName}`;
		    window.open(cvUrl, '_blank');
		},

		deleteCV() {
			swal({
				title: "Bạn có chắc chắn muốn xóa?",
				icon: "warning",
				buttons: ["Hủy", "Xác nhận"],
			})
				.then((confirm) => {
					if (confirm) {
						let checkdeleteFile = deleteFile(app.user.cvName);
						app.cvName = null;
						app.user.cvName = null;
					}
				});
		},
		
		saveUser() {			
			swal("Cập nhật thông tin cá nhân thành công");
			saveUser(this.user);
			setTimeout(function() {
		  	  swal.close();
			}, 2000);
		},
		
		saveCompany() {
			swal("Cập nhật thông tin công ty thành công");
			this.company.user = this.user;
			saveCompany(this.company);
			setTimeout(function() {
		  	  swal.close();
			}, 2000);
		}

	},

});

function saveUser(user) {
    return $.ajax({
        url: `${window.url}/profile/saveUser.json`, 
        data: JSON.stringify(user),
		cache: false,
		contentType: 'application/json',
		processData: false,
		method: 'POST',
		type: 'POST'
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

function saveCompany(company) {
	return $.ajax({
		url: `${window.url}/profile/saveCompany.json`, 
		data: JSON.stringify(company),
		cache: false,
		contentType: 'application/json',
		processData: false,
		method: 'POST',
		type: 'POST'
	});	
}

function deleteFile(fileName) {
	return $.ajax({
		url: `${window.url}/file/deleteFile.json`,
		data: {
			fileName: fileName,
		},
		cache: false, 
		method: 'GET'
	});
}




