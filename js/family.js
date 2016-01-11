// JavaScript Document// JavaScript Document

function editefamilymem()
{
	var action = $("#hdnActionFM").val();
	//alert(action);
	
		
	// Create a new FormData object.
	var formData = new FormData();
	
	// Add the file to the request.
	formData.append('hdnSurveyId'		 , $("#hdnSurveyId").val()		  );
	formData.append('txtElderId'		 , $("#txtElderId").val()		  );
	formData.append('txtMemberId'		 ,  $("#txtMemberId").val()		  );
	formData.append('txtMembername'	  	 ,  $("#txtMembername").val()	  );
	formData.append('rdMemSex'	  		 ,  $('input[name=rdMemSex]:checked').val()	);
	formData.append('drpMemRelationship' ,  $("#drpMemRelationship").val());
	formData.append('drpMemStatus'		 ,  $("#drpMemStatus").val()	  );
	formData.append('dpMemDob'			 ,  $("#dpMemDob").val()		  );
	formData.append('drpMemEdulevel' 	 ,  $("#drpMemEdulevel").val()	  );
	formData.append('drpMemHealth'		 ,  $("#drpMemHealth").val()	  );
	formData.append('txtMemincome'	  	 ,  $("#txtMemincome").val()      );
	formData.append('txtMemjob'			 ,  $("#txtMemjob").val()		  );
	
	$.ajax({
			url: baseURL+"Familycont/"+action,
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
				
				var countFM = parseInt($("#spnCountFamily").html());;
				countFM = countFM + 1;
				$("#spnCountFamily").html(countFM);
				
				$("#tbdFamilyMember").html(returndb);
				clearFamilymembFields();
				/*if(returndb == '')
				{
					var form = $('#familyMemberTab');
					$('.alert-success', form).show();
					//$('#hdnAction').val('');
				}*/
			}
		});//END $.ajax
}
function deleteFamilybyId(familymemberid)
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
			url: baseURL+"Familycont/deletefamilymember",
			type: "POST",
			data:  {familymemberid: familymemberid,
					txtElderId: $("#txtElderId").val()},
			error: function(xhr, status, error) {
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				
			$("#tbdFamilyMember").html(returndb);
				clearFamilymembFields();
			}
		});//END $.ajax
		
	}
}

function updateFamilymember(i)
{

	$("#txtMembername").val($('#tbdFamilyMember #member_name_td'+i).html());
	document.getElementById('txtMemberId').value =$('#tbdFamilyMember #member_id_td'+i).html();
	
	if($('#tbdFamilyMember #sex_td'+i).html() == '1')
	{
		$("#rdMemSexFemale").parent().removeClass("checked");
		$("#rdMemSexMale").parent().addClass("checked");
	}
	else if ($('#tbdFamilyMember #sex_td'+i).html() == '2')
	{
		$("#rdMemSexMale").parent().removeClass("checked");
		$("#rdMemSexFemale").parent().addClass("checked");
		
	}
		
	document.getElementById('drpMemRelationship').value =$('#tbdFamilyMember #relationship_td'+i).html();
	document.getElementById('drpMemStatus').value =$('#tbdFamilyMember #fmstatus_td'+i).html();
	$('#dvdpMemDob').datepicker({ dateFormat: 'yyyy-mm-dd' }); // format to show
	$('#dvdpMemDob').datepicker('setDate',$('#tbdFamilyMember #dob_td'+i).html());
	document.getElementById('drpMemEdulevel').value =$('#tbdFamilyMember #education_level_td'+i).html();
	document.getElementById('drpMemHealth').value =$('#tbdFamilyMember #health_status_td'+i).html();
	document.getElementById('txtMemjob').value =$('#tbdFamilyMember #job_td'+i).html();
	document.getElementById('txtMemincome').value =$('#tbdFamilyMember #income_shekel_td'+i).html();
	$("#hdnActionFM").val("updatefamilymember");
	$("#hdnSurveyId").val($('#tbdFamilyMember #surveyId_tb'+i).html());
	
}


