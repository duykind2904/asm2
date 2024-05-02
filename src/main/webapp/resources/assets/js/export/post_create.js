const app = new Vue({
  el: '#app',
  data: {
    recruitment: window.recruitment,
    url: window.url,
    list_category: [],
    validator: Object.assign({}, null),
    id: '',
    isCompany: false,
  },

  async created() { 
		
	},
	
	
	mounted() {
		document.onreadystatechange = async () => {
			if (document.readyState == "complete") {
				await getCategory().done((response) => {
					this.list_category = response;
					console.log(this.list_category);
				});
				app.isCompany = await isCompanyExsit().done();
				console.log(app.isCompany);
			}
		}
	},
  
  methods: {
	  submit() {

		  var bool = this.validatorInput();
		  this.id = '*';
		  console.log(this.recruitment);

		  if (bool) {
			  if(this.recruitment.id == 0) {
				  swal("Tạo bài đăng tuyển thành công");
			  } else {
				  swal("Cập nhật bài đăng thành công");
			  }
			  
			  saveRecruitment(this.recruitment).done();
			  setTimeout(function() {
				  swal.close();
				  window.location.href = this.url + "/post/list";
			  }, 2000);
			  
			  
		  }
	  },

	  validatorInput() {
		  var isValid = true;
		  if (!this.recruitment.title || !this.recruitment.title.trim()) {
			  this.validator.title = "Tiêu đề không được để trống";
			  isValid = false;
		  }
		  if (!this.recruitment.description || !this.recruitment.description.trim()) {
			  this.validator.description = "Mô tả công việc không được để trống";
			  isValid = false;
		  }
		  if (!this.recruitment.experience || !this.recruitment.experience.trim()) {
			  this.validator.experience = "Kinh nghiệm không được để trống";
			  isValid = false;
		  }
		  if (!this.recruitment.quantity || !this.recruitment.quantity.trim()) {
			  this.validator.quantity = "Số lượng ứng tuyển không được để trống";
			  isValid = false;
		  }
		  if (!this.recruitment.address || !this.recruitment.address.trim()) {
			  this.validator.address = "Địa chỉ không được để trống";
			  isValid = false;
		  }
		  if (!this.recruitment.deadline || !this.recruitment.deadline.trim()) {
			  this.validator.deadline = "Hạn ứng tuyển không được để trống";
			  isValid = false;
		  }
		  if (!this.recruitment.salary || !this.recruitment.salary.trim()) {
			  this.validator.salary = "Lương không được để trống";
			  isValid = false;
		  }
		  if (!this.recruitment.type) {
			  this.validator.type = "Loại công việc không được để trống";
			  isValid = false;
		  }
		  if (!this.recruitment.categorySelected) {
			  this.validator.categorySelected = "Danh mục không được để trống";
			  isValid = false;
		  }

		  return isValid;

	  }
	
  }, 
   
});

function getCategory() {
	return $.ajax({
		url: `${window.url}/category/getCategory.json`,
		cache: false, 
		method: 'GET'
	});
}

function isCompanyExsit() {
	return $.ajax({
		url: `${window.url}/post/isCompanyExsit.json`,
		cache: false, 
		method: 'GET'
	});
}

function saveRecruitment(recruitment) {
	return $.ajax({
		url: `${window.url}/post/save.json`,
		data: JSON.stringify(recruitment),
		cache: false,
		contentType: 'application/json',
		processData: false,
		method: 'POST',
		type: 'POST'
	});
	
}





