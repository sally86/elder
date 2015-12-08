// JavaScript Document

//-------------------- Elder Tab --------------------//

//	ELDER check ID 
function check_elder_id(){	

 	var ElderId = document.getElementById('txtElderId').value;
	if (ElderId !='')
	{
		$.ajax({
			url: baseURL+"Surveycont/check_elder_id",
			type: "POST",
			data: {elder_id: ElderId},
			error: function(xhr, status, error) {
  				//var err = eval("(" + xhr.responseText + ")");
  				alert(xhr.responseText);
	
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
	//			alert(returndb);
//				alert(returndb[0]['txtFname']);
				if(returndb !=0){					
				  $('#hdnAction').val('updateelder');
				  $('#hdnFileId').val(returndb[0]['hdnFileId']);
				  $('#drpEldercategory').val(returndb[0]['drpEldercategory']);
				  $('#txtFname').val(returndb[0]['txtFname']);
				  $('#txtMname').val(returndb[0]['txtMname']);
				  $('#txtThname').val(returndb[0]['txtThname']);
				  $('#txtLname').val(returndb[0]['txtLname']);
				 
				  //------------------------------------------------
				  // Set Select Date to date picker
				  var queryDate = returndb[0]['dpDob'],
					  dateParts = queryDate.match(/(\d+)/g);
					  realDate = new Date(dateParts[0], dateParts[1] - 1, dateParts[2]);  
													  // months are 0-based!
				  
				  $('#dvDob').datepicker({ dateFormat: 'yy-mm-dd' }); // format to show
				  $('#dvDob').datepicker('setDate', realDate);
				  //------------------------------------------------
				  
				  $('#rdSex').val(returndb[0]['rdSex']);
				  $('#drpElderstatus').val(returndb[0]['drpElderstatus']);
				  $('#drpGovernorate').val(returndb[0]['drpGovernorate']);
				  $('#txtRegion').val(returndb[0]['txtRegion']);
				  $('#txtFulladdress').val(returndb[0]['txtFulladdress']);
				  $('#txtPhone').val(returndb[0]['txtPhone']);
				  $('#txtMobile1').val(returndb[0]['txtMobile1']);
				  $('#txtMobile2').val(returndb[0]['txtMobile2']);
				  $('#drpEducationlevel').val(returndb[0]['drpEducationlevel']);
				  $('#drpSpecialization').val(returndb[0]['drpSpecialization']);
				  $('#drpCurrentjob').val(returndb[0]['drpCurrentjob']);
				  $('#drpPreviousjob').val(returndb[0]['drpPreviousjob']);
				  $('#drpInsurence').val(returndb[0]['drpInsurence']);
				  $('#hdnelder_id').val(ElderId);
				} else {
					$('#hdnAction').val('addelder');
					$('#hdnFileId').val('');
					$('#txtFname').val('');
					$('#txtMname').val('');
					$('#txtThname').val('');
					$('#txtLname').val('');
					$('#dpDob').val('');
					$('#rdSex').val(1);
					$('#drpElderstatus').val('');
					$('#drpGovernorate').val('');
					$('#txtRegion').val('');
					$('#txtFulladdress').val('');
					$('#txtPhone').val('');
					$('#txtMobile1').val('');
					$('#txtMobile2').val('');
					$('#drpEducationlevel').val('');
					$('#drpSpecialization').val('');
					$('#drpCurrentjob').val('');
					$('#drpPreviousjob').val('');
					$('#drpInsurence').val('');
					$('#hdnelder_id').val('');
				}
			}
		});//END $.ajax	
	
	}else
		return;
}
// END check ID

// Calculate Age 
function claculateAge()
{
	if($('#dpDob').val() == '')
	{
		$('#lblAge').html('');
		$('#lblAge').removeClass('font-red');
		$('#lblAge').removeClass('font-green');
		return;
	}
	
		var dateStr = $('#dpDob').val();
		var dateParts = dateStr.split("-");
		var dateOfBirth = new Date(dateParts[0], (dateParts[1] - 1), dateParts[2]);
		
		var dateToCalculate = new Date();
		var calculateYear = dateToCalculate.getFullYear();
    	var calculateMonth = dateToCalculate.getMonth();
    	var calculateDay = dateToCalculate.getDate();
		
		var birthYear = dateOfBirth.getFullYear();
    	var birthMonth = dateOfBirth.getMonth();
    	var birthDay = dateOfBirth.getDate();
		
		var age = calculateYear - birthYear;
    	var ageMonth = calculateMonth - birthMonth;
    	var ageDay = calculateDay - birthDay;
		
		if (ageMonth < 0 || (ageMonth == 0 && ageDay < 0)) {
        	age = parseInt(age) - 1;
    	}
		
		$('#lblAge').html('<b> عمر العضو : <span id="spnAge">'+age+'</span></b>');
		if (age >= 60)
		{
			$('#lblAge').removeClass('font-red').addClass('font-green');
		}
		else
		{
			$('#lblAge').removeClass('font-green').addClass('font-red');
		}
}


