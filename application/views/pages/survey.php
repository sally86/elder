<?php
$ction ="addelder";
$fmction="addfamilymember";
$surveyction="addsurvey";
$homeStatusction="addhomeStatus";
$elderRoomaction="addelderRoom";
$elderFamRelAction="addelderFamRel";
$lifeImprovAction="addelifeImprov";
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
                <div class="tools hidden-xs">
                    <a href="javascript:;" class="collapse">
                    </a>
                    <a href="#portlet-config" data-toggle="modal" class="config">
                    </a>
                    <a href="javascript:;" class="reload">
                    </a>
                    <a href="javascript:;" class="remove">
                    </a>
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
                                <div class="alert alert-danger display-none">
                                    <button class="close" data-dismiss="alert"></button>
                                    يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة.
                                </div>
                                <div class="alert alert-success display-none">
                                    <button class="close" data-dismiss="alert"></button>
                                    تـم عملية حـفـظ البيـانات بنجـاح!
                                </div>
                                
                                <!-- Tab 1-->
                                <div class="tab-pane active" id="tab1">
                                    <h3 class="block">بيـانات مـلـف الـعــضـو</h3>
                                    <input id="hdnAction" name="hdnAction" type="hidden" value="<?php echo $ction;?>" />
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
                                            <div class="input-group date date-picker" data-date-format="yyyy-mm-dd">
                                                <input type="text" class="form-control" readonly id="dpDob" name="dpDob" value="">
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
                                            <select class="form-control" id="drpGovernorate" name="drpGovernorate">
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
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">المنطقـة <span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-4">
                                            <input type="text" id="txtRegion" name="txtRegion" data-required="1" class="form-control"/>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">وصف العنوان بالكامل <span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-4">
                                            <textarea name="txtFulladdress" id="txtFulladdress" cols="70" rows="2" class="form-control"></textarea>
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
                                            <select class="form-control" id="drpEducationlevel" name="drpEducationlevel">
                                                <option value="">اختر...</option>
   													<?php
												  		foreach($survey_Educationlevel as $row)
												 	 {
                      										echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
							  						}
							 						 ?>

	                                            </select>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">التخصص <span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-4">
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
                                        <label class="control-label col-md-3">العمل السابق <span class="required">
                                        * </span>
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
                                        <label class="control-label col-md-3">رقم الملف<span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-4">
                                           <input type="text" id="txtFileid" name="txtFileid" data-required="1" class="form-control" onblur="check_file_id()"/>
                                        </div>
                                    </div>
                                    
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
                                        <div class="col-md-4">
                                            <input type="text" id="txtVisittime" name="txtVisittime" data-required="1" class="form-control"/>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3"> سـاعة انتهاء الزيارة<span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-4">
                                          <input type="text" id="txtVisitendtime" name="txtVisitendtime" data-required="1" class="form-control"/>
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
                                        <label class="control-label col-md-3">اسـم المرافق الأول <span class="required">
                                        * </span>
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
                                        <label class="control-label col-md-3">اسـم المرافق الثاني <span class="required">
                                        * </span>
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
                                    <div class="form-group">
                                        <label class="control-label col-md-3">الاسـم <span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-4">
                                            <input type="text" id="txtMembername" name="txtMembername" data-required="1" class="form-control"/>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">رقم الهوية <span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-4">
                                            <input type="text" id="txtMemberId" name="txtMemberId" data-required="1" class="form-control" onblur="check_familymember_id()"/>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">النوع الطبيعي&nbsp;&nbsp;&nbsp;
                                        </label>
                                        <div class="col-md-4">
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
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">صـلة القـرابـة&nbsp;&nbsp;&nbsp;
                                        </label>
                                        <div class="col-md-4">
                                            <select class="form-control" id="drpMemRelationship" name="drpMemRelationship">
                                                <option value="">اختر...</option>
                                                <?php
												  		foreach($survey_Relationship as $row)
												 	 {
                      										echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
							  						}
							 						 ?>
                                            </select>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">الحـالة الاجتمـاعية&nbsp;&nbsp;&nbsp;
                                        </label>
                                        <div class="col-md-4">
                                            <select class="form-control" id="drpMemStatus" name="drpMemStatus">
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
                                        <label class="control-label col-md-3">تـاريخ الميـلاد</label>
                                        <div class="col-md-4">
                                            <div class="input-group date date-picker" data-date-format="yyyy-mm-dd">
                                                <input type="text" class="form-control" readonly id="dpMemDob" name="dpMemDob">
                                                <span class="input-group-btn">
                                                <button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
                                                </span>
                                            </div>
                                            <!-- /input-group -->
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">المستـوى التعليمي&nbsp;&nbsp;&nbsp;
                                        </label>
                                        <div class="col-md-4">
                                            <select class="form-control" id="drpMemEdulevel" name="drpMemEdulevel">
                                                <option value="">اختر...</option>
                               					<?php
												  foreach($survey_Educationlevel as $row)
												  {
                      								echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
							  					}
							 					 ?>
                                            </select>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">الحـالة الصحيـة&nbsp;&nbsp;&nbsp;
                                        </label>
                                        <div class="col-md-4">
                                            <select class="form-control" id="drpMemHealth" name="drpMemHealth">
                                                <option value="">اختر...</option>
                                                <?php
												  foreach($survey_Health as $row)
												  {
                      								echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
							  					}
							 					 ?>
                                            </select>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">المهنة&nbsp;&nbsp;&nbsp;</label>
                                        <div class="col-md-4">
                                            <input type="text" id="txtMemjob" name="txtMemjob" class="form-control"/>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">الدخل بالشيكل&nbsp;&nbsp;&nbsp;</label>
                                        <div class="col-md-4">
                                            <input type="text" id="txtMemincome" name="txtMemincome" class="form-control"/>
                                        </div>
                                    </div>
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
                                     	<div class="form-group">
                                          <label class="control-label col-md-3">الحـالة الصـحيـة </label>
                                          <div class="col-md-4">
                                              <div class="checkbox-list" data-error-container="#form_2_services_error">
                                                  <label>
                                                  <input type="checkbox" value="1" name="chbxIsactive" /> الجهاز الهضمي</label>
                                                  <label>
                                                  <input type="checkbox" value="1" name="chbxIsactive" /> الجهاز التنفسي</label>
                                                  <label>
                                                  <input type="checkbox" value="1" name="chbxIsactive" /> الجهاز العصبي</label>
                                                  <label>
                                                  <input type="checkbox" value="1" name="chbxIsactive" /> الجهاز الدوري</label>
                                                  <label>
                                                  <input type="checkbox" value="1" name="chbxIsactive" /> الجهاز البولي</label>
                                                  <label>
                                                  <input type="checkbox" value="1" name="chbxIsactive" /> أمراض جلدية</label>
                                                  <label>
                                                  <input type="checkbox" value="1" name="chbxIsactive" /> زهايمر</label>
                                                  <label>
                                                  <input type="checkbox" value="1" name="chbxIsactive" /> النفسي</label>
                                                  <label>
                                                  <input type="checkbox" value="1" name="chbxIsactive" /> رعاش</label>
                                                  <label>
                                                  <input type="checkbox" value="1" name="chbxIsactive" /> الجهاز العظمي</label>
                                                  <label>
                                                  <input type="checkbox" value="1" name="chbxIsactive" /> شلل دماغي</label>
                                                  <label>
                                                  <input type="checkbox" value="1" name="chbxIsactive" /> الغدد</label>
                                                  <label>
                                                  <input type="checkbox" value="1" name="chbxIsactive" /> السرطان</label>
                                                  <label>
                                                  <input type="checkbox" value="1" name="chbxIsactive" /> العيون</label>
                                                  <label>
                                                  <input type="checkbox" value="1" name="chbxIsactive" /> إعاقة خلقية</label>
                                                  <label>
                                                  <input type="checkbox" value="1" name="chbxIsactive" /> إعاقة نتيجة إصابةحرب</label>
                                                  <label>
                                                  <input type="checkbox" value="1" name="chbxIsactive" /> إعاقة نتيجة حادث</label>
                                                  <label>
                                                  <input type="checkbox" value="1" name="chbxIsactive" /> جهاز سمعي</label>
                                              </div>
                                              <div id="form_2_services_error">
                                              </div>
                                          </div>
                                      </div>
                                     </div><!-- END tab_6_3-->
                                     <!-- ** END Health Status ** -->
                                     <!-- ** Income Resources ** -->
                                     <div class="tab-pane fade" id="tab_6_4">
                              		 <fieldset><legend>ملخص الدخل</legend>
                                     <div class="form-body">
                                      <br/>
                                        <div class="alert alert-danger display-hide">
                                            <button class="close" data-close="alert"></button>
                                            يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                                        </div>
                                        <div class="alert alert-success display-hide">
                                            <button class="close" data-close="alert"></button>
                                            Your form validation is successful!
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
                                                <button type="submit" class="btn blue-madison">حـفـظ</button>
                                                <button type="button" class="btn default">الغاء الامر</button>
                                            </div>
                                        </div>
                                    </div>
                                     </fieldset><!-- END fieldset Summery-->
                                     <fieldset><legend>تفاصيل الدخل</legend>
                                     <div class="form-body">
                                      <br/>
                                        <div class="alert alert-danger display-hide">
                                            <button class="close" data-close="alert"></button>
                                            يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                                        </div>
                                        <div class="alert alert-success display-hide">
                                            <button class="close" data-close="alert"></button>
                                            Your form validation is successful!
                                        </div>
                                        
                                        <div class="form-group">
                                          <label class="control-label col-md-3">مصدر الدخل <span class="required">
                                          * </span>
                                          </label>
                                          <div class="col-md-4">
                                              <select class="form-control select2me" id="drpincomeSource" name="drpincomeSource">
                                                  <option value="">اختر...</option>
                                                  <?php
                                                    foreach($survey_IncomeSource as $row)
                                                    {
                                                      echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
                                                  }
                                                   ?>
                                              </select>
                                          </div>
                                      </div>
                                        
                                        <div class="form-group">
                                          <label class="control-label col-md-3">القيمة المالية للدخل <span class="required">
                                          * </span>
                                          </label>
                                          <div class="col-md-4">
                                            <textarea id="txtPackage" name="txtPackage" cols="70" rows="2" class="form-control"></textarea>
                                          </div>
                                        </div>
                                        
                                        <div class="form-group">
                                          <label class="control-label col-md-3">المساعدة العينية <span class="required">
                                          * </span>
                                          </label>
                                          <div class="col-md-4">
                                            <input type="text" id="txtTotalincome" name="txtTotalincome" data-required="1" class="form-control"/>
                                          </div>
                                        </div>
                                        
                                        <div class="form-group">
                                          <label class="control-label col-md-3">التقييم المالي للمساعدات العينية <span class="required">
                                          * </span>
                                          </label>
                                          <div class="col-md-4">
                                            <input type="text" id="txtPackagecashvalue" name="txtPackagecashvalue" data-required="1" class="form-control"/>
                                          </div>
                                        </div>
                                        
                                    </div>
                                    <!-- END FORM BODY -->
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-offset-3 col-md-9">
                                                <button type="submit" class="btn blue-madison">حـفـظ</button>
                                                <button type="button" class="btn default">الغاء الامر</button>
                                            </div>
                                        </div>
                                    </div>
                                    <br/>
                                    <!-- END FORM-->
                                    <table class="table table-bordered table-striped">
                                    <thead>
                                      <tr>
                                          <th>المصدر</th>
                                          <th>القيمة المالية للدخل</th>
                                          <th>المساعدة العينية</th>
                                          <th>التقييم المالي للمساعدات العينية</th>
                                      </tr>
                                     </thead>
                                     <tbody>
                                      <tr>
                                          <td>عمل خاص</td>
                                          <td>1000</td>
                                          <td>&nbsp;</td>
                                          <td>&nbsp;</td>
                                       </tr>
                                     </tbody>
                                     </table>   
                                     </fieldset>
                                     </div><!-- END tab_6_4-->
                                     <!-- ** END Income Resources ** -->
                                   	 <!-- ** Home Status ** -->
                                     <div class="tab-pane fade" id="tab_6_5">
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
                                          <input id="homeStatushdnAction" name="homeStatushdnAction" type="hidden" value="<?php echo $homeStatusction;?>" />
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
                                                        echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
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
                                                  <button type="submit" class="btn blue-madison">حـفـظ</button>
                                                  <button type="button" class="btn default">الغاء الامر</button>
                                              </div>
                                          </div>
                                      </div>
                                     </div><!-- END tab_6_5-->
                                     <!-- ** END Home Status **-->
                                     <!-- ** Elder Room **-->
                                     <div class="tab-pane fade" id="tab_6_6">
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
                                        <input id="elderRoomhdnAction" name="elderRoomhdnAction" type="hidden" value="<?php echo $elderRoomaction;?>" />
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
                                            <label class="control-label col-md-3">تهيوية الغرفة <span class="required">
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
                                            <label class="control-label col-md-3">بحاجة للصيانة <span class="required">
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
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">بحاجة للترميم <span class="required">
                                             * </span>
                                             </label>
                                            <div class="col-md-4">
                                                <select class="form-control select2me" id="drpRestoration" name="drpRestoration">
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
                                                <button type="submit" class="btn blue-madison">حـفـظ</button>
                                                <button type="button" class="btn default">الغاء الامر</button>
                                            </div>
                                        </div>
                                    </div>
                                     </div><!-- END tab_6_6-->
                                     <!-- ** END Elder Room **-->
                                     <!-- ** Elder Midication **-->
                                     <div class="tab-pane fade" id="tab_6_7">
                              		 <fieldset><legend>توفر العلاج</legend>
                                     <div class="form-body">
                                      <br/>
                                        <div class="alert alert-danger display-hide">
                                            <button class="close" data-close="alert"></button>
                                            يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                                        </div>
                                        <div class="alert alert-success display-hide">
                                            <button class="close" data-close="alert"></button>
                                            Your form validation is successful!
                                        </div>
                                        
                                        <div class="form-group">
                                          <label class="control-label col-md-3">اسم الدواء <span class="required">
                                          * </span>
                                          </label>
                                          <div class="col-md-4">
                                              <input type="text" id="txtMedicinename" name="txtMedicinename" data-required="1" class="form-control"/>
                                          </div>
                                        </div>
                                          
                                          <div class="form-group">
                                              <label class="control-label col-md-3">توفير العلاج للمسن  </label>
                                              <div class="col-md-4">
                                                  <select class="form-control select2me" id="drpMedicationNeed" name="drpMedicationNeed">
                                                    <option value="">اختر...</option>
                                                    <?php
                                                      foreach($survey_MedicationNeed as $row)
                                                      {
                                                        echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
                                                    }
                                                     ?>
                                                </select>
                                              </div>
                                          </div>
                                          
                                          <div class="form-group">
                                            <label class="control-label col-md-3">سبب الانقطاع &nbsp;&nbsp;&nbsp </label>
                                            <div class="col-md-4">
                                                <input type="text" id="txtReason" name="txtReason" class="form-control"/>
                                            </div>
                                        </div>
                                          
                                      </div>
                                      <!-- END FORM BODY -->
                                      <div class="form-actions">
                                          <div class="row">
                                              <div class="col-md-offset-3 col-md-9">
                                                  <button type="submit" class="btn blue-madison">حـفـظ</button>
                                                  <button type="button" class="btn default">الغاء الامر</button>
                                              </div>
                                          </div>
                                      </div><br/>
                                     <!-- END FORM-->
                                    <table class="table table-bordered table-striped">
                                    <thead>
                                      <tr>
                                          <th>اسم الدواء</th>
                                          <th>حالة الدواء</th>
                                          <th>سبب الانقطاع</th>
                                      </tr>
                                     </thead>
                                     <tbody>
                                      <tr>
                                          <td>Amiral</td>
                                          <td>متوفر</td>
                                          <td>&nbsp;</td>
                                       </tr>
                                       <tr>
                                          <td>Lipanthyl</td>
                                          <td>متقطع</td>
                                          <td>غير متوفر دائما في العيادات الحكومية</td>
                                       </tr>
                                     </tbody>
                                     </table>   
                                     </fieldset><!-- END fieldset Mication Available-->
                                     <fieldset><legend>الاحتياجات العلاجية</legend>
                                     <div class="form-body">
                                      <br/>
                                        <div class="alert alert-danger display-hide">
                                            <button class="close" data-close="alert"></button>
                                            يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                                        </div>
                                        <div class="alert alert-success display-hide">
                                            <button class="close" data-close="alert"></button>
                                            Your form validation is successful!
                                        </div>
                                                                                                                  
                                        <div class="form-group">
                                            <label class="control-label col-md-3">بحاجة الى  </label>
                                            <div class="col-md-4">
                                                <select class="form-control select2me" id="drpMedtype" name="drpMedtype">
                                                  <option value="">اختر...</option>
                                                 
                                                    <?php
                                                    foreach($survey_MedicationType as $row)
                                                    {
                                                      echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
                                                  }
                                                   ?>
                                              </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                          <label class="control-label col-md-3">تفاصيل&nbsp;&nbsp;&nbsp;
                                          </label>
                                          <div class="col-md-4">
                                              <input type="text" id="txtMeddetails" name="txtMeddetails" class="form-control"/>
                                          </div>
                                      </div>
                                        
                                    </div>
                                    <!-- END FORM BODY -->
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-offset-3 col-md-9">
                                                <button type="submit" class="btn blue-madison">حـفـظ</button>
                                                <button type="button" class="btn default">الغاء الامر</button>
                                            </div>
                                        </div>
                                    </div>
                                    <br/>
                                     <!-- END FORM-->
                                    <table class="table table-bordered table-striped">
                                    <thead>
                                      <tr>
                                          <th>نوع العلاج</th>
                                          <th>تفـاصيل العلاح</th>
                                      </tr>
                                     </thead>
                                     <tbody>
                                      <tr>
                                          <td>علاج</td>
                                          <td>علاج طبيعي</td>
                                       </tr>
                                     </tbody>
                                     </table>   
                                     </fieldset><!-- END fieldset Mication Needs-->
                                     </div><!-- END tab_6_7-->
                                     <!-- ** END Elder Midication **-->
                                     <!-- ** Family-Elder Relationship **-->
                                     <div class="tab-pane fade" id="tab_6_8">
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
                                        <input id="elderFamRelAction" name="elderFamRelAction" type="hidden" value="<?php echo $elderFamRelAction;?>" />
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
                                                      echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
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
                                        
                                    </div>
                                    <!-- END FORM BODY -->
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-offset-3 col-md-9">
                                                <button type="submit" class="btn blue-madison">حـفـظ</button>
                                                <button type="button" class="btn default">الغاء الامر</button>
                                            </div>
                                        </div>
                                    </div>
                                     </div><!-- END tab_6_8-->
                                     <!-- ** END Family-Elder Relationship **-->
                                     <!-- ** Elder-Family Relationship **-->
                                     <div class="tab-pane fade" id="tab_6_9">
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
                                         
                                        <div class="form-group">
                                          <label class="control-label col-md-3">علاقة المسن بالأسرة والمجتمع المحلي <span class="required">
                                          * </span>
                                          </label>
                                          <div class="col-md-4">
                                              <select class="form-control select2me" id="drp" name="drp">
                                                  <option value="">اختر...</option>
                                                  <option value="pending">انطوائي</option>
                                                  <option value="closed">مبادر</option>
                                                  <option value="closed">مشاركة الآخرين</option>
                                                  <option value="closed">الإهتمام بمن حوله</option>
                                                  <option value="closed">أناني</option>
                                                  <option value="closed">منبوذ بسبب انه أناني</option>
                                                  <option value="closed">منبوذ بسبب انه سليط اللسان</option>
                                                  <option value="closed">منبوذ بسبب انه عصبي</option>
                                                  <option value="closed">منبوذ بسبب انه مريض</option>
                                                  <option value="closed">منبوذ بسبب انه صعب الحركة</option>
                                                  
                                              </select>
                                          </div>
                                      </div>
                   
                                    </div>
                                    <!-- END FORM BODY -->
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-offset-3 col-md-9">
                                                <button type="submit" class="btn blue-madison">حـفـظ</button>
                                                <button type="button" class="btn default">الغاء الامر</button>
                                            </div>
                                        </div>
                                    </div>
                                    <br/>
                                     <!-- END FORM-->
                                    <table class="table table-bordered table-striped">
                                    <thead>
                                      <tr>
                                          <th>علاقة المسن بالأسرة والمجتمع المحلي</th>
                                      </tr>
                                     </thead>
                                     <tbody>
                                      <tr>
                                          <td>الإهتمام بمن حوله</td>
                                       </tr>
                                      <tr>
                                          <td>منبوذ بسبب انه عصبي</td>
                                      </tr>
                                     </tbody>
                                     </table>   
                                     </div><!-- END tab_6_9-->
                                     <!-- ** END Elder-Family Relationship **-->
                                     <!-- ** Family Status **-->
                                     <div class="tab-pane fade" id="tab_6_10">
                                     <div class="form-body">
                                      <br/>
                                        <div class="alert alert-danger display-hide">
                                            <button class="close" data-close="alert"></button>
                                            يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                                        </div>
                                        <div class="alert alert-success display-hide">
                                            <button class="close" data-close="alert"></button>
                                            Your form validation is successful!
                                        </div>
                                        
                                        <div class="form-group">
                                          <label class="control-label col-md-3">حالة أسرة المسن الاجتماعية والنفسية  <span class="required">
                                          * </span>
                                          </label>
                                          <div class="col-md-4">
                                              <select class="form-control select2me" id="drpPsychologicalStatus" name="drpPsychologicalStatus">
                                                  <option value="">اختر...</option>
                                                  <?php
                                                    foreach($survey_PsychologicalStatus as $row)
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
                                                <button type="submit" class="btn blue-madison">حـفـظ</button>
                                                <button type="button" class="btn default">الغاء الامر</button>
                                            </div>
                                        </div>
                                    </div><br/>
                                     <!-- END FORM-->
                                    <table class="table table-bordered table-striped">
                                    <thead>
                                      <tr>
                                          <th>علاقة المسن بالأسرة والمجتمع المحلي</th>
                                      </tr>
                                     </thead>
                                     <tbody>
                                      <tr>
                                          <td>مشاركة</td>
                                       </tr>
                                      <tr>
                                          <td>منفتحة</td>
                                      </tr>
                                     </tbody>
                                     </table>   
                                     </div><!-- END tab_6_10-->
                                     <!-- ** END Family Status **-->
                                     <!-- ** Life Improvement ** -->
                                     <div class="tab-pane fade" id="tab_6_11">
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
                                          <input id="lifeImprovhdnaction" name="lifeImprovhdnaction" type="hidden" value="<?php echo $lifeImprovAction;?>" />
                                          <div class="form-group">
                                            <label class="control-label col-md-3">قدرة المسن على العمل  <span class="required">
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
                                            <label class="control-label col-md-3">طبيعة العمل التي يمكنه/ها القيام به  &nbsp;&nbsp;&nbsp </label>
                                            <div class="col-md-4">
                                                <input type="text" id="txtelderworktype" name="txtelderworktype" class="form-control"/>
                                            </div>
                                        </div>
                                      
                                      <div class="form-group">
                                            <label class="control-label col-md-3">في حالة عدم القدرة على العمل – إمكانية تشغيل  <span class="required">
                                            * </span>
                                            </label>
                                            <div class="col-md-4">
                                                <select class="form-control select2me" id="drpFamilyMember" name="drpFamilyMember">
                                                    <option value="">اختر...</option>
     <?php
                                                      foreach($survey_FamilyMember as $row)
                                                      {
                                                        echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
                                                    }
                                                     ?>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">طبيعة العمل التي يمكنه/ها القيام به  &nbsp;&nbsp;&nbsp </label>
                                            <div class="col-md-4">
                                                <input type="text" id="txtFamilyworktype" name="txtFamilyworktype" class="form-control"/>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">هل يوجد حاجة للتدريب  <span class="required">
                                            * </span>
                                            </label>
                                            <div class="col-md-4">
    
                                                <select class="form-control select2me" id="drpNeedtraining" name="drpNeedtraining">
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
                                            <label class="control-label col-md-3">حدد نوع التدريب &nbsp;&nbsp;&nbsp </label>
                                            <div class="col-md-4">
                                                <input type="text" id="txtTrainigType" name="txtTrainigType" class="form-control"/>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3">إمكانية عمل مشروع صغير مدر للدخل  &nbsp;&nbsp;&nbsp 
                                            </label>
                                            <div class="col-md-4">
                                                <select class="form-control" id="drpStartproject" name="drpStartproject">
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
                                                  <button type="submit" class="btn blue-madison">حـفـظ</button>
                                                  <button type="button" class="btn default">الغاء الامر</button>
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
                                        <div class="alert alert-danger display-hide">
                                            <button class="close" data-close="alert"></button>
                                            يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                                        </div>
                                        <div class="alert alert-success display-hide">
                                            <button class="close" data-close="alert"></button>
                                            Your form validation is successful!
                                        </div>
                                        
                                        <div class="form-group">
                                          <label class="control-label col-md-3">مساعدة مادية &nbsp;&nbsp;&nbsp;                                        </label>
                                          <div class="col-md-4">
                                              <select class="form-control select2me" id="drpCashAidType" name="drpCashAidType">
                                                  <option value="">اختر...</option>
                                                   <?php
                                                    foreach($survey_CashAidType as $row)
                                                    {
                                                      echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
                                                  }
                                                   ?>
                                              </select>
                                          </div>
                                      </div>
                                      
                                      <div class="form-group">
                                          <label class="control-label col-md-3">قيمة المساعدة &nbsp;&nbsp;&nbsp </label>
                                          <div class="col-md-4">
                                              <input type="text" id="txtReason" name="txtReason" class="form-control"/>
                                          </div>
                                      </div>
                                      
                                      <div class="form-group">
                                          <label class="control-label col-md-3">تغذية المسن &nbsp;&nbsp;&nbsp;                                        </label>
                                          <div class="col-md-4">
                                              <select class="form-control select2me" id="drpNutritionType" name="drpNutritionType">
                                                  <option value="">اختر...</option>
                                                  <option value="pending">أغذية</option>
                                                  <option value="closed">غذاء خاص</option>
                                                   <?php
                                                    foreach($survey_NutritionType as $row)
                                                    {
                                                      echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
                                                  }
                                                   ?>
  
                                              </select>
                                          </div>
                                      </div>
                                      
                                      <div class="form-group">
                                          <label class="control-label col-md-3">نوع الغذاء &nbsp;&nbsp;&nbsp </label>
                                          <div class="col-md-4">
                                              <input type="text" id="txtReason" name="txtReason" class="form-control"/>
                                          </div>
                                      </div>
                                                                           
                                      <div class="form-group">
                                          <label class="control-label col-md-3">دعم نفسي  &nbsp;&nbsp;&nbsp </label>
                                          <div class="col-md-4">
                                              <div class="checkbox-list" data-error-container="#form_2_services_error">
                                                  <label>
                                                  <input type="checkbox" value="1" name="chbxIsactive" /></label>
                                              </div>
                                            </div>
                                     </div>
                                     
                                     <div class="form-group">
                                          <label class="control-label col-md-3">دعم اجتماعي &nbsp;&nbsp;&nbsp </label>
                                          <div class="col-md-4">
                                              <div class="checkbox-list" data-error-container="#form_2_services_error">
                                                  <label>
                                                  <input type="checkbox" value="1" name="chbxIsactive" /></label>
                                              </div>
                                            </div>
                                     </div>
                                     
                                     <div class="form-group">
                                          <label class="control-label col-md-3">ترفيه &nbsp;&nbsp;&nbsp </label>
                                          <div class="col-md-4">
                                              <div class="checkbox-list" data-error-container="#form_2_services_error">
                                                  <label>
                                                  <input type="checkbox" value="1" name="chbxIsactive" /></label>
                                              </div>
                                            </div>
                                     </div>
                                     
                                     <div class="form-group">
                                          <label class="control-label col-md-3">مشروع تشغيل المسن &nbsp;&nbsp;&nbsp </label>
                                          <div class="col-md-4">
                                              <div class="checkbox-list" data-error-container="#form_2_services_error">
                                                  <label>
                                                  <input type="checkbox" value="1" name="chbxIsactive" /></label>
                                              </div>
                                            </div>
                                     </div>
                                     
                                     <div class="form-group">
                                          <label class="control-label col-md-3">مشروع مدر للدخل &nbsp;&nbsp;&nbsp </label>
                                          <div class="col-md-4">
                                              <div class="checkbox-list" data-error-container="#form_2_services_error">
                                                  <label>
                                                  <input type="checkbox" value="1" name="chbxIsactive" /></label>
                                              </div>
                                            </div>
                                     </div>
                                     
                                    </div>
                                    <!-- END FORM BODY -->
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-offset-3 col-md-9">
                                                <button type="submit" class="btn blue-madison">حـفـظ</button>
                                                <button type="button" class="btn default">الغاء الامر</button>
                                            </div>
                                        </div>
                                    </div>
                                    </fieldset><!-- END fieldset Aids-->
                                    <fieldset><legend>مساعدات طبية</legend>
                                    <div class="form-body">
                                      <br/>
                                        <div class="alert alert-danger display-hide">
                                            <button class="close" data-close="alert"></button>
                                            يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                                        </div>
                                        <div class="alert alert-success display-hide">
                                            <button class="close" data-close="alert"></button>
                                            Your form validation is successful!
                                        </div>
                                        
                                        <div class="form-group">
                                          <label class="control-label col-md-3">مساعدة طبية عينية &nbsp;&nbsp;&nbsp;                                        </label>
                                          <div class="col-md-4">
                                              <select class="form-control select2me" id="drpPsychologicalSupport" name="drpPsychologicalSupport">
                                                  <option value="">اختر...</option>
                                                <?php
                                                    foreach($survey_PsychologicalSupport as $row)
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
                                                <button type="submit" class="btn blue-madison">حـفـظ</button>
                                                <button type="button" class="btn default">الغاء الامر</button>
                                            </div>
                                        </div>
                                    </div><br/>
                                   <!-- END FORM-->
                                    <table class="table table-bordered table-striped">
                                    <thead>
                                      <tr>
                                          <th>المساعدات الطبية</th>
                                      </tr>
                                     </thead>
                                     <tbody>
                                      <tr>
                                          <td>نظارة</td>
                                       </tr>
                                      <tr>
                                          <td>جهاز ضغط</td>
                                      </tr>
                                     </tbody>
                                     </table>   
                                    </fieldset><!-- END fieldset Midical Aids-->
                                    <fieldset><legend>السـكـن</legend>
                                    <div class="form-body">
                                      <br/>
                                        <div class="alert alert-danger display-hide">
                                            <button class="close" data-close="alert"></button>
                                            يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                                        </div>
                                        <div class="alert alert-success display-hide">
                                            <button class="close" data-close="alert"></button>
                                            Your form validation is successful!
                                        </div>
                                        
                                        <div class="form-group">
                                          <label class="control-label col-md-3">تأهيل سكن وتحسين سبل عيش المسن &nbsp;&nbsp;&nbsp;                                        </label>
                                          <div class="col-md-4">
                                              <select class="form-control select2me" id="drpHomeImprovRecomend" name="drpHomeImprovRecomend">
                                                  <option value="">اختر...</option>
                                                <?php
                                                    foreach($survey_HomeImprovRecomend as $row)
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
                                                <button type="submit" class="btn blue-madison">حـفـظ</button>
                                                <button type="button" class="btn default">الغاء الامر</button>
                                            </div>
                                        </div>
                                    </div><br/>
                                     <!-- END FORM-->
                                    <table class="table table-bordered table-striped">
                                    <thead>
                                      <tr>
                                          <th>تأهيل سكن</th>
                                      </tr>
                                     </thead>
                                     <tbody>
                                      <tr>
                                          <td>ترميم غرفة المسن</td>
                                       </tr>
                                      <tr>
                                          <td>أجهزة كهربائية</td>
                                      </tr>
                                     </tbody>
                                     </table>   
                                    </fieldset><!-- END fieldset Home Aids-->
                                </div><!-- END tab5-->
                            </div>
                        </div>
                        <div class="form-actions">
                            <div class="row">
                                <div class="col-md-offset-3 col-md-9">
                                    <a href="javascript:;" class="btn default button-previous">
                                    <i class="m-icon-swapleft"></i> Back </a>
                                    <a href="javascript:;" class="btn blue button-next">
                                    Continue <i class="m-icon-swapright m-icon-white"></i>
                                    </a>
                                    <a href="javascript:;" class="btn green button-submit">
                                    Submit <i class="m-icon-swapright m-icon-white"></i>
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