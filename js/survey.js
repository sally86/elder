// JavaScript Document

//-------------------- Elder Tab --------------------//

//-------check drpEducationlevel type-------------//

function educationlevel_change(){	

 	var edicationLevel_code = $('#drpEducationlevel').find('option:selected').val();

	if (edicationLevel_code <27)
	{
		 document.getElementById("divSpecialization").style.display = "none";		
		
	}
	else
	{

		  document.getElementById("divSpecialization").style.display = "block";
	}
	}

//-----end drpEducationlevel type
function governorate_change(){	

 	var governorate_code = $('#drpGovernorate').find('option:selected').val();
	
	$.ajax({
			url: baseURL+"Surveycont/get_region",
			type: "POST",
			data:  {governorateCode:governorate_code},
			error: function(xhr, status, error) {
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				var i=0;
				$('#drpRegion').empty();
				$('#drpFulladdress').empty();
//				alert(returndb[0]['sub_constant_id']+returndb[0]['sub_constant_name']);
				$('#drpRegion').append("<option>أختر ....</option>");
				for (i=0;i<returndb.length;++i)
			//	alert(returndb[i]['sub_constant_id']+returndb[i]['sub_constant_name']);
				$('#drpRegion').append('<option value= "'+ returndb[i]['sub_constant_id'] + '">' + returndb[i]['sub_constant_name'] +'</option>');
				
			}
		});//END $.ajax
}

