// JavaScript Document

$(document).ready(function(){
	
	/********** doc_form **********/
	$('#drpFilestatus').change(function(event) {							
		event.preventDefault();
		
		if ($('#drpFilestatus').val() == '172')
			$("#dvClose").css("display", "block");
		else
		{
			$('#dpClose').val('');
			$('#drpClosereasone').val('');
			$("#dvClose").css("display", "none");
		}
		
	}); // END CHANGE
	
	
	
	/********** doc_form **********/
	// Add Documents
	$('#btnAdddoc').click(function(event) {							
		event.preventDefault();
				
		//-- Validation
		$('#dvSuccessMsg').attr('class', 'alert alert-success display-hide');
		$('#dvErrorMsg')  .attr('class', 'alert alert-danger  display-hide');
				
		if($('#drpDoctype').val() == '')
		{
			$('#dvErrorMsg').attr('class', 'alert alert-danger');
			$('#drpDoctype').focus();
			return;
		}
		if($('#fileToUpload').val() == '')
		{
			$('#dvErrorMsg').attr('class', 'alert alert-danger');
			$('#flFilename').focus();
			return;
		}
		//--
		
		var fileid = $('#hdnFileid').val();
		var doctype = $('#drpDoctype').val();
		var filename = $('#flFilename').html();
		var fileSelect = document.getElementById('fileToUpload');
		
		// Get the selected files from the input.
		var files = fileSelect.files;
		
		// Create a new FormData object.
		var formData = new FormData();
		var file = files[0];
		
		// Add the file to the request.
  		formData.append('fileToUpload', file, file.name);
		formData.append('fileid', fileid);
		formData.append('doctype', doctype);
		formData.append('filename', filename);
		
	
		
		$.ajax({
			url: baseURL+"Elderfilecont/uploaddoc",
			type: "POST",
			data: formData,
			processData: false,
    		contentType: false,
			error: function(xhr, status, error) {
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				$('#drpDoctype').val('');
				$('#tbdDoc').html(returndb);
			}
		});//END $.ajax
	
	}); // END CLICK
	
}); // END READY

/********** file_form **********/
function updatefile()
{
	$.ajax({
			url: baseURL+"Elderfilecont/updatefile",
			type: "POST",
			data: $('#file_form').serialize() + '&hdnFileid=' + $('#hdnFileid').val(),
			error: function(xhr, status, error) {
  				//alert(xhr.responseText);
				
				$('#spnMsg').text('حدث خطأ أثناء عملية حفظ البانات ... الرجاء المحاولة مرة أخرى');
				var form = $('#file_form');
				$('.alert-danger', form).show();
				$('.alert-success', form).hide();
				Metronic.scrollTo( $('.alert-danger', form), -200);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				if(returndb == '')
				{
					var form = $('#file_form');
					$('.alert-success', form).show();
					$('.alert-danger', form).hide();
					Metronic.scrollTo( $('.alert-danger', form), -200);
				}
			}
		});//END $.ajax
}
/********** elder_form **********/
function updateElder()
{
	
	$.ajax({
			url: baseURL+"Elderfilecont/updateelder",
			type: "POST",
			data:  $("#elder_form").serialize(),
			error: function(xhr, status, error) {
  				//var err = eval("(" + xhr.responseText + ")");
  				alert(xhr.responseText);
				
				$('#spnMsgElder').text('حدث خطأ أثناء عملية حفظ البانات ... الرجاء المحاولة مرة أخرى');
				var form = $('#elder_form');
				$('.alert-danger', form).show();
				$('.alert-success', form).hide();
				Metronic.scrollTo( $('.alert-danger', form), -200);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				if(returndb == '')
				{
					var form = $('#elder_form');
					$('.alert-success', form).show();
					$('.alert-danger', form).hide();
					Metronic.scrollTo( $('.alert-danger', form), -200);
				}
			}
		});//END $.ajax
}
/********** doc_form **********/
function deleteDoc(elderdocid,filename)
{
	var fileid = $('#hdnFileid').val();
	$.ajax({
			url: baseURL+"Elderfilecont/deletedoc",
			type: "POST",
			data: { fileid : fileid,
					elderdocid : elderdocid,
					filename : filename},
			error: function(xhr, status, error) {
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				$('#drpDoctype').val('');
				$('#tbdDoc').html(returndb);
				
			}
		});//END $.ajax
}

//-------- Validation -------------------//
// File Validation
var FileFormValidation = function () {
 var handleValidation = function() {
        	
            var form = $('#file_form');
            var errormsg = $('.alert-danger', form);
            var successmsg = $('.alert-success', form);
			
			form.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "", // validate all fields including form hidden input
                rules: {
					drpFilestatus: {
                        required: true
					},
					dpClose: {
						 required: {
							 depends: function(element) {
								 if ($('#drpFilestatus').val() == '172')
								 {
									return true;
								 }else{
									return false;
								 }
							 }//END function
						}//END required
						
					},//END dpClose
					drpClosereasone: {
						 required: {
							 depends: function(element) {
								 if ($('#drpFilestatus').val() == '172')
								 {
									return true;
								 }else{
									return false;
								 }
							 }//END function
						}//END required
						
					}//END dpClose
                },

               messages: { // custom messages for radio buttons and checkboxes
                    drpFilestatus: {
						required: "الرجاء ادخال حالة الملف"
                    },
                    dpClose: {
                        required: "الرجاء ادخال تاريخ الاغلاق"
                    },
					drpClosereasone: {
                        required: "الرجاء اختيار سبب الاغلاق"
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
					$('#spnMsg').text('يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة');
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
					updatefile();
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
//--------------------------------------
// Elder Validation
var ElderInfoValidation = function () {
 var handleValidation = function() {
        
            var form = $('#elder_form');
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
						digits: true,
						minlength: 9,
						maxlength: 9
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
					drpRegion: {
                        required: true
                    },
					drpFulladdress: {
                        required: true
					},
					txtAddressdetails: {
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
					txtMobile1: {
						digits: true,
						minlength: 10
                    },
					drpEducationlevel: {
						required: true
                    },
					drpSpecialization: {
						required: {
							 depends: function(element) {
								 if ($('#drpEducationlevel').val() > 27)
								 {
									return true;
								 }else{
									return false;
								 }
							 }//END function
						}//END required
                    },
					drpCurrentjob: {
						required: true
                    },
					drpInsurence: {
						required: true
                    }
                },

               messages: { // custom messages for radio buttons and checkboxes
                    txtElderId: {
						required: "الرجاء إدخال رقم الهوية",
						digits: "الرجـاء ادخـال ارقـام فقط",
						minlength: "رقم الهوية يجب ان يكون 9 ارقام",
						maxlength: "رقم الهوية يجب ان يكون 9 ارقام"
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
					drpRegion: {
						required: "الرجاء إختيار قيمة"
                    },
					drpFulladdress: {
						required: "الرجاء إختيار قيمة"
                    },
					txtAddressdetails: {
                        required: "الرجاء ادخـال قيمة"
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
					$('#spnMsgElder').text('يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة');
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
					updateElder();
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
