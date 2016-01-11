// JavaScript Document

function getValue(optnum)
{
	var constantid = $("#drpConstant"+optnum).val()
	
	$.ajax({
			url: baseURL+"Sms/getvalue",
			type: "POST",
			data: {constantid: constantid} ,
			error: function(xhr, status, error) {
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				$('#drpSubconstant'+optnum).html(returndb);
				
			}
		});//END $.ajax
}