<?php
$eldername = '';
if (isset($elder_file))
{
	//unset($_SESSION['update']);
	foreach($elder_file as $elder_file_row);
	foreach($elder_info as $elder_info_row);
	
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
?>
<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<div class="row">
    <div class="col-md-12">
      <!-- BEGIN VALIDATION STATES-->
      <div class="portlet box blue-madison">
          <div class="portlet-title">
              <div class="caption">
                  <i class="fa fa-folder-open"></i>بيـانـات المـلـف (<?php echo $eldername;?>)
              </div>
          </div>
          <div class="portlet-body form">
          	<input id="hdnFileid" name="hdnFileid" type="hidden" value="<?php echo $elder_file_row->file_id;?>" />
              <!-- BEGIN FORM-->
              <form action="#" id="file_form" class="form-horizontal">
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
                      
                      <div class="form-group">
                          <label class="control-label col-md-3">حالة الملف <span class="required">
                          * </span>
                          </label>
                          <div class="col-md-4">
                              <select class="form-control select2me" id="drpFilestatus" name="drpFilestatus">
                                  <option value="">اختر...</option>
                                  <?php
								  foreach ($file_status as $row_file_status)
								  {
									  $selected = '';
									  
									  if ($elder_file_row->file_status_id == $row_file_status->sub_constant_id)
									  	$selected = 'selected="selected"';
										
									  echo '<option value="'.$row_file_status->sub_constant_id.'" '.$selected.'>'
									  						.$row_file_status->sub_constant_name.'</option>';
								  }
								  ?>
                              </select>
                          </div>
                      </div>
                      
                      <div id="dvClose" 
					  		<?php if ($elder_file_row->file_status_id == 172) echo 'style="display:block"';
									else echo 'style="display:none"'; ?>
					  >
                      <div class="form-group">
                          <label class="control-label col-md-3">تـاريخ الاغـلاق <span class="required">
                          * </span>
                          </label>
                          <div class="col-md-4">
                              <div class="input-group date date-picker" data-date-format="yyyy-mm-dd">
                                  <input type="text" class="form-control" readonly id="dpClose" name="dpClose" 
                                  value="<?php if(isset($elder_file_row->close_date)) echo $elder_file_row->close_date;?>"
                                  >
                                  <span class="input-group-btn">
                                  <button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
                                  </span>
                              </div>
                              <!-- /input-group -->
                          </div>
                      </div>
                      
                      <div class="form-group">
                          <label class="control-label col-md-3">سبب الاغلاق <span class="required">
                          * </span>
                          </label>
                          <div class="col-md-4">
                              <select class="form-control" id="drpClosereasone" name="drpClosereasone">
                                  <option value="">اختر...</option>
                                   <?php
								  foreach ($close_resone as $row_close_resone)
								  {
									  $selected = '';
									  
									  if ($elder_file_row->close_reason_id == $row_close_resone->sub_constant_id)
									  	$selected = 'selected="selected"';
										
									  echo '<option value="'.$row_close_resone->sub_constant_id.'" '.$selected.'>'
									  						.$row_close_resone->sub_constant_name.'</option>';
								  }
								  ?>
                              </select>
                          </div>
                      </div>
                      </div> <!-- END Div Close -->
                      
                  </div>
                  <!-- END FORM BODY -->
                  <div class="form-actions">
                      <div class="row">
                          <div class="col-md-offset-3 col-md-9">
                              <button id="btnSavefile" type="submit" class="btn blue-madison">حـفـظ</button>
                              
                          </div>
                      </div>
                  </div>
              </form>
              <!-- END FORM-->
          </div>
          <!-- END VALIDATION STATES-->
      </div>
  </div>
</div>
<!----------------------------- END FILE ----------------------------------------------->
<div class="row">
    <div class="col-md-12">
      <!-- BEGIN VALIDATION STATES-->
      <div class="portlet box blue-madison">
          <div class="portlet-title">
              <div class="caption">
                  <i class="fa fa-user"></i>بيـانـات العـضــو الشـخـصيــة (<?php echo $eldername;?>)
              </div>
          </div>
          <div class="portlet-body form">
              <!-- BEGIN FORM-->
              <form action="#" id="elder_form" class="form-horizontal">
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
                      
                      <div class="form-group">
                          <label class="control-label col-md-3">تـصنيف الحـالة <span class="required">
                          * </span>
                          </label>
                          <div class="col-md-4">
                            <select class="form-control" id="drpEldercategory" name="drpEldercategory">
                                <option value="">اختر...</option>
                                <?php
                                foreach($eldercategory as $eldercategoryrow)
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
                               value="<?php if(isset($elder_info_row->elder_id)) echo $elder_info_row->elder_id;?>"
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
                              <div class="input-group date date-picker" data-date-format="yyyy-mm-dd">
                                  <input type="text" class="form-control" readonly id="dpDob" name="dpDob"
                                  value="<?php if(isset($elder_info_row->dob)) echo $elder_info_row->dob;?>"
                                  >
                                  <span class="input-group-btn">
                                  <button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
                                  </span>
                              </div>
                              <!-- /input-group -->
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
								  foreach ($status as $status_row)
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
								  foreach ($governorate as $governorate_row)
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
                          <label class="control-label col-md-3">المنطقـة <span class="required">
                          * </span>
                          </label>
                          <div class="col-md-4">
                              <input type="text" id="txtRegion" name="txtRegion" data-required="1" class="form-control"
                              value="<?php if(isset($elder_info_row->region)) echo $elder_info_row->region;?>"
                              />
                          </div>
                      </div>
                      
                      <div class="form-group">
                          <label class="control-label col-md-3">وصف العنوان بالكامل <span class="required">
                          * </span>
                          </label>
                          <div class="col-md-4">
                          	  <textarea name="txtFulladdress" cols="70" rows="2" class="form-control"><?php if(isset($elder_info_row->region)) echo $elder_info_row->region;?>
                              </textarea>
                          </div>
                      </div>
                                            
                      <div class="form-group">
                          <label class="control-label col-md-3">رقم الهاتف <span class="required">
                          * </span>
                          </label>
                          <div class="col-md-4">
                              <input type="text" id="txtPhone" name="txtPhone" class="form-control"
                               value="<?php if(isset($elder_info_row->phone)) echo $elder_info_row->phone;?>"
                              />
                          </div>
                      </div>
                      
                      <div class="form-group">
                          <label class="control-label col-md-3">رقم الجوال (1) <span class="required">
                          * </span>
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
                              <select class="form-control select2me" id="drpEducationlevel" name="drpEducationlevel">
                              	<option value="">اختر...</option>
                                  <?php 
								  foreach ($education_level as $education_level_row)
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
                      
                      <div class="form-group">
                          <label class="control-label col-md-3">التخصص <span class="required">
                          * </span>
                          </label>
                          <div class="col-md-4">
                              <select class="form-control select2me" id="drpSpecialization" name="drpSpecialization">
                                  <option value="">اختر...</option>
								  <?php 
								  foreach ($specialization as $specialization_row)
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
								  foreach ($current_job as $current_job_row)
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
                          <label class="control-label col-md-3">العمل السابق <span class="required">
                          * </span>
                          </label>
                          <div class="col-md-4">
                              <select class="form-control select2me" id="drpPreviousjob" name="drpPreviousjob">
                                  <option value="">اختر...</option>
								  <?php 
								  foreach ($previous_job as $previous_job_row)
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
								  foreach ($insurance_type as $insurance_type_row)
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
 					  
                      <div class="form-group">
                          <label class="control-label col-md-3">تـاريخ الوفاة <span class="required">
                          * </span>
                          </label>
                          <div class="col-md-4">
                              <div class="input-group date date-picker" data-date-format="yyyy-mm-dd">
                                  <input type="text" class="form-control" readonly id="dpDeathdate" name="dpDeathdate"
                                  value="<?php if(isset($elder_info_row->death_date)) echo $elder_info_row->death_date;?>"
                                  >
                                  <span class="input-group-btn">
                                  <button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
                                  </span>
                              </div>
                              <!-- /input-group -->
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
              </form>
              <!-- END FORM-->
          </div>
          <!-- END VALIDATION STATES-->
      </div>
  </div>
</div>
<!----------------------------- END ELDER INFO----------------------------------------------->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PORTLET-->
        <div class="portlet box blue-madison">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-file"></i>الأوراق الثبـــوتية للمسـن (<?php echo $eldername;?>)
                </div>
               
            </div>
            <div class="portlet-body form">
            <!-- BEGIN FORM-->
              <form id="doc_form" action="#" class="form-horizontal" enctype="multipart/form-data">
                <div class="form-body">
                <br/>
                  <div id="dvErrorMsg" class="alert alert-danger display-hide">
                      <button class="close" data-close="alert"></button>
                      الـرجـاء ادخــال نــوع المـســتنـد واختـيــار المــلـف
                  </div>
                  <div id="dvSuccessMsg" class="alert alert-success display-hide">
                      <button class="close" data-close="alert"></button>
                      Your form validation is successful!
                  </div>
                  <div class="row">
                	<div class="col-md-offset-1 col-md-10">
                      <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                          <th>
                            <select class="form-control input-small" id="drpDoctype" name="drpDoctype">
                                <option value="">اختر نوع المستند ...</option>
                                <?php
								foreach ($doc_type as $row_doc_type)
								{
									echo '<option value="'.$row_doc_type->sub_constant_id.'">'
									.$row_doc_type->sub_constant_name.'</option>';
								}
								?>
                             </select>                                       
                            </th>
                            <th>
                              <div class="fileinput fileinput-new" data-provides="fileinput">
                                <div class="input-group input-large">
                                  <div class="form-control uneditable-input" data-trigger="fileinput">
                                      <i class="fa fa-file fileinput-exists"></i>&nbsp; <span class="fileinput-filename" id="flFilename" name="flFilename">
                                      </span>
                                  </div>
                                  <span class="input-group-addon btn default btn-file">
                                  <span class="fileinput-new">
                                  اختر الملف </span>
                                  <span class="fileinput-exists">
                                  تعديل </span>
                                  <input type="file" id="fileToUpload" name="fileToUpload[]">
                                  </span>
                                  <a href="#" class="input-group-addon btn red fileinput-exists" data-dismiss="fileinput">
                                      حذف </a>
                                </div>
                              </div>
                            </th>
                            <th><button id="btnAdddoc" name="btnAdddoc" type="button" class="btn btn-circle green-turquoise btn-sm">
                            <i id="iConst" class="fa fa-plus"></i></button></th>
                          </tr>
                          </thead>
                           <tbody id="tbdDoc">
                           <?php
						   foreach ($elder_docs as $elder_docs_row)
						   {
							   echo '<tr>';
							   echo '<td>'.$elder_docs_row->doc_type.'</td>';
							   echo '<td><a href="/elder/docuploads/'.$elder_docs_row->doc_path.'">'
							   .$elder_docs_row->doc_path.'</a></td>';
							   echo '<td><button id="btnDeletedoc" name="btnDeletedoc" type="button" 
							   			class="btn btn-circle red-sunglo btn-sm" 
										onclick="deleteDoc('.$elder_docs_row->elder_doc_id.',\''.$elder_docs_row->doc_path.'\')">
                            			  <i id="iConst" class="fa fa-close"></i>
										 </button></td>';
								echo '</tr>';
						   }
						   ?>
                           </tbody>
                         </table>
                     </div>
                  </div>
                </div>
              </form>
              <!-- END FORM-->      
            </div>
        </div>
       <!-- END PORTLET-->
    </div>
  </div>
<!-- END PAGE CONTENT-->