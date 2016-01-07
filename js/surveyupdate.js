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
			  data:  $("#visit_info_form").serialize(),
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
	var form = $('#health_status_update_form');
    var error = $('.alert-danger', form);
	
	if(!$("#drpDisease").valid())
	{
		error.show();
        Metronic.scrollTo(error, -200);
		return false;
	}
	else
	{
		error.hide();
	}
		
	
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
	if ( !validateIncomeResourceDet_u() )
		return;
		
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
	if( !validateIncomeResource_u() )
		return false;
	
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
function validateIncomeResourceDet_u()
{
	var form = $('#income_resources_update_form');
    var error = $('.alert-danger', form);
	
	var valid = true;
	
	if ( !$("#drpIncomeSource").valid() )
		valid = false;
	if ( !$("#drpOrganization").valid() )
		valid = false;
	if ( !$("#txtCashincome").valid() )
		valid = false;
	if ( !$("#txtPackageincome").valid() )
		valid = false;
	if ( !$("#txtPackagecashvalue").valid() )
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
function validateIncomeResource_u()
{
	var form = $('#income_resources_update_form');
    var error = $('.alert-danger', form);
	
	var valid = true;
	
	if ( !$("#txtTotalincome").valid() )
		valid = false;
	if ( !$("#txtElderportion").valid() )
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
	if ( !validateMedicationAvailab_u() )
		return;
		
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
	if ( !validateMedicationNeed_u() )
		return;
		
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
function validateMedicationAvailab_u()
{
	
	var form = $('#medication_update_form');
    var error = $('.alert-danger', form);
	
	var valid = true;
	
	if ( !$("#txtMedicinename").valid() )
		valid = false;
	if ( !$("#drpMedicationAvailable").valid() )
		valid = false;
	if ( !$("#txtReason").valid() )
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
function validateMedicationNeed_u()
{
	
	var form = $('#medication_update_form');
    var error = $('.alert-danger', form);
	
	var valid = true;
	
	if ( !$("#drpMedtype").valid()  )
		valid = false;
	if ( !$("#txtMeddetails").valid()  )
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

//------------ Elder Family Relationship Tab ---------------//
function editeElderFamRel_u()
{
	var action = $("#hdnelderFamRelAction").val();
	
	//alert(action);
	
	/*if ( !validateElderFamRel() )
		return;*/
		
	// Create a new FormData object.
	var formData = new FormData();
	
	// Add the data to the request.
	formData.append('hdnSurveyId'				,  $("#hdnSurveyId").val()				);
	formData.append('drpRespect'				,  $("#drpRespect").val() 				);
	formData.append('drpPariah'					,  $("#drpPariah").val()				);
	formData.append('drpCare'					,  $("#drpCare").val()					);
	formData.append('drpPsycosupport'			,  $("#drpPsycosupport").val()			);
	formData.append('drpNeeds'					,  $("#drpNeeds").val()					);
	formData.append('txtarNeedreasone'			,  $("#txtarNeedreasone").val()			);
	formData.append('drpLegaladvice'			,  $("#drpLegaladvice").val()			);
	formData.append('txtarLegaladvicereasone'	,  $("#txtarLegaladvicereasone").val()	);
	
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
				
				$('#hdnelderFamRelAction').val('updateelderFamRel');
				
			}
		});//END $.ajax
	
}
//------------------ Elder Behavior Tab ------------------------//
function add_elder_behaviour_u()
{
	var form = $('#elder_behavior_update_form');
    var error = $('.alert-danger', form);
	
	if(!$("#drpBehaviour").valid())
	{
		error.show();
        Metronic.scrollTo(error, -200);
		return false;
	}
	else
	{
		error.hide();
	}
	
	$.ajax({
			url: baseURL+"Surveycont/addbehaviour",
			type: "POST",
			data: { hdnSurveyId : $("#hdnSurveyId").val(),
				    drpBehaviour : $("#drpBehaviour").val()
				  },
			
			error: function(xhr, status, error) {
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				
				if($("#drpBehaviour").val() == '211')	// Pariah
				{
					$("#dvPariahreasone").css("display", "block");
				}
				
				$("#tbdElderBehaviour").html(returndb);
				$("#drpBehaviour option:selected" ).attr("disabled","disabled");
				$("#drpBehaviour").val('');
			}
		});//END $.ajax
}

function add_elder_pariah_u()
{
	var form = $('#elder_behavior_update_form');
    var error = $('.alert-danger', form);
	
	if(!$("#drpPariahreasone").valid())
	{
		error.show();
        Metronic.scrollTo(error, -200);
		return false;
	}
	else
	{
		error.hide();
	}
	
	$.ajax({
			url: baseURL+"Surveycont/addpariah",
			type: "POST",
			data: { hdnSurveyId : $("#hdnSurveyId").val(),
				    drpPariahreasone : $("#drpPariahreasone").val()
				  },
			
			error: function(xhr, status, error) {
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				
				$("#tbdElderPariah").html(returndb);
				
				$("#drpPariahreasone option:selected" ).attr("disabled","disabled");
				$("#drpPariahreasone").val('');
				
			}
		});//END $.ajax
}

//******************cooperative family*************************//
function editeCooperativFamily_u()
{
	var action = $("#hdncooperativFamily").val();
	
	//alert(action);
	
	if ( !validateCooperativFamily() )
		return;
		
	// Create a new FormData object.
	var formData = new FormData();
	
	// Add the data to the request.
	formData.append('hdnSurveyId'			,  $("#hdnSurveyId").val()			);
	formData.append('drpIScooperative'	,  $("#drpIScooperative").val() 	);
	formData.append('drpcooperPersonetype'		,  $("#drpcooperPersonetype").val()		);
	formData.append('txtcooperPersoneId'		,  $("#txtcooperPersoneId").val()		);
	formData.append('txtcooperPersoneName'		,  $("#txtcooperPersoneName").val()	);
	formData.append('txtcooperPersoneMobile'		,  $("#txtcooperPersoneMobile").val()		);
	formData.append('txtcooperPersoneAddress'		,  $("#txtcooperPersoneAddress").val()		);
	
	
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
				
				$('#hdncooperativFamily').val('updatecooperFamily');	
			}
		});//END $.ajax
}
//----------------- Family Psycho Status Tab -------------------//
function add_family_psycho_u()
{
	/*if(!$("#drpPsychologicalStatus").valid())
		return false;*/
	
	$.ajax({
			url: baseURL+"Surveycont/addfamilypsycho",
			type: "POST",
			data: { hdnSurveyId : $("#hdnSurveyId").val(),
				    drpPsychologicalStatus : $("#drpPsychologicalStatus").val()	
				  },
			
			error: function(xhr, status, error) {
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				
				$("#tbdFamilyPsycho").html(returndb);
				
				$("#drpPsychologicalStatus option:selected" ).attr("disabled","disabled");
				$("#drpPsychologicalStatus").val('');
				/*if(returndb == '')
				{
					var form = $('#familyMemberTab');
					$('.alert-success', form).show();
					//$('#hdnAction').val('');
				}*/
			}
		});//END $.ajax
}
//------------------ Life Improvement Tab ----------------------//
function editeLifeImprov_u()
{
	var action = $("#hdnlifeImprovaction").val();
	
	//alert(action);
	
	/*if ( !validateLifeImprov() )
		return;*/
		
	// Create a new FormData object.
	var formData = new FormData();
	
	// Add the data to the request.
	formData.append('hdnSurveyId'			,  $("#hdnSurveyId").val()			);
	formData.append('drpElderWorkAbility'	,  $("#drpElderWorkAbility").val() 	);
	formData.append('txtelderworktype'		,  $("#txtelderworktype").val()		);
	formData.append('drpFamilyMember'		,  $("#drpFamilyMember").val()		);
	formData.append('txtFamilyworktype'		,  $("#txtFamilyworktype").val()	);
	formData.append('drpNeedtraining'		,  $("#drpNeedtraining").val()		);
	formData.append('txtTrainigType'		,  $("#txtTrainigType").val()		);
	formData.append('drpStartproject'		,  $("#drpStartproject").val()		);
	formData.append('txtProjectType'		,  $("#txtProjectType").val()		);
	formData.append('txtProjectBudget'		,  $("#txtProjectBudget").val()		);
	
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
				
				$('#hdnlifeImprovaction').val('updatelifeImprov');	
			}
		});//END $.ajax
}
//-------------------- Recomindation Tab -----------------------//
function editeaidrecomend_u()
{
	var action = $("#hdnaidraction").val();
	
	/*if( !validateAidRecommendation() )
		return;*/
	
	// Create a new FormData object.
	var formData = new FormData();
	
	// Add the data to the request.
	formData.append('hdnSurveyId'				,  $("#hdnSurveyId").val()				);
	formData.append('hdnAidsRecomendationId'	,  $("#hdnAidsRecomendationId").val()	);
	formData.append('drpCashaidtype'			,  $("#drpCashaidtype").val() 			);
	formData.append('txtCashaidamount'			,  $("#txtCashaidamount").val()			);
	formData.append('drpNutritiontype'			,  $("#drpNutritiontype").val()			);
	formData.append('txtNutritiondetails'		,  $("#txtNutritiondetails").val()		);
	formData.append('txtarPsychologicalsupport'	,  $("#txtarPsychologicalsupport").val());
	formData.append('txtarSocialsupport'		,  $("#txtarSocialsupport").val()		);
	formData.append('txtarEntertainment'		,  $("#txtarEntertainment").val()		);
	
	
	
	$.ajax({
			url: baseURL+"Surveycont/"+action,
			type: "POST",
			data:formData,
			processData: false,
    		contentType: false,
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
					//var form = $('#Aidrecomend_form');
					//$('.alert-success', form).show();
				}
			}
		});//END $.ajax	
	
}
function addmedicalaid_u()
{
	var action = $("#maidaction").val();
	//alert(action);
	
	/*if(  !$("#drpMedicalaidtype").valid() )
		return;*/
	
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
function addhomeaid_u()
{
	var action = $("#haidaction").val();
	//alert(action);
	
	/*if( !validateHomeAid() )
		return;*/
	
	$.ajax({
			url: baseURL+"Surveycont/"+action,
			type: "POST",
			data:   {hdnSurveyId: $("#hdnSurveyId").val(),
					 drpImprovementtype: $("#drpImprovementtype").val(),
					 txtImprovementdet: $('#txtImprovementdet').val()},
			error: function(xhr, status, error) {
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
			$("#tbhomeaid").html(returndb);
			
				$("#drpImprovementtype option:selected" ).attr("disabled","disabled");
				$("#drpImprovementtype").val('');
				$('#txtImprovementdet').val('');
				$("#dvImprovementdet").css("display", "none");
			}
		});//END $.ajax
}

//-------------------------- Validation ------------------------------//
// Elder Validation
var ElderInfoUpdateValidation = function () {
 var handleValidation = function() {
        	
            var form = $('#elder_info_form');
            var errormsg = $('.alert-danger', form);
            var successmsg = $('.alert-success', form);
			
			jQuery.validator.addMethod("greaterThanSixty", function(value, element) {
    			return parseInt($("#spnAge").html()) > 60;
			}, "* Amount must be greater than Sixty");
			
			form.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "", // validate all fields including form hidden input
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
					drpRegion: {
                        required: true
                    },
					drpFulladdress: {
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
					drpRegion: {
						required: "الرجاء إختيار قيمة"
                    },
					drpFulladdress: {
						required: "الرجاء إختيار قيمة"
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
					update_elder_info();
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

// Visit Info Validation
var VisitInfoUpdateValidation = function () {
 var handleValidation = function() {
        	
            var form = $('#visit_info_form');
            var errormsg = $('.alert-danger', form);
            var successmsg = $('.alert-success', form);
			
			form.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "", // validate all fields including form hidden input
                rules: {
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
                    }
                },

               messages: { // custom messages for radio buttons and checkboxes
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
					update_survey_visit();
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

// Family Member Validation
var FamilymemberUpdateValidation = function () {
 var handleValidation = function() {
        	
            var form = $('#familymember_update_form');
            var errormsg = $('.alert-danger', form);
            var successmsg = $('.alert-success', form);
			
			form.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "", // validate all fields including form hidden input
                rules: {
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
                    }
                },

               messages: { // custom messages for radio buttons and checkboxes
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
					addfamilymember();
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

// Health Status 
var HealthstatusUpdateValidation = function () {
 var handleValidation = function() {
        	
            var form = $('#health_status_update_form');
            var errormsg = $('.alert-danger', form);
            var successmsg = $('.alert-success', form);
			
			form.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "", // validate all fields including form hidden input
                rules: {
					// Health Status
					drpDisease: {
						required: true
					}
                },

               messages: { // custom messages for radio buttons and checkboxes
                    // Health Status
					drpDisease: {
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
						error.addClass('font-red');
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
					//addfamilymember();
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
// Income
var IncomeresourcesUpdateValidation = function () {
 var handleValidation = function() {
        	
            var form = $('#income_resources_update_form');
            var errormsg = $('.alert-danger', form);
            var successmsg = $('.alert-success', form);
			
			form.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "", // validate all fields including form hidden input
                rules: {
					// Income Resouce
					drpIncomeSource: {
						required: true
					},
					drpOrganization: {
						required: {
							 depends: function(element) {
								 if ($('#drpIncomeSource').val() == '75')
								 {
									return true;
								 }else{
									return false;
								 }
							 }//END function
						}//END required
					},
					txtCashincome: {
						required: function(element) {
							if ($('#txtPackageincome').val() == '')
								 {
									return true;
								 }else{
									return false;
								 }
						},
						digits: true
					},
					txtPackageincome: {
						required: function(element) {
							if ($('#txtCashincome').val() == '')
								 {
									return true;
								 }else{
									return false;
								 }
						},
					},
					txtPackagecashvalue: {
						required: {
							 depends: function(element) {
								 if ($('#txtPackageincome').val() != '')
								 {
									return true;
								 }else{
									return false;
								 }
							 }//END function
						},//END required
						digits: true
					},
					txtTotalincome: {
						required: true,
						digits: true
					},
					txtElderportion: {
						required: true,
						digits: true
					}
                },

               messages: { // custom messages for radio buttons and checkboxes
                    // Income Resouce
					drpIncomeSource: {
						required: "الرجاء إختيار قيمة"
					},
					drpOrganization: {
						required: "الرجاء إختيار قيمة"
					},
					txtCashincome: {
						required: "الرجاء إدخال قيمة",
						digits: "الرجـاء ادخـال ارقـام فقط"
					},
					txtPackageincome: {
						required: "الرجاء إدخال قيمة"
					},
					txtPackagecashvalue: {
						required: "الرجاء إدخال قيمة",
						digits: "الرجـاء ادخـال ارقـام فقط"
					},
					txtTotalincome: {
						required: "الرجاء إدخال قيمة",
						digits: "الرجـاء ادخـال ارقـام فقط"
					},
					txtElderportion: {
						required: "الرجاء إدخال قيمة",
						digits: "الرجـاء ادخـال ارقـام فقط"
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
						error.addClass('font-red');
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
					//addfamilymember();
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

// Home Status Validation
var HomestatusUpdateValidation = function () {
 var handleValidation = function() {
        	
            var form = $('#home_status_update_form');
            var errormsg = $('.alert-danger', form);
            var successmsg = $('.alert-success', form);
			
			form.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "", // validate all fields including form hidden input
                rules: {
					// Home Status
					drpHomeStatus: {
						required: true
					},
					drpHomeType:{
						required: true
					},
					drpCeilingType:{
						required: true
					},
					txtCeilingdescription:{
						 required: {
							 depends: function(element) {
								 if ($('#drpCeilingType').val() == '92')
								 {
									return true;
								 }else{
									return false;
								 }
							 }//END function
						}//END required
					},
					drpFurnitureLevel:{
						required: true
					},
					txtarFurnitureneeds:{
						required: {
							 depends: function(element) {
								 if ($('#drpFurnitureLevel').val() == '96')
								 {
									return true;
								 }else{
									return false;
								 }
							 }//END function
						}//END required
					} 
                },

               messages: { // custom messages for radio buttons and checkboxes
                    // Home Status
					drpHomeStatus: {
						required: "الرجاء إختيار قيمة"
					},
					drpHomeType:{
						required: "الرجاء إختيار قيمة"
					},
					drpCeilingType:{
						required: "الرجاء إختيار قيمة"
					},
					txtCeilingdescription:{
						required: "الرجاء إدخال قيمة"
					},
					drpFurnitureLevel:{
						required: "الرجاء إختيار قيمة"
					},
					txtarFurnitureneeds:{
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
					editeHomeStatus_u();
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
// Room Status Validation
var RoomstatusUpdateValidation = function () {
 var handleValidation = function() {
        	
            var form = $('#room_status_update_form');
            var errormsg = $('.alert-danger', form);
            var successmsg = $('.alert-success', form);
			
			form.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "", // validate all fields including form hidden input
                rules: {
					// Elder Room Status
					drpElderHometype:{
						required: true
					},
					drpRoomtype:{
						required: true
					},
					drpClothes:{
						required: true
					},
					drpVentilation:{
						required: true
					},
					drpLighting:{
						required: true
					},
					drpCloset:{
						required: true
					},
					drpBed:{
						required: true
					},
					drpCupboard:{
						required: true
					},
					drpMaintenance:{
						required: true
					},
					txtarRoommaintinancedet:{
						required: {
							 depends: function(element) {
								 if ($('#drpMaintenance').val() == '110')
								 {
									return true;
								 }else{
									return false;
								 }
							 }//END function
						}//END required
					},
					drpBathroom:{
						required: true
					},
					txtarBathroommaintinancedet:{
						required: {
							 depends: function(element) {
								 if ($('#drpBathroom').val() == '115' || $('#drpBathroom').val() == '116')
								 {
									return true;
								 }else{
									return false;
								 }
							 }//END function
						}//END required
					},
					drpHigiene:{
						required: true
					} 
                },

               messages: { // custom messages for radio buttons and checkboxes
                    // Elder Room Status
					drpElderHometype:{
						required: "الرجاء إختيار قيمة"
					},
					drpRoomtype:{
						required: "الرجاء إختيار قيمة"
					},
					drpClothes:{
						required: "الرجاء إختيار قيمة"
					},
					drpVentilation:{
						required: "الرجاء إختيار قيمة"
					},
					drpLighting:{
						required: "الرجاء إختيار قيمة"
					},
					drpCloset:{
						required: "الرجاء إختيار قيمة"
					},
					drpBed:{
						required: "الرجاء إختيار قيمة"
					},
					drpCupboard:{
						required: "الرجاء إختيار قيمة"
					},
					drpMaintenance:{
						required: "الرجاء إختيار قيمة"
					},
					txtarRoommaintinancedet:{
						required: "الرجاء إدخال قيمة"
					},
					drpBathroom:{
						required: "الرجاء إختيار قيمة"
					},
					txtarBathroommaintinancedet:{
						required: "الرجاء إدخال قيمة"
					},
					drpHigiene:{
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
					editeElderRoom_u();
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
// Elder Medication
var MedicationUpdateValidation = function () {
 var handleValidation = function() {
        	
            var form = $('#medication_update_form');
            var errormsg = $('.alert-danger', form);
            var successmsg = $('.alert-success', form);
			
			form.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "", // validate all fields including form hidden input
                rules: {
					// Medication Availability
					txtMedicinename :{
						required: true
					},
					drpMedicationAvailable:{
						required: true
					},
					txtReason:{
						required: {
							 depends: function(element) {
								 if ($('#drpMedicationAvailable').val() == '121')
								 {
									return true;
								 }else{
									return false;
								 }
							 }//END function
						}//END required
					},
					drpMedtype:{
						required: true
					},
					txtMeddetails:{
						required: true
					}
                },

               messages: { // custom messages for radio buttons and checkboxes
                    // Medication Availability
					txtMedicinename :{
						required: "الرجاء إدخال قيمة"
					},
					drpMedicationAvailable:{
						required: "الرجاء إختيار قيمة"
					},
					txtReason:{
						required: "الرجاء إدخال قيمة"
					},
					drpMedtype:{
						required: "الرجاء إختيار قيمة"
					},
					txtMeddetails:{
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
						error.addClass('font-red');
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

// Family Elder Relation
var FamEldrRelUpdateValidation = function () {
 var handleValidation = function() {
        	
            var form = $('#family_elder_relation_update_form');
            var errormsg = $('.alert-danger', form);
            var successmsg = $('.alert-success', form);
			
			form.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "", // validate all fields including form hidden input
                rules: {
					// Elder Family Relationship
					drpRespect:{
						required: true
					},
					drpPariah:{
						required: true
					},
					drpCare:{
						required: true
					},
					drpPsycosupport:{
						required: true
					},
					drpNeeds:{
						required: true
					},
					txtarNeedreasone:{
						required: {
							 depends: function(element) {
								 if ($('#drpNeeds').val() == '111')
								 {
									return true;
								 }else{
									return false;
								 }
							 }//END function
						}//END required
					},
					drpLegaladvice:{
						required: true
					},
					txtarLegaladvicereasone:{
						required: {
							 depends: function(element) {
								 if ($('#drpLegaladvice').val() == '110')
								 {
									return true;
								 }else{
									return false;
								 }
							 }//END function
						}//END required
					} 
                },

               messages: { // custom messages for radio buttons and checkboxes
                    // Elder Family Relationship
					drpRespect:{
						required: "الرجاء إختيار قيمة"
					},
					drpPariah:{
						required: "الرجاء إختيار قيمة"
					},
					drpCare:{
						required: "الرجاء إختيار قيمة"
					},
					drpPsycosupport:{
						required:"الرجاء إختيار قيمة"
					},
					drpNeeds:{
						required: "الرجاء إختيار قيمة"
					},
					txtarNeedreasone:{
						required: "الرجاء إدخال قيمة"
					},
					drpLegaladvice:{
						required: "الرجاء إختيار قيمة"
					},
					txtarLegaladvicereasone:{
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
					editeElderFamRel_u();
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
// Elder Behavior
var ElderbehaviorUpdateValidation = function () {
 var handleValidation = function() {
        	
            var form = $('#elder_behavior_update_form');
            var errormsg = $('.alert-danger', form);
            var successmsg = $('.alert-success', form);
			
			form.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "", // validate all fields including form hidden input
                rules: {
					// Elder Behaviour
					drpBehaviour :{
						required: true
					},
					drpPariahreasone :{
						required: true
					} 
                },

               messages: { // custom messages for radio buttons and checkboxes
                    // Elder Behaviour
					drpBehaviour :{
						required: "الرجاء إختيار قيمة"
					},
					drpPariahreasone :{
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
						error.addClass('font-red');
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
					editeElderFamRel_u();
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

// Family Cooperation
var FamilycooperationUpdateValidation = function () {
 var handleValidation = function() {
        	
            var form = $('#family_cooperation_update_form');
            var errormsg = $('.alert-danger', form);
            var successmsg = $('.alert-success', form);
			
			form.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "", // validate all fields including form hidden input
                rules: {
					// Family Cooperation Relationship
					drpIScooperative:{
						required: true
					},
					drpcooperPersonetype:{
						required: {
							 depends: function(element) {
								 if ($('#drpIScooperative').val() == '111')
								 {
									return true;
								 }else{
									return false;
								 }
							 }//END function
						}//END required
					},
					txtcooperPersoneId:{
						required: {
							 depends: function(element) {
								 if ($('#drpIScooperative').val() == '111')
								 {
									return true;
								 }else{
									return false;
								 }
							 }//END function
						}//END required
					},
					txtcooperPersoneName:{
						required: {
							 depends: function(element) {
								 if ($('#drpIScooperative').val() == '111')
								 {
									return true;
								 }else{
									return false;
								 }
							 }//END function
						}//END required
					},
					txtcooperPersoneMobile:{
						required: {
							 depends: function(element) {
								 if ($('#drpIScooperative').val() == '111')
								 {
									return true;
								 }else{
									return false;
								 }
							 }//END function
						}//END required
					},
					txtcooperPersoneAddress:{
						required: {
							 depends: function(element) {
								 if ($('#drpIScooperative').val() == '111')
								 {
									return true;
								 }else{
									return false;
								 }
							 }//END function
						}//END required
					},
                },

               messages: { // custom messages for radio buttons and checkboxes
                    // Family Cooperation Relationship
					drpIScooperative:{
						required: "الرجاء إختيار قيمة"
					},
					drpcooperPersonetype:{
						required: "الرجاء إختيار قيمة"
					},
					txtcooperPersoneId:{
						required: "الرجاء إدخال قيمة"
					},
					txtcooperPersoneName:{
						required:"الرجاء إدخال قيمة"
					},
					txtcooperPersoneMobile:{
						required: "الرجاء إدخال قيمة"
					},
					txtcooperPersoneAddress:{
						required: "الرجاء إدخال قيمة"
					},
					drpLegaladvice:{
						required: "الرجاء إختيار قيمة"
					},
					txtarLegaladvicereasone:{
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
					editeCooperativFamily_u();
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
// Family Psycho Behavior
var FamilypsychoUpdateValidation = function () {
 var handleValidation = function() {
        	
            var form = $('#family_psycho_update_form');
            var errormsg = $('.alert-danger', form);
            var successmsg = $('.alert-success', form);
			
			form.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "", // validate all fields including form hidden input
                rules: {
					// Family Psyco
					drpPsychologicalStatus:{
						required: true
					}
                },

               messages: { // custom messages for radio buttons and checkboxes
                    // Family Psyco
					drpPsychologicalStatus:{
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
						error.addClass('font-red');
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
					add_family_psycho_u();
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


// Life Improvement
var LifeimprovementUpdateValidation = function () {
 var handleValidation = function() {
        	
            var form = $('#life_improvement_update_form');
            var errormsg = $('.alert-danger', form);
            var successmsg = $('.alert-success', form);
			
			form.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "", // validate all fields including form hidden input
                rules: {
					// Life Improvement
					drpElderWorkAbility: {
                        required: true
					},
					txtelderworktype: {
                        required: {
							 depends: function(element) {
								 if ($('#drpElderWorkAbility').val() == '142')
								 {
									return true;
								 }else{
									return false;
								 }
							 }//END function
						}//END required
                    },
					drpFamilyMember: {
                        required: {
							 depends: function(element) {
								 if ($('#drpElderWorkAbility').val() == '143')
								 {
									return true;
								 }else{
									return false;
								 }
							 }//END function
						}//END required
                    },
					txtFamilyworktype: {
                        required: {
							 depends: function(element) {
								 if ($('#drpElderWorkAbility').val() == '143')
								 {
									return true;
								 }else{
									return false;
								 }
							 }//END function
						}//END required
                    }, 
					drpNeedtraining: {
                        required: true
                    },
					txtTrainigType: {
                        required: {
							 depends: function(element) {
								 if ($('#drpNeedtraining').val() == '110')
								 {
									return true;
								 }else{
									return false;
								 }
							 }//END function
						}//END required
					},
					drpStartproject: {
                        required: true
                    },
					txtProjectType: {
                        required: {
							 depends: function(element) {
								 if ($('#drpStartproject').val() == '110')
								 {
									return true;
								 }else{
									return false;
								 }
							 }//END function
						}//END required
                    },
					txtProjectBudget: {
                        required: {
							 depends: function(element) {
								 if ($('#drpStartproject').val() == '110')
								 {
									return true;
								 }else{
									return false;
								 }
							 }//END function
						}//END required
					}
                },

               messages: { // custom messages for radio buttons and checkboxes
                    // Life Improvement
					drpElderWorkAbility: {
                        required: "الرجاء إختيار قيمة"
					},
					txtelderworktype: {
                        required: "الرجاء إدخال قيمة"
                    },
					drpFamilyMember: {
                        required: "الرجاء إختيار قيمة"
                    },
					txtFamilyworktype: {
                        required: "الرجاء إدخال قيمة"
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
					editeLifeImprov_u();
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

// Aid Validation
var AidUpdateValidation = function () {
 var handleValidation = function() {
        	
            var form = $('#aid_form');
            var errormsg = $('.alert-danger', form);
            var successmsg = $('.alert-success', form);
			
			form.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "", // validate all fields including form hidden input
                rules: {
					// Aids Recommendations
					drpCashaidtype: {
                        required: {
							 depends: function(element) {
								 if ($.trim($('#txtCashaidamount').val()) != '')
								 {
									return true;
								 }else{
									return false;
								 }
							 }//END function
						}//END required
					},
					txtCashaidamount: {
                        required: {
							 depends: function(element) {
								 if ($('#drpCashaidtype').val() != '')
								 {
									return true;
								 }else{
									return false;
								 }
							 }//END function
						},//END required
						digits:true
					},
					drpNutritiontype: {
                        required: {
							 depends: function(element) {
								 if ($.trim($('#txtNutritiondetails').val()) != '')
								 {
									return true;
								 }else{
									return false;
								 }
							 }//END function
						}//END required
					},
					txtNutritiondetails: {
                        required: {
							 depends: function(element) {
								 if ($('#drpNutritiontype').val() != '')
								 {
									return true;
								 }else{
									return false;
								 }
							 }//END function
						}//END required
					}
                },

               messages: { // custom messages for radio buttons and checkboxes
                    // Aids Recommendations
					drpCashaidtype: {
                        required: "الرجاء إختيار قيمة"
					},
					txtCashaidamount: {
                        required: "الرجاء إدخال قيمة",
						digits: "الرجـاء ادخـال ارقـام فقط"
					},
					drpNutritiontype: {
                        required: "الرجاء إختيار قيمة"
					},
					txtNutritiondetails: {
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
					editeaidrecomend_u();
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
// Medical Aid
var MedicalAidUpdateValidation = function () {
 var handleValidation = function() {
        	
            var form = $('#medical_aid_form');
            var errormsg = $('.alert-danger', form);
            var successmsg = $('.alert-success', form);
			
			form.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "", // validate all fields including form hidden input
                rules: {
					drpMedicalaidtype: {
                        required: true
					}
                },

               messages: { // custom messages for radio buttons and checkboxes
                    // Family Psyco
					drpMedicalaidtype:{
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
						error.addClass('font-red');
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
					addmedicalaid_u();
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
// Home Aid
var HomeAidUpdateValidation = function () {
 var handleValidation = function() {
        	
            var form = $('#home_aid_form');
            var errormsg = $('.alert-danger', form);
            var successmsg = $('.alert-success', form);
			
			form.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "", // validate all fields including form hidden input
                rules: {
					drpImprovementtype: {
                        required: true
					},
					txtImprovementdet: {
                        required: {
							 depends: function(element) {
								 if ($('#drpImprovementtype').val() == '168' || $('#drpImprovementtype').val() == '169')
								 {
									return true;
								 }else{
									return false;
								 }
							 }//END function
						}//END required
					}
                },

               messages: { // custom messages for radio buttons and checkboxes
                    // Home Aid
					drpImprovementtype: {
                        required: "الرجاء إختيار قيمة"
					},
					txtImprovementdet: {
                        required: "الرجاء إدخال قيمة"
					},
					
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
						error.addClass('font-red');
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
					addhomeaid_u();
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
