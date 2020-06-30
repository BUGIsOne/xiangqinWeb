function a(){
    	var now=new Date();
		var y=now.getFullYear();
		var m=now.getMonth()+1;
		var d=now.getDate();
		var h=now.getHours();
		var mm=now.getMinutes();
		var s=now.getSeconds();
		var show=(y+"-"+m+"-"+d+" "+h+":"+mm+":"+s);
		document.getElementById('nowDate').value = show;
    }