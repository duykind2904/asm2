async function setRecuiment(recs) {
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
}

function checkFollowAndApplyPost(userId, recId) {
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
}

function saveFollowPost(userId, recId, isFollow) {
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
}

function getFileNameCV(userId) {
	return $.ajax({
		url: `${window.url}/post/getFileNameCVByUserId.json`,
		data: {
			userId: userId,
		},
		cache: false, 
		method: 'GET'
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

function updatenameCVToUser(userId, nameCV) {
	return $.ajax({
		url: `${window.url}/post/updatenameCVToUser.json`,
		data: {
			userId: userId,
			nameCV: nameCV,
		},
		cache: false, 
		method: 'GET'
	});
}

function saveApplyPost(applyPost) {
	return $.ajax({
		url: `${window.url}/applyPost/saveApplyPost.json`, 
		data: JSON.stringify(applyPost),
		cache: false,
		contentType: 'application/json',
		processData: false,
		method: 'POST',
		type: 'POST'
	});	
}