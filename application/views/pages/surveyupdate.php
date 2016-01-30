<?php
$eldername = "";
if (isset($elder_info))
{
	foreach($elder_info as $elder_info_row);
	
	if(count($elder_info) > 0)
	{
		$ction = "updateelder";
		
		// Calculate Age
		date_default_timezone_set('Asia/Gaza');   
		//date in yyyy-mm-dd format;
  		$birthDate = $elder_info_row->dob;
		//explode the date to get month, day and year
		$birthDate = explode("-", $birthDate);
		//get age from date or birthdate
		$age = (date("md", date("U", mktime(0, 0, 0, $birthDate[2], $birthDate[1], $birthDate[0]))) > date("md")
		  ? ((date("Y") - $birthDate[0]) - 1)
		  : (date("Y") - $birthDate[0]));
		
		if ($age > 60 )
			$lblClass = ' font-green ';
		else
			$lblClass = ' font-red ';
			
		$lblage = '<b> عمر العضو : <span id="spnAge">'.$age.'</span></b>';
		
		// Elder Name
		if(isset($elder_info_row->first_name)) 
			$eldername = $elder_info_row->first_name;
		if(isset($elder_info_row->first_name)) 
			$eldername = $eldername.' '.$elder_info_row->middle_name;
		if(isset($elder_info_row->first_name)) 
			$eldername = $eldername.' '.$elder_info_row->third_name;
		if(isset($elder_info_row->first_name)) 
			$eldername = $eldername.' '.$elder_info_row->last_name;
	}
	else
		$ction = "addelder";
}

if (isset($survey_info))
{
	foreach($survey_info as $survey_info_row);
	
}
// Home Status
if (isset($homeStatus_info))
{
	foreach($homeStatus_info as $homeStatus_row);
	
	if(count($homeStatus_info) > 0)
		$homeStatusction = "updatehomeStatus";
	else
		$homeStatusction = "addhomeStatus";
}

// Elder Room
if (isset($elderRoom_info))
{
	foreach($elderRoom_info as $elderRoom_row);
	
	if(count($elderRoom_info) > 0)
		$elderRoomaction = "updateelderRoom";
	else
		$elderRoomaction = "addelderRoom";
}

// Life Improvement 
if (isset($lifeImprovement_info))
{
	foreach($lifeImprovement_info as $lifeImprovement_row);
	
	if(count($lifeImprovement_info) > 0)
		$lifeImprovAction = "updatelifeImprov";
	else
		$lifeImprovAction = "addelifeImprov";
}

// Medication Needs
/*if (isset($medicationNeed_info))
{
	foreach($medicationNeed_info as $medicationNeed_row);
	
}*/
/*if (isset($medicationAvailability_info))
{
	foreach($medicationAvailability_info as $medicationAvailability_row);
}*/
/*if (isset($medicalAidRecomend_info))
{
	foreach($medicalAidRecomend_info as $medicalAidRecomend_row);
}*/
if (isset($incomeResources_info))
{
	foreach($incomeResources_info as $incomeResources_row);
}
if (isset($incomeResourcesDetails_info))
{
	foreach($incomeResourcesDetails_info as $incomeResourcesDetails_row);
	
}
/*if (isset($homeImprovRecomend_info))
{
	foreach($homeImprovRecomend_info as $homeImprovRecomend_row);
}*/
if (isset($followUp_info))
{
	foreach($followUp_info as $followUp_row);
};
/*if (isset($familyMember_info))
{
	foreach($familyMember_info as $familyMember_row);
}*/
if (isset($familyRelationship_info))
{
	foreach($familyRelationship_info as $familyRelationship_row);
	
	if(count($familyRelationship_info) > 0)
		$elderFamRelAction = "updateelderFamRel";
	else
		$elderFamRelAction = "addelderFamRel";
}
if (isset($familyCooperation_info))
{
	foreach($familyCooperation_info as $familyCooperation_row);
	
	if(count($familyCooperation_info) > 0)
		$cooperativFamilyAction = "updatecooperFamily";
	else
		$cooperativFamilyAction = "addcooperFamily";
}
/*if (isset($elderPariah_info))
{
	foreach($elderPariah_info as $elderPariah_row);
}*/
if (isset($elderInteresting_info))
{
	foreach($elderInteresting_info as $elderInteresting_row);
}
/*if (isset($elderDoc_info))
{
	foreach($elderDoc_info as $elderDoc_row);
}*/
/*if (isset($elderDisease_info))
{
	foreach($elderDisease_info as $elderDisease_row);
}*/
if (isset($elderDiseaseDet_info))
{
	foreach($elderDiseaseDet_info as $elderDiseaseDet_row);
}
/*if (isset($elderBehaviour_info))
{
	foreach($elderBehaviour_info as $elderBehaviour_row);
}*/
if (isset($aidsRecomendation_info))
{
	foreach($aidsRecomendation_info as $aidsRecomendation_row);
	
	if(count($aidsRecomendation_info) > 0)
		$aidsRecomendationAction = "updateaidrecomend";
	else
		$aidsRecomendationAction = "addaidrecomend";
}