function clearFamilymembFields()
{
	  $("#txtMemberId").val('');
	  $("#txtMembername").val('');
	  $("#drpMemRelationship").val('');
	  $("#drpMemStatus").val('');
	  $("#dpMemDob").val('');
	  $("#drpMemEdulevel").val('');
	  $("#drpMemHealth").val('');
	  $("#txtMemincome").val('');
	  $("#txtMemjob").val('');
	  $('#hdnActionFM').val('addfamilymember');
	  $("#rdMemSexFemale").parent().removeClass("checked");
	  $("#rdMemSexMale").parent().addClass("checked");
	  
	   var form = $('#familymemberform');
       var errormsg = $('.alert-danger', form);
	   errormsg.hide();
	   $('.help-block').text('');
	
}
//-------------ELDER check ID ----------------------//
function check_familyId(){	

 	var MemberId = document.getElementById('txtMemberId').value;
	if (MemberId !='')
	{
		$.ajax({
			url: baseURL+"Familycont/check_familymember_id",
			type: "POST",
			data: {member_id: MemberId},
			error: function(xhr, status, error) {
  				//var err = eval("(" + xhr.responseText + ")");
  				alert(xhr.responseText);
	
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
	
				if(returndb !=0)
				{
					// If member is from elder family -> Update
					if (returndb[0]['elder_id'] == $('#txtElderId').val())
						$('#hdnActionFM').val('updatefamilymember');
					
					$('#txtMembername')		.val(returndb[0]['member_name']);
					$('#rdMemSex')			.val(returndb[0]['member_sex_id']);
					$('#drpMemRelationship').val(returndb[0]['relationship_id']);
					$('#drpMemStatus')		.val(returndb[0]['status_id']);
					$('#dpMemDob')			.val(returndb[0]['dob']);
					$('#drpMemEdulevel')	.val(returndb[0]['education_level']);
					$('#drpMemHealth')		.val(returndb[0]['health_status_id']);
					$('#txtMemincome')		.val(returndb[0]['income_shekel']);
					$('#txtMemjob')			.val(returndb[0]['job']);
			
				}
			}
		});//END $.ajax	
	
}
else

return;
}

//******************form validation ***************************//
var FamilyMemberValidation = function () {
 var handleValidation = function() {
       
            var form = $('#familymemberform');
            var errormsg = $('.alert-danger', form);
            var successmsg = $('.alert-success', form);
			
            form.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "", // validate all fields including form hidden input
                rules: {
					txtMemberId: {
                        required: true,
						digits: true
                    },
					txtMembername: {
                        required: true
                    },
					dpMemDob: {
                        required: true
                    },
					drpMemRelationship: {
                        required: true
                    },
					drpMemStatus: {
                        required: true
                    },
					drpMemEdulevel: {
                        required: true
                    },
					drpMemHealth: {
						required: true
                    },
					txtMemincome: {
						digits: true
                    }
				},

               messages: { // custom messages for radio buttons and checkboxes
                    txtMemberId: {
						required: "الرجاء إدخال رقم الهوية",
						digits: "الرجـاء ادخـال ارقـام فقط"
                    },
					txtMembername: {
                        required: "الرجاء ادخل الاسم"
                    },
					dpMemDob: {
						required: "الرجاء إدخال تاريخ الميلاد"
                    },
					drpMemRelationship: {
						required: "الرجاء إختيار قيمة"
                    },
					drpMemStatus: {
						required: "الرجاء إختيار قيمة"
                    },
					drpMemEdulevel: {
						required: "الرجاء إختيار قيمة"
                    },
					drpMemHealth: {
						required: "الرجاء إختيار قيمة"
                    },
					txtMemincome: {
						digits: "الرجـاء ادخـال ارقـام فقط",
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
					error.addClass('font-red');
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
					editefamilymem();
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
//**************** end family member function******************//

