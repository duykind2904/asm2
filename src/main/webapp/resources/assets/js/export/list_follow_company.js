const app = new Vue({
	el: '#app',
	data: {
		userId: window.userId,
		url: window.url,

		companies: [],
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
				app.totalCount = await countByFollowCompany().done();
				if (app.totalCount > 0) {
					await getListByFollowCompany(app.pageNumber, app.pageSize)
						.then((response) => {
							return setCompany(response); // Trả về một promise từ hàm setRecuiment
						})
						.then((result) => {
							app.companies = result;
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
			await getListByFollowCompany(app.pageNumber, app.pageSize).then((response) => {
				setCompany(response).then((result) => {
					app.companies = result;
				})
					.catch((error) => {
						console.error(error);
					});

			});
		},
		
		folowCompany(companyId, isFollow) {
			if (app.userId > 0) {
				var com = app.companies.find(item => item.id === companyId);
				com.isFollow = isFollow;
				saveFollowCompany(app.userId, companyId, isFollow);
				if (isFollow) {
					swal("Theo dõi công ty " + com.name + " thành công");
				} else {
					swal("Hủy theo dõi công ty " + com.name + " thành công");
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
	},

});

async function setCompany(companies) {
	const processedRecs = await Promise.all(
		companies.map(async (com) => {
			return {
				...com,
				isFollow: true,
			};
		})
	);
	return processedRecs;
}

function countByFollowCompany() {
	return $.ajax({
		url: `${window.url}/company/countByFollowCompany.json`,
		cache: false,
		method: 'GET',
		type: 'GET'
	});
}

function getListByFollowCompany(pageNumber, pageSize) {
	return $.ajax({
		url: `${window.url}/company/getListByFollowCompany.json`,
		data: {
			pageNumber: pageNumber,
			pageSize: pageSize,
		},
		cache: false,
		method: 'GET',
		type: 'GET',
	});
}

function saveFollowCompany(userId, companyId, isFollow) {
	return $.ajax({
		url: `${window.url}/company/handleFollowCompany.json`,
		data: {
			userId: userId,
			companyId: companyId,
			isFollow: isFollow,
		},
		cache: false,
		method: 'GET',
		type: 'GET'
	});
}




