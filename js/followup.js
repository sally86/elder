// JavaScript Document

// Add Or Update follow up
function editefollowup()
{
	var action = $("#hdnAction").val();
	alert(action);
	
	/*if ( !validateFollowup() )
		return;
		*/
	// Create a new FormData object.
	var formData = new FormData();
	
	// Add the follow up to the formdata.
	formData.append('txtElderId'		 , $("#txtElderId").val()		  );
	formData.append('dpVisitdate'	  	 ,  $("#dpVisitdate").val()	  	  );
	formData.append('txtVisittime' 		 ,  $("#txtVisittime").val()      );
	formData.append('txtVisitendtime'	 ,  $("#txtVisitendtime").val()	  );
	formData.append('txtresearcherId'	 ,  $("#txtresearcherId").val()	  );
	formData.append('txtVisitreason'	 ,  $("#txtVisitreason").val()	  );
	formData.append('txtnotes' 	 		 ,  $("#txtnotes").val()	      );
	formData.append('txtRecommendation'	 ,  $("#txtRecommendation").val() );
	
	$.ajax({
			url: baseURL+"Followupcont/"+action,
			type: "POST",
			data:  formData,
			processData: false,
    		contentType: false,
			error: function(xhr, status, error) {
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				
				
				$("#tbdFollowup").html(returndb);
				clearFollowupFields();
				/*if(returndb == '')
				{
					var form = $('#familyMemberTab');
					$('.alert-success', form).show();
					//$('#hdnAction').val('');
				}*/
			}
		});//END $.ajax
}
function deleteFollowupbyId(followupid)
{
	//	alert(booking_code);
	var r = confirm('هل انت متأكد من عملية الحذف');
	if (r == true) {
		x =1;
	} else {
		x = 0;
	}
	if(x==1)
	{
	$.ajax({
			url: baseURL+"Followupcont/deletefollowup",
			type: "POST",
			data:  {followupid: followupid,
					txtElderId: $("#txtElderId").val()},
			error: function(xhr, status, error) {
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				
			$("#tbdFollowup").html(returndb);
				clearFollowupFields();
			}
		});//END $.ajax
		
	}
}

function updateFollowup(i)
{
	document.getElementById('txtresearcherId').value =$('#tbdFollowup #researcher_id_tb'+i).html();
	document.getElementById('txtVisittime').value =$('#tbdFollowup #visit_time_tb'+i).html();
	document.getElementById('txtVisitendtime').value =$('#tbdFollowup #visit_end_time_tb'+i).html();
	$('#dvdpVisitdate').datepicker({ dateFormat: 'yyyy-mm-dd' }); // format to show
	$('#dvdpVisitdate').datepicker('setDate',$('#tbdFollowup #visit_date_tb'+i).html());
	document.getElementById('txtVisitreason').value =$('#tbdFollowup #visit_reason_tb'+i).html();
	document.getElementById('notes_tb').value =$('#tbdFollowup #txtnotes'+i).html();
	document.getElementById('txtRecommendation').value =$('#tbdFollowup #recommendation_tb'+i).html();
	$("#hdnAction").val("updatefollowup");
	$("#hdnFollowupId").val($('#tbdFollowup #follow_up_id_tb'+i).html());
	
}


function clearFollowupFields()
{	  $("#hdnFollowupId").val('');
	  $("#txtElderId").val('');
	  $("#dpVisitdate").val('');
	  $('txtVisittime').val('1');
	  $("#txtVisitendtime").val('');
	  $("#txtresearcherId").val('');
	  $("#txtVisitreason").val('');
	  $("#txtnotes").val('');
	  $("#txtRecommendation").val('');
	  $("#hdnAction").val("addfollowup");
}

//-------------check ID ----------------------//
function check_emp_id(){	

 	var national_id = document.getElementById('txtNationalId').value;
if (national_id !='')
{
		$.ajax({
			url: baseURL+"Employee/check_id",
			type: "POST",
			data: {national_id: national_id},
			error: function(xhr, status, error) {
  				//var err = eval("(" + xhr.responseText + ")");
  				alert(xhr.responseText);
	
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(result){
				
				if (result==1)
				{
					alert('رقم الهوية مستخدم مسبقاً, الرجاء التأكد من رقم الهوية المدخل');
					document.getElementById('txtNationalId').value='';
					document.getElementById('txtNationalId').focus();
					return;
				}
				
			}
		});//END $.ajax	
	
}
else
return;
}


//-------------End check ID
//----------------------------------------------------------