?>
<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<div class="row">
    <div class="col-md-12">
  
       <div class="portlet box blue-madison">
          <div class="portlet-title">
              <div class="caption">
                  <i class="fa fa-gift"></i>تعـــديل استبـــانة العـضــو (<?php echo $eldername;?>)
              </div>
          </div>
          
          <div class="portlet-body">
              <div class="panel-group accordion" id="accordion1">
                  <div class="panel panel-default">
                      <div class="panel-heading">
                          <h4 class="panel-title">
                          <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapse_1">
                          <strong>#1 بيـانات العضو</strong> </a>
                          </h4>
                      </div>
                      <div id="collapse_1" class="panel-collapse collapse"><!--class="panel-collapse in-->
                          <div class="panel-body">
                              <div class="portlet-body form">
                                <!-- BEGIN FORM-->
                                <form action="#" id="elder_info_form" class="form-horizontal">
                                    <div class="form-body">
                                      <br/>
                                        <div class="alert alert-danger display-hide">
                                            <button class="close" data-close="alert"></button>
                                            <span id="spnMsgElder">
                                            يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                                            </span>
                                        </div>
                                        <div class="alert alert-success display-hide">
                                            <button class="close" data-close="alert"></button>
                                            تمت عملية حـفـظ البيـانات بنجـاح !
                                        </div>
                                        
                                        <input id="hdnAction" name="hdnAction" type="hidden" value="<?php echo $ction;?>" />
                                        <input id="hdnElderId" name="hdnElderId"  type="hidden" 
                                        value="<?php if(isset($elder_info_row->elder_id)) echo $elder_info_row->elder_id;?>" />
                                 
                                        <div class="form-group">
                                            <label class="control-label col-md-3">تـصنيف الحـالة <span class="required">
                                            * </span>
                                            </label>
                                            <div class="col-md-4">
                                              <select class="form-control" id="drpEldercategory" name="drpEldercategory">
                                                  <option value="">اختر...</option>
                                                  <?php
                                                  foreach($survey_Eldercategory as $eldercategoryrow)
                                                  {
                                                      $selected = '';
                                                        
                                                      if ($elder_info_row->elder_category_id == $eldercategoryrow->sub_constant_id)
                                                          $selected = 'selected="selected"';
                                                      
                                                      echo ' <option value="'.$eldercategoryrow->sub_constant_id.'" '.$selected.'>'
                                                                             .$eldercategoryrow->sub_constant_name.'</option>';
                                                                             
                                                  }
                                                  ?>
                  
                                              </select>
                                          </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">رقم الهوية <span class="required">
                                            * </span>
                                            </label>
                                            <div class="col-md-4">
                                                <input type="text" id="txtElderId" name="txtElderId" data-required="1" class="form-control"
                                                 value="<?php if(isset($elder_info_row->elder_national_id)) 
												 			echo $elder_info_row->elder_national_id;?>"
                                                />
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                          <label class="control-label col-md-3">الاســـم <span class="required">
                                          * </span>
                                          </label>
                                          <div class="col-md-2">
                                              <input type="text" id="txtFname" name="txtFname" data-required="1" class="form-control input-small" placeholder="الاسم الاول" value="<?php if(isset($elder_info_row->first_name)) echo $elder_info_row->first_name;?>"/>
                                          </div>
                                          <div class="col-md-2">
                                              <input type="text" id="txtMname" name="txtMname" data-required="1" class="form-control input-small" placeholder="اسم الاب" value="<?php if(isset($elder_info_row->middle_name)) echo $elder_info_row->middle_name;?>"/>
                                          </div>
                                          <div class="col-md-2">
                                              <input type="text" id="txtThname" name="txtThname" data-required="1" class="form-control input-small" placeholder="اسم الجد" value="<?php if(isset($elder_info_row->third_name)) echo $elder_info_row->third_name;?>"/>
                                          </div>
                                          <div class="col-md-2">
                                              <input type="text" id="txtLname" name="txtLname" data-required="1" class="form-control input-small" placeholder="اسم العائلة" value="<?php if(isset($elder_info_row->last_name)) echo $elder_info_row->last_name;?>"/>
                                          </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">تـاريخ الميـلاد <span class="required">
                                            * </span>
                                            </label>
                                            <div class="col-md-4">
                                              <div id="dvDob" class="input-group date date-picker" data-date-format="yyyy-mm-dd">
                                                <input type="text" class="form-control" readonly id="dpDob" name="dpDob" 
                                                value="<?php if(isset($elder_info_row->dob)) echo $elder_info_row->dob;?>"
                                                onchange="claculateAge()">
                                                <span class="input-group-btn">
                                                <button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
                                                </span>
                                              </div>
                                              <!-- /input-group -->
                                           </div>
                                           <div class="col-md-4">
                                             <label id="lblAge" class="control-label <?php echo $lblClass?>">
                                             <?php
											 echo $lblage;
											 ?>
                                             </label>
                                          </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">النوع الطبيعي <span class="required">
                                            * </span>
                                            </label>
                                            <div class="col-md-4">
                                                <div class="radio-list" data-error-container="#form_2_membership_error">
                                                    <label>
                                                    <input type="radio" id="rdSexMale" name="rdSex" value="1" 
                                                    <?php 
                                                        if(isset($elder_info_row->sex_id) && $elder_info_row->sex_id == 1) echo 'checked="checked"';
                                                    ?>
                                                    />
                                                    ذكـر </label>
                                                    <label>
                                                    <input type="radio" id="rdSexFemale" name="rdSex" value="2"
                                                    <?php 
                                                        if(isset($elder_info_row->sex_id) && $elder_info_row->sex_id == 2) echo 'checked="checked"';
                                                    ?>
                                                    />
                                                    انـثى </label>
                                                </div>
                                                <div id="form_2_membership_error">
                                                </div>
                                            </div>
                                        </div>
                                        
                                         <div class="form-group">
                                            <label class="control-label col-md-3">الحـالة الاجتمـاعية <span class="required">
                                            * </span>
                                            </label>
                                            <div class="col-md-4">
                                                <select class="form-control select2me" id="drpElderstatus" name="drpElderstatus">
                                                    <option value="">اختر...</option>
                                                    <?php 
                                                    foreach ($survey_Maritalstatus as $status_row)
                                                    {
                                                        $selected = '';
                                                        
                                                        if ($elder_info_row->status_id == $status_row->sub_constant_id)
                                                          $selected = 'selected="selected"';
                                                        
                                                        echo ' <option value="'.$status_row->sub_constant_id.'" '.$selected.'>'
                                                                               .$status_row->sub_constant_name.'</option>';
                                                    }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">العنوان : المحـافظة <span class="required">
                                            * </span>
                                            </label>
                                            <div class="col-md-4">
                                                <select class="form-control select2me" id="drpGovernorate" name="drpGovernorate">
                                                    <?php 
                                                    foreach ($survey_Governorate as $governorate_row)
                                                    {
                                                        $selected = '';
                                                        
                                                        if ($elder_info_row->governorate_id == $governorate_row->sub_constant_id)
                                                          $selected = 'selected="selected"';
                                                        
                                                        echo ' <option value="'.$governorate_row->sub_constant_id.'" '.$selected.'>'
                                                                               .$governorate_row->sub_constant_name.'</option>';
                                                    }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                        <label class="control-label col-md-3">المدينة <span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-4">
                                            <select class="form-control" id="drpRegion" name="drpRegion" onchange="region_change();">
                                                <option value="">اختر...</option>
												<?php 
                                                foreach ($region as $region_row)
												{
													$selected = '';
													
													if ($elder_info_row->region == $region_row->sub_constant_id)
													  $selected = 'selected="selected"';
													
													echo ' <option value="'.$region_row->sub_constant_id.'" '.$selected.'>'
																		   .$region_row->sub_constant_name.'</option>';
												}
												?>
                                                
                                             </select>
                                          </div>
                                        </div>
                                        
                                        <div class="form-group">
                                          <label class="control-label col-md-3"> الحي <span class="required">
                                          * </span>
                                          </label>
                                          <div class="col-md-4">
                                              <select class="form-control" id="drpFulladdress" name="drpFulladdress">
                                                  <option value="">اختر...</option>
												  <?php 
                                                  foreach ($fulladdress as $fulladdress_row)
												  {
													  $selected = '';
													  
													  if ($elder_info_row->full_address == $fulladdress_row->sub_constant_id)
														$selected = 'selected="selected"';
													  
													  echo ' <option value="'.$fulladdress_row->sub_constant_id.'" '.$selected.'>'
																			 .$fulladdress_row->sub_constant_name.'</option>';
												  }
												  ?>				
                                               </select>
                                           </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3">وصف العنوان بالكامل <span class="required">
                                            * </span>
                                            </label>
                                            <div class="col-md-4">
                                                <textarea name="txtAddressdetails" id="txtAddressdetails" cols="70" rows="2" class="form-control"><?php if(isset($elder_info_row->address_details)) echo $elder_info_row->address_details;?></textarea>
                                            </div>
                                    	</div>                      
                                        <div class="form-group">
                                            <label class="control-label col-md-3">رقم الهاتف &nbsp;&nbsp;&nbsp;
                                            </label>
                                            <div class="col-md-4">
                                                <input type="text" id="txtPhone" name="txtPhone" class="form-control"
                                              value="<?php if(isset($elder_info_row->phone)) echo $elder_info_row->phone;?>"
                                                />
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">رقم الجوال (1)  &nbsp;&nbsp;&nbsp;
                                            </label>
                                            <div class="col-md-4">
                                                <input type="text" id="txtMobile1" name="txtMobile1" class="form-control"
                                                value="<?php if(isset($elder_info_row->mobile_first)) echo $elder_info_row->mobile_first;?>"
                                                />
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">رقم الجوال (2)&nbsp;&nbsp;&nbsp;
                                            </label>
                                            <div class="col-md-4">
                                                <input type="text" id="txtMobile2" name="txtMobile2" class="form-control"
                                                value="<?php if(isset($elder_info_row->mobile_second)) echo $elder_info_row->mobile_second;?>"
                                                />
                                            </div>
                                        </div>
                                        
                                         <div class="form-group">
                                            <label class="control-label col-md-3">المؤهل العلمي <span class="required">
                                            * </span>
                                            </label>
                                            <div class="col-md-4">
                                               <select class="form-control select2me" id="drpEducationlevel" name="drpEducationlevel"
                                                onchange="educationlevel_change();">
                                                  <option value="">اختر...</option>
                                                    <?php 
                                                    foreach ($survey_Educationlevel as $education_level_row)
                                                    {
                                                        $selected = '';
                                                        
                                                        if ($elder_info_row->education_level_id == $education_level_row->sub_constant_id)
                                                          $selected = 'selected="selected"';
                                                        
                                                        echo ' <option value="'.$education_level_row->sub_constant_id.'" '.$selected.'>'
                                                                               .$education_level_row->sub_constant_name.'</option>';
                                                    }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div id="divSpecialization" class="form-group" 
                                        <?php if (!isset($elder_info_row->education_level_id) || 
														 $elder_info_row->education_level_id <27)
												echo 'style="display:none"';?> >
                                            <label class="control-label col-md-3">التخصص <span class="required">
                                            * </span>
                                            </label>
                                            <div class="col-md-4">
                                                <select class="form-control select2me" id="drpSpecialization" name="drpSpecialization">
                                                    <option value="">اختر...</option>
                                                    <?php 
                                                    foreach ($survey_Specialization as $specialization_row)
                                                    {
                                                        $selected = '';
                                                        
                                                        if ($elder_info_row->specialization_id == $specialization_row->sub_constant_id)
                                                          $selected = 'selected="selected"';
                                                        
                                                        echo ' <option value="'.$specialization_row->sub_constant_id.'" '.$selected.'>'
                                                                               .$specialization_row->sub_constant_name.'</option>';
                                                    }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">العمل الحالي <span class="required">
                                            * </span>
                                            </label>
                                            <div class="col-md-4">
                                                <select class="form-control select2me" id="drpCurrentjob" name="drpCurrentjob">
                                                    <option value="">اختر...</option>
                                                    <?php 
                                                    foreach ($survey_CurrentJob as $current_job_row)
                                                    {
                                                        $selected = '';
                                                        
                                                        if ($elder_info_row->current_job_id == $current_job_row->sub_constant_id)
                                                          $selected = 'selected="selected"';
                                                        
                                                        echo ' <option value="'.$current_job_row->sub_constant_id.'" '.$selected.'>'
                                                                               .$current_job_row->sub_constant_name.'</option>';
                                                    }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">العمل السابق &nbsp;&nbsp;&nbsp;
                                            </label>
                                            <div class="col-md-4">
                                                <select class="form-control select2me" id="drpPreviousjob" name="drpPreviousjob">
                                                    <option value="">اختر...</option>
                                                    <?php 
                                                    foreach ($survey_PreviousJob as $previous_job_row)
                                                    {
                                                        $selected = '';
                                                        
                                                        if ($elder_info_row->previous_job_id == $previous_job_row->sub_constant_id)
                                                          $selected = 'selected="selected"';
                                                        
                                                        echo ' <option value="'.$previous_job_row->sub_constant_id.'" '.$selected.'>'
                                                                               .$previous_job_row->sub_constant_name.'</option>';
                                                    }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">نوع التأمين الصحي <span class="required">
                                            * </span>
                                            </label>
                                            <div class="col-md-4">
                                                <select class="form-control select2me" id="drpInsurence" name="drpInsurence">
                                                    <option value="">اختر...</option>
                                                   <?php 
                                                    foreach ($survey_InsuranceType as $insurance_type_row)
                                                    {
                                                        $selected = '';
                                                        
                                                        if ($elder_info_row->insurance_type_id == $insurance_type_row->sub_constant_id)
                                                          $selected = 'selected="selected"';
                                                        
                                                        echo ' <option value="'.$insurance_type_row->sub_constant_id.'" '.$selected.'>'
                                                                               .$insurance_type_row->sub_constant_name.'</option>';
                                                    }
                                                    ?>                             
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- END FORM BODY -->
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-offset-3 col-md-9">
                                                <button type="submit" class="btn blue-madison">
                                                حـفـظ</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <!-- END FORM-->
                            </div>
                          </div> <!-- END panel-body -->
                      </div>
                  </div>
                  <div class="panel panel-default">
                      <div class="panel-heading">
                          <h4 class="panel-title">
                          <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapse_2">
                          <strong>#2 بيانات اول زيارة</strong>  </a>
                          </h4>
                      </div>
                      <div id="collapse_2" class="panel-collapse collapse">
                          <div class="panel-body">
                              <div class="portlet-body form">
                                <!-- BEGIN FORM-->
                                <form action="#" id="visit_info_form" class="form-horizontal">
                                    <div class="form-body">
                                      <br/>
                                        <div class="alert alert-danger display-hide">
                                            <button class="close" data-close="alert"></button>
                                            <span id="spnMsg">
                                            يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                                            </span>
                                        </div>
                                        <div class="alert alert-success display-hide">
                                            <button class="close" data-close="alert"></button>
                                            تمت عملية حـفـظ البيـانات بنجـاح !
                                        </div>
                                        <!-- Add Here-->
                                        <input id="hdnSurveyId" name="hdnSurveyId" type="hidden" value="<?php echo $survey_id;?>" />
                                        <div class="form-group">
                                        <label class="control-label col-md-3">تـاريخ دراسـة الحـالة <span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-4">
                                          <div class="input-group date date-picker" data-date-format="yyyy-mm-dd">
                                              <input type="text" class="form-control" readonly id="dpVisitdate" name="dpVisitdate" value="<?php if(isset($survey_info_row->visit_date)) echo $survey_info_row->visit_date;?>">
                                              <span class="input-group-btn">
                                              <button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
                                              </span>
                                          </div>
                                          <!-- /input-group -->
                                      </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">ساعة الزيارة <span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-3">
                                            <div class="input-group">
												<input type="text" id="txtVisittime" name="txtVisittime"  value="<?php if(isset($survey_info_row->visit_time)) echo $survey_info_row->visit_time;?>" 
                                                class="form-control timepicker timepicker-24" >
												<span class="input-group-btn">
												<button class="btn default" type="button"><i class="fa fa-clock-o"></i></button>
												</span>
											</div> 
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3"> سـاعة انتهاء الزيارة <span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-3">
											<div class="input-group">
												<input type="text" id="txtVisitendtime" name="txtVisitendtime" value="<?php if(isset($survey_info_row->visit_end_time)) echo $survey_info_row->visit_end_time;?>"
                                                class="form-control timepicker timepicker-24" >
												<span class="input-group-btn">
												<button class="btn default" type="button"><i class="fa fa-clock-o"></i></button>
												</span>
											</div>
										</div>
                                    </div>
                                                                                                         
                                    <div class="form-group">
                                        <label class="control-label col-md-3">اسـم البحاث <span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-4">
                                            <select class="form-control" id="drpResearcher" name="drpResearcher">
                                                <option value="">اختر...</option>
                                                <?php
												 foreach($survey_employee_info as $employee_info_row)
												 {
													 $selected = "";
													 $disabled = "";
													 if ($survey_info_row->researcher_id == $employee_info_row->national_id)
                                                          $selected = ' selected="selected" ';
													 
													 if ($employee_info_row->national_id 
														 == $survey_info_row->researcher_assistant_fst_id 
														 || $employee_info_row->national_id 
														 == $survey_info_row->researcher_assistant_sec_id)
													 		$disabled = ' disabled="disabled" ';
                                                        
                      								echo '<option value="'.$employee_info_row->national_id.'"'.$selected.$disabled.'>'
																		  .$employee_info_row->name.'</option>';
							  					  }
							 					?>

                                            </select>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">اسـم المرافق الأول &nbsp;&nbsp;&nbsp;
                                        </label>
                                        <div class="col-md-4">
                                            <select class="form-control" id="drpResearcherass1" name="drpResearcherass1">
                                                <option value="">اختر...</option>
                                                 <?php
												  foreach($survey_employee_info as $row)
												  {	
												  		$selected ="";
														$disabled = "";
													   if ($survey_info_row->researcher_assistant_fst_id == 
														   		$row->national_id) 
                                                          $selected = 'selected="selected"';
														
													   if ($row->national_id 
														 == $survey_info_row->researcher_id 
														 || $row->national_id 
														 == $survey_info_row->researcher_assistant_sec_id)
													 		$disabled = ' disabled="disabled" ';
                                                    
                      								echo '<option value="'.$row->national_id.'" '.$selected.$disabled.'>'
																		  .$row->name.'</option>';
							  					}
							 					 ?>

                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-md-3">اسـم المرافق الثاني  &nbsp;&nbsp;&nbsp;
                                        </label>
                                        <div class="col-md-4">
                                            <select class="form-control" id="drpResearcherass2" name="drpResearcherass2">
                                                <option value="">اختر...</option>
                                                 <?php
												  foreach($survey_employee_info as $row)
												  {
													  $selected ="";
													  $disabled = "";
													 if ($survey_info_row->researcher_assistant_sec_id == 
														 $row->national_id)
                                                          $selected = ' selected="selected" ';
														  
													 if ($row->national_id 
														 == $survey_info_row->researcher_id 
														 || $row->national_id 
														 == $survey_info_row->researcher_assistant_fst_id)
													 		$disabled = ' disabled="disabled" ';
                                                      
                      								echo '<option value="'.$row->national_id.'"'.$selected.$disabled.'>'
																		  .$row->name.'</option>';
							  					}
							 					 ?>

                                            </select>
                                        </div>
                                    </div>
                                    </div> 
                                    <!-- END FORM BODY -->
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-offset-3 col-md-9">
                                                <button id="btnSavefile" type="submit" class="btn blue-madison">
                                                حـفـظ</button>
                                                
                                            </div>
                                        </div>
                                    </div>
                               </form>
                               <!-- END FORM-->
                          </div> <!-- END portlet-body -->
                          </div> <!-- END panel-body -->
                      </div>
                  </div>
                  <div class="panel panel-default">
                      <div class="panel-heading">
                          <h4 class="panel-title">
                          <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapse_3">
                          <strong>#3 بيانات الاسـرة</strong>  </a>
                          </h4>
                      </div>
                      <div id="collapse_3" class="panel-collapse collapse">
                          <div class="panel-body">
                            <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            <form action="#" id="familymember_update_form" class="form-horizontal">
                              <div class="form-body">
                                <br/>
                                  <div class="alert alert-danger display-hide">
                                      <button class="close" data-close="alert"></button>
                                      يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                                  </div>
                                  <div class="alert alert-success display-hide">
                                      <button class="close" data-close="alert"></button>
                                        تـم عملية حـفـظ البيـانات بنجـاح !
                                  </div>
                                  <div class="note note-info">
                                      <p><b> عــدد أفــــراد الأســــرة ( <span id="spnCountFamily"> 
                                                                         <?php echo count($familyMember_info);?> </span> )</b></p>
                                  </div>
   <!------------------------------------------TABLE------------------------------------------------>
                                    <div class="table-scrollable" style="white-space: nowrap;">
                                        <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                        <tr class="bg-grey-steel">
                                            <th scope="col">
                                                 #
                                            </th>
                                            <th scope="col">
                                                 الاسـم
                                                 <span class="font-red">
                                        		* </span>
                                            </th>
                                            <th scope="col">
                                                 رقم الهوية
                                                 <span class="font-red">
                                        		* </span>
                                            </th>
                                            <th scope="col">
                                                 النوع الطبيعي
                                            </th>
                                            <th scope="col">
                                                 صلة القرابة
                                                 <span class="font-red">
                                        		* </span>
                                            </th>
                                            <th scope="col">
                                                 الحالة الاجتماعية
                                                 <span class="font-red">
                                        		* </span>
                                            </th>
                                            <th scope="col">
                                                 تاريخ الميلاد
                                                 <span class="font-red">
                                        		* </span>
                                            </th>
                                            <th scope="col">
                                                 المستوى التعليمي
                                                 <span class="font-red">
                                        		* </span>
                                            </th>
                                            <th scope="col">
                                                 الحالة الصحية
                                                 <span class="font-red">
                                        		* </span>
                                            </th>
                                            <th scope="col">
                                                 المهنة
                                            </th>
                                            <th scope="col">
                                                 الدخل بالشيكل
                                            </th>
                                            <th scope="col">&nbsp;
                                                 
                                            </th>
                                        </tr>
                                        <tr>
                                            <th>&nbsp;
                                                 
                                            </th>
                                            <th>
                                                <input type="text" id="txtMembername" name="txtMembername" data-required="1" 
                                                class="form-control input-sm input-small"/>
                                            </th>
                                            <th>
                                                 <input type="text" id="txtMemberId" name="txtMemberId" data-required="1" 
                                                 class="form-control input-sm input-small" />
                                            </th>
                                            <th>
                                                 <div class="radio-list" data-error-container="#form_2_membership_error">
                                                        <label>
                                                        <input type="radio" id="rdMemSexMale" name="rdMemSex" value="1" checked="checked"/>
                                                        ذكـر </label>
                                                        <label>
                                                        <input type="radio" id="rdMemSexFemale" name="rdMemSex" value="2"/>
                                                        انـثى </label>
                                                    </div>
                                                    <div id="form_2_membership_error">
                                                    </div>
                                                
                                            </th>
                                            <th>
                                                 <select id="drpMemRelationship" name="drpMemRelationship"
                                                 class="form-control input-sm input-xsmall" >
                                                        <option value="">اختر...</option>
                                                        <?php
                                                         foreach($survey_Relationship as $row)
                                                         {
                                                            echo '<option value="'.$row->sub_constant_id.'">'
                                                                    .$row->sub_constant_name.'</option>';
                                                         }
                                                         ?>
                                                  </select>
                                            </th>
                                            <th>
                                                 <select id="drpMemStatus" name="drpMemStatus" 
                                                   class="form-control input-sm input-xsmall" >
                                                         <option value="">اختر...</option>
                                                         <?php
                                                          foreach($survey_Maritalstatus as $row)
                                                          {
                                                            echo '<option value="'.$row->sub_constant_id.'">'
                                                                    .$row->sub_constant_name.'</option>';
                                                          }
                                                         ?>
                                                </select>
                                            </th>
                                            <th>
                                                 <div class="input-group date date-picker input-small margin-top-10" 
                                                      data-date-format="yyyy-mm-dd">
                                                        <input type="text" class="form-control" readonly id="dpMemDob" name="dpMemDob">
                                                        <span class="input-group-btn">
                                                        <button class="btn default" type="button">
                                                        <i class="fa fa-calendar"></i></button>
                                                        </span>
                                                 </div>
                                            </th>
                                            <th>
                                                 <select id="drpMemEdulevel" name="drpMemEdulevel" 
                                                   class="form-control input-sm input-xsmall" >
                                                        <option value="">اختر...</option>
                                                        <?php
                                                          foreach($survey_Educationlevel as $row)
                                                          {
                                                            echo '<option value="'.$row->sub_constant_id.'">'
																	.$row->sub_constant_name.'</option>';
                                                          }
                                                         ?>
                                                 </select>
                                            </th>
                                            <th>
                                                 <select id="drpMemHealth" name="drpMemHealth"
                                                   class="form-control input-sm input-xsmall" >
                                                        <option value="">اختر...</option>
                                                        <?php
                                                          foreach($survey_Health as $row)
                                                          {
                                                            echo '<option value="'.$row->sub_constant_id.'">'
                                                                    .$row->sub_constant_name.'</option>';
                                                          }
                                                        ?>
                                                    </select>
                                            </th>
                                            <th>
                                                  <input type="text" id="txtMemjob" name="txtMemjob" 
                                                    class="form-control input-sm input-small"/>
                                            </th>
                                            <th>
                                                 <input type="text" id="txtMemincome" name="txtMemincome" 
                                                   class="form-control input-sm input-xsmall"/>
                                            </th>
                                            <th>
                                                 <button id="btnAddMem" name="btnAddMem" type="submit" 
                                   					class="btn btn-circle green-turquoise btn-sm">
                                                <i id="iConst" class="fa fa-plus"></i></button>
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody id="tbdFamilyMember">
                                        <?php 
										
											$i=1;
											foreach($familyMember_info as $row)
											{
												
												echo "<tr>";
												echo "<td>" . $i++ 					. "</td>";
												echo "<td>" . $row->member_name 	. "</td>";
												echo "<td>" . $row->member_id 		. "</td>";
												echo "<td>" . $row->sex 			. "</td>";
												echo "<td>" . $row->relationship 	. "</td>";
												echo "<td>" . $row->fmstatus 		. "</td>";
												echo "<td>" . $row->dob 			. "</td>";
												echo "<td>" . $row->education_level . "</td>";
												echo "<td>" . $row->health_status 	. "</td>";
												echo "<td>" . $row->job 			. "</td>";
												echo "<td>" . $row->income_shekel 	. "</td>";
												echo '<td><button id="btnDeletedoc" name="btnDeletedoc" type="button" 
																  class="btn btn-circle red-sunglo btn-sm" 
																  onclick="deleteFamilybyId('. $row->family_member_id .')">
																   <i id="iConst" class="fa fa-close"></i>
														  </button></td>';
												echo "</tr>";
												
											}

										?>
                                        </tbody>
                                     	</table>
                        		</div>
   <!----------------------------------------END TABLE---------------------------------------------->
   							    </div>
                              </form>
                            </div> <!--END panel-body-->
                          </div>
                      </div>
                  </div>
                  <div class="panel panel-default">
                      <div class="panel-heading">
                          <h4 class="panel-title">
                          <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapse_4">
                          <strong>#4 بيـانات الاستبـــانة </strong>  </a>
                          </h4>
                      </div>
                      <div id="collapse_4" class="panel-collapse collapse">
                          <div class="panel-body">
                              <div class="row">
                                      <div class="col-md-3 col-sm-3 col-xs-3">
                                          <ul class="nav nav-tabs tabs-left">
                                             <li class="active">
                                                  <a href="#tab_6_3" data-toggle="tab">
                                                  الحـالة الصحية </a>
                                              </li>
                                              <li>
                                                  <a href="#tab_6_4" data-toggle="tab">
                                                  مصـادر الدخل </a>
                                              </li>
                                              <li>
                                                  <a href="#tab_6_5" data-toggle="tab">
                                                  حـالة سكن الأسرة </a>
                                              </li>
                                              <li>
                                                  <a href="#tab_6_6" data-toggle="tab">
                                                  حـالة غرفة المسن </a>
                                              </li>
                                              <li>
                                                  <a href="#tab_6_7" data-toggle="tab">
                                                  علاج المسن </a>
                                              </li>
                                              <li>
                                                  <a href="#tab_6_8" data-toggle="tab">
                                                  عـلاقـة الأسـرة مع المسن </a>
                                              </li>
                                              <li>
                                                  <a href="#tab_6_9" data-toggle="tab">
                                                  عـلاقـة المسن بالأسرة والمجتـمع</a>
                                              </li>
                                              <li>
                                                  <a href="#tab_6_12" data-toggle="tab">
                                                  علاقة الاسرة مع الباحث</a>
                                              </li>
                                              <li>
                                                  <a href="#tab_6_10" data-toggle="tab">
                                                  حـالة اسرة الاجتماعية والنفسية</a>
                                              </li>
                                              <li>
                                                  <a href="#tab_6_11" data-toggle="tab">
                                                  التشغيل وتحسين مستوى الدخل</a>
                                              </li>
                                          </ul>
                                     
                                     </div><!-- END col-md-3 (Tab Header)-->
                                     <div class="col-md-9 col-sm-9 col-xs-9">
                        			 <div class="tab-content">
                                     <div class="tab-pane active" id="tab_6_3">
                                     	<div class="portlet-body form">
                                        <!-- BEGIN FORM-->
                                     <form action="#" id="health_status_update_form" class="form-horizontal">
                                     <div class="form-body">
                                        <br/>
                                          <div class="alert alert-danger display-hide">
                                              <button class="close" data-close="alert"></button>
                                              يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                                          </div>
                                          <div class="alert alert-success display-hide">
                                              <button class="close" data-close="alert"></button>
                                                تـم عملية حـفـظ البيـانات بنجـاح !
                                          </div>
                                     	<div class="col-md-12">
                                        <input id="hdnElderDiseaseId" name="hdnElderDiseaseId" type="hidden" 
                                        value="<?php if(isset($elderDiseaseDet_row->elder_disease_details))
											echo $elderDiseaseDet_row->elder_disease_id; ?>" />
                                     	<table class="table table-bordered table-striped">
                                        <thead>
                                          <tr>
                                            <th>
                                              <div class="col-md-3">
                                                 الحـــالة الصحيـــة 
                                              </div>
                                              <div class="col-md-7">
                                                <select id="drpDisease" name="drpDisease"
                                                   class="form-control input-large" >
                                                    <option value="">اختر...</option>
                                                    <?php
                                                     foreach($survey_ElderDisease as $row)
                                                     {
														 $disabled = '';
														 foreach($elderDisease_info as $elderDisease_row)
														 {
															 if ($row->sub_constant_id == $elderDisease_row->disease_id)
															 {
															 	$disabled = 'disabled="disabled"';
																break;
															 }
														 }
                                                         echo '<option value="'.$row->sub_constant_id.'" '.$disabled.'>'
                                                                .$row->sub_constant_name.'</option>';
                                                      }
                                                    ?>
                                                </select>
                                              </div>
                                              <div class="col-md-2">
                                                <button id="btnAdddisease" name="btnAdddisease" type="button" class="btn btn-circle green-turquoise btn-sm" onclick="add_elder_disease_u()">
                                                <i id="iConst" class="fa fa-plus"></i></button> 
                                              </div>
                                            </th>
                                          </tr>
                                         </thead>
                                         <tbody id="tbdElderDisease">
                                        <?php 
										foreach($elderDisease_info as $row)
											{
												
												echo '<tr>';
												echo '<td>';
												echo '<div class="col-md-11">';
												echo '<span class="font-blue">' . $row->disease .'</span></div>';
												echo '<div class="col-md-1"><button id="btnDeletedoc" 
														name="btnDeletedoc" type="button" 
														class="btn btn-circle red-sunglo btn-sm" 
														onclick="delete_elder_disease('. $row->elder_disease_det_id .','. $row->disease_id .')">
																	   <i id="iConst" class="fa fa-close"></i>
															  </div>';
												echo "</td>";
												echo "</tr>";
											}
																			
										
										
										?> 
                                          
                                         </tbody>
                                         </table>
                                         <table class="table table-bordered table-striped">
                                          <thead>
                                            <tr>
                                              <th>
                                              	<div class="form-group">
                                                    <label class="control-label col-md-3"><b>
                                                    تــفاصيـل الحــالة المـرضيـة </b>
                                                    </label>
                                                    <div class="col-md-6">
                                                       <textarea id="txtarDiseaasedet" name="txtarDiseaasedet" 
                                                        class="form-control input-large"><?php 
														if(isset($elderDiseaseDet_row->elder_disease_details)) 
															echo $elderDiseaseDet_row->elder_disease_details;?></textarea>
                                                    </div>
                                                    <div class="col-md-2">
                                                    	<button id="btnAdddiseaasedet" name="btnAdddiseaasedet" type="button" 
								  							class="btn btn-circle green-turquoise btn-sm" 
								  							onclick="add_disease_details_u()">
								   							<i id="iConst" class="fa fa-check"></i></button>
						  							</div>
                                                </div>  
                                              </th>
                                            </tr>
                                          </thead>
                                          </table>
                                         </div> <!-- END col-12 -->
                                        </div>
                                        </form>
                                      </div> 
                                     </div><!-- END tab_6_3-->
                                     <!-- ** END Health Status ** -->
                                     <!-- ** Income Resources ** -->
                                     <div class="tab-pane fade" id="tab_6_4">
                                     <div class="portlet-body form">
                                        <!-- BEGIN FORM-->
                                     <form action="#" id="income_resources_update_form" class="form-horizontal">
                                     <div class="form-body">
                                        <br/>
                                          <div class="alert alert-danger display-hide">
                                              <button class="close" data-close="alert"></button>
                                              يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                                          </div>
                                          <div class="alert alert-success display-hide">
                                              <button class="close" data-close="alert"></button>
                                                تـم عملية حـفـظ البيـانات بنجـاح !
                                          </div>
                                     <fieldset><legend>تفاصيل الدخل</legend>
                                     <input id="hdnIncomeResourcesId" name="hdnIncomeResourcesId" type="hidden" 
                                     	value="<?php if (isset($incomeResources_row->income_resources_id) )
												echo $incomeResources_row->income_resources_id;?>" />
                                     <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                          <tr class="bg-grey-steel">
                                            <th>
                                            	#
                                            </th>
                                            <th>
                                            	مصدر الدخل <span class="font-red">
                                          * </span>
                                            </th>
                                            <th>
                                            	القيمة المالية للدخل 
                                            </th>
                                            <th>
                                            	المساعدة العينية
                                            </th>
                                            <th>
                                            	التقييم المالي<br />
                                                للمساعدات العينية
                                            </th>
                                            <th>&nbsp;
                                            	
                                            </th>
                                          </tr>
                                          <tr>
                                            <th>&nbsp;
                                            	
                                            </th>
                                            <th>
                                              <select class="form-control input-sm" id="drpIncomeSource" name="drpIncomeSource">
                                                  <option value="">اختر...</option>
                                                  <?php
                                                    foreach($survey_IncomeSource as $row)
                                                    {
														$disabled = "";
														foreach($incomeResources_info as $incomeResources_row)
														{
														  if ($row->sub_constant_id == $incomeResources_row->resource_id
															  && $row->sub_constant_id != 75)
															  $disabled = ' disabled="disabled" ';
														}
														
														echo '<option value="'.$row->sub_constant_id.'"'.$disabled.'>'
													  			.$row->sub_constant_name.'</option>';
                                                  	}
                                                   ?>
                                              </select>
                                              <select class="form-control input-sm" id="drpOrganization" name="drpOrganization"
                                               style="display:none">
                                                  <option value="">اختر الجمعية ...</option>
                                                  <?php
                                                    foreach($survey_Organization as $row)
                                                    {
														$disabled = "";
														foreach($incomeResources_info as $incomeResources_row)
														{
														  if ($row->sub_constant_id == $incomeResources_row->organization_id)
															  $disabled = ' disabled="disabled" ';
														}
                                                      echo '<option value="'.$row->sub_constant_id.'"'.$disabled.'>'
													  			.$row->sub_constant_name.'</option>';
                                                  	}
                                                   ?>
                                              </select>
                                            </th>
                                            <th>
                                            	<input type="text" id="txtCashincome" name="txtCashincome" 
                                                  data-required="1" class="form-control input-sm input-xsmall"/>
                                            </th>
                                            <th>
                                            	<input type="text" id="txtPackageincome" name="txtPackageincome" 
                                                  data-required="1" class="form-control input-sm"/>
                                            </th>
                                            <th>
                                            	<input type="text" id="txtPackagecashvalue" name="txtPackagecashvalue" 
                                                  data-required="1" class="form-control input-sm input-xsmall"/>
                                            </th>
                                            <th>
                                            	<button id="btnAddincomeresource" name="btnAddincomeresource" type="button" 
								  							class="btn btn-circle green-turquoise btn-sm" 
								  							onclick="add_income_resource_det_u()">
								   							<i id="iConst" class="fa fa-check"></i></button>
                                            </th>
                                          </tr>
                                        </thead>
                                        <tbody id="tbdIncomeSourceDet">
										<?php
                                        $i=1;
                                        $j=1;
                                        $org_row = "";
                                        $total_cash = 0;
                                        $total_package = 0;
                                        foreach($incomeResources_info as $row)
                                        {
                                            $total_cash = $total_cash + $row->cash_income;
                                            $total_package = $total_package + $row->package_cash_value;
                                            
                                            if($row->resource_id == 75)
                                            {
                                                if ($j == 1)
                                                {
                                                    $org = $row->resource;
                                                }
                                                $org_row = $org_row . '<tr><td>' . $j++ . '- ' . $row->organization . '</td>'
                                                                    . '<td>' . $row->cash_income . '</td>'
                                                                    . '<td>' . $row->package_income . '</td>'
                                                                    . '<td>' . $row->package_cash_value . '</td>'
                                                                    . '<td><div class="col-md-1">
																	<button id="btnDeletedoc" name="btnDeletedoc" type="button" 
                                                                          class="btn btn-circle red-sunglo btn-sm" 
                                                                          onclick="delete_income_resource_det('
																				.$row->income_resources_details_id .','
                                                                                .$row->resource_id .',\''
                                                                                . $row->organization_id .'\')">
                                                                           <i id="iConst" class="fa fa-close"></i></button>
                                                                         </div>
                                                                  </td></tr>';
                                        
                                            }
                                            else
                                            {
                                                echo '<tr>';
                                                echo '<td>' . $i++ . '</td>';
                                                echo '<td>' . $row->resource . '</td>';
                                                echo '<td>' . $row->cash_income . '</td>';
                                                echo '<td>' . $row->package_income . '</td>';
                                                echo '<td>' . $row->package_cash_value . '</td>';
                                                echo '<td><div class="col-md-1">
													  <button id="btnDeletedoc" name="btnDeletedoc" type="button" 
                                                                      class="btn btn-circle red-sunglo btn-sm" 
                                                                      onclick="delete_income_resource_det('
																			. $row->income_resources_details_id .','
                                                                            . $row->resource_id .',\''
                                                                            . $row->organization_id .'\')">
                                                                       <i id="iConst" class="fa fa-close"></i></button>
                                                              </div>';
                                                echo "</td>";
                                                echo "</tr>";
                                            }
                                            
                                        }
                                        
                                        if ($j > 1)
                                        {
                                            echo '<tr>';
                                            echo '<td rowspan="' .$j. '">' . $i++ . '</td>';
                                            echo '<td> ' . $org . ' </td>';
                                            echo '<td> &nbsp; </td>';
                                            echo '<td> &nbsp; </td>';
                                            echo '<td> &nbsp; </td>';
                                            echo '<td> &nbsp; </td>';
                                            echo "</tr>";
                                            echo $org_row;
                                        }
                                        
                                        // Total Row
                                        echo '<tr class="bg-grey-steel">';
                                        echo '<td> &nbsp; </td>';
                                        echo '<td> المــجـموع الكـلي </td>';
                                        echo '<td> '.$total_cash.' </td>';
                                        echo '<td> &nbsp; </td>';
                                        echo '<td> '.$total_package.' </td>';
                                        echo '<td> &nbsp; </td>';
                                        echo "</tr>";
                                        ?>
                                        </tbody>
                                     </table>
                                     </fieldset>
                              		 <fieldset><legend>ملخص الدخل</legend>
                                     
                                        
                                        <div class="form-group">
                                          <label class="control-label col-md-3">المجموع الكلي للدخل  <span class="required">
                                          * </span>
                                          </label>
                                          <div class="col-md-4">
                                            <input type="text" id="txtTotalincome" name="txtTotalincome" data-required="1" class="form-control" value="<?php if(isset($incomeResourcesDetails_row->total_income)) echo $incomeResourcesDetails_row->total_income;?>"/>
                                          </div>
                                        </div>
                                        
                                        <div class="form-group">
                                          <label class="control-label col-md-3">حصة المسن من دخل الأسرة   <span class="required">
                                          * </span>
                                          </label>
                                          <div class="col-md-4">
                                            <input type="text" id="txtElderportion" name="txtElderportion" data-required="1" class="form-control" value="<?php if(isset($incomeResourcesDetails_row->elder_portion)) echo $incomeResourcesDetails_row->elder_portion;?>"/>
                                          </div>
                                        </div>
                                        
                                    
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-offset-3 col-md-9">
                                                <button type="button" class="btn blue-madison" onclick="edit_income_resource_u()">
                                                حـفـظ</button>
                                            </div>
                                        </div>
                                    </div>
                                     
                                    
                                     </fieldset><!-- END fieldset Summery-->
                                     </div>
                                     </form>
                                     </div>
                                     </div><!-- END tab_6_4-->
                                     <!-- ** END Income Resources ** -->
                                   	 <!-- ** Home Status ** -->
                                     <div class="tab-pane fade" id="tab_6_5">
                                     <div class="portlet-body form">
                                        <!-- BEGIN FORM-->
                                     <form action="#" id="home_status_update_form" class="form-horizontal">
                                     <div class="form-body">
                                        <br/>
                                          <div class="alert alert-danger display-hide">
                                              <button class="close" data-close="alert"></button>
                                              يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                                          </div>
                                          <div class="alert alert-success display-hide">
                                              <button class="close" data-close="alert"></button>
                                                تـم عملية حـفـظ البيـانات بنجـاح !
                                          </div>
                                          <input id="hdnHomeStatusAction" name="hdnHomeStatusAction" type="hidden" 
                                          value="<?php echo $homeStatusction;?>" />
                                          <input id="hdnHomeStatusId" name="hdnHomeStatusId" type="hidden" 
                                          value="<?php if(isset($homeStatus_row->home_status_id))
										  	echo $homeStatus_row->home_status_id; ?>" />
                                          <div class="form-group">
                                              <label class="control-label col-md-3">الوضع العام <span class="required">
                                               * </span>
                                               </label>
                                              <div class="col-md-4">
                                                  <select class="form-control" id="drpHomeStatus" name="drpHomeStatus">
                                                    <option value="">اختر...</option> 
												    <?php
                                                   
                                                    foreach($survey_HomeStatus as $survey_HomeStatus_row)
                                                    {
                                                        $selected="";
                                                        if ($homeStatus_row->home_situation_id == 
                                                            $survey_HomeStatus_row->sub_constant_id)
                                                        	$selected = 'selected="selected"';
                                                        
                                                        echo '<option value="'.$survey_HomeStatus_row->sub_constant_id.'" '
                                                                  .$selected.'>'
                                                              .$survey_HomeStatus_row->sub_constant_name.'</option>';           
                                                    }
                                                   ?>
    
                                                </select>
                                              </div>
                                          </div>
                                          
                                          <div class="form-group">
                                              <label class="control-label col-md-3">نوع السكن <span class="required">
                                               * </span>
                                               </label>
                                              <div class="col-md-4">
                                                  <select class="form-control" id="drpHomeType" name="drpHomeType">
                                                    <option value="">اختر...</option>
    
                                                     <?php
 													 $selected="";
                                                      foreach($survey_HomeType as $survey_HomeType_row)
                                                      {
													  if ($homeStatus_row->home_type_id == $survey_HomeType_row->sub_constant_id)
                                                          $selected = 'selected="selected"';
                                                        echo '<option value="'.$survey_HomeType_row->sub_constant_id.'"'.$selected.'>'.$survey_HomeType_row->sub_constant_name.'</option>';
       													 $selected="";
													}
                                                     ?>
                                                </select>
                                              </div>
                                          </div>
                                          
                                          <div class="form-group">
                                              <label class="control-label col-md-3">نوع السقف <span class="required">
                                               * </span>
                                               </label>
                                              <div class="col-md-4">
                                                  <select class="form-control" id="drpCeilingType" name="drpCeilingType">
                                                    <option value="">اختر...</option>
                                                      <?php
  													 
                                                      foreach($survey_CeilingType as $survey_CeilingType_row)
                                                      {
														  $selected="";
														  if ($homeStatus_row->ceiling_type_id == 
															  $survey_CeilingType_row->sub_constant_id)
															  $selected = 'selected="selected"';
															  
													   echo '<option value="'.$survey_CeilingType_row->sub_constant_id.'" '
													   		   .$selected.'>'.$survey_CeilingType_row->sub_constant_name.'</option>';
                                                    
													}
                                                     ?>
                                                </select>
                                              </div>
                                          </div>
                                          
                                          <div id="dvCeilingDescription" class="form-group" 
                                          <?php 
										  	if (!isset($homeStatus_row->ceiling_type_id) || 
													  $homeStatus_row->ceiling_type_id != 92)
												echo 'style="display:none"';
										  ?>
                                          >
                                              <label class="control-label col-md-3">نوع السقف توضيح<span class="required">
                                               * </span>
                                               </label>
                                              <div class="col-md-4">
                                                  <input type="text" id="txtCeilingdescription" name="txtCeilingdescription"
                                                   data-required="1" class="form-control" value="<?php if(isset($homeStatus_row->ceiling_description)) echo $homeStatus_row->ceiling_description;?>"/>
                                              </div>
                                          </div>
                                          
                                          <div class="form-group">
                                              <label class="control-label col-md-3">مستوى الأثاث <span class="required">
                                               * </span>
                                               </label>
                                              <div class="col-md-4">
                                                  <select class="form-control" id="drpFurnitureLevel" name="drpFurnitureLevel">
                                                    <option value="">اختر...</option>
                                                    <?php
													$selected="";
                                                      foreach($survey_FurnitureLevel as $survey_FurnitureLevel_row)
                                                      {
													  if ($homeStatus_row->furniture_level_id== $survey_FurnitureLevel_row->sub_constant_id)
                                                          $selected = 'selected="selected"';
                                                        echo '<option value="'.$survey_FurnitureLevel_row->sub_constant_id.'"'.$selected.'>'.$survey_FurnitureLevel_row->sub_constant_name.'</option>';
														$selected="";
                                                      }
                                                     ?>
                                                </select>
                                              </div>
                                          </div>
                                          
                                          <div id="dvFurnitureNeeds" class="form-group"
                                          <?php
										  if (!isset($homeStatus_row->furniture_level_id) ||
													$homeStatus_row->furniture_level_id != 96)
										  	echo 'style="display:none"';
										  ?>
                                          >
                                              <label class="control-label col-md-3">أذكر هذه الضروريات <span class="required">
                                               * </span>
                                               </label>
                                              <div class="col-md-4">
                                                   <textarea id="txtarFurnitureneeds" name="txtarFurnitureneeds" 
                                                        class="form-control input-large"><?php if(isset($homeStatus_row->furniture_needs)) echo $homeStatus_row->furniture_needs;?></textarea>
                                              </div>
                                          </div>
                                          
                                      </div>
                                      <!-- END FORM BODY -->
                                      <div class="form-actions">
                                          <div class="row">
                                              <div class="col-md-offset-3 col-md-9">
                                                  <button type="submit" class="btn blue-madison">
                                                  حـفـظ</button>
                                              </div>
                                          </div>
                                      </div>
                                      </form>
                                          <!-- END FORM-->
                                     </div>
                                     </div><!-- END tab_6_5-->
                                     <!-- ** END Home Status **-->
                                     <!-- ** Elder Room **-->
                                     <div class="tab-pane fade" id="tab_6_6">
                                     <div class="portlet-body form">
                                    <!-- BEGIN FORM-->
                                     <form action="#" id="room_status_update_form" class="form-horizontal">
                                     <div class="form-body">
                                      <br/>
                                        <div class="alert alert-danger display-hide">
                                            <button class="close" data-close="alert"></button>
                                            يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                                        </div>
                                        <div class="alert alert-success display-hide">
                                            <button class="close" data-close="alert"></button>
                                            تـم عملية حـفـظ البيـانات بنجـاح !
                                        </div>
                                        <input id="hdnElderRoomAction" name="hdnElderRoomAction" type="hidden" 
                                          value="<?php echo $elderRoomaction;?>" />
                                        <input id="hdnElderRoomId" name="hdnElderRoomId" type="hidden" 
                                          value="<?php if(isset($elderRoom_row->elder_room_id)) 
										  	echo $elderRoom_row->elder_room_id; ?>" />
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">وصف السكن بالتفصيل للمسن <span class="required">
                                             * </span>
                                             </label>
                                            <div class="col-md-4">
                                                <select class="form-control" id="drpElderHometype" name="drpElderHometype">
                                                  <option value="">اختر...</option>
                                                   <?php
												   $selected="";
                                                    foreach($survey_Hometype as $survey_Hometype_row)
                                                    {  
														$selected="";
														if ($elderRoom_row->home_type_id == $survey_Hometype_row->sub_constant_id)
                                                          $selected = 'selected="selected"';
														
                                         				echo '<option value="'.$survey_Hometype_row->sub_constant_id.'"'.$selected.'>'
													  		.$survey_Hometype_row->sub_constant_name.'</option>';
                                                  
												  }
                                                   ?>
                                              </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">وصف حالة المسن في الأسرة <span class="required">
                                             * </span>
                                             </label>
                                            <div class="col-md-4">
                                                <select class="form-control" id="drpRoomtype" name="drpRoomtype">
                                                  <option value="">اختر...</option>
                                                   <?php
												   $selected="";
                                                    foreach($survey_Roomtype as $survey_Roomtype_row)
                                                    {
														if ($elderRoom_row->room_type_id == $survey_Roomtype_row->sub_constant_id)
                                                          $selected = 'selected="selected"';
														
                                                      echo '<option value="'.$survey_Roomtype_row->sub_constant_id.'"'.$selected.'>'.$survey_Roomtype_row->sub_constant_name.'</option>';
													   $selected="";
                                                  }
                                                   ?>
                                              </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">وصف ملابس وأغطية المسن <span class="required">
                                             * </span>
                                             </label>
                                            <div class="col-md-4">
                                                <select class="form-control" id="drpClothes" name="drpClothes">
                                                  <option value="">اختر...</option>
                                                  <?php
												  $selected="";
                                                    foreach($survey_Clothes as $survey_Clothes_row)
                                                    {
														if ($elderRoom_row->clothes_covers_status_id == $survey_Clothes_row->sub_constant_id)
                                                          $selected = 'selected="selected"';
                                                      echo '<option value="'.$survey_Clothes_row->sub_constant_id.'"'.$selected.'>'.$survey_Clothes_row->sub_constant_name.'</option>';
                                                  $selected="";
												  }
                                                   ?>
                                              </select>
                                              </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">تهوية الغرفة <span class="required">
                                             * </span>
                                             </label>
                                            <div class="col-md-4">
                                                <select class="form-control" id="drpVentilation" name="drpVentilation">
                                                  <option value="">اختر...</option>
                                                  <?php
												  $selected="";
												  
                                                    foreach($survey_Ventilation as $survey_Ventilation_row)
                                                    {if ($elderRoom_row->room_ventilation_id == $survey_Ventilation_row->sub_constant_id)
                                                          $selected = 'selected="selected"';
														
                                                      echo '<option value="'.$survey_Ventilation_row->sub_constant_id.'"'.$selected.'>'.$survey_Ventilation_row->sub_constant_name.'</option>';
                                                  $selected="";
												  }
                                                   ?>
                                              </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">اضاءة الغرفة <span class="required">
                                             * </span>
                                             </label>
                                            <div class="col-md-4">
                                                <select class="form-control" id="drpLighting" name="drpLighting">
                                                  <option value="">اختر...</option>
                                                     <?php
													 $selected="";
                                                    foreach($survey_Lighting as $survey_Lighting_row)
                                                    {if ($elderRoom_row->room_lighting_id == $survey_Lighting_row->sub_constant_id)
                                                          $selected = 'selected="selected"';
														
                                                      echo '<option value="'.$survey_Lighting_row->sub_constant_id.'"'.$selected.'>'.$survey_Lighting_row->sub_constant_name.'</option>';
                                                  $selected="";
												  }
                                                   ?>
                                              </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">يوجد خزانة ملابس <span class="required">
                                             * </span>
                                             </label>
                                            <div class="col-md-4">
                                                <select class="form-control" id="drpCloset" name="drpCloset">
                                                  <option value="">اختر...</option>
                                                        <?php
														$selected="";
                                                    foreach($survey_Choice as $survey_Choice_row)
                                                    {if ($elderRoom_row->has_closet == $survey_Choice_row->sub_constant_id)
                                                          $selected = 'selected="selected"';
                                      echo '<option value="'.$survey_Choice_row->sub_constant_id.'"'.$selected.'>'.$survey_Choice_row->sub_constant_name.'</option>';
                                                  $selected="";
												  }
                                                   ?>
                                              </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">يوجد سرير وفرشة مناسبة <span class="required">
                                             * </span>
                                             </label>
                                            <div class="col-md-4">
                                                <select class="form-control" id="drpBed" name="drpBed">
                                                  <option value="">اختر...</option>
                                                  <?php
												  $selected="";
                                                    foreach($survey_Choice as $survey_Choice_row)
                                                    {if ($elderRoom_row->has_good_bed == $survey_Choice_row->sub_constant_id)
                                                          $selected = 'selected="selected"';
                                                      echo '<option value="'.$survey_Choice_row->sub_constant_id.'"'.$selected.'>'.$survey_Choice_row->sub_constant_name.'</option>';
                                                  $selected="";
												  }
                                                   ?>
                                              </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">يوجد مكان مخصص للأدوية <span class="required">
                                             * </span>
                                             </label>
                                            <div class="col-md-4">
                                                <select class="form-control" id="drpCupboard" name="drpCupboard">
                                                  <option value="">اختر...</option>
                                                  <?php
												  $selected="";
                                                    foreach($survey_Choice as $survey_Choice_row)
                                                    {if ($elderRoom_row->has_medicine_cupboard == $survey_Choice_row->sub_constant_id)
                                                          $selected = 'selected="selected"';
                                                      echo '<option value="'.$survey_Choice_row->sub_constant_id.'"'.$selected.'>'.$survey_Choice_row->sub_constant_name.'</option>';
                                                  $selected="";
												  }
                                                   ?>
                                              </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">غرفة المسن بحاجة إلى صيانة / ترميم <span class="required">
                                             * </span>
                                             </label>
                                            <div class="col-md-4">
                                                <select class="form-control" id="drpMaintenance" name="drpMaintenance">
                                                  <option value="">اختر...</option>
                                                  <?php
												  $selected="";
                                                    foreach($survey_Choice as $survey_Choice_row)
                                                    {
														if ($elderRoom_row->room_need_maintenance == $survey_Choice_row->sub_constant_id)
                                                          $selected = 'selected="selected"';
                                                      echo '<option value="'.$survey_Choice_row->sub_constant_id.'"'.$selected.'>'.$survey_Choice_row->sub_constant_name.'</option>';
													  $selected="";
                                                  }
                                                   ?>
                                              </select>
                                            </div>
                                        </div>
                                        
                                        <div id="dvRoommaintinancedet" class="form-group" 
                                        <?php
										if (isset($elderRoom_row->room_need_maintenance) &&
												  $elderRoom_row->room_need_maintenance != 110)
											echo 'style="display:none"';
										?>
                                        >
                                            <label class="control-label col-md-3">توضيح نوع الصيانة والترميم المطلوب <span class="required">
                                             * </span>
                                             </label>
                                            <div class="col-md-4">
                                            	<textarea id="txtarRoommaintinancedet" name="txtarRoommaintinancedet" 
                                                  class="form-control input-large"><?php if(isset($elderRoom_row->room_maintenance_details)) echo $elderRoom_row->room_maintenance_details;?></textarea>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">وصف الحمام / دورة المياه <span class="required">
                                             * </span>
                                             </label>
                                            <div class="col-md-4">
                                                <select class="form-control" id="drpBathroom" name="drpBathroom">
                                                  <option value="">اختر...</option>
                                                  <?php
												  $selected="";
                                                    foreach($survey_Bathroom as $survey_Bathroom_row)
                                                    {
														if ($elderRoom_row->bathroom_status_id == $survey_Bathroom_row->sub_constant_id)
                                                          $selected = 'selected="selected"';
                                                      echo '<option value="'.$survey_Bathroom_row->sub_constant_id.'"'.$selected.'>'.$survey_Bathroom_row->sub_constant_name.'</option>';
                                                  $selected="";
												  }
                                                   ?>
                                              </select>
                                            </div>
                                        </div>
                                        
                                        <div id="dvBathroommaintinancedet" class="form-group" 
                                        <?php
										if (!isset($elderRoom_row->bathroom_status_id) ||
												  ($elderRoom_row->bathroom_status_id != 115 && 
												  $elderRoom_row->bathroom_status_id != 116))
											echo 'style="display:none"';
										?>
                                        >
                                            <label class="control-label col-md-3">
                                            	توضيح نوع الصيانة والترميم المطلوب وخاصة في حالة الإعاقة<span class="required">
                                             * </span>
                                             </label>
                                            <div class="col-md-4">
                                            	<textarea id="txtarBathroommaintinancedet" name="txtarBathroommaintinancedet" 
                                                  class="form-control input-large"><?php if(isset($elderRoom_row->bathroom_maintenance_details)) echo $elderRoom_row->bathroom_maintenance_details;?></textarea>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">حالة النظافة للمسن نفسه  <span class="required">
                                             * </span>
                                             </label>
                                            <div class="col-md-4">
                                                <select class="form-control" id="drpHigiene" name="drpHigiene">
                                                  <option value="">اختر...</option>
                                                <?php
												$selected="";
                                                    foreach($survey_Higiene as $survey_Higiene_row)
                                                    {
														if ($elderRoom_row->elder_higiene_id == $survey_Higiene_row->sub_constant_id)
                                                          $selected = 'selected="selected"';
                                       echo '<option value="'.$survey_Higiene_row->sub_constant_id.'"'.$selected.'>'
													  .$survey_Higiene_row->sub_constant_name.'</option>';
                                                 $selected="";
												  }
                                                   ?>
                                              </select>
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <!-- END FORM BODY -->
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-offset-3 col-md-9">
                                                <button type="submit" class="btn blue-madison">
                                                حـفـظ</button>
                                            </div>
                                        </div>
                                    </div>
                                    </form>
                                        <!-- END FORM-->
                                    </div>
                                     </div><!-- END tab_6_6-->
                                     <!-- ** END Elder Room **-->
                                     <!-- ** Elder Midication **-->
                                     <div class="tab-pane fade" id="tab_6_7">
                                     <div class="portlet-body form">
                                    <!-- BEGIN FORM-->
                                     <form action="#" id="medication_update_form" class="form-horizontal">
                                     <div class="form-body">
                                      <br/>
                                        <div class="alert alert-danger display-hide">
                                            <button class="close" data-close="alert"></button>
                                            يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                                        </div>
                                        <div class="alert alert-success display-hide">
                                            <button class="close" data-close="alert"></button>
                                            تـم عملية حـفـظ البيـانات بنجـاح !
                                        </div>
                              		 <fieldset><legend>توفر العلاج</legend>
                                    <table class="table table-bordered table-striped">
                                    <thead>
                                      <tr class="bg-grey-steel">
                                          <th>اسم الدواء
                                          </th>
                                          <th>حالة الدواء <span class="font-red">
                                             * </span>
                                          </th>
                                          <th>سبب الانقطاع 
                                          </th>
                                          <th>&nbsp;</th>
                                      </tr>
                                      <tr>
                                          <th>
                                          	<input type="text" id="txtMedicinename" name="txtMedicinename" 
                                            data-required="1" class="form-control input-sm"/>
                                          </th>
                                          <th>
                                          	<select id="drpMedicationAvailable" name="drpMedicationAvailable" 
                                             class="form-control input-sm input-small">
                                                <option value="">اختر...</option>
                                                <?php
                                                  foreach($survey_MedicationNeed as $row)
                                                  {
                                                    echo '<option value="'.$row->sub_constant_id.'">'
													.$row->sub_constant_name.'</option>';
                                                  }
                                                 ?>
                                            </select>
                                          </th>
                                          <th>
                                          	<input type="text" id="txtReason" name="txtReason" class="form-control input-sm"/>
                                          </th>
                                          <th>
                                          <button id="btnAddMedication" name="btnAddMedication" type="button" 
                                              class="btn btn-circle green-turquoise btn-sm" 
                                              onclick="add_medication_availability_u()">
                                              <i id="iConst" class="fa fa-plus"></i></button>
                                          </th>
                                      </tr>
                                     </thead>
                                     <tbody id="tbdMedication">
                                      <?php 
									  
									  foreach($medicationAvailability_info as $row)
										{
											
											echo '<tr>';
											echo '<td>'. $row->medicine_name .'</td>';
											echo '<td>'. $row->availability_status .'</td>';
											echo '<td>'. $row->unavailable_reason .'</td>';
											echo '<td><button id="btnDeletedoc" name="btnDeletedoc" type="button" 
															  class="btn btn-circle red-sunglo btn-sm" 
															  onclick="delete_medication_availability('. $row->medication_availability_id .')">
															   <i id="iConst" class="fa fa-close"></i></button>';
											echo "</td>";
											echo "</tr>";
										}
									  
									  
									  ?>
                                     </tbody>
                                     </table>   
                                     </fieldset><!-- END fieldset Mication Available-->
                                     <fieldset><legend>الاحتياجات العلاجية</legend>
                                    <table class="table table-bordered table-striped">
                                    <thead>
                                      <tr class="bg-grey-steel">
                                          <th>نوع العلاج <span class="font-red">
                                             * </span>
                                          </th>
                                          <th>تفـاصيل العلاج <span class="font-red">
                                             * </span>
                                          </th>
                                          <th>&nbsp;</th>
                                      </tr>
                                      <tr>
                                          <th>
                                          	<select id="drpMedtype" name="drpMedtype" class="form-control input-sm input-small" >
                                                <option value="">اختر...</option>
                                                  <?php
                                                  foreach($survey_MedicationType as $row)
                                                  {
													  $disabled = "";
													  foreach($medicationNeed_info as $medicationNeed_row)
													  {
														if ($row->sub_constant_id == $medicationNeed_row->medication_type_id)
															$disabled = ' disabled="disabled" ';
													  }
													  
													  echo '<option value="'.$row->sub_constant_id.'"'.$disabled.'>'
													      .$row->sub_constant_name.'</option>';
                                                  }
                                                 ?>
                                            </select>
                                          </th>
                                          <th>
                                          	<input type="text" id="txtMeddetails" name="txtMeddetails" 
                                            class="form-control input-sm input-larg"/>
                                          </th>
                                          <th>
                                          	<button id="btnAddMedicationneed" name="btnAddMedicationneed" type="button" 
                                              class="btn btn-circle green-turquoise btn-sm" 
                                              onclick="add_medication_need_u()">
                                              <i id="iConst" class="fa fa-plus"></i></button>
                                          </th>
                                      </tr>

                                     </thead>
                                     <tbody id="tbdMedicationneed">
                                      <?php 
									  foreach($medicationNeed_info as $row)
										{
											
											echo '<tr>';
											echo '<td>'. $row->medication_type .'</td>';
											echo '<td>'. $row->medication_details .'</td>';
											echo '<td><button id="btnDeleteMedicneed" name="btnDeleteMedicneed" type="button" 
															  class="btn btn-circle red-sunglo btn-sm" 
															  onclick="delete_medication_need('. $row->medication_need_id  .
																							  ','. $row->medication_type_id .')"">
															   <i id="iConst" class="fa fa-close"></i></button>';
											echo "</td>";
											echo "</tr>";
										}
									  
									  ?>
                                     </tbody>
                                     </table>   
                                     </fieldset><!-- END fieldset Mication Needs-->
                                     </div>
                                     </form>
                                     </div>
                                     </div><!-- END tab_6_7-->
                                     <!-- ** END Elder Midication **-->
                                     <!-- ** Family-Elder Relationship **-->
                                     <div class="tab-pane fade" id="tab_6_8">
                                     <div class="portlet-body form">
                                    <!-- BEGIN FORM-->
                                     <form action="#" id="family_elder_relation_update_form" class="form-horizontal">
                                     <div class="form-body">
                                      <br/>
                                        <div class="alert alert-danger display-hide">
                                            <button class="close" data-close="alert"></button>
                                            يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                                        </div>
                                        <div class="alert alert-success display-hide">
                                            <button class="close" data-close="alert"></button>
                                            تـم عملية حـفـظ البيـانات بنجـاح !
                                        </div>
                                        <input id="hdnelderFamRelAction" name="hdnelderFamRelAction" type="hidden" 
                                        	value="<?php echo $elderFamRelAction;?>" />
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">احترام متبادل <span class="required">
                                             * </span>
                                             </label>
                                            <div class="col-md-4">
                                                <select class="form-control" id="drpRespect" name="drpRespect">
                                                  <option value="">اختر...</option>
                                                   <?php
												   $selected="";
                                                    foreach($survey_Choice as $row)
                                                    {
														if ($familyRelationship_row->respect == $row->sub_constant_id)
                                                          $selected = 'selected="selected"';
                                           echo '<option value="'.$row->sub_constant_id.'"'.$selected.'>'.$row->sub_constant_name.'</option>';
                                                  $selected="";
												  }
                                                   ?>
                                              </select>
                                            </div>
                                        </div>
                                        
                                         <div class="form-group">
                                            <label class="control-label col-md-3">منبوذ <span class="required">
                                             * </span>
                                             </label>
                                            <div class="col-md-4">
                                                <select class="form-control" id="drpPariah" name="drpPariah">
                                                  <option value="">اختر...</option>
                                                   <?php
												   $selected="";
                                                    foreach($survey_Choice as $row)
                                                    {
														if ($familyRelationship_row->pariah == $row->sub_constant_id)
                                                          $selected = 'selected="selected"';
                                                      echo '<option value="'.$row->sub_constant_id.'"'.$selected.'>'
													  		.$row->sub_constant_name.'</option>';
															$selected="";
                                                  }
                                                   ?>
                                              </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">اهتمام <span class="required">
                                             * </span>
                                             </label>
                                            <div class="col-md-4">
                                                <select class="form-control" id="drpCare" name="drpCare">
                                                  <option value="">اختر...</option>
                                                   <?php
												   $selected="";
                                                    foreach($survey_Choice as $row)
                                                    {
														if ($familyRelationship_row->care == $row->sub_constant_id)
                                                          $selected = 'selected="selected"';
                                     echo '<option value="'.$row->sub_constant_id.'"'.$selected.'>'.$row->sub_constant_name.'</option>';
													  $selected="";
                                                  }
                                                   ?>
                                              </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">الدعم النفسي <span class="required">
                                             * </span>
                                             </label>
                                            <div class="col-md-4">
                                                <select class="form-control" id="drpPsycosupport" name="drpPsycosupport">
                                                  <option value="">اختر...</option>
                                                   <?php
												    $selected="";
                                                    foreach($survey_Choice as $row)
                                                    {
														if ($familyRelationship_row->psychological_support == $row->sub_constant_id)
                                                          $selected = 'selected="selected"';
                                                      echo '<option value="'.$row->sub_constant_id.'"'.$selected.'>'.$row->sub_constant_name.'</option>';
                                                   $selected="";
												  }
                                                   ?>
                                              </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">توفير الاحتياجات <span class="required">
                                             * </span>
                                             </label>
                                            <div class="col-md-4">
                                                <select class="form-control" id="drpNeeds" name="drpNeeds">
                                                  <option value="">اختر...</option>
                                                   <?php
												    
                                                    foreach($survey_Choice as $row)
                                                    {
														$selected="";
														if ($familyRelationship_row->provision_needs == $row->sub_constant_id)
                                                          $selected = 'selected="selected"';
														  
                                                      echo '<option value="'.$row->sub_constant_id.'"'.$selected.'>'
													  .$row->sub_constant_name.'</option>';
                                                  
												  }
												  
                                                   ?>
                                              </select>
                                            </div>
                                        </div>
                                        
                                        <div id="dvNeedreasone" class="form-group" 
                                        <?php
										if (!isset($familyRelationship_row->provision_needs) ||
												  $familyRelationship_row->provision_needs != 111)
											echo 'style="display:none"';
										?>
                                        >
                                            <label class="control-label col-md-3">اذكر السـبب <span class="required">
                                             * </span>
                                             </label>
                                            <div class="col-md-4">
                                                <textarea id="txtarNeedreasone" name="txtarNeedreasone" 
                                                  class="form-control input-large"><?php if(isset($familyRelationship_row->no_provision_needs_reason)) echo $familyRelationship_row->no_provision_needs_reason;?></textarea>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">الاحتياج للعيادة القانونية <span class="required">
                                             * </span>
                                             </label>
                                            <div class="col-md-4">
                                                <select class="form-control" id="drpLegaladvice" name="drpLegaladvice">
                                                  <option value="">اختر...</option>
                                                   <?php
												   $selected ="";
                                                    foreach($survey_Choice as $row)
                                                    {
														if ($familyRelationship_row->legal_advice == $row->sub_constant_id)
                                                          $selected = 'selected="selected"';
                                                      echo '<option value="'.$row->sub_constant_id.'"'.$selected.'>'.$row->sub_constant_name.'</option>';
													  $selected ="";
                                                  }
                                                   ?>
                                              </select>
                                            </div>
                                        </div>
                                        
                                        <div id="dvLegaladvicereasone" class="form-group" 
                                        <?php
										if (!isset($familyRelationship_row->legal_advice) ||
												  $familyRelationship_row->legal_advice != 110)
											echo 'style="display:none"';
										?> >
                                        
                                            <label class="control-label col-md-3">اذكر السـبب <span class="required">
                                             * </span>
                                             </label>
                                            <div class="col-md-4">
                                                <textarea id="txtarLegaladvicereasone" name="txtarLegaladvicereasone" 
                                                  class="form-control input-large"><?php if (isset($familyRelationship_row->legal_advice_reason)) echo $familyRelationship_row->legal_advice_reason;?></textarea>
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <!-- END FORM BODY -->
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-offset-3 col-md-9">
                                                <button type="submit" class="btn blue-madison">
                                                حـفـظ</button>
                                            </div>
                                        </div>
                                    </div>
                                    </form>
                                        <!-- END FORM-->
                                     </div>
                                     </div><!-- END tab_6_8-->
                                     <!-- ** END Family-Elder Relationship **-->
                                     <!-- ** Elder-Family Relationship **-->
                                     <div class="tab-pane fade" id="tab_6_9">
                                     <div class="portlet-body form">
                                    <!-- BEGIN FORM-->
                                     <form action="#" id="elder_behavior_update_form" class="form-horizontal">
                                     <div class="form-body">
                                      <br/>
                                        <div class="alert alert-danger display-hide">
                                            <button class="close" data-close="alert"></button>
                                            يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                                        </div>
                                        <div class="alert alert-success display-hide">
                                            <button class="close" data-close="alert"></button>
                                            تـم عملية حـفـظ البيـانات بنجـاح !
                                        </div>
                                    	<div class="col-md-12">
                                        <table class="table table-bordered table-striped">
                                        <thead>
                                          <tr>
                                            <th>
                                              <div class="col-md-3">
                                                 علافة المسن بالأسرة والمجتمع المحلي 
                                              </div>
                                              <div class="col-md-7">
                                                <select id="drpBehaviour" name="drpBehaviour"
                                                   class="form-control input-large" >
                                                    <option value="">اختر...</option>
                                                    <?php
                                                     foreach($survey_ElderBehaviour as $row)
													 {
														$disabled = "";
														foreach($elderBehaviour_info as $elderBehaviour_row)
														{
														  if ($row->sub_constant_id == $elderBehaviour_row->behaviour_id)
															  $disabled = ' disabled="disabled" ';
														}
														 echo '<option value="'.$row->sub_constant_id.'"'.$disabled.'>'
															  .$row->sub_constant_name.'</option>';
													 }
                                                    ?>
                                                </select>
                                              </div>
                                              <div class="col-md-2">
                                                <button id="btnAddBehaviour" name="btnAddBehaviour" type="button" 
                                                class="btn btn-circle green-turquoise btn-sm" onclick="add_elder_behaviour_u()">
                                                <i id="iConst" class="fa fa-plus"></i></button> 
                                              </div>
                                            </th>
                                          </tr>
                                         </thead>
                                         <tbody id="tbdElderBehaviour">
											<?php
											$dvPariahreasone_style = 'style="display:none"';
											foreach($elderBehaviour_info as $row)
											{
												if ($row->behaviour_id == 211)
													$dvPariahreasone_style = 'style="display:block"';
												echo '<tr>';
												echo '<td>';
												echo '<div class="col-md-11">';
												echo '<span class="font-blue">' . $row->behaviour .'</span></div>';
												echo '<div class="col-md-1"><button id="btnDeletedoc" name="btnDeletedoc" type="button" 
																	  class="btn btn-circle red-sunglo btn-sm" 
																	  onclick="delete_elder_behaviour('. $row->elder_behaviour_id .','
																									 . $row->behaviour_id .')">
																	   <i id="iConst" class="fa fa-close"></i>
															  </div>';
												echo "</td>";
												echo "</tr>";
											}
                                            
                                          ?>
                                         </tbody>
                                         </table>
                                         <div id="dvPariahreasone" 
                                         <?php
										 echo $dvPariahreasone_style;
										 ?>
                                         >
                                         <table class="table table-bordered table-striped">
                                        <thead>
                                          <tr>
                                            <th>
                                              <div class="col-md-3">
                                                 سبب نبذ المسن 
                                              </div>
                                              <div class="col-md-7">
                                                <select id="drpPariahreasone" name="drpPariahreasone"
                                                   class="form-control input-large" >
                                                    <option value="">اختر...</option>
                                                    <?php
                                                     foreach($survey_ElderPariah as $row)
                                                     {
														$disabled = "";
														foreach($elderPariah_info as $elderPariah_row)
														{
														  if ($row->sub_constant_id == $elderPariah_row->elder_pariah_reason_id)
															  $disabled = ' disabled="disabled" ';
														}
														
                                                        echo '<option value="'.$row->sub_constant_id.'"'.$disabled.'>'
                                                                .$row->sub_constant_name.'</option>';
                                                     }
                                                    ?>
                                                </select>
                                              </div>
                                              <div class="col-md-2">
                                                <button id="btnAddpariah" name="btnAddpariah" type="button" 
                                                class="btn btn-circle green-turquoise btn-sm" onclick="add_elder_pariah_u()">
                                                <i id="iConst" class="fa fa-plus"></i></button> 
                                              </div>
                                            </th>
                                          </tr>
                                         </thead>
                                         <tbody id="tbdElderPariah">
                                         <?php 
                                         foreach($elderPariah_info as $row)
										  {
											  
											  echo '<tr>';
											  echo '<td>';
											  echo '<div class="col-md-11">';
											  echo '<span class="font-blue">' . $row->pariah_reason .'</span></div>';
											  echo '<div class="col-md-1"><button id="btnDeletedoc" name="btnDeletedoc" type="button" 
																	class="btn btn-circle red-sunglo btn-sm" 
																	onclick="delete_elder_pariah('. $row->elder_pariah_id .','
																								   . $row->elder_pariah_reason_id .')">
																	 <i id="iConst" class="fa fa-close"></i>
															</div>';
											  echo "</td>";
											  echo "</tr>";
										  }
										  ?>
                                          
                                         </tbody>
                                         </table>
                                          </div>
                                         </div>
                                       </div>
                                       </form>
                                       </div>   
                                     </div><!-- END tab_6_9-->
                                     <!-- ** END Elder-Family Relationship **-->
                                      <!-- ** Family Cooperation **-->
                                      <div class="tab-pane fade" id="tab_6_12">
                                    	<div class="col-md-12">
                                        <div class="portlet-body form">
                                        <!-- BEGIN FORM-->
                                          <form action="#" id="family_cooperation_update_form" class="form-horizontal">
                                              <div class="form-body">
                                                <br/>
                                                  <div class="alert alert-danger display-hide">
                                                      <button class="close" data-close="alert"></button>
                                                      <span id="spnMsg">
                                                      يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                                                      </span>
                                                  </div>
                                                  <div class="alert alert-success display-hide">
                                                      <button class="close" data-close="alert"></button>
                                                      تمت عملية حـفـظ البيـانات بنجـاح !
                                                  </div>
                                           <input id="hdncooperativFamily" name="hdncooperativFamily" type="hidden" 
                                             value="<?php echo $cooperativFamilyAction;?>" />
                                        <div class="form-group">
                                            <label class="control-label col-md-3">تعاون الاسرة مع الباحث <span class="required">
                                             * </span>
                                             </label>
                                            <div class="col-md-4">
                                                <select class="form-control" id="drpIScooperative" name="drpIScooperative">
                                                  <option value="">اختر...</option>
                                                   <?php
												   $selected="";
                                                    foreach($survey_Choice as $row)
                                                    {
														if ($familyCooperation_row->is_cooperative_family == $row->sub_constant_id)
                                                          $selected = 'selected="selected"';
														  
                                                      echo '<option value="'.$row->sub_constant_id.'"'.$selected.'>'.$row->sub_constant_name.'</option>';
                                                  $selected="";
												  }
                                                   ?>
                                              </select>
                                            </div>
                                        </div>
                                        
                                         <div class="form-group">
                                            <label class="control-label col-md-3">يمكن الاستعانة بمن  &nbsp;&nbsp;&nbsp;
                                             </label>
                                            <div class="col-md-4">
                                                <select class="form-control" id="drpcooperPersonetype" name="drpcooperPersonetype">
                                                  <option value="">اختر...</option>
                                                   <?php
												   $selected="";
                                                    foreach($survey_Hiring as $row)
                                                    {
														if ($familyCooperation_row->cooperative_persone_type_id == $row->sub_constant_id)
                                                          $selected = 'selected="selected"';
														
                                                      echo '<option value="'.$row->sub_constant_id.'"'.$selected.'>'
													  		.$row->sub_constant_name.'</option>';
                                                  $selected="";
												  }
                                                   ?>
                                              </select>
                                            </div>
                                        </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">رقم الهوية   &nbsp;&nbsp;&nbsp;
                                        </label>
                                        <div class="col-md-4">
                                            <input type="text" id="txtcooperPersoneId" name="txtcooperPersoneId" data-required="1" 
                                            class="form-control" value="<?php if(isset($familyCooperation_row->cooperative_persone_id)) echo $familyCooperation_row->cooperative_persone_id;?>" />
                                        </div>
                                    </div>
                                        <div class="form-group">
                                        <label class="control-label col-md-3">الاسم بالكامل   &nbsp;&nbsp;&nbsp;
                                        </label>
                                        <div class="col-md-4">
                                            <input type="text" id="txtcooperPersoneName" name="txtcooperPersoneName" data-required="1" 
                                            class="form-control"  value="<?php if(isset($familyCooperation_row->cooperative_persone_name)) echo $familyCooperation_row->cooperative_persone_name;?>" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">رقم الجوال   &nbsp;&nbsp;&nbsp;
                                        </label>
                                        <div class="col-md-4">
                                            <input type="text" id="txtcooperPersoneMobile" name="txtcooperPersoneMobile" class="form-control" value="<?php if(isset($familyCooperation_row->cooperative_persone_mobile)) echo $familyCooperation_row->cooperative_persone_mobile;?>" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">العنوان   &nbsp;&nbsp;&nbsp;
                                        </label>
                                        <div class="col-md-4">
                                            <input type="text" id="txtcooperPersoneAddress" name="txtcooperPersoneAddress" data-required="1" class="form-control"  value="<?php if(isset($familyCooperation_row->cooperative_persone_address)) echo $familyCooperation_row->cooperative_persone_address;?>"/>
                                        </div>
                                    </div>
                                    
                                </div>
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-offset-3 col-md-9">
                                                <button type="submit" class="btn blue-madison">
                                                حـفـظ</button>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    </form>
                                        <!-- END FORM-->
                                    </div>
                                    </div>
                  
                                     </div><!-- END tab_6_12-->
                                     <!-- ** END Elder-Family Relationship **-->
                                     <!-- ** Family Status **-->
                                     <div class="tab-pane fade" id="tab_6_10">
                                     <div class="portlet-body form">
                                    <!-- BEGIN FORM-->
                                     <form action="#" id="family_psycho_update_form" class="form-horizontal">
                                     <div class="form-body">
                                      <br/>
                                        <div class="alert alert-danger display-hide">
                                            <button class="close" data-close="alert"></button>
                                            يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                                        </div>
                                        <div class="alert alert-success display-hide">
                                            <button class="close" data-close="alert"></button>
                                            تـم عملية حـفـظ البيـانات بنجـاح !
                                        </div>
                                     <div class="col-md-12">
                                        <table class="table table-bordered table-striped">
                                        <thead>
                                          <tr>
                                            <th>
                                              <div class="col-md-3">
                                                 حالة أسرة المسن الاجتماعية والنفسية 
                                              </div>
                                              <div class="col-md-7">
                                                <select class="form-control" id="drpPsychologicalStatus" 
                                                	name="drpPsychologicalStatus">
                                                  <option value="">اختر...</option>
                                                  <?php
                                                    foreach($survey_PsychologicalStatus as $row)
                                                    {
														$disabled = "";
														foreach($familyPsyStatus_info as $familyPsyStatus_row)
														{
														  if ($row->sub_constant_id == $familyPsyStatus_row->psychological_status_id)
															  $disabled = ' disabled="disabled" ';
														}
                                                        
														echo '<option value="'.$row->sub_constant_id.'"'.$disabled.'>'
													  		.$row->sub_constant_name.'</option>';
                                                  }
                                                   ?>
                                              </select>
                                              </div>
                                              <div class="col-md-2">
                                                <button id="btnAddfamilypsycho" name="btnAddfamilypsycho" type="submit" 
                                                 class="btn btn-circle green-turquoise btn-sm">
                                                <i id="iConst" class="fa fa-plus"></i></button> 
                                              </div>
                                            </th>
                                          </tr>
                                         </thead>
                                         <tbody id="tbdFamilyPsycho">
										 <?php
										 foreach($familyPsyStatus_info as $row)
										{
											
											echo '<tr>';
											echo '<td>';
											echo '<div class="col-md-11">';
											echo '<span class="font-blue">' . $row->psychological_status .'</span></div>';
											echo '<div class="col-md-1"><button id="btnDeletedoc" name="btnDeletedoc" type="button" 
																  class="btn btn-circle red-sunglo btn-sm" 
																  onclick="delete_family_psycho('. $row->family_psychological_status_id .','
																								 . $row->psychological_status_id .')">
																   <i id="iConst" class="fa fa-close"></i>
														  </div>';
											echo "</td>";
											echo "</tr>";
										}
										 ?>
                                         </tbody>
                                         </table>
                                         
                                         </div>
                                       </div>
                                       </form>
                                       </div>
                                     </div><!-- END tab_6_10-->
                                     <!-- ** END Family Status **-->
                                     <!-- ** Life Improvement ** -->
                                     <div class="tab-pane fade" id="tab_6_11">
                                     <div class="portlet-body form">
                                     <!-- BEGIN FORM-->
                                      <form action="#" id="life_improvement_update_form" class="form-horizontal">
                                     <div class="form-body">
                                        <br/>
                                          <div class="alert alert-danger display-hide">
                                              <button class="close" data-close="alert"></button>
                                              يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                                          </div>
                                          <div class="alert alert-success display-hide">
                                              <button class="close" data-close="alert"></button>
                                              تـم عملية حـفـظ البيـانات بنجـاح !
                                          </div>
                                          <input id="hdnlifeImprovaction" name="hdnlifeImprovaction" type="hidden" 
                                          value="<?php echo $lifeImprovAction;?>" />
                                          <div class="form-group">
                                            <label class="control-label col-md-3">قدرة المسن على العمل <span class="required">
                                            * </span>
                                            </label>
                                            <div class="col-md-4">
                                                <select class="form-control" id="drpElderWorkAbility" name="drpElderWorkAbility">
                                                    <option value="">اختر...</option>
                                                     <?php
                                                      foreach($survey_ElderWorkAbility as $row)
                                                      {
														  $selected="";
														  if ($lifeImprovement_row->elder_work_ability_id == $row->sub_constant_id)
                                                          	$selected = 'selected="selected"';
                                                        
														  echo '<option value="'.$row->sub_constant_id.'"'.$selected.'>'
														  			.$row->sub_constant_name.'</option>';
														
                                                      }
                                                     ?>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">طبيعة العمل التي يمكنه/ها القيام به </label>
                                            <div class="col-md-4">
                                               <input type="text" id="txtelderworktype" name="txtelderworktype" class="form-control" value="<?php if(isset($lifeImprovement_row->elder_work_type)) echo $lifeImprovement_row->elder_work_type;?>"/>
                                            </div>
                                        </div>
                                      
                                      <div class="form-group">
                                            <label class="control-label col-md-3">في حالة عدم القدرة على العمل – إمكانية تشغيل 
                                            </label>
                                            <div class="col-md-4">
                                                <select class="form-control" id="drpFamilyMember" name="drpFamilyMember">
                                                    <option value="">اختر...</option>
     												<?php
													$selected="";
                                                      foreach($survey_FamilyMember as $row)
                                                      {
														  if ($lifeImprovement_row->family_member_id == $row->sub_constant_id)
                                                          $selected = 'selected="selected"';
                                                        echo '<option value="'.$row->sub_constant_id.'"'.$selected.'>'
														.$row->sub_constant_name.'</option>';
                                                      $selected="";
													  }
                                                     ?>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">طبيعة العمل التي يمكنه/ها القيام به  </label>
                                            <div class="col-md-4">
                                                <input type="text" id="txtFamilyworktype" name="txtFamilyworktype" class="form-control" value="<?php if(isset($lifeImprovement_row->family_work_type)) echo $lifeImprovement_row->family_work_type;?>"/>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">هل يوجد حاجة للتدريب  <span class="required">
                                            * </span>
                                            </label>
                                            <div class="col-md-4">
    
                                                <select class="form-control" id="drpNeedtraining" name="drpNeedtraining">
                                                    <option value="">اختر...</option>
                                                      <?php
													  $selected="";
                                                      foreach($survey_Choice as $row)
                                                      {if ($lifeImprovement_row->is_elder_need_training == $row->sub_constant_id)
                                                          $selected = 'selected="selected"';
                                                        echo '<option value="'.$row->sub_constant_id.'"'.$selected.'>'
														.$row->sub_constant_name.'</option>';
                                                    $selected="";
													}
                                                     ?>
                                                </select>
                                            </div>
                                        </div>
                                        
                                         <div class="form-group">
                                            <label class="control-label col-md-3">حدد نوع التدريب &nbsp;&nbsp;&nbsp </label>
                                            <div class="col-md-4">
                                                <input type="text" id="txtTrainigType" name="txtTrainigType" class="form-control" value="<?php if(isset($lifeImprovement_row->elder_training_type)) echo $lifeImprovement_row->elder_training_type;?>"/>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">إمكانية عمل مشروع صغير مدر للدخل  
                                            <span class="required">
                                            * </span> 
                                            </label>
                                            <div class="col-md-4">
                                                <select class="form-control" id="drpStartproject" name="drpStartproject">
                                                    <option value="">اختر...</option>
                                                      <?php
													  $selected = "";
                                                      foreach($survey_Choice as $row)
                                                      {
														  if ($lifeImprovement_row->can_start_project == $row->sub_constant_id)
                                                          $selected = 'selected="selected"';
                                                        echo '<option value="'.$row->sub_constant_id.'"'.$selected.'>'
															.$row->sub_constant_name.'</option>';
                                                     $selected = "";
													}
                                                     ?>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">حدد نوع المشروع &nbsp;&nbsp;&nbsp </label>
                                            <div class="col-md-4">
                                                <input type="text" id="txtProjectType" name="txtProjectType" class="form-control" value="<?php if(isset($lifeImprovement_row->project_type)) echo $lifeImprovement_row->project_type;?>"/>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">التكلفة المتوقعة لتنفيذ المشروع &nbsp;&nbsp;&nbsp </label>
                                            <div class="col-md-4">
                                                <input type="text" id="txtProjectBudget" name="txtProjectBudget" class="form-control" value="<?php if(isset($lifeImprovement_row->project_budget)) echo $lifeImprovement_row->project_budget;?>"/>
                                            </div>
                                        </div>
                                        
                                      </div>
                                        
                                      <!-- END FORM BODY -->
                                      <div class="form-actions">
                                          <div class="row">
                                              <div class="col-md-offset-3 col-md-9">
                                                  <button type="submit" class="btn blue-madison">
                                                  حـفـظ</button>
                                                  
                                              </div>
                                          </div>
                                      </div>
                                      </form>
                                        <!-- END FORM-->
                                    </div>  
                                     </div><!-- END tab_6_11-->
                                     <!-- ** END Life Improvement ** -->

                                     </div><!-- END tab-content-->
                                     </div><!-- END col-md-9-->
                                  </div><!-- END ROW For Survey-->
                          </div><!-- END portlet-body -->
                      </div>
                  </div>
                  <div class="panel panel-default">
                      <div class="panel-heading">
                          <h4 class="panel-title">
                          <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapse_5">
                          <strong>#5 توصيات الادارة </strong>  </a>
                          </h4>
                      </div>
                      <div id="collapse_5" class="panel-collapse collapse">
                          <div class="panel-body">
                              
                              <fieldset><legend>مســاعدات</legend>
                              <div class="portlet-body form">
                                <!-- BEGIN FORM--> 
                                <form action="#" id="aid_form" class="form-horizontal">
                                    <div class="form-body">
                                      <br/>
                                        <div class="alert alert-danger display-hide">
                                            <button class="close" data-close="alert"></button>
                                            <span id="spnMsg">
                                            يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                                            </span>
                                        </div>
                                        <div class="alert alert-success display-hide">
                                            <button class="close" data-close="alert"></button>
                                            تمت عملية حـفـظ البيـانات بنجـاح !
                                        </div>
                                        <!-- Add Here-->
                                       
                                    	<input id="hdnaidraction" name="hdnaidraction" type="hidden" 
                                        value="<?php echo $aidsRecomendationAction;?>" />
                                   		<input id="hdnAidsRecomendationId" name="hdnAidsRecomendationId" type="hidden" 
                                        value="<?php if (isset($aidsRecomendation_row->aids_recomendation_id)) 
														echo $aidsRecomendation_row->aids_recomendation_id;?>" />
                                          <div class="form-group">
                                            <label class="control-label col-md-3">مساعدة مادية &nbsp;&nbsp;&nbsp;                                        </label>
                                            <div class="col-md-4">
                                                <select class="form-control" id="drpCashaidtype" name="drpCashaidtype">
                                                    <option value="">اختر...</option>
                                                     <?php
													 $selected ="";
                                                    foreach($survey_CashAidType as $row)
                                                    {
														if ($aidsRecomendation_row->cash_aid_type_id == $row->sub_constant_id)
                                                          $selected = 'selected="selected"';
                                                        echo '<option value="'.$row->sub_constant_id.'"'.$selected.'>'
                                                                .$row->sub_constant_name.'</option>';
                                                    $selected ="";
													}
                                                    ?>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">قيمة المساعدة &nbsp;&nbsp;&nbsp </label>
                                            <div class="col-md-4">
                                                <input type="text" id="txtCashaidamount" name="txtCashaidamount" class="form-control" value="<?php if(isset($aidsRecomendation_row->cash_aid_amount)) echo $aidsRecomendation_row->cash_aid_amount;?>"/>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">تغذية المسن &nbsp;&nbsp;&nbsp;                                        </label>
                                            <div class="col-md-4">
                                                <select class="form-control" id="drpNutritiontype" name="drpNutritiontype">
                                                    <option value="">اختر...</option>
                                                     <?php
													 $selected ="";
                                                    foreach($survey_NutritionType as $row)
                                                    {
														if ($aidsRecomendation_row->nutrition_type_id == $row->sub_constant_id)
                                                          $selected = 'selected="selected"';
                                                        echo '<option value="'.$row->sub_constant_id.'"'.$selected.'>'
                                                            .$row->sub_constant_name.'</option>';
                                                    $selected ="";
													}
                                                    ?>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">نوع الغذاء &nbsp;&nbsp;&nbsp </label>
                                            <div class="col-md-4">
                                                <input type="text" id="txtNutritiondetails" name="txtNutritiondetails" class="form-control" value="<?php if(isset($aidsRecomendation_row->nutrition_details)) echo $aidsRecomendation_row->nutrition_details;?>"/>
                                            </div>
                                        </div>
                                                                             
                                        <div class="form-group">
                                            <label class="control-label col-md-3">دعم نفسي  &nbsp;&nbsp;&nbsp </label>
                                            <div class="col-md-4">
                                               <textarea id="txtarPsychologicalsupport" name="txtarPsychologicalsupport" 
                                                  class="form-control"><?php if(isset($aidsRecomendation_row->psychological_support)) echo $aidsRecomendation_row->psychological_support;?></textarea>
                                                
                                              </div>
                                       </div>
                                       
                                       <div class="form-group">
                                            <label class="control-label col-md-3">دعم اجتماعي &nbsp;&nbsp;&nbsp </label>
                                            <div class="col-md-4">
                                               <textarea id="txtarSocialsupport" name="txtarSocialsupport" 
                                                            class="form-control"> <?php if(isset($aidsRecomendation_row->social_support)) echo $aidsRecomendation_row->social_support;?></textarea>
                                              </div>
                                       </div>
                                       
                                       <div class="form-group">
                                            <label class="control-label col-md-3">ترفيه &nbsp;&nbsp;&nbsp </label>
                                            <div class="col-md-4">
                                                <textarea id="txtarEntertainment" name="txtarEntertainment" 
                                                            class="form-control"><?php if(isset($aidsRecomendation_row->entertainment)) echo $aidsRecomendation_row->entertainment;?></textarea>
                                              </div>
                                       </div>
                                       
                                                         
                                      </div>
                                      <!-- END FORM BODY -->
                                      <div class="form-actions">
                                          <div class="row">
                                              <div class="col-md-offset-3 col-md-9">
                                                  <button type="submit" class="btn blue-madison">
                                                  حـفـظ</button>
                                                  
                                              </div>
                                          </div>
                                      </div>
                                    </form> <!-- END FORM-->
                                    </div>
                               </fieldset><!-- END fieldset Aids-->
                              
                               <fieldset><legend>مساعدات طبية</legend>
                                <div class="portlet-body form">
                                <!-- BEGIN FORM-->
                                <form action="#" id="medical_aid_form" class="form-horizontal">
                                    <div class="form-body">
                                      <br/>
                                        <div class="alert alert-danger display-hide">
                                            <button class="close" data-close="alert"></button>
                                            <span id="spnMsg">
                                            يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                                            </span>
                                        </div>
                                        <div class="alert alert-success display-hide">
                                            <button class="close" data-close="alert"></button>
                                            تمت عملية حـفـظ البيـانات بنجـاح !
                                        </div>                                    
                                   <input id="maidaction" name="maidaction" type="hidden" value="addmedicalaid" />
                                    <table class="table table-bordered table-striped">
                                        <thead>
                                         <tr>
                                          <th>
                                    <div class="col-md-3">
                                      مساعدة طبية عينية
                                     </div> 
                                      
                                      
                                      <div class="col-md-6">
                                          <select class="form-control" id="drpMedicalaidtype" name="drpMedicalaidtype">
                                              <option value="">اختر...</option>
                                              <?php
                                              foreach($survey_PsychologicalSupport as $row)
                                              {
												  $disabled = "";
												  foreach($medicalAidRecomend_info as $medicalAidRecomend_row)
												  {
													  if ($row->sub_constant_id == $medicalAidRecomend_row->medical_aid_type_id)
													   	$disabled = ' disabled="disabled" ';
												  }
												  
												  echo '<option value="'.$row->sub_constant_id.'"'.$disabled.'>'
                                                          .$row->sub_constant_name.'</option>';
                                              }
                                              ?>
                                          </select>
                                          
                                      </div>
                                      <div class="col-md-2">
                                        <button id="btnAddmedicalaid" name="btnAddmedicalaid" type="submit" 
                                         class="btn btn-circle green-turquoise btn-sm">
                                        <i id="iConst" class="fa fa-plus"></i></button> 
                                     </div>
                                    </th>
                                  </tr>
                                 </thead>
                                 <tbody id="tbmedicalaid">
									<?php
                                     $i=1;
                                    foreach($medicalAidRecomend_info as $row)
                                    {
                                     
                                        echo "<tr>";
                                        
                                        echo '<td style="display:none;" id="surveyId_tb'.$i.'">'. $row->medical_aid_recomendation_id. "</td>";
                                        echo '<td style="display:none;" id="medical_aid_type_id_tb'.$i.'">'. $row->medical_aid_type_id. "</td>";
                                        echo '<td id="medicalaid_type'.$i.'">'. $row-> medicalaid_type . "</td>";
                                        echo '<td><button id="btnDeletedoc" name="btnDeletedoc" type="button" 
                                                          class="btn btn-circle red-sunglo btn-sm" 
                                                          onclick="deletemedicalaidbyId('.$row->medical_aid_recomendation_id.','. $row->medical_aid_type_id .')">
                                                           <i id="iConst" class="fa fa-close"></i>
                                                           </td>';
                                        echo "</tr>";
                                        
                                        
                                        
                                    }
                                    ?>
                                                      
                                   </tbody>
                                   </table>
                                    
                                  </div><!-- END FORM BODY -->
                                  </form>
                                  </div>
                                
                                  </fieldset><!-- END fieldset Midical Aids-->
                                  
                                  <fieldset><legend>السـكـن</legend>
                                  <div class="portlet-body form">
                                  <!-- BEGIN FORM-->
                                  <form action="#" id="home_aid_form" class="form-horizontal">
                                      <div class="form-body">
                                        <br/>
                                          <div class="alert alert-danger display-hide">
                                              <button class="close" data-close="alert"></button>
                                              <span id="spnMsg">
                                              يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                                              </span>
                                          </div>
                                          <div class="alert alert-success display-hide">
                                              <button class="close" data-close="alert"></button>
                                              تمت عملية حـفـظ البيـانات بنجـاح !
                                          </div>
                                    
                                     <input id="haidaction" name="haidaction" type="hidden" value="addhomeaid" />
                                    <table class="table table-bordered table-striped">
                                        <thead>
                                         <tr>
                                          <th>
                                    <div class="col-md-3">
                                      تأهيل سكن وتحسين سبل عيش المسن
                                     </div> 
                                      
                                      
                                      <div class="col-md-6">
               
                                          <select class="form-control" id="drpImprovementtype" name="drpImprovementtype">
                                              <option value="">اختر...</option>
                                              <?php
                                              foreach($survey_HomeImprovRecomend as $row)
                                              {
												  $disabled = "";
												  foreach($homeImprovRecomend_info as $homeImprovRecomend_row)
												  {
													  if ($row->sub_constant_id == $homeImprovRecomend_row->improvement_type_id)
													   	$disabled = ' disabled="disabled" ';
												  }
												  
                                                  echo '<option value="'.$row->sub_constant_id.'"'.$disabled.'>'
                                                          .$row->sub_constant_name.'</option>';
                                              }
                                              ?>
                                          </select>
                                          <div id="dvImprovementdet" style="display:none" class="margin-top-10">
                                              <input type="text" id="txtImprovementdet" name="txtImprovementdet" 
                                               class="form-control" placeholder=""/>
                                          </div>
                                      </div>
                                      <div class="col-md-2">
                                         <button id="btnaddhomeaid" name="btnaddhomeaid" type="submit" 
                                         class="btn btn-circle green-turquoise btn-sm">
                                         <i id="iConst" class="fa fa-plus"></i></button> 
                                       </div>
                                      </th>
                                     </tr>
                                    </thead>
                                    <tbody id="tbhomeaid">
									<?php
                                    $i=1;
									foreach($homeImprovRecomend_info as $row)
									{
										if ($row->improvement_type_id == 168)
											$details = "فيمة الإيجار الشهري : ";
										else if ($row->improvement_type_id == 169)
											$details = "تفصيل الأشياء الأخرى : ";
										else
											$details = "";
											
										echo "<tr>";
										echo '<td style="display:none;" id="surveyId_tb'.$i.'">'. $row->home_improvement_recomendation_id. "</td>";
										echo '<td style="display:none;" id="improvement_type_id_id_tb'.$i.'">'. $row->improvement_type_id. "</td>";
										echo '<td id="homeaid_type'.$i.'">
												<div class="col-md-3">'. $row-> homeaid_type . '</div>
												<div class="col-md-6">'. $details . ' ' . $row-> improvement_details.'</div></td>';
										echo '<td><button id="btnDeletedoc" name="btnDeletedoc" type="button" 
														  class="btn btn-circle red-sunglo btn-sm" 
														  onclick="deletehomeaidbyId('.$row->home_improvement_recomendation_id.','
																					  . $row->improvement_type_id .')">
														   <i id="iConst" class="fa fa-close"></i>
														   </td>';
										echo "</tr>";
										
										
										
									}
							
							?>
                                    </tbody>
                                 </table>
                                </div><!-- END FORM BODY -->
                                </form>
                                </div>
                                  
                               </fieldset><!-- END fieldset Home Aids-->   
                            </div> <!-- END portlet-body -->
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
         
	</div>
</div>
<!-- END PAGE CONTENT-->