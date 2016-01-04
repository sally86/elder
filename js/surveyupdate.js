// JavaScript Document

function update_elder_info()
{
	var action = $("#hdnAction").val();
	
	$.ajax({
			url: baseURL+"Surveycont/"+action,
			type: "POST",
			data:  $("#elder_info_form").serialize(),
			error: function(xhr, status, error) {
				//var err = eval("(" + xhr.responseText + ")");
				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				if(returndb != 0)
				{
					//$("#hdnSurveyId").val(returndb['survey_id']);
					//$("#hdnFileId")  .val(returndb['file_id']);
					
					$("#hdnAction").val('updateelder');
				}
			}
		});//END $.ajax
}