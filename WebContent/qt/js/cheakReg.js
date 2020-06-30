function checkReg(e){
	//alert($(e).nextAll(".info").html());
	var checkReg=$(e).attr("check");
	var val=$(e).val();
	//alert(val);
	if(checkReg!=""&&checkReg!=null){
		var checkR=checkReg.split(",");
		for(var i=0;i<checkR.length;i++){
			//alert("12");
			checkMatch(e,val,checkR[i]);
		}
	}
}


function checkMatch(e,val,match){
	//alert(match);
	switch (match) {
		case "required":
			if(val==""||val==null){
				$(e).nextAll(".info").html("此项不能为空！");
				//art.dialog.alert("此项不能为空！");
				//$(e).focus();
			}else{
				$(e).nextAll(".info").html("");
			}
			break;
		case "num":
			var reg=/^(\d+)$/;
			//var flag = genericRegularFun(reg,e);
			var flag = true;
			var val=$(e).val();
			if(val!=""&&val!=null&&val!=undefined){
				if(!reg.test(val)){
					$(e).nextAll(".info2").html("/ 请填写正确格式");
					flag = false;
				}else{
					$(e).nextAll(".info2").html("");
					flag = true;
				}
			}else{
				var checkReg=$(e).attr("check");
				if(checkReg!="num"&&checkReg!="ip"){
					$(e).nextAll(".info2").html("/ 此项不能为空！");
				}else{
					$(e).nextAll(".info2").html("");
				}
				flag = false;
			}
			
			
			if(flag==true){
				var minNum = $(e).attr("minNum");
				var maxNum = $(e).attr("maxNum");
				
				if(typeof(minNum) != "undefined"&&typeof(maxNum) != "undefined"){
					if(parseInt(val)<parseInt(minNum)||parseInt(val)>parseInt(maxNum)){
						$(e).nextAll(".info2").html('/ 请修改到1至32范围之内');
					}else{
						$(e).nextAll(".info2").html("");
					}
				}
			}
			
			
			break;
		case "char":
			var reg=/^[A-Za-z0-9\-_]+$/;
			genericRegularFun(reg,e);
			break;
		case "float":
			var reg=/^\d+(\.\d+)?$/;
			genericRegularFun(reg,e);
			break;
		case "ip":
			var reg=/^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/;
			genericRegularFun(reg,e);
			break;
		case "notR":
			var reg = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]", "g");
			if(val!=null&&val!=""){
				var result=val.match(reg);
				if(result!=null){
					$(e).nextAll(".info").html("不能包含特殊符号！");
					//art.dialog.alert("不能包含特殊符号！");
					//$(e).focus();
				}
			}else{
				$(e).nextAll(".info").html("");
			}
			break;
		default:
			break;
	}
}


function genericRegularFun(reg,e){
	var val=$(e).val();
	if(val!=""&&val!=null&&val!=undefined){
		if(!reg.test(val)){
			$(e).nextAll(".info").html("请填写正确格式");
			return false;
			//art.dialog.alert("请填写正确格式");
			//$(e).focus();
		}else{
			$(e).nextAll(".info").html("");
			return true;
		}
	}else{
		var checkReg=$(e).attr("check");
		if(checkReg!="num"&&checkReg!="ip"){
			$(e).nextAll(".info").html("此项不能为空！");
		}else{
			$(e).nextAll(".info").html("");
		}
		
		return false;
		//art.dialog.alert("请填写正确格式");
		//$(e).focus();
	}
}
