// JavaScript Document// JavaScript Document

function editeaidrecomend()
{
	var action = $("#hdnaidraction").val();
	alert(action);
	alert(action);
//	action ="addaidrecomend";
$.ajax({
			url: baseURL+"Surveycont/"+action,
			type: "POST",
			data:  $("#Aidrecomend_form").serialize(),
			error: function(xhr, status, error) {
  				//var err = eval("(" + xhr.responseText + ")");
				alert('error');
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				if(returndb == '')
				{
					$("#hdnaidraction").val("updateaidrecomend");
					var form = $('#Aidrecomend_form');
					$('.alert-success', form).show();
				}
			}
		});//END $.ajax	
	
}

function editemedicalaid()
{
	var action = $("#maidaction").val();
	alert(action);
	
	
	$.ajax({
			url: baseURL+"Surveycont/"+action,
			type: "POST",
			data: {hdnSurveyId: $("#hdnSurveyId").val(),
			drpMedicalaidtype: $("#drpMedicalaidtype").val()},
			error: function(xhr, status, error) {
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				$("#tbmedicalaid").html(returndb);
				
				$("#drpMedicalaidtype option:selected" ).attr("disabled","disabled");
				$("#drpMedicalaidtype").val('');
				if(returndb == '')
				{
					
					var form = $('#medicalaid_form');
					$('.alert-success', form).show();
				}
			}
		});//END $.ajax
}
function editehomeaid()
{
	var action = $("#haidaction").val();
	alert(action);
	
	
	$.ajax({
			url: baseURL+"Surveycont/"+action,
			type: "POST",
			data:   {hdnSurveyId: $("#hdnSurveyId").val(),
			drpImprovementtype: $("#drpImprovementtype").val()},
			error: function(xhr, status, error) {
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
			$("#tbhomeaid").html(returndb);
			
				$("#drpImprovementtype option:selected" ).attr("disabled","disabled");
				$("#drpImprovementtype").val('');
				if(returndb == '')
				{
					var form = $('#homeimprovement_form');
					$('.alert-success', form).show();
				}
			}
		});//END $.ajax
}


function deletemedicalaidbyId(medicalaidId,medicationtypeid)
{
	var action = $("#maidaction").val();
	alert(action);
	
		var r = confirm('هل انت متأكد من عملية الحذف');
	if (r == true) {
		x =1;
	} else {
		x = 0;
	}
	if(x==1)
	{
	
	$.ajax({
			url: baseURL+"Surveycont/deletemedicalaidbyId",
			type: "POST",
			data: {medicalaidId: medicalaidId,hdnSurveyId: $("#hdnSurveyId").val(),
			medicationtypeid:medicationtypeid},
			error: function(xhr, status, error) {
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				$("#tbmedicalaid").html(returndb);
				$("#drpMedicalaidtype option[value='"+medicationtypeid+"']").prop('disabled', false);
				$("#drpMedicalaidtype").val('');
				if(returndb == '')
				{
					
					var form = $('#medicalaid_form');
					$('.alert-success', form).show();
				}
			}
		});//END $.ajax
	}

}
function deletehomeaidbyId(homeaidId,hometypeid)
{
	//var action = $("#maidaction").val();
	//alert(action);
	
		var r = confirm('هل انت متأكد من عملية الحذف');
	if (r == true) {
		x =1;
	} else {
		x = 0;
	}
	if(x==1)
	{
	
	$.ajax({
			url: baseURL+"Surveycont/deletehomeaidbyId",
			type: "POST",
			data: {homeaidId: homeaidId,
			hdnSurveyId: $("#hdnSurveyId").val(),
			hometypeid:hometypeid},
			error: function(xhr, status, error) {
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				$("#tbhomeaid").html(returndb);
				$("#drpImprovementtype option[value='"+hometypeid+"']").prop('disabled', false);
				$("#drpImprovementtype").val('');
				if(returndb == '')
				{
					
					var form = $('#homeimprovement_form');
					$('.alert-success', form).show();
				}
			}
		});//END $.ajax
	}
}