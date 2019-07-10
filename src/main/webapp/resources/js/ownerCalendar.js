function drawCalendar(today){
	var year = today.getFullYear();
	var month = today.getMonth()+1;
	var arrDow = ["일", "월", "화", "수", "목", "금", "토"];
	var arrLastDate = [31, 28, 31, 30, 31, 31, 30, 31, 30, 31, 30, 31];
	var lastDate;
	var str = '';
	
	if((year%4 == 0 && year%100 != 0) || year%400 == 0){
		arrLastDate[1] = 29;
	}
	
	lastDate = arrLastDate[month-1];
	
	var row = Math.ceil(lastDate/7);
	var firstDate = new Date(year, month-1, 1);
	var theDay = firstDate.getDay();
	
	var dNum = 1;
	for(var i=1; i<=6; i++){ 
		if(dNum > lastDate){
			break;
		}
		str += "<tr class='calendarDateTr'>";
		for( var k=1; k<=7; k++){
			if(i==1 && k<=theDay||dNum>lastDate){
				str += "<td></td>";
			}else{
				str += "<td class='c_"+year+"-"+((month>9?'':'0')+month)+"-"+((dNum>9?'':'0')+dNum)+"'><p><span class='btnPlus'>+</span>"+dNum+"</p><div class='calNoticeWrap'></div></td>";
				dNum ++; 
			}
		}
		str += "</tr>";
	}
	$("#calendarWrap > table .calendarDateTr").remove();
	$("#calendarWrap > table").append(str);
	
	$("#sYearMonth > p").text(year+"년"+" "+month+"월");
	$("#sYearMonth > input[name='selectDate']").val(year+"-"+(month>9?'':'0')+month);
	
	var nDate = new Date();
	var y = nDate.getFullYear();
	var m = nDate.getMonth()+1;
	m = (m>9?'':'0')+m;
	var d = nDate.getDate();
	d = (d>9?'':'0')+d;
	td = y+"-"+m+"-"+d;
	
	$(".c_"+td).css("background","orange");
	
	/*draw_memo(year+"-"+(month>9?'':'0')+month);*/
	draw_table_roomMonthSchedule(year+"-"+(month>9?'':'0')+month);
}