//---------------------------------
//--------------------------------------
var ElderTabValidation = function () {
 var handleValidation = function() {
        
            var form = $('#ElderTab');
            var errormsg = $('.alert-danger', form);
            var successmsg = $('.alert-success', form);

            form.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "", // validate all fields including form hidden input
                rules: {
					txtElderId: {
                        required: true,
						digits: true
                    },
					txtFname: {
                        required: true
                    },
	                txtMname: {
                        required: true
                    },
					txtThname: {
                        required: true
                    },
	                txtLname: {
                        required: true
                    },
					dpDob: {
                        required: true
                    },
					drpElderstatus: {
                        required: true
                    },
					drpGovernorate: {
                        required: true
                    },
					txtRegion: {
                        required: true
                    },
					txtFulladdress: {
                        required: true
					},
					txtPhone: {
                       digits: true,
						minlength: 7
					},
					txtMobile1: {
						digits: true,
						minlength: 10,
						required: true
                    },
					txtMobile1: {
						digits: true,
						minlength: 10,
						required: true
                    },
					drpEducationlevel: {
						required: true
                    },
					drpSpecialization: {
						required: true
                    },
					drpCurrentjob: {
						required: true
                    },
					drpPreviousjob: {
						required: true
                    },
					drpInsurence: {
						required: true
                    }
                },

               messages: { // custom messages for radio buttons and checkboxes
                    txtElderId: {
						required: "الرجاء إدخال رقم الهوية",
						digits: "الرجـاء ادخـال ارقـام فقط"
                    },
					txtFname: {
                        required: "الرجاء ادخل الاسم"
                    },
                    txtMname: {
                        required: "الرجاء ادخل الاسم"
                    }
					,
                    txtThname: {
                        required: "الرجاء ادخل الاسم"
                    }
					,
                    txtLname: {
                        required: "الرجاء ادخل الاسم"
                    },
					dpDob: {
						required: "الرجاء إدخال تاريخ الميلاد"
                    },
					drpElderstatus: {
						required: "الرجاء إختيار قيمة"
                    },
					drpGovernorate: {
						required: "الرجاء إختيار قيمة"
                    },
					txtRegion: {
						required: "الرجاء إدخال قيمة"
                    },
					txtFulladdress: {
						required: "الرجاء إدخال قيمة"
                    },
					txtPhone: {
						minlength: "رقم الهاتف يجب ان يكون 7 ارقام",
						digits: "الرجـاء ادخـال ارقـام فقط"
                    },
					txtMobile1: {
						minlength: "رقم الجوال يجب ان يكون 10 ارقام مبدوء ب 059",
						digits: "الرجـاء ادخـال ارقـام فقط",
						required: "الرجـاء ادخـال رقـم الجـوال"
                    },
					txtMobile2: {
						minlength: "رقم الجوال يجب ان يكون 10 ارقام مبدوء ب 059",
						digits: "الرجـاء ادخـال ارقـام فقط",
						required: "الرجـاء ادخـال رقـم الجـوال"
                    },
					drpEducationlevel: {
						required: "الرجاء إختيار قيمة"
                    },
					drpSpecialization: {
						required: "الرجاء إختيار قيمة"
                    },
					drpCurrentjob: {
						required: "الرجاء إختيار قيمة"
                    },
					drpPreviousjob: {
						required: "الرجاء إختيار قيمة"
                    },
					drpInsurence: {
						required: "الرجاء إختيار قيمة"
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
					editeelder();
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
//-------------------- END Elder Tab --------------------//

//-------------------- Visit Tab -----------------------//
$(document).ready(function(){
	
	/********** Researcher **********/
	$('#drpResearcher').change(function(event) {							
		event.preventDefault();
		
		// Reset Disable Options
		$("#drpResearcherass1 > option").prop('disabled', false);
		$("#drpResearcherass2 > option").prop('disabled', false);
		
		// Disable the new Selected Option
		if ($('#drpResearcher').val() != "")
		{
			var name = $( "#drpResearcher option:selected" ).text();
			$("#drpResearcherass1 > option:contains('"+name+"')").attr("disabled","disabled");
			$("#drpResearcherass2 > option:contains('"+name+"')").attr("disabled","disabled");
		}
		
		// Disable Other Selected Options
		if ($('#drpResearcherass1').val() != "")
		{
			var name = $( "#drpResearcherass1 option:selected" ).text();
			$("#drpResearcherass2 > option:contains('"+name+"')").attr("disabled","disabled");
		}
		if ($('#drpResearcherass2').val() != "")
		{
			var name = $( "#drpResearcherass2 option:selected" ).text();
			$("#drpResearcherass1 > option:contains('"+name+"')").attr("disabled","disabled");
		}
		
		
	}); // END CHANGE
	
	/********** Researcher Assistant 1**********/
	$('#drpResearcherass1').change(function(event) {							
		event.preventDefault();
		
		// Reset Disable Options
		$("#drpResearcher > option").prop('disabled', false);
		$("#drpResearcherass2 > option").prop('disabled', false);
		
		// Disable the new Selected Option
		if ($('#drpResearcherass1').val() != "")
		{
			var name = $( "#drpResearcherass1 option:selected" ).text();
			$("#drpResearcher > option:contains('"+name+"')").attr("disabled","disabled");
			$("#drpResearcherass2 > option:contains('"+name+"')").attr("disabled","disabled");
		}
		
		// Disable Other Selected Options
		if ($('#drpResearcher').val() != "")
		{
			var name = $( "#drpResearcher option:selected" ).text();
			$("#drpResearcherass2 > option:contains('"+name+"')").attr("disabled","disabled");
		}
		if ($('#drpResearcherass2').val() != "")
		{
			var name = $( "#drpResearcherass2 option:selected" ).text();
			$("#drpResearcher > option:contains('"+name+"')").attr("disabled","disabled");
		}
		
	}); // END CHANGE
	/********** Researcher Assistant 2**********/
	$('#drpResearcherass2').change(function(event) {							
		event.preventDefault();
		
		// Reset Disable Options
		$("#drpResearcher > option").prop('disabled', false);
		$("#drpResearcherass1 > option").prop('disabled', false);
		
		// Disable the new Selected Option
		if ($('#drpResearcherass2').val() != "")
		{
			var name = $( "#drpResearcherass2 option:selected" ).text();
			$("#drpResearcher > option:contains('"+name+"')").attr("disabled","disabled");
			$("#drpResearcherass1 > option:contains('"+name+"')").attr("disabled","disabled");
		}
		
		// Disable Other Selected Options
		if ($('#drpResearcher').val() != "")
		{
			var name = $( "#drpResearcher option:selected" ).text();
			$("#drpResearcherass1 > option:contains('"+name+"')").attr("disabled","disabled");
		}
		if ($('#drpResearcherass1').val() != "")
		{
			var name = $( "#drpResearcherass1 option:selected" ).text();
			$("#drpResearcher > option:contains('"+name+"')").attr("disabled","disabled");
		}
		
	}); // END CHANGE
	
}); // END READY
	
//-------------------- END Visit Tab -----------------------//
//------------------- Family Member Tab --------------------//
function editefamilymember()
{
	var action = $("#hdnActionFM").val();
	//alert(action);
	
	if ( !validateFamilymember() )
		return;
		
	// Create a new FormData object.
	var formData = new FormData();
	
	// Add the data to the request.
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
			url: baseURL+"Surveycont/"+action,
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
				clearFamilymemberFields();
				/*if(returndb == '')
				{
					var form = $('#familyMemberTab');
					$('.alert-success', form).show();
					//$('#hdnAction').val('');
				}*/
			}
		});//END $.ajax
}
function deleteFamilymember(familymemberid)
{
	
	$.ajax({
			url: baseURL+"Surveycont/deletefamilymember",
			type: "POST",
			data:  {familymemberid: familymemberid,
					hdnSurveyId: $("#hdnSurveyId").val()},
			error: function(xhr, status, error) {
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				
				var countFM = parseInt($("#spnCountFamily").html());
				countFM = countFM - 1;
				$("#spnCountFamily").html(countFM);
				
				$("#tbdFamilyMember").html(returndb);

			}
		});//END $.ajax
}
function clearFamilymemberFields()
{
	  $("#txtMemberId").val('');
	  $("#txtMembername").val('');
	  $('input[name=rdMemSex]:checked').val('1');
	  $("#drpMemRelationship").val('');
	  $("#drpMemStatus").val('');
	  $("#dpMemDob").val('');
	  $("#drpMemEdulevel").val('');
	  $("#drpMemHealth").val('');
	  $("#txtMemincome").val('');
	  $("#txtMemjob").val('');
	
}
function validateFamilymember()
{
	var form = $('#submit_form');
    var error = $('.alert-danger', form);
	
	var valid = true;
	
	if ( !$("#txtMemberId").valid() )
		valid = false;
	if ( !$("#txtMembername").valid() )
		valid = false;
	if ( !$("#drpMemRelationship").valid() )
		valid = false;
	if ( !$("#drpMemStatus").valid() )
		valid = false;
	if ( !$("#dpMemDob").valid() )
		valid = false;
	if ( !$("#drpMemEdulevel").valid() )
		valid = false;
	if ( !$("#drpMemHealth").valid() )
		valid = false;
	if ( !$("#txtMemincome").valid() )
		valid = false;
	if ( !$("#txtMemjob").valid() )
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
//-------------ELDER check ID ----------------------//
function check_familymember_id(){	

 	var MemberId = document.getElementById('txtMemberId').value;
if (MemberId !='')
{
		$.ajax({
			url: baseURL+"Surveycont/check_familymember_id",
			type: "POST",
			data: {member_id: MemberId},
			error: function(xhr, status, error) {
  				//var err = eval("(" + xhr.responseText + ")");
  				alert(xhr.responseText);
	
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
	//			alert(returndb);
//				alert(returndb[0]['txtFname']);
				if(returndb !=null)
			
				{
					
	
					
				$('#fmhdnAction').val('updatefamilymember');
				$('#txtMembername').val(returndb[0]['member_name']);
				$('#rdMemSex').val(returndb[0]['member_sex_id']);
				$('#drpMemRelationship').val(returndb[0]['relationship_id']);
				$('#drpMemStatus').val(returndb[0]['status_id']);
				$('#dpMemDob').val(returndb[0]['dob']);
				$('#drpMemEdulevel').val(returndb[0]['education_level']);
				$('#drpMemHealth').val(returndb[0]['health_status_id']);
				$('#txtMemincome').val(returndb[0]['income_shekel']);
				$('#txtMemjob').val(returndb[0]['job']);
				
			
				}
			}
		});//END $.ajax	
	
}
else

return;
}
//------------------ END Family Member Tab ------------------//
//------------------- Health Status Tab --------------------//
function add_elder_disease()
{
	
	if(!$("#drpDisease").valid())
		return false;
	
	$.ajax({
			url: baseURL+"Surveycont/adddisease",
			type: "POST",
			data: { hdnSurveyId : $("#hdnSurveyId").val(),
				    hdnElderDiseaseId : $("#hdnElderDiseaseId").val(),
					diseaseid : $("#drpDisease").val()	
				  },
			
			error: function(xhr, status, error) {
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				
				$("#hdnElderDiseaseId").val(returndb.substr(0, returndb.indexOf('|') ) );
				$("#tbdElderDisease").html(returndb.substr(returndb.indexOf('|')+1 ) );
				
				$("#drpDisease option:selected" ).attr("disabled","disabled");
				$("#drpDisease").val('');
				/*if(returndb == '')
				{
					var form = $('#familyMemberTab');
					$('.alert-success', form).show();
					//$('#hdnAction').val('');
				}*/
			}
		});//END $.ajax
}
function delete_elder_disease(elderdiseaseid, diseaseid)
{
	$.ajax({
			url: baseURL+"Surveycont/deletedisease",
			type: "POST",
			data: { hdnSurveyId : $("#hdnSurveyId").val(),
				    elderdiseaseid : elderdiseaseid,
					diseaseid : diseaseid	
				  },
			
			error: function(xhr, status, error) {
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				
				$("#drpDisease option[value='"+diseaseid+"']").prop('disabled', false);
				$("#drpDisease").val('');
				$("#tbdElderDisease").html(returndb);
				/*if(returndb == '')
				{
					var form = $('#familyMemberTab');
					$('.alert-success', form).show();
					//$('#hdnAction').val('');
				}*/
			}
		});//END $.ajax
}
function add_disease_details()
{
	if(!$("#txtarDiseaasedet").valid())
		return false;
	
	$.ajax({
			url: baseURL+"Surveycont/adddiseasedet",
			type: "POST",
			data: { hdnSurveyId : $("#hdnSurveyId").val(),
				    hdnElderDiseaseId : $("#hdnElderDiseaseId").val(),
					elderdiseasedet : $("#txtarDiseaasedet").val()	
				  },
			
			error: function(xhr, status, error) {
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				$("#hdnElderDiseaseId").val(returndb);
				/*if(returndb == '')
				{
					var form = $('#familyMemberTab');
					$('.alert-success', form).show();
					//$('#hdnAction').val('');
				}*/
			}
		});//END $.ajax
}
//---------------- END Health Status Tab --------------------//
//******************form validation ***************************//
var FamilyMemberTabValidation = function () {
 var handleValidation = function() {
       
            var form = $('#familyMemberTab');
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
						required: true,
						digits: true
                    },
					txtMemjob: {
						required: true
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
						required: "الرجاء إدخال قيمة",
						digits: "الرجـاء ادخـال ارقـام فقط",
                    },
					txtMemjob: {
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
					editefamilymember();
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

//***************** survey *************//
//-------------get servey data ----------------------//
// غير لازمه
function check_file_id(){	

 	var Fileid = document.getElementById('txtFileid').value;
if (Fileid !='')
{
		$.ajax({
			url: baseURL+"Surveycont/get_survey_data",
			type: "POST",
			data: {file_id: Fileid},
			error: function(xhr, status, error) {
  				//var err = eval("(" + xhr.responseText + ")");
  				alert(xhr.responseText);
	
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
	//			alert(returndb);
//				alert(returndb[0]['txtFname']);
				if(returndb !=null)
			
				{
					
//********************get survey tab data****************//	
				$('#SurveyId').val(returndb[0]['SurveyId']);			

				$('#surveyhdnAction').val('updatesurvey');
				$('#dpVisitdate').val(returndb[0]['dpVisitdate']);
				$('#txtVisittime').val(returndb[0]['txtVisittime']);
				$('#txtVisitendtime').val(returndb[0]['txtVisitendtime']);
				$('#drpResearcher').val(returndb[0]['drpResearcher']);
				$('#drpResearcherass1').val(returndb[0]['drpResearcherass1']);
				$('#drpResearcherass2').val(returndb[0]['drpResearcherass2']);
//********************get home status tab data****************//
				//$('#homeStatushdnAction').val('updatehomeStatus');									
				//$('#drpHomeStatus').val(returndb[0]['drpHomeStatus']);
				//$('#drpHomeType').val(returndb[0]['drpHomeType']);
				//$('#drpCeilingType').val(returndb[0]['drpCeilingType']);
				//$('#drpFurnitureLevel').val(returndb[0]['drpFurnitureLevel']);
//**************************************
				}
			}
		});//END $.ajax	
	
}
else

return;
}


//*********** Survey tab validation 
var SurveyTabValidation = function () {
 var handleValidation = function() {
        
            var form = $('#SurveyTab');
            var errormsg = $('.alert-danger', form);
            var successmsg = $('.alert-success', form);

            form.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "", // validate all fields including form hidden input
                rules: {
					txtFileid: {
                        required: true,
						digits: true
                    },
					dpVisitdate: {
                        required: true
                    }
					,
					txtVisittime: {
                        required: true
                    },
					txtVisitendtime: {
                        required: true
                    },
					drpResearcher: {
                        required: true
                    },
					drpResearcherass1: {
                        required: true
                    },
					drpResearcherass2: {
						required: true
                    }
				},

               messages: { // custom messages for radio buttons and checkboxes
                    txtFileid: {
						required: "الرجاء إدخال رقم الهوية",
						digits: "الرجـاء ادخـال ارقـام فقط"
                    },
					dpVisitdate: {
						required: "الرجاء إدخال تاريخ الميلاد"
                    },
					txtVisittime: {
						required: "الرجاء إدخال الوقت"
                    },
					txtVisitendtime: {
						required: "الرجاء إدخال الوقت"
                    },
					drpResearcher: {
						required: "الرجاء إختيار قيمة"
                    },
					drpResearcherass1: {
						required: "الرجاء إختيار قيمة"
                    },
					drpResearcherass2: {
						required: "الرجاء إختيار قيمة"
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
					editesurvey();
                    //form[0].submit(); // submit the form
                }

            });
    }
return {
        //main function to initiate the module
        init: function () {
            handleValidation();

        }

    };}();
	
//**************** end survey function******************

//***************** home status function *************//
function editehomeStatus()
{
	var action = $("#homeStatushdnAction").val();
	var SurveyId = $('#SurveyId').val();
	alert(action);
	alert(SurveyId);
	
	
	$.ajax({
			url: baseURL+"Surveycont/"+action,
			type: "POST",
			data:$('#HomeStatusTab').serialize() + '&SurveyId=' + $('#SurveyId').val(),
			error: function(xhr, status, error) {
  				//var err = eval("(" + xhr.responseText + ")");
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				if (returndb=='')
				{
					var form = $('#HomeStatusTab');
					$('.alert-success', form).show();
					$('#homeStatushdnAction').val('updatehomeStatus');										
				}
			}
		});//END $.ajax
}
//********** home status valisation**
var HomeStatusTabValidation = function () {
 var handleValidation = function() {
        
            var form = $('#HomeStatusTab');
            var errormsg = $('.alert-danger', form);
            var successmsg = $('.alert-success', form);

            form.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "", // validate all fields including form hidden input
                rules: {
					drpHomeStatus: {
                        required: true
					},
					drpHomeType: {
                        required: true
                    },
					drpCeilingType: {
                        required: true
                    },
					drpFurnitureLevel: {
                        required: true
                    }
				},

               messages: { // custom messages for radio buttons and checkboxes
                    drpHomeStatus: {
						required: "الرجاء إختيار قيمة"
                    },
					drpHomeType: {
						required: "الرجاء إختيار قيمة"
                    },
					drpCeilingType: {
						required: "الرجاء إختيار قيمة"
                    },
					drpFurnitureLevel: {
						required: "الرجاء إختيار قيمة"
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
					editehomeStatus();
                    //form[0].submit(); // submit the form
                }

            });
    }
return {
        //main function to initiate the module
        init: function () {
            handleValidation();

        }

    };}();
//*************** end home function************************//

//**************elder room fucntion******************//

function editeElderRoom()
{
	var action = $("#elderRoomhdnAction").val();
	var SurveyId = $('#SurveyId').val();
	alert(action);
	alert(SurveyId);
	
	
	$.ajax({
			url: baseURL+"Surveycont/"+action,
			type: "POST",
			data:$('#ElderRoomTab').serialize() + '&SurveyId=' + $('#SurveyId').val(),
			error: function(xhr, status, error) {
  				//var err = eval("(" + xhr.responseText + ")");
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				if (returndb=='')
				{
					var form = $('#ElderRoomTab');
					$('.alert-success', form).show();
					$('#elderRoomhdnAction').val('updateelderRoom');										
				}
			}
		});//END $.ajax
}
//********** home status valisation**
var ElderRoomTabValidation = function () {
 var handleValidation = function() {
        
            var form = $('#ElderRoomTab');
            var errormsg = $('.alert-danger', form);
            var successmsg = $('.alert-success', form);

            form.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "", // validate all fields including form hidden input
                rules: {
					drpRoomtype: {
                        required: true
					},
					drpClothes: {
                        required: true
                    },
					drpVentilation: {
                        required: true
                    },
					drpLighting: {
                        required: true
                    },
					drpCloset: {
                        required: true
					},
					drpCupboard: {
                        required: true
                    },
					drpMaintenance: {
                        required: true
                    },
					drpRestoration: {
                        required: true
                    },
					drpBathroom: {
                        required: true
                    },
					drpHigiene: {
                        required: true
                    }
				},

               messages: { // custom messages for radio buttons and checkboxes
                    
					drpRoomtype: {
                        required: "الرجاء إختيار قيمة"
					},
					drpClothes: {
                        required: "الرجاء إختيار قيمة"
                    },
					drpVentilation: {
                        required: "الرجاء إختيار قيمة"
                    },
					drpLighting: {
                        required: "الرجاء إختيار قيمة"
                    },
					drpCloset: {
                        required: "الرجاء إختيار قيمة"
					},
					drpCupboard: {
                        required: "الرجاء إختيار قيمة"
                    },
					drpMaintenance: {
                        required: "الرجاء إختيار قيمة"
                    },
					drpRestoration: {
                        required: "الرجاء إختيار قيمة"
                    },
					drpBathroom: {
                        required:"الرجاء إختيار قيمة"
                    },
					drpHigiene: {
                    required: "الرجاء إختيار قيمة"
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
					editeElderRoom();
                    //form[0].submit(); // submit the form
                }

            });
    }
return {
        //main function to initiate the module
        init: function () {
            handleValidation();

        }

    };}();
//*************** elder room function************************//

//**************elder family relation fucntion******************//

function editeElderFamRel()
{
	var action = $("#elderFamRelAction").val();
	var SurveyId = $('#SurveyId').val();
	alert(action);
	alert(SurveyId);
	
	
	$.ajax({
			url: baseURL+"Surveycont/"+action,
			type: "POST",
			data:$('#ElderFamRelTab').serialize() + '&SurveyId=' + $('#SurveyId').val(),
			error: function(xhr, status, error) {
  				//var err = eval("(" + xhr.responseText + ")");
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				if (returndb=='')
				{
					var form = $('#ElderFamRelTab');
					$('.alert-success', form).show();
					$('#elderFamRelAction').val('updateelderFamRel');										
				}
			}
		});//END $.ajax
}
//********** home status valisation**
var ElderFamRelTabValidation = function () {
 var handleValidation = function() {
        
            var form = $('#ElderFamRelTab');
            var errormsg = $('.alert-danger', form);
            var successmsg = $('.alert-success', form);

            form.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "", // validate all fields including form hidden input
                rules: {
					drpRespect: {
                        required: true
					},
					drpPariah: {
                        required: true
                    },
					drpCare: {
                        required: true
                    },
					drpNeeds: {
                        required: true
                    },
					drpPsycosupport: {
                        required: true
					}
					
				},

               messages: { // custom messages for radio buttons and checkboxes
                    
					drpRespect: {
                        required: "الرجاء إختيار قيمة"
					},
					drpPariah: {
                        required: "الرجاء إختيار قيمة"
                    },
					drpCare: {
                        required: "الرجاء إختيار قيمة"
                    },
					drpNeeds: {
                        required: "الرجاء إختيار قيمة"
                    },
					drpPsycosupport: {
                        required: "الرجاء إختيار قيمة"
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
					editeElderFamRel();
                    //form[0].submit(); // submit the form
                }

            });
    }
return {
        //main function to initiate the module
        init: function () {
            handleValidation();

        }

    };}();
