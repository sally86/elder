// JavaScript Document

// Add Or Update follow up
function editefollowup()
{
	var action = $("#hdnAction").val();
	alert(action);
	alert( $("#hdnfollowupId").val());
	
	if ( !validateFollowup() )
		return;
		
	// Create a new FormData object.
	var formData = new FormData();
	
	// Add the follow up to the formdata.
	formData.append('txtElderId'		 , $("#txtElderId").val()		  );
	formData.append('dpVisitdate'	  	 ,  $("#dpVisitdate").val()	  	  );
	formData.append('txtVisittime' 		 ,  $("#txtVisittime").val()      );
	formData.append('txtVisitendtime'	 ,  $("#txtVisitendtime").val()	  );
	formData.append('drpResearcher'	     ,  $("#drpResearcher").val()	  );
	formData.append('txtVisitreason'	 ,  $("#txtVisitreason").val()	  );
	formData.append('txtnotes' 	 		 ,  $("#txtnotes").val()	      );
	formData.append('txtRecommendation'	 ,  $("#txtRecommendation").val() );
	formData.append('hdnfollowupId'	     ,  $("#hdnfollowupId").val()     );
	
	
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
			data:  {hdnfollowupId: followupid,
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
	document.getElementById('drpResearcher').value =$('#tbdFollowup #researcher_id_tb'+i).html();
	document.getElementById('txtVisittime').value =$('#tbdFollowup #visit_time_tb'+i).html();
	document.getElementById('txtVisitendtime').value =$('#tbdFollowup #visit_end_time_tb'+i).html();
	$('#dvdpVisitdate').datepicker({ dateFormat: 'yyyy-mm-dd' }); // format to show
	$('#dvdpVisitdate').datepicker('setDate',$('#tbdFollowup #visit_date_tb'+i).html());
	document.getElementById('txtVisitreason').value =$('#tbdFollowup #visit_reason_tb'+i).html();
	document.getElementById('txtnotes').value =$('#tbdFollowup #notes_tb'+i).html();
	document.getElementById('txtRecommendation').value =$('#tbdFollowup #recommendation_tb'+i).html();
	$("#hdnAction").val("updatefollowup");
	$("#hdnfollowupId").val($('#tbdFollowup #follow_up_id_tb'+i).html());
	//alert(document.getElementById('hdnFollowupId').value);
	
}


function clearFollowupFields()
{	  $("#hdnfollowupId").val('');
	  //$("#txtElderId").val('');
	  $("#dpVisitdate").val('');
	 // $('txtVisittime').val('1');
	 // $("#txtVisitendtime").val('');
	  $("#drpResearcher").val('');
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

function validateFollowup()
{
	var form = $('#followupform');
    var error = $('.alert-danger', form);
	
	var valid = true;
	
	if ( !$("#dpVisitdate").valid() )
		valid = false;
	//if ( !$("#txtVisittime").valid() )
		//valid = false;
	//if ( !$("#txtVisitendtime").valid() )
		//valid = false;
	if ( !$("#txtVisitreason").valid() )
		valid = false;
	if ( !$("#txtnotes").valid() )
		valid = false;
	if ( !$("#txtRecommendation").valid() )
		valid = false;
	if ( !$("#drpResearcher").valid() )
		valid = false;
	
	if(!valid)
	{
		
		error.show();
        Metronic.scrollTo(error, -200);
	}
	else
	{
		error.hide();
	}
		
	return valid;
}

//******************form validation ***************************//
var FollowupValidation = function () {
 var handleValidation = function() {
       
            var form = $('#followupform');
            var errormsg = $('.alert-danger', form);
            var successmsg = $('.alert-success', form);
			
            form.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "", // validate all fields including form hidden input
                rules: {
					drpResearcher: {
                        required: true
                    },
					dpVisitdate: {
                        required: true
                    }
					/*,
					txtVisittime: {
                        required: true
                    },
					txtVisitendtime: {
                        required: true
                    }
					*/,
					txtVisitreason: {
                        required: true
                    },
					txtnotes: {
						required: true
                    },
					txtRecommendation: {
						required: true
                    }
				},

               messages: { // custom messages for radio buttons and checkboxes
                    
					drpResearcher: {
                        required: "الرجاء إختيار قيمة"
                    },
					dpVisitdate: {
						required: "الرجاء إدخال تاريخ الزيارة"
                    }
					/*,
					txtVisittime: {
						required: "الرجاء إختيار الوقت"
                    },
					txtVisitendtime: {
						required: "الرجاء إختيار الوقت"
                    }
					*/,
					txtVisitreason: {
						required: "الرجاء إدخال قيمة"
                    },
					txtnotes: {
						required: "الرجاء إدخال قيمة"
                    },
					txtRecommendation: {
						required: "الرجاء إدخال قيمة"
                    }
					
                },

                errorPlacement: function (error, element) { // render error placement for each input type
                    if (element.attr("data-error-container")) { 
                        error.appendTo(element.attr("data-error-container"));
                    } else if (element.parent(".input-group").size() > 0) {
                        error.insertAfter(element.parent(".input-group"));
                    } else if (element.parents('.radio-list').size() > 0) { 
                        error.appendTo(element.parents('.radio-list').attr("data-error-container"));
                    } else if (element.parents('.radio-inline').size() > 0) { 
                        error.appendTo(element.parents('.radio-inline').attr("data-error-container"));
                    } else if (element.parents('.checkbox-list').size() > 0) {
                        error.appendTo(element.parents('.checkbox-list').attr("data-error-container"));
                    } else if (element.parents('.checkbox-inline').size() > 0) { 
                        error.appendTo(element.parents('.checkbox-inline').attr("data-error-container"));
                    } else {
                        error.insertAfter(element); // for other inputs, just perform default behavior
                    }
                },

                invalidHandler: function (event, validator) { //display error alert on form submit   
                    successmsg.hide();
                    errormsg.show();
                    Metronic.scrollTo(errormsg, -200);
                },

                highlight: function (element) { // hightlight error inputs
                   $(element)
                        .closest('.form-group').addClass('has-error'); // set error class to the control group
                },

                unhighlight: function (element) { // revert the change done by hightlight
                    $(element)
                        .closest('.form-group').removeClass('has-error'); // set error class to the control group
                },

                success: function (label) {
                    label
                        .closest('.form-group').removeClass('has-error'); // set success class to the control group
                },

                submitHandler: function (form) {
                    errormsg.hide();
					editefollowup();
                    //form[0].submit(); // submit the form
                }

            });
    }
return {
        //main function to initiate the module
        init: function () {
            handleValidation();

        }

    };
}();

//-------------End check ID
//----------------------------------------------------------
