function get_BuildingByMno(mno){
	var dt;
	$.ajax({
		url:"${pageContext.request.contextPath}/getBuildingByMno/"+mno,
		type:"get",
		async:false,
		dataType:"json",
		success:function(json){
			dt = json;
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	return dt;
}

function get_BuildingByOno(ono){
	var dt;
	$.ajax({
		url:"${pageContext.request.contextPath}/owner/getBuildingByOno/"+ono,
		type:"get",
		async:false,
		dataType:"json",
		success:function(json){
			dt = json;
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	return dt;
}