function region_change(){	

 	var region_code = $('#drpRegion').find('option:selected').val();
	
	$.ajax({
			url: baseURL+"Surveycont/get_fulladdress",
			type: "POST",
			data:  {regionCode:region_code},
			error: function(xhr, status, error) {
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				var i=0;
				$('#drpFulladdress').empty();
//				alert(returndb[0]['sub_constant_id']+returndb[0]['sub_constant_name']);
				$('#drpFulladdress').append("<option>أختر ....</option>");
				for (i=0;i<returndb.length;++i)
			//	alert(returndb[i]['sub_constant_id']+returndb[i]['sub_constant_name']);
				$('#drpFulladdress').append('<option value= "'+ returndb[i]['sub_constant_id'] + '">' + returndb[i]['sub_constant_name'] +'</option>');
				
			}
		});//END $.ajax
}


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
					alert ("تم ادخال استبانة للعضو مسبقا");
					$('#txtElderId').val('');
					$('#txtElderId').focus();
					return;
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
				  $('#drpRegion').val(returndb[0]['drpRegion']);
				  $('#drpFulladdress').val(returndb[0]['drpFulladdress']);
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
					$('#drpRegion').val('');
					$('#drpFulladdress').val('');
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
//----------------------- Income Tab ------------------------//
function add_income_resource_det()
{
	if ( !validateIncomeResourceDet() )
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
function delete_income_resource_det(incomeresourcedetid,resourceid,orgid)
{
	$.ajax({
			url: baseURL+"Surveycont/deleteincomeresourcedet",
			type: "POST",
			data: { hdnSurveyId : $("#hdnSurveyId").val(),
				    incomeresourcedetid : incomeresourcedetid,
					resourceid : resourceid	
				  },
			
			error: function(xhr, status, error) {
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				if(resourceid == '75')
					$("#drpOrganization option[value='"+orgid+"']").prop('disabled', false);
				else
					$("#drpIncomeSource option[value='"+resourceid+"']").prop('disabled', false);
				
				$("#tbdIncomeSourceDet").html(returndb);
				
				/*if(returndb == '')
				{
					var form = $('#familyMemberTab');
					$('.alert-success', form).show();
					//$('#hdnAction').val('');
				}*/
			}
		});//END $.ajax
}
function edit_income_resource()
{
	if( !validateIncomeResource() )
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

function clearIncomeFields()
{
	$("#drpIncomeSource").val('');
	$("#drpOrganization").val('');
	$('#txtCashincome').val('');
	$("#txtPackageincome").val('');
	$("#txtPackagecashvalue").val('');
	$("#drpOrganization").css("display", "none");
}
function validateIncomeResourceDet()
{
	var form = $('#submit_form');
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
function validateIncomeResource()
{
	var form = $('#submit_form');
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

$(document).ready(function(){
	
	/********** Income Source **********/
	$('#drpIncomeSource').change(function(event) {							
		event.preventDefault();
		
		if($('#drpIncomeSource').val() == '75')
			$("#drpOrganization").css("display", "block");
		else
		{
			$("#drpOrganization").css("display", "none");
		}
		
	}); // END CHANGE INCOME SOURCE
	
	
}); // END READY

//--------------------- END Income Tab ----------------------//

//-------------------- Home Status Tab ----------------------//
function editeHomeStatus()
{
	var action = $("#hdnHomeStatusAction").val();
	
	//alert(action);
	
	if ( !validateHomeStatus() )
		return;
		
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
function validateHomeStatus()
{
	var form = $('#submit_form');
    var error = $('.alert-danger', form);
	
	var valid = true;
	
	if ( !$("#drpHomeStatus").valid() )
		valid = false;
	if ( !$("#drpHomeType").valid() )
		valid = false;
	if ( !$("#drpCeilingType").valid() )
		valid = false;
	if ( !$("#txtCeilingdescription").valid() )
		valid = false;
	if ( !$("#drpFurnitureLevel").valid() )
		valid = false;
	if ( !$("#txtarFurnitureneeds").valid() )
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

$(document).ready(function(){
	
	/********** Ceiling **********/
	$('#drpCeilingType').change(function(event) {							
		event.preventDefault();
		
		if($('#drpCeilingType').val() == '92')
			$("#dvCeilingDescription").css("display", "block");
		else
		{
			$('#txtCeilingdescription').val('');
			$("#dvCeilingDescription").css("display", "none");
		}
		
	}); // END CHANGE CEILING
	
	/********** Furniture **********/
	$('#drpFurnitureLevel').change(function(event) {							
		event.preventDefault();
		
		if($('#drpFurnitureLevel').val() == '96')
			$("#dvFurnitureNeeds").css("display", "block");
		else
		{
			$('#txtarFurnitureneeds').val('');
			$("#dvFurnitureNeeds").css("display", "none");
		}
		
	}); // END CHANGE FURNITURE
	
}); // END READY

//------------------ END Home Status Tab --------------------//

//---------------- Elder Room Status Tab --------------------//
function editeElderRoom()
{
	var action = $("#hdnElderRoomAction").val();
	
	//alert(action);
	
	if ( !validateHomeStatus() )
		return;
		
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
function validateHomeStatus()
{
	var form = $('#submit_form');
    var error = $('.alert-danger', form);
	
	var valid = true;
	
	if ( !$("#drpElderHometype").valid() )
		valid = false;
	if ( !$("#drpRoomtype").valid() )
		valid = false;
	if ( !$("#drpClothes").valid() )
		valid = false;
	if ( !$("#drpVentilation").valid() )
		valid = false;
	if ( !$("#drpLighting").valid() )
		valid = false;
	if ( !$("#drpCloset").valid() )
		valid = false;
	if ( !$("#drpBed").valid() )
		valid = false;
	if ( !$("#drpCupboard").valid() )
		valid = false;
	if ( !$("#drpMaintenance").valid() )
		valid = false;
	if ( !$("#txtarRoommaintinancedet").valid() )
		valid = false;
	if ( !$("#drpBathroom").valid() )
		valid = false;
	if ( !$("#txtarBathroommaintinancedet").valid() )
		valid = false;
	if ( !$("#drpHigiene").valid() )
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

$(document).ready(function(){
	
	/********** Room Maintenance **********/
	$('#drpMaintenance').change(function(event) {							
		event.preventDefault();
		
		if($('#drpMaintenance').val() == '110')
			$("#dvRoommaintinancedet").css("display", "block");
		else
		{
			$('#txtarRoommaintinancedet').val('');
			$("#dvRoommaintinancedet").css("display", "none");
		}
		
	}); // END CHANGE ROOM
	
	/********** Bathroom Maintenance **********/
	$('#drpBathroom').change(function(event) {							
		event.preventDefault();
		
		if($('#drpBathroom').val() == '115' || $('#drpBathroom').val() == '116')
			$("#dvBathroommaintinancedet").css("display", "block");
		else
		{
			$('#txtarBathroommaintinancedet').val('');
			$("#dvBathroommaintinancedet").css("display", "none");
		}
		
	}); // END CHANGE BATHROOM
	
}); // END READY
//-------------- END Elder Room Status Tab ------------------//

//----------------- Elder Midication Tab -------------------//
function add_medication_availability()
{
	if ( !validateMedicationAvailab() )
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
function delete_medication_availability(medicationavaid)
{
	$.ajax({
			url: baseURL+"Surveycont/deletemedicationavailabl",
			type: "POST",
			data:{ hdnSurveyId : $("#hdnSurveyId").val(),
				   medicationavaid : medicationavaid
				 },
			error: function(xhr, status, error) {
  				//var err = eval("(" + xhr.responseText + ")");
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				
				$("#tbdMedication").html(returndb);
				/*if (returndb=='')
				{
					var form = $('#HomeStatusTab');
					$('.alert-success', form).show();
					$('#homeStatushdnAction').val('updatehomeStatus');										
				}*/
			}
		});//END $.ajax
}
function add_medication_need()
{
	if ( !validateMedicationNeed() )
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
function delete_medication_need(medicationneedid,medicationtypeid)
{
	$.ajax({
			url: baseURL+"Surveycont/deletemedicationneed",
			type: "POST",
			data:{ hdnSurveyId : $("#hdnSurveyId").val(),
				   medicationneedid : medicationneedid,
				},
			error: function(xhr, status, error) {
  				//var err = eval("(" + xhr.responseText + ")");
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				$("#drpMedtype option[value='"+medicationtypeid+"']").prop('disabled', false);
				$("#tbdMedicationneed").html(returndb);
				/*if (returndb=='')
				{
					var form = $('#HomeStatusTab');
					$('.alert-success', form).show();
					$('#homeStatushdnAction').val('updatehomeStatus');										
				}*/
			}
		});//END $.ajax
}
function validateMedicationAvailab()
{
	var form = $('#submit_form');
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
function validateMedicationNeed()
{
	
	var form = $('#submit_form');
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
function clearMedicationAvaFields()
{
	$("#txtMedicinename").val('');
	$("#drpMedicationAvailable").val('');
	$("#txtReason").val('');
}
function clearMedicationNeedFields()
{
	$("#drpMedtype").val('');
	$("#txtMeddetails").val('');
}
//-------------- END Elder Midication Tab ------------------//
//------------ Elder Family Relationship Tab ---------------//
function editeElderFamRel()
{
	var action = $("#hdnelderFamRelAction").val();
	
	//alert(action);
	
	if ( !validateElderFamRel() )
		return;
		
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
function validateElderFamRel()
{
										 
	var form = $('#submit_form');
    var error = $('.alert-danger', form);
	
	var valid = true;
	
	if ( !$("#drpRespect").valid()  )
		valid = false;
	if ( !$("#drpPariah").valid()  )
		valid = false;
	if ( !$("#drpCare").valid()  )
		valid = false;
	if ( !$("#drpPsycosupport").valid()  )
		valid = false;
	if ( !$("#drpNeeds").valid()  )
		valid = false;
	if ( !$("#txtarNeedreasone").valid()  )
		valid = false;
	if ( !$("#drpLegaladvice").valid()  )
		valid = false;
	if ( !$("#txtarLegaladvicereasone").valid()  )
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
$(document).ready(function(){
	
	/********** Needs **********/
	$('#drpNeeds').change(function(event) {							
		event.preventDefault();
		
		if($('#drpNeeds').val() == '111')
			$("#dvNeedreasone").css("display", "block");
		else
		{
			$('#txtarNeedreasone').val('');
			$("#dvNeedreasone").css("display", "none");
		}
		
	}); // END CHANGE CEILING
	
	/********** Legal Advice **********/
	$('#drpLegaladvice').change(function(event) {							
		event.preventDefault();
		
		if($('#drpLegaladvice').val() == '110')
			$("#dvLegaladvicereasone").css("display", "block");
		else
		{
			$('#txtarLegaladvicereasone').val('');
			$("#dvLegaladvicereasone").css("display", "none");
		}
		
	}); // END CHANGE FURNITURE
	
}); // END READY

//------------ END Elder Family Relationship Tab ---------------//

//------------------ Elder Behavior Tab ------------------------//
function add_elder_behaviour()
{
	if(!$("#drpBehaviour").valid())
		return false;
	
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
function delete_elder_behaviour(elderbehaviourid , behaviourid)
{
	$.ajax({
			url: baseURL+"Surveycont/deletebehaviour",
			type: "POST",
			data:{ hdnSurveyId : $("#hdnSurveyId").val(),
				   elderbehaviourid : elderbehaviourid,
				   behaviourid : behaviourid
				},
			error: function(xhr, status, error) {
  				//var err = eval("(" + xhr.responseText + ")");
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				
				$("#drpBehaviour option[value='"+behaviourid+"']").prop('disabled', false);
				$("#tbdElderBehaviour").html(returndb);
				
				if(behaviourid == '211')	// Pariah
				{
					$("#drpPariahreasone").val('');
					$("#tbdElderPariah").html('');
					$("#dvPariahreasone").css("display", "none");
					$("#drpPariahreasone > option").prop('disabled', false);
				}
			}
		});//END $.ajax
}
function add_elder_pariah()
{
	if(!$("#drpPariahreasone").valid())
		return false;
	
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
function delete_elder_pariah(elderpariahid, pariahreasonid)
{
	$.ajax({
			url: baseURL+"Surveycont/deletepariah",
			type: "POST",
			data:{ hdnSurveyId : $("#hdnSurveyId").val(),
				   elderpariahid : elderpariahid,
				},
			error: function(xhr, status, error) {
  				//var err = eval("(" + xhr.responseText + ")");
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				
				$("#drpPariahreasone option[value='"+pariahreasonid+"']").prop('disabled', false);
				$("#tbdElderPariah").html(returndb);
				
			}
		});//END $.ajax
}

//-----------------END Elder Behavior Tab ----------------------//

//----------------- Family Psycho Status Tab -------------------//
function add_family_psycho()
{
	if(!$("#drpPsychologicalStatus").valid())
		return false;
	
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
function delete_family_psycho(familypsychoid , psycholostatusid)
{
	$.ajax({
			url: baseURL+"Surveycont/deletefamilypsycho",
			type: "POST",
			data: { hdnSurveyId : $("#hdnSurveyId").val(),
				    familypsychoid : familypsychoid
				  },
			
			error: function(xhr, status, error) {
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				
				$("#drpPsychologicalStatus option[value='"+psycholostatusid+"']").prop('disabled', false);
				$("#drpPsychologicalStatus").val('');
				$("#tbdFamilyPsycho").html(returndb);
				/*if(returndb == '')
				{
					var form = $('#familyMemberTab');
					$('.alert-success', form).show();
					//$('#hdnAction').val('');
				}*/
			}
		});//END $.ajax
}
//------------- END Family Psycho Status Tab -------------------//

//------------------ Life Improvement Tab ----------------------//
function editeLifeImprov()
{
	var action = $("#hdnlifeImprovaction").val();
	
	//alert(action);
	
	if ( !validateLifeImprov() )
		return;
		
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
function validateLifeImprov()
{
										 
	var form = $('#submit_form');
    var error = $('.alert-danger', form);
	
	var valid = true;
	
	if ( !$("#drpElderWorkAbility").valid()  )
		valid = false;
	if ( !$("#txtelderworktype").valid()  )
		valid = false;
	if ( !$("#drpFamilyMember").valid()  )
		valid = false;
	if ( !$("#txtFamilyworktype").valid()  )
		valid = false;
	if ( !$("#drpNeedtraining").valid()  )
		valid = false;
	if ( !$("#txtTrainigType").valid()  )
		valid = false;
	if ( !$("#drpStartproject").valid()  )
		valid = false;
	if ( !$("#txtProjectType").valid()  )
		valid = false;
	if ( !$("#txtProjectBudget").valid()  )
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
$(document).ready(function(){
	
	/********** Elder Work Ability **********/
	$('#drpElderWorkAbility').change(function(event) {							
		event.preventDefault();
		
		if($('#drpElderWorkAbility').val() == '142')	// Can
		{
			$("#drpFamilyMember").val('');
			$("#txtFamilyworktype").val('');
		}
		else
		{
			$('#txtelderworktype').val('');
		}
		
	}); // END CHANGE ELDER WORK ABILITY
	
	/********** Need Training **********/
	$('#drpNeedtraining').change(function(event) {							
		event.preventDefault();
		
		if($('#drpNeedtraining').val() == '111')
			$("#txtTrainigType").val('');
		
	}); // END CHANGE NEED TRAINING
	
	/********** Start Project **********/
	$('#drpStartproject').change(function(event) {							
		event.preventDefault();
		
		if($('#drpStartproject').val() == '111')
		{
			$("#txtProjectType").val('');
			$("#txtProjectBudget").val('');
		}
		
	}); // END CHANGE START PROJECT
	
}); // END READY
//--------------- END Life Improvement Tab ---------------------//
//******************cooperative family*************************//


function editeCooperativFamily()
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
function validateCooperativFamily()
{
										 
	var form = $('#submit_form');
    var error = $('.alert-danger', form);
	
	var valid = true;
	
	if ( !$("#drpIScooperative").valid()  )
		valid = false;
	if ( !$("#txtcooperPersoneId").valid()  )
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

//****************end cooperative family************************//
//-------------------- Recomindation Tab -----------------------//
function editeaidrecomend()
{
	var action = $("#hdnaidraction").val();
	
	if( !validateAidRecommendation() )
		return;
	
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
function addmedicalaid()
{
	var action = $("#maidaction").val();
	//alert(action);
	
	if(  !$("#drpMedicalaidtype").valid() )
		return;
	
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
function addhomeaid()
{
	var action = $("#haidaction").val();
	//alert(action);
	
	if( !validateHomeAid() )
		return;
	
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


function deletemedicalaidbyId(medicalaidId,medicationtypeid)
{
	var action = $("#maidaction").val();
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
function validateAidRecommendation()
{
										 
	var form = $('#submit_form');
    var error = $('.alert-danger', form);
	
	var valid = true;
	
	if ( !$("#drpCashaidtype").valid()  )
		valid = false;
	if ( !$("#txtCashaidamount").valid()  )
		valid = false;
	if ( !$("#drpNutritiontype").valid()  )
		valid = false;
	if ( !$("#txtNutritiondetails").valid()  )
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
function validateHomeAid()
{
										 
	var form = $('#submit_form');
    var error = $('.alert-danger', form);
	
	var valid = true;
	
	if ( !$("#drpImprovementtype").valid()  )
		valid = false;
	if ( !$("#txtImprovementdet").valid()  )
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

$(document).ready(function(){
	
	/********** Home Improvement Type **********/
	$('#drpImprovementtype').change(function(event) {							
		event.preventDefault();
		
		if($('#drpImprovementtype').val() == '168' || $('#drpImprovementtype').val() == '169')
		{
			$("#dvImprovementdet").css("display", "block");
			
			if($('#drpImprovementtype').val() == '168')
				$('#txtImprovementdet').attr('placeholder','فيمة الإيجار الشهري');
			else if($('#drpImprovementtype').val() == '169')
				$('#txtImprovementdet').attr('placeholder','تحديد الأشياء الأخرى');
		}
		else
		{
			$('#txtImprovementdet').val('');
			$("#dvImprovementdet").css("display", "none");
		}
		
	}); // END CHANGE CEILING
	
	
}); // END READY

//-------------------END Recomindation Tab ---------------------//

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
						digits: true,
						minlength: 9,
						maxlength: 9
                    },
					txtFiledocId: {
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
					txtMobile2: {
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
						digits: true
                    },
					
					// Health Status
					drpDisease: {
						required: true
					},
					txtarDiseaasedet: {
						required: true
					},
					
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
					},
					
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
					},
					
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
					},
					
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
					},
					
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
					},
					
					// Elder Behaviour
					drpBehaviour :{
						required: true
					},
					drpPariahreasone :{
						required: true
					},
					
					// Family Psyco
					drpPsychologicalStatus:{
						required: true
					},
					
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
					},
					
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
					},
					drpMedicalaidtype: {
                        required: true
					},
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
					},
					
					drpIScooperative: {
                        required: true
					},
					txtcooperPersoneId: {
                        digits: true
					}
					
                },

               messages: { // custom messages for radio buttons and checkboxes
                    txtElderId: {
						required: "الرجاء إدخال رقم الهوية",
						digits: "الرجـاء ادخـال ارقـام فقط",
						minlength: "رقم الهوية يجب ان يكون 9 ارقام",
						maxlength: "رقم الهوية يجب ان يكون 9 ارقام"
                    },
					txtFiledocId: {
                        required: "الرجاء إدخال رقم الملف الورقي",
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
						digits: "الرجـاء ادخـال ارقـام فقط",
                    },
					
					// Health Status
					drpDisease: {
						required: "الرجاء إختيار قيمة"
					},
					txtarDiseaasedet: {
						required: "الرجاء إدخال قيمة"
					},
					
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
					},
					
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
					},
					
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
					},
					
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
					},
					
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
					},
					
					// Elder Behaviour
					drpBehaviour :{
						required: "الرجاء إختيار قيمة"
					},
					drpPariahreasone :{
						required: "الرجاء إختيار قيمة"
					},
					
					// Family Psyco
					drpPsychologicalStatus:{
						required: "الرجاء إختيار قيمة"
					},
					
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
					},
					
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
					},
					drpMedicalaidtype: {
                        required: "الرجاء إختيار قيمة"
					},
					drpImprovementtype: {
                        required: "الرجاء إختيار قيمة"
					},
					txtImprovementdet: {
                        required: "الرجاء إدخال قيمة"
					},
					drpIScooperative: {
                        required: "الرجاء إختيار قيمة"
					},
					txtcooperPersoneId: {
                        digits: "الرجـاء ادخـال ارقـام فقط"
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
                $('#tab5 .form-control-static', form).each(function(){
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
					
					if (index != 3 && index != 4)
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
					else if (index == 3 || index == 4){
						
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
                alert('تم إنهـاء إضـافة الاستبانة بنجـاح)');
            }).hide();
        }

    };

}();