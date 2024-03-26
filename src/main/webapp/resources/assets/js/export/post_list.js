const app = new Vue({
  el: '#app',
  data: {
    url: window.url,
    listPost: [],
    totalCount: 0,
    pageTotal: 0,
    pageNumber: 1,
    pageSize: 2,
    
    activeIndex: -1,
    
  },
  
	mounted() {
		document.onreadystatechange = async () => {
			if (document.readyState == "complete") {
				app.totalCount = await countListPost().done();
				if(app.totalCount > 0) {
					app.listPost = await getListPost(app.pageNumer, app.pageSize).done();
					this.activeIndex = 1;
					if(app.totalCount % app.pageSize > 0) {
						app.pageTotal = app.listPost.length / app.pageSize + 1;
					} else {
						app.pageTotal = app.listPost.length / app.pageSize;
					}
				}
				
			}
		}
	},

	methods: {
		async getPage(index) {
			this.activeIndex = index;
			app.pageNumber = index;
			app.listPost = await getListPost(app.pageNumber, app.pageSize).done();
		},
		
		async deletePost(id) {
			//var OK = await deletePost(id).done();
			app.listPost = app.listPost.filter(item => item.id !== id);
			$('#exampleModal-' + id).modal('hide');
		}


	}, 
   
});

function countListPost() {
	return $.ajax({
		url: `${window.url}/post/countListPost.json`,
		cache: false,
		method: 'GET',
		type: 'GET'
	});
}

function getListPost(pageNumber, pageSize) {
	return $.ajax({
		url: `${window.url}/post/getListPost.json`,
		data: {
			pageNumber: pageNumber,
			pageSize: pageSize,
		},
		cache: false,
		method: 'GET',
		type: 'GET'
	});
}

function deletePost(id) {
	return $.ajax({
		url: `${window.url}/post/deletePost.json`,
		data: {
			id: id,
		},
		cache: false,
		method: 'GET',
		type: 'GET'
	});	
}





