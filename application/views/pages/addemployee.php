<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<div class="row">
    <div class="col-md-12">
      <!-- BEGIN VALIDATION STATES-->
      <div class="portlet box blue-madison">
          <div class="portlet-title">
              <div class="caption">
                  <i class="fa fa-briefcase"></i>اضـــافة مـوظـــف
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
                          <label class="control-label col-md-3">رقم الهوية <span class="required">
                          * </span>
                          </label>
                          <div class="col-md-4">
                              <input type="text" id="txtNationalId" name="txtNationalId" data-required="1" class="form-control"/>
                          </div>
                      </div>
                      
                      <div class="form-group">
                          <label class="control-label col-md-3">الرقم الوظيفي <span class="required">
                          * </span>
                          </label>
                          <div class="col-md-4">
                              <input type="text" id="txtEmployeeId" name="txtEmployeeId" data-required="1" class="form-control"/>
                          </div>
                      </div>
                      
                      <div class="form-group">
                          <label class="control-label col-md-3">اسـم المـوظف <span class="required">
                          * </span>
                          </label>
                          <div class="col-md-4">
                              <input type="text" id="txtName" name="txtName" data-required="1" class="form-control"/>
                          </div>
                      </div>
                      
                      <div class="form-group">
                          <label class="control-label col-md-3">الجنـس&nbsp;&nbsp;&nbsp;
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
                          <label class="control-label col-md-3">المسـمى الوظيـفي<span class="required">
                          * </span>
                          </label>
                          <div class="col-md-4">
                              <select class="form-control select2me" name="drpJobtitle" name="drpJobtitle">
                                  <option value="">اختر...</option>
                                  <option value="Option 1">مدخل بيانات</option>
                                  <option value="Option 2">باحث</option>
                                  <option value="Option 3">مدير</option>
                              </select>
                          </div>
                      </div>
                      
                      <div class="form-group">
                          <label class="control-label col-md-3">رقم الجوال <span class="required">
                          * </span>
                          </label>
                          <div class="col-md-4">
                              <input type="text" id="txtMobile" name="txtMobile" data-required="1" class="form-control"/>
                          </div>
                      </div>
                      
                      <div class="form-group">
                          <label class="control-label col-md-3">رقم الهاتف&nbsp;&nbsp;&nbsp;
                          </label>
                          <div class="col-md-4">
                              <input type="text" id="txtPhone" name="txtPhone" class="form-control"/>
                          </div>
                      </div>
                      
                      <div class="form-group">
                          <label class="col-md-3 control-label">البريد الالكتروني <span class="required">
                          * </span>
                          </label>
                          <div class="col-md-4">
                              <div class="input-group">
                                  <span class="input-group-addon">
                                  <i class="fa fa-envelope"></i>
                                  </span>
                                  <input type="email" id="txtEmail" name="txtEmail" class="form-control" placeholder="البريد الالكتروني">
                              </div>
                          </div>
                      </div>
                      
                      <div class="form-group">
                          <label class="control-label col-md-3">مـوظـف حـالي&nbsp;&nbsp;&nbsp;
                          </label>
                          <div class="col-md-4">
                              <div class="checkbox-list" data-error-container="#form_2_services_error">
                                  <label>
                                  <input type="checkbox" value="1" name="chbxIsactive" checked="checked"/> </label>
                              </div>
                              <div id="form_2_services_error">
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
              </form>
              <!-- END FORM-->
          </div>
          <!-- END VALIDATION STATES-->
      </div>
  </div>
</div>
<!-- END PAGE CONTENT-->