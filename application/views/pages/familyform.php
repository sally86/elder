<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<?php
$page_title = "تعـــديل أفراد العائلة ";

if (isset($elder_info))
{
	foreach($elder_info as $elder_row);
}

	
	

?>

<div class="row">
    <div class="col-md-12">
      <!-- BEGIN VALIDATION STATES-->
      <div class="portlet box blue-madison">
          <div class="portlet-title">
              <div class="caption">
                  <i class="fa fa-briefcase"></i><?php echo $page_title;?>
              </div>
              <div class="tools">
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
              <!-- BEGIN FORM-->
              <form action="#" id="familymemberform" class="form-horizontal">
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
                      <div>
                      
                       <input id="hdnActionFM" name="hdnActionFM" type="hidden" value="addfamilymember" />
					   <input id="hdnSurveyId" name="hdnSurveyId" type="hidden" value="" />
                               
                      </div>
                       <div class="form-group">
										<label class="control-label col-md-3">رقم الهوية <span class="required">
										* </span>
										</label>
										<div class="col-md-4">
											<input type="text" id="txtElderId" name="txtElderId"  data-required="1" readonly class="form-control"  value="<?php if(isset($elder_row->elder_id)) echo $elder_row->elder_id;?>"/>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-md-3">الاسم<span class="required">
										* </span>
										</label>
										<div class="col-md-4">
											<input type="text" id="txtName" name="txtName"  readonly class="form-control" value="<?php if(isset($elder_row->name)) echo $elder_row->name;?>"/>
										</div>
									</div>
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
                                                 <span class="font-red">
                                        		* </span>
                                            </th>
                                            <th scope="col">
                                                 الدخل بالشيكل
                                                 <span class="font-red">
                                        		* </span>
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
                                                 class="form-control input-sm input-small"/>
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
                                                 <div id="dvdpMemDob" class="input-group date date-picker input-small margin-top-10" 
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
									  <?php
                                            $i=1;
                                            foreach($familymember_info as $row)
                                            {
                                             
                                                echo "<tr>";
                                                echo "<td>" . $i++ . "</td>";
                                                echo '<td id="member_name_td'.$i.'">'. $row->member_name . "</td>";
                                                echo '<td id="member_id_td'.$i.'">'. $row->member_id . "</td>";
                                                echo '<td>'. $row->sex . "</td>";
												echo '<td style="display:none;" id="surveyId_tb'.$i.'">'. $row->survey_id . "</td>";
												echo '<td style="display:none;" id="sex_td'.$i.'">'. $row->member_sex_id . "</td>";
                                                echo '<td>'. $row->relationship ."</td>";
												echo '<td style="display:none;" id="relationship_td'.$i.'">'. $row->relationship_id ."</td>";
                                                echo '<td>'. $row->fmstatus ."</td>";
												echo '<td style="display:none;" id="fmstatus_td'.$i.'">'. $row->status_id ."</td>";
                                                echo '<td id="dob_td'.$i.'">'. $row->dob . "</td>";
                                                echo '<td>'. $row->education_level . "</td>";
												echo '<td style="display:none;" id="education_level_td'.$i.'">'. $row->education_level_id . "</td>";
                                                echo '<td>'. $row->health_status . "</td>";
												echo '<td style="display:none;" id="health_status_td'.$i.'">'. $row->health_status_id . "</td>";
                                                echo '<td id="job_td'.$i.'">'. $row->job . "</td>";
                                                echo '<td id="income_shekel_td'.$i.'">'. $row->income_shekel . "</td>";
                                                echo '<td><button id="btnDeletedoc" name="btnDeletedoc" type="button" 
                                                                  class="btn btn-circle red-sunglo btn-sm" 
                                                                  onclick="deleteFamilybyId('. $row->family_member_id .')">
                                                                   <i id="iConst" class="fa fa-close"></i>
																   <button id="btnUpdatedoc" name="btnUpdatedoc" type="button" 
																  class="btn btn-circle red-sunglo btn-sm" 
																  onclick="updateFamilymember('.$i.')">
																   <i id="iConst" class="fa fa-edit"></i>
                                                          </button></td>';
                                                echo "</tr>";
                                                
                                                
                                                
                                            }
                                    ?>
                                                                            </tbody>
                                      	</table>
                        </div>
              </form>
              <!-- END FORM-->
          </div>
          <!-- END VALIDATION STATES-->
      </div>
  </div>
</div>
<!-- END PAGE CONTENT-->