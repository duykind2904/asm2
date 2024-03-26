const app = new Vue({
  el: '#app',
  data: {
    url: window.url,
    rec: window.recruitment,
    
    listApplyPost: [],
    totalCount: 0,
    pageTotal: 0,
    pageNumber: 1,
    pageSize: 2,    
    activeIndex: -1,
    
  },
  
	mounted() {
		document.onreadystatechange = async () => {
			if (document.readyState == "complete") {
				console.log(app.rec);
				
				app.totalCount = await countApplyPostByRecId(app.rec.id).done();
				if(app.totalCount > 0) {
					app.listApplyPost = await getListApplyPostByRecId(app.rec.id, app.pageNumer, app.pageSize).done();
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
		


	}, 
   
});

function countApplyPostByRecId(id) {
	return $.ajax({
		url: `${window.url}/post/countApplyPostByRecId.json`,
		data: {
			id: id,
		},
		cache: false,
		method: 'GET',
		type: 'GET'
	});
}

function getListApplyPostByRecId(id, pageNumber, pageSize) {
	return $.ajax({
		url: `${window.url}/post/getListApplyPostByRecId.json`,
		data: {
			id: id,
			pageNumber: pageNumber,
			pageSize: pageSize,
		},
		cache: false,
		method: 'GET',
		type: 'GET'
	});
}

/*function deletePost(id) {
	return $.ajax({
		url: `${window.url}/post/deletePost.json`,
		data: {
			id: id,
		},
		cache: false,
		method: 'GET',
		type: 'GET'
	});	
}*/

/*function apply(id){
    var name = "#idRe" +id;
    var nameModal = "#exampleModal" +id;
    var nameFile = "#fileUpload"+id;
    var nameText = "#text" +id;
    var idRe = $(name).val();
    var textvalue = $(nameText).val();
    var fileUpload = $(nameFile).get(0);
    var files = fileUpload.files;
    var formData = new FormData();
    formData.append('file', files[0]);
    formData.append('idRe', idRe);
    formData.append('text', textvalue);
    if(files[0] == null){
        swal({
            title: 'Bạn cần phải chọn cv!',
             text: 'Redirecting...', 
            icon: 'error',
            timer: 3000,
            buttons: true,
            type: 'error'
        })
    } else {
        $.ajax(
            {
                type: 'POST',
                url: '/user/apply-job/',
                contentType: false,
                processData: false,
                data: formData,
                success: function (data) {
                    if(data == "false"){
                        swal({
                            title: 'Bạn cần phải đăng nhập!',
                             text: 'Redirecting...', 
                            icon: 'error',
                            timer: 3000,
                            buttons: true,
                            type: 'error'
                        })
                    }else if(data == "true"){
                        swal({
                            title: 'Ứng tuyển thành công!',
                             text: 'Redirecting...', 
                            icon: 'success',
                            timer: 3000,
                            buttons: true,
                            type: 'success'
                        })
                        $(nameModal).modal('hide');
                        $('#fileUpload').val("");
                    }else{
                        swal({
                            title: 'Bạn đã ứng tuyển công việc này!',
                             text: 'Redirecting...', 
                            icon: 'error',
                            timer: 3000,
                            buttons: true,
                            type: 'error'
                        })
                        $(nameModal).modal('hide');
                        $('#fileUpload').val("");
                    }
                },
                error: function (err) {
                    alert(err);
                }
            }
        )
    }

}*/

/*function save(id){
    var name = "#idRe" +id;
    var idRe = $(name).val();
    var formData = new FormData();
    formData.append('idRe', idRe);
    $.ajax(
        {
            type: 'POST',
            url: '/save-job/save/',
            contentType: false,
            processData: false,
            data: formData,
            success: function (data) {
                if(data == "false"){
                    swal({
                        title: 'Bạn cần phải đăng nhập!',
                         text: 'Redirecting...', 
                        icon: 'error',
                        timer: 3000,
                        buttons: true,
                        type: 'error'
                    })
                }else if(data == "true"){
                    swal({
                        title: 'Lưu thành công!',
                         text: 'Redirecting...', 
                        icon: 'success',
                        timer: 3000,
                        buttons: true,
                        type: 'success'
                    })
                }else{
                    swal({
                        title: 'Bạn đã lưu bài này rồi!',
                         text: 'Redirecting...', 
                        icon: 'error',
                        timer: 3000,
                        buttons: true,
                        type: 'error'
                    })
                }
            },
            error: function (err) {
                alert(err);
            }
        }
    )
}*/