//*************** end elder family relation function************************//

//**************Life Improvemnt fucntion******************//

function editeLifeImprov()
{
	var action = $("#lifeImprovhdnaction").val();
	var SurveyId = $('#SurveyId').val();
	alert(action);
	alert(SurveyId);
	
	
	$.ajax({
			url: baseURL+"Surveycont/"+action,
			type: "POST",
			data:$('#LifeImprovementTab').serialize() + '&SurveyId=' + $('#SurveyId').val(),
			error: function(xhr, status, error) {
  				//var err = eval("(" + xhr.responseText + ")");
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				if (returndb=='')
				{
					var form = $('#LifeImprovementTab');
					$('.alert-success', form).show();
					$('#lifeImprovhdnaction').val('updatelifeImprov');										
				}
			}
		});//END $.ajax
}
//********** home status valisation**
var LifeImprovTabValidation = function () {
 var handleValidation = function() {
        
            var form = $('#LifeImprovementTab');
            var errormsg = $('.alert-danger', form);
            var successmsg = $('.alert-success', form);

            form.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "", // validate all fields including form hidden input
                rules: {
					drpElderWorkAbility: {
                        required: true
					},
					txtelderworktype: {
                        required: true
                    },
					drpFamilyMember: {
                        required: true
                    },
					drpNeedtraining: {
                        required: true
                    },
					txtTrainigType: {
                        required: true
					},
					drpStartproject: {
                        required: true
                    },
					txtProjectType: {
                        required: true
                    },
					txtProjectBudget: {
                        required: true
					}
					
				},

               messages: { // custom messages for radio buttons and checkboxes
                    
					drpElderWorkAbility: {
                        required: "الرجاء إختيار قيمة"
					},
					txtelderworktype: {
                        required: "الرجاء إدخال قيمة"
                    },
					drpFamilyMember: {
                        required: "الرجاء إختيار قيمة"
                    },
					drpNeedtraining: {
                        required: "الرجاء إختيار قيمة"
                    },
					txtTrainigType: {
                        required: "الرجاء إدخال قيمة"
					},
					drpStartproject: {
                        required: "الرجاء إختيار قيمة"
                    },
					txtProjectType: {
                        required: "الرجاء إدخال قيمة"
                    },
					txtProjectBudget: {
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
					editeLifeImprov();
                    //form[0].submit(); // submit the form
                }

            });
    }
