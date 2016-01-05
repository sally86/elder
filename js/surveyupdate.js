// JavaScript Document

// Elder Info
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

// Survey Visit
function update_survey_visit()
{
	$.ajax({
			  url: baseURL+"Surveycont/updatesurvey",
			  type: "POST",
			  data:  $("#survey_visit").serialize(),
			  error: function(xhr, status, error) {
				  //var err = eval("(" + xhr.responseText + ")");
				  alert(xhr.responseText);
			  },
			  beforeSend: function(){},
			  complete: function(){},
			  success: function(returndb){
				  if(returndb == '')
				  {
					  
				  }		
			  
			  }
			  
		  });//END $.ajax
}
//------------------- Family Member Tab --------------------//
function addfamilymember()
{
	//var action = $("#hdnActionFM").val();
	//alert(action);
	
	/*if ( !validateFamilymember() )
		return;*/
		
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
			url: baseURL+"Surveycont/addfamilymember",
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

//------------------- Health Status Tab --------------------//
function add_elder_disease_u()
{
	
	/*if(!$("#drpDisease").valid())
		return false;*/
	alert($("#drpDisease").val());
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
function add_disease_details_u()
{
	/*if(!$("#txtarDiseaasedet").valid())
		return false;*/
	
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
//----------------------- Income Tab ------------------------//
function add_income_resource_det_u()
{
	/*if ( !validateIncomeResourceDet() )
		return;*/
		
	// Create a new FormData object.
	var formData = new FormData();
	
	// Add the data to the request.
	formData.append('hdnSurveyId'		 	, $("#hdnSurveyId").val()		   );
	formData.append('hdnIncomeResourcesId'	, $("#hdnIncomeResourcesId").val() );
	formData.append('drpIncomeSource'		,  $("#drpIncomeSource").val()	   );
	formData.append('drpOrganization'	  	,  $("#drpOrganization").val()	   );
	formData.append('txtCashincome'	  		,  $('#txtCashincome').val()	   );
	formData.append('txtPackageincome' 		,  $("#txtPackageincome").val()	   );
	formData.append('txtPackagecashvalue'	,  $("#txtPackagecashvalue").val() );

	
	$.ajax({
			url: baseURL+"Surveycont/addincomeresourcedet",
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
				
				$("#hdnIncomeResourcesId").val(returndb.substr(0, returndb.indexOf('|') ) );
				$("#tbdIncomeSourceDet").html(returndb.substr(returndb.indexOf('|')+1 ) );
				
				if ($("#drpIncomeSource").val() == '75')	// NGOs
					$("#drpOrganization option:selected" ).attr("disabled","disabled");
				else
					$("#drpIncomeSource option:selected" ).attr("disabled","disabled");
				
				clearIncomeFields();
				/*if(returndb == '')
				{
					var form = $('#familyMemberTab');
					$('.alert-success', form).show();
					//$('#hdnAction').val('');
				}*/
			}
		});//END $.ajax
}

function edit_income_resource_u()
{
	/*if( !validateIncomeResource() )
		return false;*/
	
	if($("#hdnIncomeResourcesId").val() == "")
		var action = "addincomeresource";
	else
		var action = "updateincomeresource";
		
	// Create a new FormData object.
	var formData = new FormData();
	
	// Add the data to the request.
	formData.append('hdnSurveyId'		 	, $("#hdnSurveyId").val()		   );
	formData.append('hdnIncomeResourcesId'	, $("#hdnIncomeResourcesId").val() );
	formData.append('txtTotalincome'		,  $("#txtTotalincome").val()	   );
	formData.append('txtElderportion'	  	,  $("#txtElderportion").val()	   );
	
		
	$.ajax({
			url: baseURL+"Surveycont/"+action,
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
				
				$("#hdnIncomeResourcesId").val(returndb);
				
			}
		});//END $.ajax
}

//-------------------- Home Status Tab ----------------------//
function editeHomeStatus_u()
{
	var action = $("#hdnHomeStatusAction").val();
	
	//alert(action);
	
	/*if ( !validateHomeStatus() )
		return;*/
		
	// Create a new FormData object.
	var formData = new FormData();
	
	// Add the data to the request.
	formData.append('hdnSurveyId'		 	,  $("#hdnSurveyId").val()		   	);
	formData.append('hdnHomeStatusId'		,  $("#hdnHomeStatusId").val() 		);
	formData.append('drpHomeStatus'			,  $("#drpHomeStatus").val()	   	);
	formData.append('drpHomeType'	  		,  $("#drpHomeType").val()	   		);
	formData.append('drpCeilingType'	  	,  $('#drpCeilingType').val()		);
	formData.append('txtCeilingdescription' ,  $("#txtCeilingdescription").val());
	formData.append('drpFurnitureLevel'		,  $("#drpFurnitureLevel").val() 	);
	formData.append('txtarFurnitureneeds'	,  $("#txtarFurnitureneeds").val() 	);
	
	
	$.ajax({
			url: baseURL+"Surveycont/"+action,
			type: "POST",
			data:formData,
			processData: false,
    		contentType: false,
			error: function(xhr, status, error) {
  				//var err = eval("(" + xhr.responseText + ")");
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				$("#hdnHomeStatusId").val(returndb);
				$('#hdnHomeStatusAction').val('updatehomeStatus');
				/*if (returndb=='')
				{
					var form = $('#HomeStatusTab');
					$('.alert-success', form).show();
					$('#homeStatushdnAction').val('updatehomeStatus');										
				}*/
			}
		});//END $.ajax
}
//---------------- Elder Room Status Tab --------------------//
function editeElderRoom_u()
{
	var action = $("#hdnElderRoomAction").val();
	
	//alert(action);
	
	/*if ( !validateHomeStatus() )
		return;*/
		
	// Create a new FormData object.
	var formData = new FormData();
	
	// Add the data to the request.
	formData.append('hdnSurveyId'		 			,  $("#hdnSurveyId").val()		   			);
	formData.append('hdnElderRoomId'				,  $("#hdnElderRoomId").val() 				);
	formData.append('drpElderHometype'				,  $("#drpElderHometype").val()	   			);
	formData.append('drpRoomtype'	  				,  $("#drpRoomtype").val()	   				);
	formData.append('drpClothes'	  				,  $('#drpClothes').val()					);
	formData.append('drpVentilation' 				,  $("#drpVentilation").val()				);
	formData.append('drpLighting'					,  $("#drpLighting").val() 					);
	formData.append('drpCloset'						,  $("#drpCloset").val() 					);
	formData.append('drpBed'						,  $("#drpBed").val() 						);
	formData.append('drpCupboard'					,  $("#drpCupboard").val() 					);
	formData.append('drpMaintenance'				,  $("#drpMaintenance").val() 				);
	formData.append('txtarRoommaintinancedet'		,  $("#txtarRoommaintinancedet").val() 		);
	formData.append('drpBathroom'					,  $("#drpBathroom").val() 					);
	formData.append('txtarBathroommaintinancedet'	,  $("#txtarBathroommaintinancedet").val() 	);
	formData.append('drpHigiene'					,  $("#drpHigiene").val() 					);
	
	
	$.ajax({
			url: baseURL+"Surveycont/"+action,
			type: "POST",
			data:formData,
			processData: false,
    		contentType: false,
			error: function(xhr, status, error) {
  				//var err = eval("(" + xhr.responseText + ")");
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				$("#hdnElderRoomId").val(returndb);
				$('#hdnElderRoomAction').val('updateelderRoom');	
				/*if (returndb=='')
				{
					var form = $('#HomeStatusTab');
					$('.alert-success', form).show();
					$('#homeStatushdnAction').val('updatehomeStatus');										
				}*/
			}
		});//END $.ajax
}
//----------------- Elder Midication Tab -------------------//
function add_medication_availability_u()
{
	/*if ( !validateMedicationAvailab() )
		return;*/
		
	// Create a new FormData object.
	var formData = new FormData();
	
	// Add the data to the request.
	formData.append('hdnSurveyId'		 		,  $("#hdnSurveyId").val()		   		);
	formData.append('txtMedicinename'			,  $("#txtMedicinename").val() 			);
	formData.append('drpMedicationAvailable'	,  $("#drpMedicationAvailable").val()	);
	formData.append('txtReason'	  				,  $("#txtReason").val()	   			);
	
	
	$.ajax({
			url: baseURL+"Surveycont/addmedicationavailabl",
			type: "POST",
			data:formData,
			processData: false,
    		contentType: false,
			error: function(xhr, status, error) {
  				//var err = eval("(" + xhr.responseText + ")");
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				$("#tbdMedication").html(returndb);
				clearMedicationAvaFields();
				/*if (returndb=='')
				{
					var form = $('#HomeStatusTab');
					$('.alert-success', form).show();
					$('#homeStatushdnAction').val('updatehomeStatus');										
				}*/
			}
		});//END $.ajax
}
function add_medication_need_u()
{
	/*if ( !validateMedicationNeed() )
		return;*/
		
	// Create a new FormData object.
	var formData = new FormData();
	
	// Add the data to the request.
	formData.append('hdnSurveyId'	,  $("#hdnSurveyId").val()		);
	formData.append('drpMedtype'	,  $("#drpMedtype").val() 		);
	formData.append('txtMeddetails'	,  $("#txtMeddetails").val()	);
	
	
	$.ajax({
			url: baseURL+"Surveycont/addmedicationneed",
			type: "POST",
			data:formData,
			processData: false,
    		contentType: false,
			error: function(xhr, status, error) {
  				//var err = eval("(" + xhr.responseText + ")");
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				
				$("#drpMedtype option:selected" ).attr("disabled","disabled");
				$("#tbdMedicationneed").html(returndb);
				clearMedicationNeedFields();
				/*if (returndb=='')
				{
					var form = $('#HomeStatusTab');
					$('.alert-success', form).show();
					$('#homeStatushdnAction').val('updatehomeStatus');										
				}*/
			}
		});//END $.ajax
}
//-------------------------- Validation ------------------------------//
// File Validation
/*var FileFormValidation = function () {
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

}();*/