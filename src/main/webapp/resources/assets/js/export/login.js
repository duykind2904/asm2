new Vue({
  el: '#app',
  data: {
    user: window.user,
    url: window.url,
    password1: '',
    passwordVisible1: true,
    password2: '',
    passwordVisible2: true,
    emailLogin: null,
    passwordLogin: null,
    errorLogin: true,
    emailLoginMsg: "",
    passwordLoginMsg: "",
    emailMsg: "",
    fullNameMsg: "",
    passwordMsg: "",
    rePasswordMsg: "",
    roleMsg: "",
    roleId: 0,
  },

  created() { 
		if (window.location.href.indexOf('?error') !== -1) {
			this.errorLogin = false;
    	} 
	},
	
	
  computed: {
    
  },
  
  methods: {
	togglePassword1() {
		this.passwordVisible1 = !this.passwordVisible1;
	},
	
	togglePassword2() {
		this.passwordVisible2 = !this.passwordVisible2;
	},
	
	async handleregister(event) {				
		var bool = await this.checkInput();		
		if (bool) {
			
			await getRole(this.roleId).done(data => {
				this.user.role = data;
			});
			
			this.user.password = this.password1;
			await saveUser(this.user);

		}		
		
	},
	
	handleLogin(event) {
		event.preventDefault();
				
		var bool = this.checkInputLogin();		
		if (bool) {			
			event.target.submit();
		}		
		
	},
	
	checkInput: async function() {
		var isValid = true;
		this.emailLoginMsg = "";
		this.passwordLoginMsg = "";
		
		this.user.email = document.getElementById('email').value;
		const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
		if(!this.user.email) {
			this.emailMsg = "(Email không được để trống)";
			isValid = false;
		} else if (!emailRegex.test(this.user.email)){
			this.emailMsg = "(Email không đúng định dạng)";
			isValid = false;
		}
		
		this.user.fullName = document.getElementById('fullName').value;
		if(!this.user.fullName) {
			this.fullNameMsg = "(Tên không được để trống)";
			isValid = false;
		}
		
		const passwordPattern = /^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z])(?=.*[^a-zA-Z0-9]).{8,}$/;
		/*if(!this.password1) {
			this.passwordMsg = "(Password không được để trống)";
			isValid = false;
		} else if (!passwordPattern.test(this.password1)) {
			this.passwordMsg = "(Password không đúng định dạng. Ít nhất 8 ký tự, ít nhất 1 ký tự viết hoa, 1 ký tự số, 1 ký tự đặc biệt)";
			isValid = false;
		} else if(this.password2 && this.password1 !== this.password2 ) {				 
			this.rePasswordMsg = "(Password không giống nhau)";
			isValid = false;
		}*/	
		
		if(!this.password2) {
			this.rePasswordMsg = "(RePassword không được để trống)";
			isValid = false;
		} 
				
		this.roleId = document.getElementById('role').value;
		if(this.roleId == 0) {
			this.roleMsg = "(Vai trò không được để trống)";
			isValid = false;
		}
		
		if(this.user.email) {
			const emailValid = await  checkEmailRegister(this.user.email).done();
			if (emailValid) {
				this.emailMsg = "(Email đã tồn tại)";
				isValid = false;
			}
		}
				
		return isValid;			
	}, 
	
	checkInputLogin: function() {
		this.emailMsg = "";
		this.fullNameMsg = "";
		this.passwordMsg = "";
		this.rePasswordMsg = "";
		this.roleMsg = "";
		var i = 0;
		
		this.emailLogin = document.getElementById('emailLogin').value;
		const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
		if(!this.emailLogin) {
			this.emailLoginMsg = "(Email không được để trống)";
		} else if (!emailRegex.test(this.emailLogin)){
			this.emailLoginMsg = "(Email không đúng định dạng)";
		} else {
			this.emailLoginMsg = "";
			i++;
		}
		
		this.passwordLogin = document.getElementById('passwordLogin').value;
		if(!this.passwordLogin) {
			this.passwordLoginMsg = "(Password không được để trống)";
		} else {
			this.passwordLoginMsg = "";
			i++;
		} 
	
		if(i === 2) {
			return true;
		}
		return false;			
	}, 
	
  }, 
   
});

function saveUser(user) {
	return $.ajax({
		url: save_user,
		data: JSON.stringify(user),
		cache: false,
		contentType: 'application/json',
		processData: false,
		method: 'POST',
		type: 'POST'
	});
	
}

function getRole(id) {
	return $.ajax({
		url: getRole_url,
		data: {
			roleId: id,
		},
		cache: false,
		method: 'POST',
		type: 'POST'
	});	
}


function checkEmailRegister(email) {
	return $.ajax({
		url: checkEmail_url,
		data: {
			email: email,
		},
		
		cache: false,
		method: 'POST',
		type: 'POST'
	});	
}