return {
        //main function to initiate the module
        init: function () {
            handleValidation();

        }

    };}();
//*********************end life improvemnt function************//
var FormWizard = function () {


    return {
        //main function to initiate the module
        init: function () {
            if (!jQuery().bootstrapWizard) {
                return;
            }

            function format(state) {
                if (!state.id) return state.text; // optgroup
                return "<img class='flag' src='../../assets/global/img/flags/" + state.id.toLowerCase() + ".png'/>&nbsp;&nbsp;" + state.text;
            }

            $("#country_list").select2({
                placeholder: "Select",
                allowClear: true,
                formatResult: format,
                formatSelection: format,
                escapeMarkup: function (m) {
                    return m;
                }
            });

            var form = $('#submit_form');
            var error = $('.alert-danger', form);
            var success = $('.alert-success', form);
			
			jQuery.validator.addMethod("greaterThanSixty", function(value, element) {
    			return parseInt($("#spnAge").html()) > 60;
			}, "* Amount must be greater than Sixty");
			
            form.validate({
                doNotHideMessage: true, //this option enables to show the error/success messages on tab switch.
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                rules: {
					// Elder Info
					txtElderId: {
                        required: true,
						digits: true
                    },
					drpEldercategory: {
						required: true
                    },
					txtFname: {
                        required: true
                    },
	                txtMname: {
                        required: true
                    },
					txtThname: {
                        required: true
                    },
	                txtLname: {
                        required: true
                    },
					dpDob: {
                        required: true,
						greaterThanSixty : true
                    },
					drpElderstatus: {
                        required: true
                    },
					drpGovernorate: {
                        required: true
                    },
					txtRegion: {
                        required: true
                    },
					txtFulladdress: {
                        required: true
					},
					txtPhone: {
                       digits: true,
						minlength: 7
					},
					txtMobile1: {
						digits: true,
						minlength: 10
                    },
					txtMobile2: {
						digits: true,
						minlength: 10
                    },
					drpEducationlevel: {
						required: true
                    },
					drpSpecialization: {
						required: true
                    },
					drpCurrentjob: {
						required: true
                    },
					drpPreviousjob: {
						required: true
                    },
					drpInsurence: {
						required: true
                    },
					// Visit Info
					dpVisitdate: {
                        required: true
                    }
					,
					txtVisittime: {
                        required: true
                    },
					txtVisitendtime: {
                        required: true
                    },
					drpResearcher: {
                        required: true
                    },
					
					// Family Member
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
						required: true,
						digits: true
                    },
					txtMemjob: {
						required: true
                    },
					
					// Health Status
					drpDisease: {
						required: true
					},
					txtarDiseaasedet: {
						required: true
					}
					
                },

               messages: { // custom messages for radio buttons and checkboxes
                    txtElderId: {
						required: "الرجاء إدخال رقم الهوية",
						digits: "الرجـاء ادخـال ارقـام فقط"
                    },
					drpEldercategory: {
						required: "الرجاء إختيار قيمة"
                    },
					txtFname: {
                        required: "الرجاء ادخل الاسم"
                    },
                    txtMname: {
                        required: "الرجاء ادخل الاسم"
                    }
					,
                    txtThname: {
                        required: "الرجاء ادخل الاسم"
                    }
					,
                    txtLname: {
                        required: "الرجاء ادخل الاسم"
                    },
					dpDob: {
						required: "الرجاء إدخال تاريخ الميلاد",
						greaterThanSixty: "عمر العضو يجب ان يكون أكبر من 60 سنة"
                    },
					drpElderstatus: {
						required: "الرجاء إختيار قيمة"
                    },
					drpGovernorate: {
						required: "الرجاء إختيار قيمة"
                    },
					txtRegion: {
						required: "الرجاء إدخال قيمة"
                    },
					txtFulladdress: {
						required: "الرجاء إدخال قيمة"
                    },
					txtPhone: {
						minlength: "رقم الهاتف يجب ان يكون 7 ارقام",
						digits: "الرجـاء ادخـال ارقـام فقط"
                    },
					txtMobile1: {
						minlength: "رقم الجوال يجب ان يكون 10 ارقام مبدوء ب 059",
						digits: "الرجـاء ادخـال ارقـام فقط"
                    },
					txtMobile2: {
						minlength: "رقم الجوال يجب ان يكون 10 ارقام مبدوء ب 059",
						digits: "الرجـاء ادخـال ارقـام فقط"
                    },
					drpEducationlevel: {
						required: "الرجاء إختيار قيمة"
                    },
					drpSpecialization: {
						required: "الرجاء إختيار قيمة"
                    },
					drpCurrentjob: {
						required: "الرجاء إختيار قيمة"
                    },
					drpPreviousjob: {
						required: "الرجاء إختيار قيمة"
                    },
					drpInsurence: {
						required: "الرجاء إختيار قيمة"
                    },
					// Visit Info
					dpVisitdate: {
						required: "الرجاء إدخال تاريخ الزيارة"
                    },
					txtVisittime: {
						required: "الرجاء إدخال الوقت"
                    },
					txtVisitendtime: {
						required: "الرجاء إدخال الوقت"
                    },
					drpResearcher: {
						required: "الرجاء إختيار الباحث"
                    },
		
					// Family Member
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
						required: "الرجاء إدخال قيمة",
						digits: "الرجـاء ادخـال ارقـام فقط",
                    },
					txtMemjob: {
						required: "الرجاء إدخال قيمة"
                    },
					
					// Health Status
					drpDisease: {
						required: "الرجاء إختيار قيمة"
					},
					txtarDiseaasedet: {
						required: "الرجاء إدخال قيمة"
					}
                },

                errorPlacement: function (error, element) { // render error placement for each input type
                    if (element.attr("name") == "gender") { // for uniform radio buttons, insert the after the given container
                        error.insertAfter("#form_gender_error");
                    } else if (element.attr("name") == "payment[]") { // for uniform checkboxes, insert the after the given container
                        error.insertAfter("#form_payment_error");
                    } else if (element.parent(".input-group").size() > 0) {
                        error.insertAfter(element.parent(".input-group"));
						error.addClass('font-red');
                    } else {
                        error.insertAfter(element); // for other inputs, just perform default behavior
						error.addClass('font-red');
                    }
                },

                invalidHandler: function (event, validator) { //display error alert on form submit   
                    success.hide();
                    error.show();
                    Metronic.scrollTo(error, -200);
                },

                highlight: function (element) { // hightlight error inputs
                    $(element)
                        .closest('.form-group').removeClass('has-success').addClass('has-error'); // set error class to the control group
                },

                unhighlight: function (element) { // revert the change done by hightlight
                    $(element)
                        .closest('.form-group').removeClass('has-error'); // set error class to the control group
                },

                success: function (label) {
                    if (label.attr("for") == "gender" || label.attr("for") == "payment[]") { // for checkboxes and radio buttons, no need to show OK icon
                        label
                            .closest('.form-group').removeClass('has-error').addClass('has-success');
                        label.remove(); // remove error label here
                    } else { // display success icon for other inputs
                        label
                            .addClass('valid') // mark the current input as valid and display OK icon
                        .closest('.form-group').removeClass('has-error').addClass('has-success'); // set success class to the control group
                    }
                },

                submitHandler: function (form) {
                    success.show();
                    error.hide();
                    //add here some ajax code to submit your form or just call form.submit() if you want to submit the form without ajax
                }

            });

            var displayConfirm = function() {
                $('#tab4 .form-control-static', form).each(function(){
                    var input = $('[name="'+$(this).attr("data-display")+'"]', form);
                    if (input.is(":radio")) {
                        input = $('[name="'+$(this).attr("data-display")+'"]:checked', form);
                    }
                    if (input.is(":text") || input.is("textarea")) {
                        $(this).html(input.val());
                    } else if (input.is("select")) {
                        $(this).html(input.find('option:selected').text());
                    } else if (input.is(":radio") && input.is(":checked")) {
                        $(this).html(input.attr("data-title"));
                    } else if ($(this).attr("data-display") == 'payment[]') {
                        var payment = [];
                        $('[name="payment[]"]:checked', form).each(function(){ 
                            payment.push($(this).attr('data-title'));
                        });
                        $(this).html(payment.join("<br>"));
                    }
                });
            }

            var handleTitle = function(tab, navigation, index) {
                var total = navigation.find('li').length;
                var current = index + 1;
                // set wizard title
                $('.step-title', $('#form_wizard_1')).text('خطوة ' + (index + 1) + ' من ' + total);
                // set done steps
                jQuery('li', $('#form_wizard_1')).removeClass("done");
                var li_list = navigation.find('li');
                for (var i = 0; i < index; i++) {
                    jQuery(li_list[i]).addClass("done");
                }

                if (current == 1) {
                    $('#form_wizard_1').find('.button-previous').hide();
                } else {
                    $('#form_wizard_1').find('.button-previous').show();
                }

                if (current >= total) {
                    $('#form_wizard_1').find('.button-next').hide();
                    $('#form_wizard_1').find('.button-submit').show();
                    displayConfirm();
                } else {
                    $('#form_wizard_1').find('.button-next').show();
                    $('#form_wizard_1').find('.button-submit').hide();
                }
                Metronic.scrollTo($('.page-title'));
            }

            // default form wizard
            $('#form_wizard_1').bootstrapWizard({
                'nextSelector': '.button-next',
                'previousSelector': '.button-previous',
                onTabClick: function (tab, navigation, index, clickedIndex) {
                    alert('hi');
					return false;
                    /*
                    success.hide();
                    error.hide();
                    if (form.valid() == false) {
                        return false;
                    }
                    handleTitle(tab, navigation, clickedIndex);
                    */
                },
                onNext: function (tab, navigation, index) {
                    success.hide();
                    error.hide();
					
					if (index != 3)
					{
					  if (form.valid() == false) {
						  return false;
					  }
					}
					if (index == 1)
					{
						
						var action = $("#hdnAction").val();
						//alert(action);
						
						$.ajax({
								url: baseURL+"Surveycont/"+action,
								type: "POST",
								data:  $("#submit_form").serialize(),
								error: function(xhr, status, error) {
									//var err = eval("(" + xhr.responseText + ")");
									alert(xhr.responseText);
								},
								beforeSend: function(){},
								complete: function(){},
								success: function(returndb){
									if(returndb != 0)
									{
										$("#hdnSurveyId").val(returndb['survey_id']);
										$("#hdnFileId")  .val(returndb['file_id']);
										
										$("#hdnAction").val('updateelder');
										handleTitle(tab, navigation, index);
									}
								}
							});//END $.ajax
						
					}else if (index == 2){
						$.ajax({
								url: baseURL+"Surveycont/updatesurvey",
								type: "POST",
								data:  $("#submit_form").serialize(),
								error: function(xhr, status, error) {
									//var err = eval("(" + xhr.responseText + ")");
									alert(xhr.responseText);
								},
								beforeSend: function(){},
								complete: function(){},
								success: function(returndb){
									if(returndb == '')
									{
										handleTitle(tab, navigation, index);
									}		
								
								}
								
							});//END $.ajax
					}
					else if (index == 3){
						
						handleTitle(tab, navigation, index);
									
					}
					
                    
                },
                onPrevious: function (tab, navigation, index) {
                    success.hide();
                    error.hide();

                    handleTitle(tab, navigation, index);
                },
                onTabShow: function (tab, navigation, index) {
                    var total = navigation.find('li').length;
                    var current = index + 1;
                    var $percent = (current / total) * 100;
                    $('#form_wizard_1').find('.progress-bar').css({
                        width: $percent + '%'
                    });
                }
            });

            $('#form_wizard_1').find('.button-previous').hide();
            $('#form_wizard_1 .button-submit').click(function () {
                alert('Finished! Hope you like it :)');
            }).hide();
        }

    };

}();