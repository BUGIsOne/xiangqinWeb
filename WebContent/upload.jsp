<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>图片上传</title>
    <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="js/mobileBUGFix.mini.js" ></script>
    <script type="text/javascript" src="js/exif.js" ></script>
</head>
<body>
        <input type="hidden" name="" id="canvasval"/>
        上传图片:
       <input type="file" accept="image/*" id="uploadImage" capture="camera" onchange="selectFileImage(this);"  style="display: none;"/>

       <a id="uploadPic">
            <img src="images/addimg.jpg" style="width: 50px;" />
        </a>
		<div style="margin-top: 10px;">
            <div id="fileList" style="width:200px;height:200px;"></div>
		</div>

        <button id="uploadFun">上传</button>
</body>
<script>
    //点击上传图片
    document.getElementById('uploadPic').addEventListener('tap',function(){
        $("#uploadImage").click();
    });

    document.getElementById('uploadFun').addEventListener('tap',function(){
        var imglist=$("#fileList img");//获取ID为div里面的所有img
        var imgArray=new Array;
        for(var i=0;i<imglist.length;i++){ //循环为每个img设置
            imgArray[i]=imglist[i].src;
        }
        //uploadImage(imgArray);
        uploadImage(JSON.stringify(imgArray));
    });

    function selectFileImage(fileObj) {
        var file = fileObj.files['0'];
        //图片方向角 added by lzk
        var Orientation = null;

        if (file) {
            console.log("正在上传,请稍后...");
            var rFilter = /^(image\/jpeg|image\/png|image\/jpg|image\/gif)$/i; // 检查图片格式
            if (!rFilter.test(file.type)) {
                //showMyTips("请选择jpeg、png格式的图片", false);
                return;
            }
            //获取照片方向角属性，用户旋转控制
            EXIF.getData(file, function() {
                EXIF.getAllTags(this);
                Orientation = EXIF.getTag(this, 'Orientation');
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
                    $("#canvasval").val(canvas);
                    var base64 = null;
                    var mpImg = new MegaPixImage(image);
                    mpImg.render(canvas, {
                        maxWidth: 800,
                        maxHeight: 1200,
                        quality: 0.8,
                        orientation: Orientation
                    });

                    base64 = canvas.toDataURL("image/jpeg", 0.8);
                    $("#fileList").append("<img alt='preview' src='"+base64+"' width='200px'/>");
                };
            };
            oReader.readAsDataURL(file);
        }
    }

 
</script>
</html>