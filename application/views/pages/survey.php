<?php
$ction ="addelder";
$fmction="addfamilymember";
$surveyction="addsurvey";
$homeStatusction="addhomeStatus";
$elderRoomaction="addelderRoom";
$elderFamRelAction="addelderFamRel";
$lifeImprovAction="addelifeImprov";
$cooperativFamilyAction="addcooperFamily";
$page_title = "اضـــافة موظف";
$readonly = '';
/*if (isset($elder_info))
{
	unset($_SESSION['update']);
	foreach($elder_info as $elder_row);
	$ction ="updateelder";
	$page_title = "تعـــديل عضو";
	$readonly = 'readonly="readonly"';
}*/
?>

<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<div class="row">
    <div class="col-md-12">
        <div class="portlet box blue" id="form_wizard_1">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-gift"></i> إستمارة بيانات حالة "كبار السن" - <span class="step-title">
                    خطوة 1 من 5 </span>
                </div>
                
            </div>
            <div class="portlet-body form">
                <form action="#" class="form-horizontal" id="submit_form" method="POST">
                    <div class="form-wizard">
                        <div class="form-body">
                            <ul class="nav nav-pills nav-justified steps">
                                <li>
                                    <a href="#tab1" data-toggle="tab" class="step">
                                    <span class="number">
                                    1 </span>
                                    <span class="desc">
                                    <i class="fa fa-check"></i> مـلف العـضــو </span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#tab2" data-toggle="tab" class="step">
                                    <span class="number">
                                    2 </span>
                                    <span class="desc">
                                    <i class="fa fa-check"></i> بيـانات الزيـارة </span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#tab3" data-toggle="tab" class="step active">
                                    <span class="number">
                                    3 </span>
                                    <span class="desc">
                                    <i class="fa fa-check"></i> بيانات الاسرة </span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#tab4" data-toggle="tab" class="step">
                                    <span class="number">
                                    4 </span>
                                    <span class="desc">
                                    <i class="fa fa-check"></i> استمارة كبار سن </span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#tab5" data-toggle="tab" class="step">
                                    <span class="number">
                                    5 </span>
                                    <span class="desc">
                                    <i class="fa fa-check"></i> توصيــات الباحـث </span>
                                    </a>
                                </li>
                            </ul>
                            <div id="bar" class="progress progress-striped" role="progressbar">
                                <div class="progress-bar progress-bar-success">
                                </div>
                            </div>
                            <div class="tab-content">
                                <div id="dvSurveyErrorMsg" class="alert alert-danger display-none">
                                    <button class="close" data-dismiss="alert"></button>
                                    يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة.
                                </div>
                                <div id="dvSurveySuccessMsg" class="alert alert-success display-none">
                                    <button class="close" data-dismiss="alert"></button>
                                    تـم عملية حـفـظ البيـانات بنجـاح!
                                </div>
                                
                                <!-- Tab 1-->
                                <div class="tab-pane active" id="tab1">
                                    <h3 class="block">بيـانات مـلـف الـعــضـو</h3>
                                    <input id="hdnAction" name="hdnAction" type="hidden" value="<?php echo $ction;?>" />
                                    <input id="hdnElderId" name="hdnElderId" type="hidden" value="" />
                                    <input id="hdnFileId" name="hdnFileId" type="hidden" value="" />
                                    <div class="form-group">
                                        <label class="control-label col-md-3">رقم الهوية <span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-4">
                                            <input type="text" id="txtElderId" name="txtElderId" data-required="1" 
                                            class="form-control"  onblur="check_elder_id()"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">رقم الملف الورقي <span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-4">
                                            <input type="text" id="txtFiledocId" name="txtFiledocId" data-required="1" 
                                            class="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">تـصنيف الحـالة <span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-4">
                                            <select class="form-control" id="drpEldercategory" name="drpEldercategory">
                                                <option value="">اختر...</option>
                                                <?php
												foreach($survey_Eldercategory as $row)
												{
													
                      								echo '<option value="'.$row->sub_constant_id.'">'
																		  .$row->sub_constant_name.'</option>';
							  					}
							 					?>

                                            </select>
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
                                                <input type="text" class="form-control" readonly id="dpDob" name="dpDob" value=""
                                                onchange="claculateAge()">
                                                <span class="input-group-btn">
                                                <button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
                                                </span>
                                            </div>
                                            <!-- /input-group -->
                                        </div>
                                        <div class="col-md-4">
                                         <label id="lblAge" class="control-label"></label>
                                      </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">النوع الطبيعي &nbsp;&nbsp;&nbsp;
                                         
		                                 </label>
                                        <div class="col-md-4">
                                            <div class="radio-list" data-error-container="#form_2_membership_error">
                                                <label>
                                                <input type="radio" id="rdSexMale" name="rdSex" value="1" checked="checked"/>
                                                ذكـر </label>
                                                <label>
                                                <input type="radio" id="rdSexFemale" name="rdSex" value="2"/>
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
                                            <select class="form-control" id="drpElderstatus" name="drpElderstatus">
                                                <option value="">اختر...</option>
                                                 <?php
												  foreach($survey_Maritalstatus as $row)
												  {
                      								echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
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
                                            <select class="form-control" id="drpGovernorate" name="drpGovernorate" onchange="governorate_change()">
                                                <option value="">اختر...</option>
													<?php
												  	foreach($survey_Governorate as $row)
												 	{
                      									echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
							  						}
							 						 ?>
                                            </select>
                                        </div>
                                    </div>
                <!-- -------------------- change the Area with drplist  --->
                
				                <div class="form-group">
                                        <label class="control-label col-md-3">المدينة <span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-4">
                                            <select class="form-control" id="drpRegion" name="drpRegion" onchange="region_change();">
                                                <option value="">اختر...</option>
													
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
													
                                            </select>
                                        </div>
                                  </div>
                <!-- 
                                    <div class="form-group">
                                        <label class="control-label col-md-3">المنطقـة <span class="required"	>
                                        * </span>
                                        </label>
                                        <div class="col-md-4">
                                            <input type="text" id="txtRegion" name="txtRegion" data-required="1" class="form-control"/>
                                        </div>
                                    </div>
                                    --> 
                                    <div class="form-group">
                                        <label class="control-label col-md-3">وصف العنوان بالكامل <span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-4">
                                            <textarea name="txtAddressdetails" id="txtAddressdetails" cols="70" rows="2" class="form-control"></textarea>
                                        </div>
                                    </div>
                                                         
                                    <div class="form-group">
                                        <label class="control-label col-md-3">رقم الهاتف &nbsp;&nbsp;&nbsp;
                                        </label>
                                        <div class="col-md-4">
                                            <input type="text" id="txtPhone" name="txtPhone" class="form-control"/>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">رقم الجوال (1)  &nbsp;&nbsp;&nbsp;
                                        </label>
                                        <div class="col-md-4">
                                            <input type="text" id="txtMobile1" name="txtMobile1" class="form-control"/>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">رقم الجوال (2)  &nbsp;&nbsp;&nbsp;
                                        </label>
                                        <div class="col-md-4">
                                            <input type="text" id="txtMobile2" name="txtMobile2" class="form-control"/>
                                        </div>
                                    </div>
                                    
                                     <div class="form-group">
                                        <label class="control-label col-md-3">المؤهل العلمي <span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-4">
                                            <select class="form-control" id="drpEducationlevel" name="drpEducationlevel" 
                                            onchange="educationlevel_change();">
                                                <option value="">اختر...</option>
   													<?php
												  		foreach($survey_Educationlevel as $row)
												 	 {
                      										echo '<option value="'.$row->sub_constant_id.'">'
															.$row->sub_constant_name.'</option>';
							  						}
							 						 ?>

	                                            </select>
                                        </div>
                                    </div>
                                    
                                    <div id="divSpecialization" class="form-group" style="display:none">
                                        <label class="control-label col-md-3">التخصص <span class="required">
                                        * </span>
                                        </label>
                                        <div  class="col-md-4">
                                            <select class="form-control" id="drpSpecialization" name="drpSpecialization">
                                                <option value="">اختر...</option>
                                                <?php
												  		foreach($survey_Specialization as $row)
												 	 {
                      										echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
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
                                            <select class="form-control" id="drpCurrentjob" name="drpCurrentjob">
                                                <option value="">اختر...</option>
													<?php
												  		foreach($survey_CurrentJob as $row)
												 	 {
                      										echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
							  						}
							 						 ?>
                                            </select>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">العمل السابق &nbsp;&nbsp;&nbsp;
                                        </label>
                                        <div class="col-md-4">
                                            <select class="form-control" id="drpPreviousjob" name="drpPreviousjob">
                                                <option value="">اختر...</option>
                                                	<?php
												  		foreach($survey_PreviousJob as $row)
												 	 {
                      										echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
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
                                            <select class="form-control" id="drpInsurence" name="drpInsurence">
                                                <option value="">اختر...</option>
                                                	<?php
												  		foreach($survey_InsuranceType as $row)
												 	 {
                      										echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
							  						}
							 						 ?>                             
                                            </select>
                                        </div>
                                    </div>
                                </div><!-- END Tab 1-->
                                
                                <!-- Tab 2-->
                                <div class="tab-pane" id="tab2">
                                    <h3 class="block">ادخل بيــانات الزيـارة الحــالية</h3>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">تـاريخ دراسـة الحـالة <span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-4">
                                          <div class="input-group date date-picker" data-date-format="yyyy-mm-dd">
                                              <input type="text" class="form-control" readonly id="dpVisitdate" name="dpVisitdate">
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
												<input type="text" id="txtVisittime" name="txtVisittime" readonly 
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
												<input type="text" id="txtVisitendtime" name="txtVisitendtime" readonly 
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
												 foreach($survey_employee_info as $row)
												 {
                      								echo '<option value="'.$row->national_id.'">'.$row->name.'</option>';
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
                      								echo '<option value="'.$row->national_id.'">'.$row->name.'</option>';
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
                      								echo '<option value="'.$row->national_id.'">'.$row->name.'</option>';
							  					}
							 					 ?>

                                            </select>
                                        </div>
                                    </div>
                                </div><!-- END Tab 2-->
                                
                                
                                <!-- Tab 3 -->
                                <div class="tab-pane" id="tab3">
                                    <h3 class="block">ادخـــل بيـانات أفراد اســرة المسـن</h3>
                                    <input id="hdnActionFM" name="hdnActionFM" type="hidden" value="addfamilymember" />
                                    <div class="note note-info">
										<p><b> عــدد أفــــراد الأســــرة ( <span id="spnCountFamily"> 0 </span> )</b></p>
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
                                                 <button id="btnAddMem" name="btnAddMem" type="button" 
                                                 class="btn btn-circle green-turquoise btn-sm" onclick="editefamilymember()">
                                                <i id="iConst" class="fa fa-plus"></i></button>
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody id="tbdFamilyMember">
                                        
                                        </tbody>
                                      	</table>
                        </div>
   <!----------------------------------------END TABLE---------------------------------------------->
                                </div><!-- END Tab 3-->
                                
                                <!-- Tab 4 -->
                                <div class="tab-pane" id="tab4">
                                    <h3 class="block">ادخـل بيانات استمارة كبير السـن</h3>
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
                                     <input id="hdnSurveyId" name="hdnSurveyId" type="hidden" value="" />
                                     </div><!-- END col-md-3 (Tab Header)-->
                                     <div class="col-md-9 col-sm-9 col-xs-9">
                        			 <div class="tab-content">
                                     
                                     <!-- ** Health Status ** -->
                                     <div class="tab-pane active" id="tab_6_3">
                                     	<div class="col-md-12">
                                        <input id="hdnElderDiseaseId" name="hdnElderDiseaseId" type="hidden" value="" />
                                     	<table class="table table-bordered table-striped">
                                        <thead>
                                          <tr>
                                            <th>
                                              <div class="col-md-3">
                                                 الحـــالة الصحيـــة 
                                              </div>
                                              <div class="col-md-6">
                                                <select id="drpDisease" name="drpDisease"
                                                   class="form-control input-large" >
                                                    <option value="">اختر...</option>
                                                    <?php
                                                     foreach($survey_ElderDisease as $row)
                                                      {
                                                        echo '<option value="'.$row->sub_constant_id.'">'
                                                                .$row->sub_constant_name.'</option>';
                                                      }
                                                    ?>
                                                </select>
                                              </div>
                                              <div class="col-md-2">
                                                <button id="btnAdddisease" name="btnAdddisease" type="button" class="btn btn-circle green-turquoise btn-sm" onclick="add_elder_disease()">
                                                <i id="iConst" class="fa fa-plus"></i></button> 
                                              </div>
                                            </th>
                                          </tr>
                                         </thead>
                                         <tbody id="tbdElderDisease">
                                         
                                          
                                         </tbody>
                                         </table>
                                         <table class="table table-bordered table-striped">
                                          <thead>
                                            <tr>
                                              <th>
                                              	<!---->
                                              	 <div id="dvHealthErrorMsg" class="alert alert-danger display-hide">
                                                    <button class="close" data-close="alert"></button>
                                                    يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                                                </div>
                                                <div id="dvHealthSuccessMsg" class="alert alert-success display-hide">
                                                    <button class="close" data-close="alert"></button>
                                                      تـم عملية حـفـظ البيـانات بنجـاح !
                                                </div>
                                                <!---->
                                              	<div class="form-group">
                                                    <label class="control-label col-md-3"><b>
                                                    تــفاصيـل الحــالة المـرضيـة </b>
                                                    </label>
                                                    <div class="col-md-6">
                                                       <textarea id="txtarDiseaasedet" name="txtarDiseaasedet" 
                                                        class="form-control input-large"></textarea>
                                                    </div>
                                                    <div class="col-md-2">
                                                    	<button id="btnAdddiseaasedet" name="btnAdddiseaasedet" type="button" 
								  							class="btn btn-circle green-turquoise btn-sm" 
								  							onclick="add_disease_details()">
								   							<i id="iConst" class="fa fa-check"></i></button>
						  							</div>
                                                </div>  
                                              </th>
                                            </tr>
                                          </thead>
                                          </table>
                                         </div>
                                         
                                         
                                     </div><!-- END tab_6_3-->
                                     <!-- ** END Health Status ** -->
                                     <!-- ** Income Resources ** -->
                                     <div class="tab-pane fade" id="tab_6_4">
                                     <fieldset><legend>تفاصيل الدخل</legend>
                                     <input id="hdnIncomeResourcesId" name="hdnIncomeResourcesId" type="hidden" value="" />
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
                                                      echo '<option value="'.$row->sub_constant_id.'">'
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
                                                      echo '<option value="'.$row->sub_constant_id.'">'
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
								  							onclick="add_income_resource_det()">
								   							<i id="iConst" class="fa fa-check"></i></button>
                                            </th>
                                          </tr>
                                        </thead>
                                        <tbody id="tbdIncomeSourceDet">
                                        </tbody>
                                     </table>
                                     </fieldset>
                              		 <fieldset><legend>ملخص الدخل</legend>
                                     <div class="form-body">
                                      <br/>
                                        <div id="dvIncomeErrorMsg" class="alert alert-danger display-hide">
                                            <button class="close" data-close="alert"></button>
                                            يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                                        </div>
                                        <div id="dvIncomeSuccessMsg" class="alert alert-success display-hide">
                                            <button class="close" data-close="alert"></button>
                                            تـم عملية حـفـظ البيـانات بنجـاح !
                                        </div>
                                        
                                        <div class="form-group">
                                          <label class="control-label col-md-3">المجموع الكلي للدخل  <span class="required">
                                          * </span>
                                          </label>
                                          <div class="col-md-4">
                                            <input type="text" id="txtTotalincome" name="txtTotalincome" data-required="1" class="form-control"/>
                                          </div>
                                        </div>
                                        
                                        <div class="form-group">
                                          <label class="control-label col-md-3">حصة المسن من دخل الأسرة   <span class="required">
                                          * </span>
                                          </label>
                                          <div class="col-md-4">
                                            <input type="text" id="txtElderportion" name="txtElderportion" data-required="1" class="form-control"/>
                                          </div>
                                        </div>
                                        
                                    </div>
                                    <!-- END FORM BODY -->
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-offset-3 col-md-9">
                                                <button type="button" class="btn blue-madison" onclick="edit_income_resource()">
                                                حـفـظ</button>
                                            </div>
                                        </div>
                                    </div>
                                     </fieldset><!-- END fieldset Summery-->
                                     
                                     </div><!-- END tab_6_4-->
                                     <!-- ** END Income Resources ** -->
                                   	 <!-- ** Home Status ** -->
                                     <div class="tab-pane fade" id="tab_6_5">
                                     <div class="form-body">
                                        <br/>
                                          <div id="dvHomeErrorMsg" class="alert alert-danger display-hide">
                                              <button class="close" data-close="alert"></button>
                                              يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                                          </div>
                                          <div id="dvHomeSuccessMsg" class="alert alert-success display-hide">
                                              <button class="close" data-close="alert"></button>
                                                تـم عملية حـفـظ البيـانات بنجـاح !
                                          </div>
                                          <input id="hdnHomeStatusAction" name="hdnHomeStatusAction" type="hidden" 
                                          value="<?php echo $homeStatusction;?>" />
                                          <input id="hdnHomeStatusId" name="hdnHomeStatusId" type="hidden" 
                                          value="" />
                                          <div class="form-group">
                                              <label class="control-label col-md-3">الوضع العام <span class="required">
                                               * </span>
                                               </label>
                                              <div class="col-md-4">
                                                  <select class="form-control" id="drpHomeStatus" name="drpHomeStatus">
                                                    <option value="">اختر...</option>
                                                    
                                                     <?php
                                                      foreach($survey_HomeStatus as $row)
                                                      {
                                                        echo '<option value="'.$row->sub_constant_id.'">'
																.$row->sub_constant_name.'</option>';
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
                                                      foreach($survey_HomeType as $row)
                                                      {
                                                        echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
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
                                                      foreach($survey_CeilingType as $row)
                                                      {
                                                        echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
                                                    }
                                                     ?>
                                                </select>
                                              </div>
                                          </div>
                                          
                                          <div id="dvCeilingDescription" class="form-group" style="display:none">
                                              <label class="control-label col-md-3">نوع السقف توضيح<span class="required">
                                               * </span>
                                               </label>
                                              <div class="col-md-4">
                                                  <input type="text" id="txtCeilingdescription" name="txtCeilingdescription"
                                                   data-required="1" class="form-control"/>
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
                                                      foreach($survey_FurnitureLevel as $row)
                                                      {
                                                        echo '<option value="'.$row->sub_constant_id.'">'
																.$row->sub_constant_name.'</option>';
                                                      }
                                                     ?>
                                                </select>
                                              </div>
                                          </div>
                                          
                                          <div id="dvFurnitureNeeds" class="form-group" style="display:none">
                                              <label class="control-label col-md-3">أذكر هذه الضروريات <span class="required">
                                               * </span>
                                               </label>
                                              <div class="col-md-4">
                                                   <textarea id="txtarFurnitureneeds" name="txtarFurnitureneeds" 
                                                        class="form-control input-large"></textarea>
                                              </div>
                                          </div>
                                          
                                      </div>
                                      <!-- END FORM BODY -->
                                      <div class="form-actions">
                                          <div class="row">
                                              <div class="col-md-offset-3 col-md-9">
                                                  <button type="button" class="btn blue-madison" onclick="editeHomeStatus()">
                                                  حـفـظ</button>
                                              </div>
                                          </div>
                                      </div>
                                     </div><!-- END tab_6_5-->
                                     <!-- ** END Home Status **-->
                                     <!-- ** Elder Room **-->
                                     <div class="tab-pane fade" id="tab_6_6">
                                     <div class="form-body">
                                      <br/>
                                        <div id="dvRoomErrorMsg" class="alert alert-danger display-hide">
                                            <button class="close" data-close="alert"></button>
                                            يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                                        </div>
                                        <div id="dvRoomSuccessMsg" class="alert alert-success display-hide">
                                            <button class="close" data-close="alert"></button>
                                            تـم عملية حـفـظ البيـانات بنجـاح !
                                        </div>
                                        <input id="hdnElderRoomAction" name="hdnElderRoomAction" type="hidden" 
                                          value="<?php echo $elderRoomaction;?>" />
                                        <input id="hdnElderRoomId" name="hdnElderRoomId" type="hidden" value="" />
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">وصف السكن بالتفصيل للمسن <span class="required">
                                             * </span>
                                             </label>
                                            <div class="col-md-4">
                                                <select class="form-control" id="drpElderHometype" name="drpElderHometype">
                                                  <option value="">اختر...</option>
                                                   <?php
                                                    foreach($survey_Hometype as $row)
                                                    {
                                                      echo '<option value="'.$row->sub_constant_id.'">'
													  		.$row->sub_constant_name.'</option>';
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
                                                    foreach($survey_Roomtype as $row)
                                                    {
                                                      echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
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
                                                    foreach($survey_Clothes as $row)
                                                    {
                                                      echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
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
                                                    foreach($survey_Ventilation as $row)
                                                    {
                                                      echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
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
                                                    foreach($survey_Lighting as $row)
                                                    {
                                                      echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
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
                                                    foreach($survey_Choice as $row)
                                                    {
                                                      echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
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
                                                    foreach($survey_Choice as $row)
                                                    {
                                                      echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
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
                                                    foreach($survey_Choice as $row)
                                                    {
                                                      echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
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
                                                    foreach($survey_Choice as $row)
                                                    {
                                                      echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
                                                  }
                                                   ?>
                                              </select>
                                            </div>
                                        </div>
                                        
                                        <div id="dvRoommaintinancedet" class="form-group" style="display:none">
                                            <label class="control-label col-md-3">توضيح نوع الصيانة والترميم المطلوب <span class="required">
                                             * </span>
                                             </label>
                                            <div class="col-md-4">
                                            	<textarea id="txtarRoommaintinancedet" name="txtarRoommaintinancedet" 
                                                  class="form-control input-large"></textarea>
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
                                                    foreach($survey_Bathroom as $row)
                                                    {
                                                      echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
                                                  }
                                                   ?>
                                              </select>
                                            </div>
                                        </div>
                                        
                                        <div id="dvBathroommaintinancedet" class="form-group" style="display:none">
                                            <label class="control-label col-md-3">
                                            	توضيح نوع الصيانة والترميم المطلوب وخاصة في حالة الإعاقة<span class="required">
                                             * </span>
                                             </label>
                                            <div class="col-md-4">
                                            	<textarea id="txtarBathroommaintinancedet" name="txtarBathroommaintinancedet" 
                                                  class="form-control input-large"></textarea>
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
                                                    foreach($survey_Higiene as $row)
                                                    {
                                                      echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
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
                                                <button type="button" class="btn blue-madison" onclick="editeElderRoom()">
                                                حـفـظ</button>
                                            </div>
                                        </div>
                                    </div>
                                     </div><!-- END tab_6_6-->
                                     <!-- ** END Elder Room **-->
                                     <!-- ** Elder Midication **-->
                                     <div class="tab-pane fade" id="tab_6_7">
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
                                              onclick="add_medication_availability()">
                                              <i id="iConst" class="fa fa-plus"></i></button>
                                          </th>
                                      </tr>
                                     </thead>
                                     <tbody id="tbdMedication">
                                      
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
                                                    echo '<option value="'.$row->sub_constant_id.'">'
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
                                              onclick="add_medication_need()">
                                              <i id="iConst" class="fa fa-plus"></i></button>
                                          </th>
                                      </tr>

                                     </thead>
                                     <tbody id="tbdMedicationneed">
                                      
                                     </tbody>
                                     </table>   
                                     </fieldset><!-- END fieldset Mication Needs-->
                                     </div><!-- END tab_6_7-->
                                     <!-- ** END Elder Midication **-->
                                     <!-- ** Family-Elder Relationship **-->
                                     <div class="tab-pane fade" id="tab_6_8">
                                     <div class="form-body">
                                      <br/>
                                        <div id="dvFamRelErrorMsg" class="alert alert-danger display-hide">
                                            <button class="close" data-close="alert"></button>
                                            يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                                        </div>
                                        <div id="dvFamRelSuccessMsg" class="alert alert-success display-hide">
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
                                                    foreach($survey_Choice as $row)
                                                    {
                                                      echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
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
                                                    foreach($survey_Choice as $row)
                                                    {
                                                      echo '<option value="'.$row->sub_constant_id.'">'
													  		.$row->sub_constant_name.'</option>';
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
                                                    foreach($survey_Choice as $row)
                                                    {
                                                      echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
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
                                                    foreach($survey_Choice as $row)
                                                    {
                                                      echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
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
                                                      echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
                                                  }
                                                   ?>
                                              </select>
                                            </div>
                                        </div>
                                        
                                        <div id="dvNeedreasone" class="form-group" style="display:none">
                                            <label class="control-label col-md-3">اذكر السـبب <span class="required">
                                             * </span>
                                             </label>
                                            <div class="col-md-4">
                                                <textarea id="txtarNeedreasone" name="txtarNeedreasone" 
                                                  class="form-control input-large"></textarea>
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
                                                    foreach($survey_Choice as $row)
                                                    {
                                                      echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
                                                  }
                                                   ?>
                                              </select>
                                            </div>
                                        </div>
                                        
                                        <div id="dvLegaladvicereasone" class="form-group" style="display:none">
                                            <label class="control-label col-md-3">اذكر السـبب <span class="required">
                                             * </span>
                                             </label>
                                            <div class="col-md-4">
                                                <textarea id="txtarLegaladvicereasone" name="txtarLegaladvicereasone" 
                                                  class="form-control input-large"></textarea>
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <!-- END FORM BODY -->
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-offset-3 col-md-9">
                                                <button type="button" class="btn blue-madison" onclick="editeElderFamRel()">
                                                حـفـظ</button>
                                            </div>
                                        </div>
                                    </div>
                                     </div><!-- END tab_6_8-->
                                     <!-- ** END Family-Elder Relationship **-->
                                     <!-- ** Elder-Family Relationship **-->
                                     <div class="tab-pane fade" id="tab_6_9">
                                    	<div class="col-md-12">
                                        <input id="hdnElderDiseaseId" name="hdnElderDiseaseId" type="hidden" value="" />
                                     	<table class="table table-bordered table-striped">
                                        <thead>
                                          <tr>
                                            <th>
                                              <div class="col-md-3">
                                                 علافة المسن بالأسرة والمجتمع المحلي 
                                              </div>
                                              <div class="col-md-6">
                                                <select id="drpBehaviour" name="drpBehaviour"
                                                   class="form-control input-large" >
                                                    <option value="">اختر...</option>
                                                    <?php
                                                     foreach($survey_ElderBehaviour as $row)
                                                      {
                                                        echo '<option value="'.$row->sub_constant_id.'">'
                                                                .$row->sub_constant_name.'</option>';
                                                      }
                                                    ?>
                                                </select>
                                              </div>
                                              <div class="col-md-2">
                                                <button id="btnAddBehaviour" name="btnAddBehaviour" type="button" 
                                                class="btn btn-circle green-turquoise btn-sm" onclick="add_elder_behaviour()">
                                                <i id="iConst" class="fa fa-plus"></i></button> 
                                              </div>
                                            </th>
                                          </tr>
                                         </thead>
                                         <tbody id="tbdElderBehaviour">
                                         
                                          
                                         </tbody>
                                         </table>
                                         <div id="dvPariahreasone" style="display:none">
                                         <table class="table table-bordered table-striped">
                                        <thead>
                                          <tr>
                                            <th>
                                              <div class="col-md-3">
                                                 سبب نبذ المسن 
                                              </div>
                                              <div class="col-md-6">
                                                <select id="drpPariahreasone" name="drpPariahreasone"
                                                   class="form-control input-large" >
                                                    <option value="">اختر...</option>
                                                    <?php
                                                     foreach($survey_ElderPariah as $row)
                                                      {
                                                        echo '<option value="'.$row->sub_constant_id.'">'
                                                                .$row->sub_constant_name.'</option>';
                                                      }
                                                    ?>
                                                </select>
                                              </div>
                                              <div class="col-md-2">
                                                <button id="btnAddpariah" name="btnAddpariah" type="button" 
                                                class="btn btn-circle green-turquoise btn-sm" onclick="add_elder_pariah()">
                                                <i id="iConst" class="fa fa-plus"></i></button> 
                                              </div>
                                            </th>
                                          </tr>
                                         </thead>
                                         <tbody id="tbdElderPariah">
                                         
                                          
                                         </tbody>
                                         </table>
                                          </div>
                                         </div>   
                                     </div><!-- END tab_6_9-->
                                     <!-- ** END Elder-Family Relationship **-->
                                      <!-- ** Elder-Family Relationship **-->
                                     <div class="tab-pane fade" id="tab_6_12">
                                     <div class="form-body">
                                      <br/>
                                        <div id="dvCooFamErrorMsg" class="alert alert-danger display-hide">
                                            <button class="close" data-close="alert"></button>
                                            يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                                        </div>
                                        <div id="dvCooFamSuccessMsg" class="alert alert-success display-hide">
                                            <button class="close" data-close="alert"></button>
                                            تـم عملية حـفـظ البيـانات بنجـاح !
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
                                                    foreach($survey_Choice as $row)
                                                    {
                                                      echo '<option value="'.$row->sub_constant_id.'">'
													  						.$row->sub_constant_name.'</option>';
                                                  }
                                                   ?>
                                              </select>
                                            </div>
                                        </div>
                                        
                                         <div class="form-group">
                                            <label class="control-label col-md-3">يمكن الاستعانة بمن   &nbsp;&nbsp;&nbsp;
                                             </label>
                                            <div class="col-md-4">
                                                <select class="form-control" id="drpcooperPersonetype" name="drpcooperPersonetype">
                                                  <option value="">اختر...</option>
                                                   <?php
                                                    foreach($survey_Hiring as $row)
                                                    {
                                                      echo '<option value="'.$row->sub_constant_id.'">'
													  		.$row->sub_constant_name.'</option>';
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
                                            class="form-control"  />
                                        </div>
                                    </div>
                                        <div class="form-group">
                                        <label class="control-label col-md-3">الاسم بالكامل  &nbsp;&nbsp;&nbsp;
                                        </label>
                                        <div class="col-md-4">
                                            <input type="text" id="txtcooperPersoneName" name="txtcooperPersoneName" data-required="1" 
                                            class="form-control"  />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">رقم الجوال   &nbsp;&nbsp;&nbsp;
                                        </label>
                                        <div class="col-md-4">
                                            <input type="text" id="txtcooperPersoneMobile" name="txtcooperPersoneMobile" class="form-control"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">العنوان  &nbsp;&nbsp;&nbsp;
                                        </label>
                                        <div class="col-md-4">
                                            <input type="text" id="txtcooperPersoneAddress" name="txtcooperPersoneAddress" data-required="1" 
                                            class="form-control"  />
                                        </div>
                                    </div>
                                    
                                </div>
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-offset-3 col-md-9">
                                                <button type="button" class="btn blue-madison" onclick="editeCooperativFamily();">
                                                حـفـظ</button>
                                            </div>
                                        </div>
                                    </div>
     
                  
                                     </div><!-- END tab_6_12-->
                                     <!-- ** END Elder-Family Relationship **-->
                                     <!-- ** Family Status **-->
                                     <div class="tab-pane fade" id="tab_6_10">
                                     <div class="col-md-12">
                                        <table class="table table-bordered table-striped">
                                        <thead>
                                          <tr>
                                            <th>
                                              <div class="col-md-3">
                                                 حالة أسرة المسن الاجتماعية والنفسية 
                                              </div>
                                              <div class="col-md-6">
                                                <select class="form-control" id="drpPsychologicalStatus" 
                                                	name="drpPsychologicalStatus">
                                                  <option value="">اختر...</option>
                                                  <?php
                                                    foreach($survey_PsychologicalStatus as $row)
                                                    {
                                                      echo '<option value="'.$row->sub_constant_id.'">'
													  		.$row->sub_constant_name.'</option>';
                                                  }
                                                   ?>
                                              </select>
                                              </div>
                                              <div class="col-md-2">
                                                <button id="btnAddfamilypsycho" name="btnAddfamilypsycho" type="button" 
                                                 class="btn btn-circle green-turquoise btn-sm" onclick="add_family_psycho()">
                                                <i id="iConst" class="fa fa-plus"></i></button> 
                                              </div>
                                            </th>
                                          </tr>
                                         </thead>
                                         <tbody id="tbdFamilyPsycho">
                                         
                                         </tbody>
                                         </table>
                                         
                                         </div>
                                     </div><!-- END tab_6_10-->
                                     <!-- ** END Family Status **-->
                                     <!-- ** Life Improvement ** -->
                                     <div class="tab-pane fade" id="tab_6_11">
                                     <div class="form-body">
                                        <br/>
                                          <div id="dvLifeImprovErrorMsg" class="alert alert-danger display-hide">
                                              <button class="close" data-close="alert"></button>
                                              يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                                          </div>
                                          <div id="dvLifeImprovSuccessMsg" class="alert alert-success display-hide">
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
                                                        echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
                                                    }
                                                     ?>
    
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">طبيعة العمل التي يمكنه/ها القيام به </label>
                                            <div class="col-md-4">
                                               <input type="text" id="txtelderworktype" name="txtelderworktype" class="form-control"/>
                                            </div>
                                        </div>
                                      
                                      <div class="form-group">
                                            <label class="control-label col-md-3">في حالة عدم القدرة على العمل – إمكانية تشغيل 
                                            </label>
                                            <div class="col-md-4">
                                                <select class="form-control" id="drpFamilyMember" name="drpFamilyMember">
                                                    <option value="">اختر...</option>
     												<?php
                                                      foreach($survey_FamilyMember as $row)
                                                      {
                                                        echo '<option value="'.$row->sub_constant_id.'">'
														.$row->sub_constant_name.'</option>';
                                                      }
                                                     ?>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">طبيعة العمل التي يمكنه/ها القيام به  </label>
                                            <div class="col-md-4">
                                                <input type="text" id="txtFamilyworktype" name="txtFamilyworktype" class="form-control"/>
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
                                                      foreach($survey_Choice as $row)
                                                      {
                                                        echo '<option value="'.$row->sub_constant_id.'">'
														.$row->sub_constant_name.'</option>';
                                                    }
                                                     ?>
                                                </select>
                                            </div>
                                        </div>
                                        
                                         <div class="form-group">
                                            <label class="control-label col-md-3">حدد نوع التدريب &nbsp;&nbsp;&nbsp </label>
                                            <div class="col-md-4">
                                                <input type="text" id="txtTrainigType" name="txtTrainigType" class="form-control"/>
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
                                                      foreach($survey_Choice as $row)
                                                      {
                                                        echo '<option value="'.$row->sub_constant_id.'">'
															.$row->sub_constant_name.'</option>';
                                                    }
                                                     ?>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">حدد نوع المشروع &nbsp;&nbsp;&nbsp </label>
                                            <div class="col-md-4">
                                                <input type="text" id="txtProjectType" name="txtProjectType" class="form-control"/>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">التكلفة المتوقعة لتنفيذ المشروع &nbsp;&nbsp;&nbsp </label>
                                            <div class="col-md-4">
                                                <input type="text" id="txtProjectBudget" name="txtProjectBudget" class="form-control"/>
                                            </div>
                                        </div>
                                        
                                      </div>
                                        
                                      <!-- END FORM BODY -->
                                      <div class="form-actions">
                                          <div class="row">
                                              <div class="col-md-offset-3 col-md-9">
                                                  <button type="button" class="btn blue-madison" onclick="editeLifeImprov()">
                                                  حـفـظ</button>
                                                  
                                              </div>
                                          </div>
                                      </div>  
                                     </div><!-- END tab_6_11-->
                                     <!-- ** END Life Improvement ** -->
                            		 
                                     </div><!-- END tab-content-->
                                     </div><!-- END col-md-9-->
                                  </div><!-- END ROW For Survey-->
                                </div><!-- END tab4-->
                                
                                <!-- Tab 5 -->
                                <div class="tab-pane" id="tab5">
                                    <h3 class="block">ادخل تـوصيـات البـاحــث</h3>
                                    <fieldset><legend>مســاعدات</legend>
                                    <div class="form-body">
                                        <br/>
                                          <div id="dvAidErrorMsg" class="alert alert-danger display-hide">
                                              <button class="close" data-close="alert"></button>
                                              يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                                          </div>
                                          <div id="dvAidSuccessMsg" class="alert alert-success display-hide">
                                              <button class="close" data-close="alert"></button>
                                              تـم عملية حـفـظ البيـانات بنجـاح !
                                          </div>
                                       <input id="hdnaidraction" name="hdnaidraction" type="hidden" value="addaidrecomend" />
                                   		<input id="hdnAidsRecomendationId" name="hdnAidsRecomendationId" type="hidden" value="" />
                                      <div class="form-group">
                                        <label class="control-label col-md-3">مساعدة مادية &nbsp;&nbsp;&nbsp;                                        </label>
                                        <div class="col-md-4">
                                            <select class="form-control" id="drpCashaidtype" name="drpCashaidtype">
                                                <option value="">اختر...</option>
                                                 <?php
                                                foreach($survey_CashAidType as $row)
                                                {
                                                    echo '<option value="'.$row->sub_constant_id.'">'
															.$row->sub_constant_name.'</option>';
                                                }
                                                ?>
                                            </select>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">قيمة المساعدة &nbsp;&nbsp;&nbsp </label>
                                        <div class="col-md-4">
                                            <input type="text" id="txtCashaidamount" name="txtCashaidamount" class="form-control"/>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">تغذية المسن &nbsp;&nbsp;&nbsp;                                        </label>
                                        <div class="col-md-4">
                                            <select class="form-control" id="drpNutritiontype" name="drpNutritiontype">
                                                <option value="">اختر...</option>
                                                 <?php
                                                foreach($survey_NutritionType as $row)
                                                {
                                                    echo '<option value="'.$row->sub_constant_id.'">'
														.$row->sub_constant_name.'</option>';
                                                }
                                                ?>
                                            </select>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">نوع الغذاء &nbsp;&nbsp;&nbsp </label>
                                        <div class="col-md-4">
                                            <input type="text" id="txtNutritiondetails" name="txtNutritiondetails" class="form-control"/>
                                        </div>
                                    </div>
                                                                         
                                    <div class="form-group">
                                        <label class="control-label col-md-3">دعم نفسي  &nbsp;&nbsp;&nbsp </label>
                                        <div class="col-md-4">
                                           <textarea id="txtarPsychologicalsupport" name="txtarPsychologicalsupport" 
                                              class="form-control"></textarea>
                                            
                                          </div>
                                   </div>
                                   
                                   <div class="form-group">
                                        <label class="control-label col-md-3">دعم اجتماعي &nbsp;&nbsp;&nbsp </label>
                                        <div class="col-md-4">
                                           <textarea id="txtarSocialsupport" name="txtarSocialsupport" 
                                                        class="form-control"></textarea>
                                          </div>
                                   </div>
                                   
                                   <div class="form-group">
                                        <label class="control-label col-md-3">ترفيه &nbsp;&nbsp;&nbsp </label>
                                        <div class="col-md-4">
                                            <textarea id="txtarEntertainment" name="txtarEntertainment" 
                                                        class="form-control"></textarea>
                                          </div>
                                   </div>
                                   
                                                     
                                  </div>
                                  <!-- END FORM BODY -->
                                  <div class="form-actions">
                                      <div class="row">
                                          <div class="col-md-offset-3 col-md-9">
                                              <button type="button" class="btn blue-madison" onclick="editeaidrecomend()">
                                              حـفـظ</button>
                                              
                                          </div>
                                      </div>
                                  </div>
                                    </fieldset><!-- END fieldset Aids-->
                                    <fieldset><legend>مساعدات طبية</legend>
                                    <div class="form-body">
                                    <br/>
                                      
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
                                                    echo '<option value="'.$row->sub_constant_id.'">'
															.$row->sub_constant_name.'</option>';
                                                }
                                                ?>
                                            </select>
                                            
                                        </div>
                                    	<div class="col-md-2">
                                          <button id="btnAddmedicalaid" name="btnAddmedicalaid" type="button" 
                                           class="btn btn-circle green-turquoise btn-sm" onclick="addmedicalaid()">
                                          <i id="iConst" class="fa fa-plus"></i></button> 
                                       </div>
                                      </th>
                                    </tr>
                                   </thead>
                                   <tbody id="tbmedicalaid">
                                   
                                    
                                   </tbody>
                                   </table>
                                    
                                  </div>
                                  <!-- END FORM BODY -->
                                    
                                    </fieldset><!-- END fieldset Midical Aids-->
                                    <fieldset><legend>السـكـن</legend>
                                    <div class="form-body">
                                    <br/>
                                      
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
                                                    echo '<option value="'.$row->sub_constant_id.'">'
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
                                           <button id="btnaddhomeaid" name="btnaddhomeaid" type="button" 
                                           class="btn btn-circle green-turquoise btn-sm" onclick="addhomeaid()">
                                           <i id="iConst" class="fa fa-plus"></i></button> 
                                         </div>
                                        </th>
                                       </tr>
                                      </thead>
                                      <tbody id="tbhomeaid">
                                      
                                      </tbody>
                                   </table>
                                  </div>
                                    <!-- END FORM BODY -->
                                    
                                    </fieldset><!-- END fieldset Home Aids-->
                                </div><!-- END tab5-->
                            </div>
                        </div>
                        <div class="form-actions">
                            <div class="row">
                                <div class="col-md-offset-3 col-md-9">
                                    <a href="javascript:;" class="btn default button-previous">
                                    <i class="m-icon-swapleft"></i> رجـوع </a>
                                    <a href="javascript:;" class="btn blue button-next">
                                    متـابـعة <i class="m-icon-swapright m-icon-white"></i>
                                    </a>
                                    <a href="javascript:;" class="btn green button-submit">
                                    إنـــهاء <i class="m-icon-swapright m-icon-white"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- END PAGE CONTENT-->