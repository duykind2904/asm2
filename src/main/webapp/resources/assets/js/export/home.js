const app = new Vue({
  el: '#app',
  data: {

    recs: [],
    companies: [],
  },
  
  mounted() {
		document.onreadystatechange = async () => {
			if (document.readyState == "complete") {
				await getRecruitmentOutstanding().done((response) => {
					app.recs = response;
					console.log(app.recs);
					
					
				});
				
				await getCompanyOutstanding().done((response) => {
					app.companies = response;
					console.log(app.companies);
				});
			}
		}
	},
  
  
  methods: {
   
  },  
  
});

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





