
$(document).ready(function(){
	
	$.ajax({
		type : 'get',
		url : '${path}/admin/age-graph',
		dataType : 'json',
		success : function(data, xhr) {
			console.log(data);

			var labels = [];
			var myData = [];
			//맵안에서 list였으니 for문으로 돌린다.
			$.each(data.list, function(k, v) {
				labels.push(v.agerange);
				myData.push(v.count);
				
			});
			var newLabels = labels;
			var newMyData = myData;
			var ctx = $('#ageBox');

			drawUserChart(ctx, 'bar', newLabels, newMyData);

		},
		error : function(status, request, error) {

			alert("에러");
		}

	});
	});


	
	//--------------age-----------------------
 function drawUserChart(ctx,type,labels,data){
	 var dateChart = new Chart(ctx, {
		type: type,
		data: {
			labels: labels,
			datasets:[{
				label: '연령대별',
				data: data,
				borderColor:'white',
				borderWidth: 1,
				backgroundColor:['rgba(200,0,0,.5)','yellow','green','blue','pink'],
				hoverBackgroundColor:['gray','gray','gray','gray','gray']
				
			}],
		}
 	});
}

