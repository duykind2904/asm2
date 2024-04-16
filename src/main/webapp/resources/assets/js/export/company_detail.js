const app = new Vue({
  el: '#app',
  data: {
	userId: window.userId,
    url: window.url,
    company: window.company,
	isFollowCompany: false,
    
  },
  
	mounted() {
		document.onreadystatechange = async () => {
			if (document.readyState == "complete") {
				console.log(app.company);
				if(app.userId > 0) {
					app.isFollowCompany = await checkFollowCompany(app.userId, app.company.id);
				}
				
			}
		}
	},

	methods: {
		followCompany() {
			if(app.userId > 0) {				
				if(app.isFollowCompany) {
					deleteFollowCompany(app.userId, app.company.id);
				} else {
					saveFollowCompany(app.userId, app.company.id);				
				}
				app.isFollowCompany == true ? app.isFollowCompany = false : app.isFollowCompany = true;
				
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

function checkFollowCompany(userId, companyId) {
	return $.ajax({
		url: `${window.url}/company/checkFollow.json`,
		data: {
			userId: userId,
			companyId: companyId,
		},
		cache: false,
		method: 'GET',
		type: 'GET'
	});
}

function saveFollowCompany(userId, companyId) {
	return $.ajax({
		url: `${window.url}/company/saveFollow.json`,
		data: {
			userId: userId,
			companyId: companyId,
		},
		cache: false,
		method: 'GET',
		type: 'GET'
	});
}

function deleteFollowCompany(userId, companyId) {
	return $.ajax({
		url: `${window.url}/company/deleteFollow.json`,
		data: {
			userId: userId,
			companyId: companyId,
		},
		cache: false,
		method: 'GET',
		type: 'GET'
	});
}
