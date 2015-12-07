<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<div class="row">
    <div class="col-md-12">
      <!-- BEGIN VALIDATION STATES-->
      <div class="portlet box blue-madison">
          <div class="portlet-title">
              <div class="caption">
                  <i class="fa fa-flag"></i>نوصيـــات الادارة
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
              <!-- BEGIN FORM--><!-- aids_recomendation_tb -->
              <fieldset><legend>مســاعدات</legend>
              <form action="#" id="Aidrecomend_form" class="form-horizontal">
                  <div class="form-body">
                    <br/>
                      <div class="alert alert-danger display-hide">
                          <button class="close" data-close="alert"></button>
                          يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                      </div>
                      <div class="alert alert-success display-hide">
                          <button class="close" data-close="alert"></button>
                          تمت عملية حـفـظ البيـانات بنجـاح !
                      </div>
                       <input id="hdnaidraction" name="hdnaidraction" type="hidden" value="addaidrecomend" />
					   
					 <div class="form-group">
                        <label class="control-label col-md-3">رقم الإستبانة &nbsp;&nbsp;&nbsp </label>
                        <div class="col-md-4">
                            <input type="text" id="hdnSurveyId" name="hdnSurveyId" class="form-control"/>
                        </div>
                    </div>
                   
                      <div class="form-group">
                        <label class="control-label col-md-3">مساعدة مادية &nbsp;&nbsp;&nbsp;                                        </label>
                        <div class="col-md-4">
                            <select class="form-control" id="drpCashaidtype" name="drpCashaidtype">
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
									echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
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
                            <div class="checkbox-list" data-error-container="#form_2_services_error">
                                <label>
                                <input type="checkbox" value="1" id="chbxPsychologicalsupport" name="chbxPsychologicalsupport" /></label>
                            </div>
                          </div>
                   </div>
                   
                   <div class="form-group">
                        <label class="control-label col-md-3">دعم اجتماعي &nbsp;&nbsp;&nbsp </label>
                        <div class="col-md-4">
                            <div class="checkbox-list" data-error-container="#form_2_services_error">
                                <label>
                                <input type="checkbox" value="1" id="chbxSocialsupport" name="chbxSocialsupport" /></label>
                            </div>
                          </div>
                   </div>
                   
                   <div class="form-group">
                        <label class="control-label col-md-3">ترفيه &nbsp;&nbsp;&nbsp </label>
                        <div class="col-md-4">
                            <div class="checkbox-list" data-error-container="#form_2_services_error">
                                <label>
                                <input type="checkbox" value="1" id="chbxEntertainment" name="chbxEntertainment" /></label>
                            </div>
                          </div>
                   </div>
                   
                                     
                  </div>
                  <!-- END FORM BODY -->
                  <div class="form-actions">
                      <div class="row">
                          <div class="col-md-offset-3 col-md-9">
                              <button type="button" class="btn blue-madison" onclick="editeaidrecomend()">حـفـظ</button>
                              <button type="button" class="btn default">الغاء الامر</button>
                          </div>
                      </div>
                  </div>
              </form>
              </fieldset>
              <fieldset><legend>مساعدات طبية</legend>
              
              <!-- medical_aid_recomendation_tb -->
              <form action="#" id="medicalaid_form" class="form-horizontal">
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
                     <input id="maidaction" name="maidaction" type="hidden" value="addmedicalaid" />
                      <div class="form-group">
                        <label class="control-label col-md-3">مساعدة طبية عينية &nbsp;&nbsp;&nbsp;                                        </label>
                        <div class="col-md-4">
                            <select class="form-control" id="drpMedicalaidtype" name="drpMedicalaidtype">
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
                              <button type="button" class="btn blue-madison" onclick="editemedicalaid()">حـفـظ</button>
                              <button type="button" class="btn default">الغاء الامر</button>
                          </div>
                      </div>
                  </div>
              </form><br/>
               <!-- END FORM-->
              <table class="table table-bordered table-striped">
              <thead>
                <tr>
                    <th>المساعدات الطبية</th>
                </tr>
               </thead>
               <tbody id="tbmedicalaid">
                
               </tbody>
               </table>   
              </fieldset>
              <fieldset><legend>السـكـن</legend><!-- home_improvement_recomendation_tb -->
              <form action="#" id="homeimprovement_form" class="form-horizontal">
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
                       <input id="haidaction" name="haidaction" type="hidden" value="addhomeaid" />
                      <div class="form-group">
                        <label class="control-label col-md-3">تأهيل سكن وتحسين سبل عيش المسن &nbsp;&nbsp;&nbsp;                                        </label>
                        <div class="col-md-4">
                            <select class="form-control" id="drpImprovementtype" name="drpImprovementtype">
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
                              <button type="button" class="btn blue-madison" onclick="editehomeaid()">حـفـظ</button>
                              <button type="button" class="btn default">الغاء الامر</button>
                          </div>
                      </div>
                  </div>
              </form><br/>
               <!-- END FORM-->
              <table class="table table-bordered table-striped">
              <thead>
                <tr>
                    <th>تأهيل سكن</th>
                </tr>
               </thead>
               <tbody id="tbhomeaid">
                
               </tbody>
               </table>   
              </fieldset>
          </div>
          <!-- END VALIDATION STATES-->
      </div>
  </div>
</div>
<!-- END PAGE CONTENT-->