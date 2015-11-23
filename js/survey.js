// JavaScript Document

// Add Or Update User
function editeelder()
{
	var action = $("#hdnAction").val();
	var ElderId = document.getElementById('txtElderId').value;
	alert(action);
	
	$.ajax({
			url: baseURL+"Surveycont/"+action,
			type: "POST",
			data:  $("#ElderTab").serialize(),
			error: function(xhr, status, error) {
  				//var err = eval("(" + xhr.responseText + ")");
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				if(returndb == '')
				{
					var form = $('#ElderTab');
					$('.alert-success', form).show();
					$('#hdnelder_id').val(ElderId);
				
				}
			}
		});//END $.ajax
}
//-------------ELDER check ID ----------------------//
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
				if(returndb !=null)
			
				{
					
				$('#hdnAction').val('updateelder');
				$('#txtFname').val(returndb[0]['txtFname']);
				$('#txtMname').val(returndb[0]['txtMname']);
				$('#txtThname').val(returndb[0]['txtThname']);
				$('#txtLname').val(returndb[0]['txtLname']);
				$('#dpDob').val(returndb[0]['dpDob']);
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
			
				}
			}
		});//END $.ajax	
	
}
else

return;
}


//-------------End check ID
//-----------------check age less 60
/*$('#dpDob').change(function(event) {							
		event.preventDefault();
		
		var Elder_date= document.getElementById('dpDob').value;
		
		var date = new Date();
		
		var day = date.getDate();
		if (day>= 1 && day <= 9) 
			day = '0' + day;
			
		var month = date.getMonth()+1;
		if (month >= 1 && month <= 9)
			month = '0' + month;
		
		var year = date.getFullYear();
		
		
		var d = year+'-'+month+'-'+day;
		
		var Elderdate = new Date(Elder_date);
		var today = new Date(d);
		//alert ("bookingDate: "+bookingDate);
		//alert ("today: "+today);
		alert((today-Elderdate))
	//	if ((Elderdate - today)<60)
		{
			//alert ('يجب ان يكون تاريخ الحجز اكبر من تاريخ اليوم');
			//document.getElementById('booking_date').value = '';
		//	return;
		}
}); // END READY*/


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
					txtTHname: {
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
					txtFName: {
                        required: "الرجاء ادخل الاسم"
                    },
                    txtMName: {
                        required: "الرجاء ادخل الاسم"
                    }
					,
                    txtTHName: {
                        required: "الرجاء ادخل الاسم"
                    }
					,
                    txtLName: {
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

//----------------------------------------------------------
function editefamilymember()
{
	var action = $("#fmhdnAction").val();
	alert(action);
	
	$.ajax({
			url: baseURL+"Surveycont/"+action,
			type: "POST",
			data:  $("#familyMemberTab").serialize(),
			error: function(xhr, status, error) {
  				//var err = eval("(" + xhr.responseText + ")");
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				if(returndb == '')
				{
					var form = $('#familyMemberTab');
					$('.alert-success', form).show();
					//$('#hdnAction').val('');
				}
			}
		});//END $.ajax
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
function editesurvey()
{
	var action = $("#surveyhdnAction").val();
	var FileId = document.getElementById('txtFileid').value;
	alert(action);
	
	$.ajax({
			url: baseURL+"Surveycont/"+action,
			type: "POST",
			data:  $("#SurveyTab").serialize(),
			error: function(xhr, status, error) {
  				//var err = eval("(" + xhr.responseText + ")");
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				
					var form = $('#SurveyTab');
					$('.alert-success', form).show();
					$('#SurveyId').val(returndb);			
			
			}
		});//END $.ajax
}
//-------------get servey data ----------------------//
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