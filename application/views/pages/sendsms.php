<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<div class="row">
    <div class="col-md-12">
      <!-- BEGIN VALIDATION STATES-->
      <div class="portlet box blue-madison">
          <div class="portlet-title">
              <div class="caption">
                  <i class="fa fa-envelope"></i>ارســـال رســـالة
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
              <form action="#" id="form_sample_3" class="form-horizontal">
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
                        <label class="control-label col-md-3">خيـارات الفـلتـرة : 
                        </label>
                        <div class="col-md-2">
                           <label class="control-label col-md-2"> الخيار الأول
                          </label>
                        </div>
                        <div class="col-md-2">
                            <select class="form-control select2me" id="drpConstant1" name="drpConstant1" onchange="getValue(1)">
                                  <option value="">اختر...</option>
                                  <?php 
								  foreach ($constants as $constants_row)
								  {
									 echo ' <option value="'.$constants_row->constant_id.'">'
									  						.$constants_row->constant_name.'</option>';
								  }
								  ?>
                              </select>
                        </div>
                        <div class="col-md-2">
                            <label class="control-label col-md-2">القيــمة
                          </label>
                        </div>
                        <div class="col-md-2">
                            <select class="form-control select2me" id="drpSubconstant1" name="drpSubconstant1">
                                  <option value="">اختر...</option>
                                 
                              </select>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3">&nbsp; 
                        </label>
                        <div class="col-md-2">
                           <label class="control-label col-md-2"> الخيار الثاني
                          </label>
                        </div>
                        <div class="col-md-2">
                            <select class="form-control select2me" id="drpConstant2" name="drpConstant2" onchange="getValue(2)">
                                  <option value="">اختر...</option>
                                  <?php 
								  foreach ($constants as $constants_row)
								  {
									 echo ' <option value="'.$constants_row->constant_id.'">'
									  						.$constants_row->constant_name.'</option>';
								  }
								  ?>
                              </select>
                        </div>
                        <div class="col-md-2">
                            <label class="control-label col-md-2">القيــمة
                          </label>
                        </div>
                        <div class="col-md-2">
                            <select class="form-control select2me" id="drpSubconstant2" name="drpSubconstant2">
                                  <option value="">اختر...</option>
                                  
                              </select>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3">&nbsp;
                        </label>
                        <div class="col-md-2">
                           <label class="control-label col-md-2"> الخيار الثالث
                          </label>
                        </div>
                        <div class="col-md-2">
                            <select class="form-control select2me" id="drpConstant3" name="drpConstant3" onchange="getValue(3)">
                                  <option value="">اختر...</option>
                                  <?php 
								  foreach ($constants as $constants_row)
								  {
									 echo ' <option value="'.$constants_row->constant_id.'">'
									  						.$constants_row->constant_name.'</option>';
								  }
								  ?>
                              </select>
                        </div>
                        <div class="col-md-2">
                            <label class="control-label col-md-2">القيــمة
                          </label>
                        </div>
                        <div class="col-md-2">
                            <select class="form-control select2me" id="drpSubconstant3" name="drpSubconstant3">
                                  <option value="">اختر...</option>
                                  
                              </select>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3">&nbsp;
                        </label>
                        <div class="col-md-2">
                           <label class="control-label col-md-2"> الخيار الرابع
                          </label>
                        </div>
                        <div class="col-md-2">
                            <select class="form-control select2me" id="drpConstant4" name="drpConstant4" onchange="getValue(4)">
                                  <option value="">اختر...</option>
                                  <?php 
								  foreach ($constants as $constants_row)
								  {
									 echo ' <option value="'.$constants_row->constant_id.'">'
									  						.$constants_row->constant_name.'</option>';
								  }
								  ?>
                              </select>
                        </div>
                        <div class="col-md-2">
                            <label class="control-label col-md-2">القيــمة
                          </label>
                        </div>
                        <div class="col-md-2">
                            <select class="form-control select2me" id="drpSubconstant4" name="drpSubconstant4">
                                  <option value="">اختر...</option>
                                  
                              </select>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3">&nbsp;
                        </label>
                        <div class="col-md-2">
                           <label class="control-label col-md-2"> الخيار الخامس
                          </label>
                        </div>
                        <div class="col-md-2">
                            <select class="form-control select2me" id="drpConstant5" name="drpConstant5" onchange="getValue(5)">
                                  <option value="">اختر...</option>
                                  <?php 
								  foreach ($constants as $constants_row)
								  {
									 echo ' <option value="'.$constants_row->constant_id.'">'
									  						.$constants_row->constant_name.'</option>';
								  }
								  ?>
                              </select>
                        </div>
                        <div class="col-md-2">
                            <label class="control-label col-md-2">القيــمة
                          </label>
                        </div>
                        <div class="col-md-2">
                            <select class="form-control select2me" id="drpSubconstant5" name="drpSubconstant5">
                                  <option value="">اختر...</option>
                                  
                              </select>
                        </div>
                      </div>
                      
                      <div class="form-group">
                          <label class="control-label col-md-3">رقم الجوال <span class="required">
                          * </span>
                          </label>
                          <div class="col-md-4">
                              <input type="text" id="txtVisittime" name="txtVisittime" data-required="1" class="form-control"/>
                          </div>
                      </div>
                      
                      <div class="form-group">
                          <label class="control-label col-md-3">الرســــالة&nbsp;&nbsp;&nbsp;
                          </label>
                          <div class="col-md-4">
                              <textarea name="txtFulladdress" cols="70" rows="2" class="form-control"></textarea>
                          </div>
                      </div>
                      
                  </div>
                  <!-- END FORM BODY -->
                  <div class="form-actions">
                      <div class="row">
                          <div class="col-md-offset-3 col-md-9">
                              <button type="submit" class="btn blue-madison">ارســال</button>
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
<!-- END PAGE CONTENT-->