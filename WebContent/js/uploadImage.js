
function selectFileImage(fileObj) {
	var file = fileObj.files['0'];
	//图片方向角 added by lzk
	var Orientation = null;
	
	if (file) {
		console.log("正在上传,请稍后...");
		var rFilter = /^(image\/jpeg|image\/png)$/i; // 检查图片格式
		if (!rFilter.test(file.type)) {
			//showMyTips("请选择jpeg、png格式的图片", false);
			return;
		}
		// var URL = URL || webkitURL;
		//获取照片方向角属性，用户旋转控制
		EXIF.getData(file, function() {
		   // alert(EXIF.pretty(this));
		    EXIF.getAllTags(this); 
		    //alert(EXIF.getTag(this, 'Orientation')); 
		    Orientation = EXIF.getTag(this, 'Orientation');
		    //return;
		});
		
		var oReader = new FileReader();
		oReader.onload = function(e) {
			//var blob = URL.createObjectURL(file);
			//_compress(blob, file, basePath);
			var image = new Image();
			image.src = e.target.result;
			image.onload = function() {
				var expectWidth = this.naturalWidth;
				var expectHeight = this.naturalHeight;
				
				if (this.naturalWidth > this.naturalHeight && this.naturalWidth > 800) {
					expectWidth = 800;
					expectHeight = expectWidth * this.naturalHeight / this.naturalWidth;
				} else if (this.naturalHeight > this.naturalWidth && this.naturalHeight > 1200) {
					expectHeight = 1200;
					expectWidth = expectHeight * this.naturalWidth / this.naturalHeight;
				}
				alert(expectWidth+','+expectHeight);
				var canvas = document.createElement("canvas");
				var ctx = canvas.getContext("2d");
				canvas.width = expectWidth;
				canvas.height = expectHeight;
				ctx.drawImage(this, 0, 0, expectWidth, expectHeight);
				alert(canvas.width+','+canvas.height);
				
				var base64 = null;
				var mpImg = new MegaPixImage(image);
					mpImg.render(canvas, {
						maxWidth: 800,
						maxHeight: 1200,
						quality: 0.8,
						orientation: Orientation
					});
					
				base64 = canvas.toDataURL("image/jpeg", 0.8);
				//uploadImage(base64);
				$("#myImage").attr("src", base64);
			};
		};
		oReader.readAsDataURL(file);
	}
}

/** 记录上传数据 */
function uploadImage(imageData) {
	if (imageData) {
		$.ajax({
			type: "post",
			async: false,
			url: basePath + "goods/savePic/",
			data: {
				baseStr: imageData,
				number: currImgGroup
			},
			dataType: 'json',
			success: function(data) {
				if (data.id > 0) {
					var curImg = $("#uploadImg_" + currImgGroup);
					curImg.attr("src", ossPath + data.remark);
					if (!$("#lPicUrl").val() || $("#lPicUrl").val() == "") {
						$("#lPicUrl").val(data.remark);
					} else {
						$("#lPicUrl").val($("#lPicUrl").val() + "," + data.remark);
					}
					setImgShow(data.remark);
				} else {
					console.log(data.msg, false);
				}
			}
		});
	}
}