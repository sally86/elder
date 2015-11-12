<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<div class="row">
  <div class="col-md-12">
      <!-- BEGIN VALIDATION STATES-->
      <div class="portlet box blue-madison">
          <div class="portlet-title">
              <div class="caption">
                  <i class="fa fa-user"></i>صلاحيات انواع المستخدمين
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
                          <label class="control-label col-md-3">نوع المستخدم <span class="required">
                          * </span>
                          </label>
                          <div class="col-md-4">
                              <select class="form-control select2me" id="drpUsertype" name="drpUsertype">
                                  <option value="">اختر...</option>
                                  <option value="pending">مدير النظام</option>
                              	  <option value="closed">مدخل بيانات</option>
                              	  <option value="closed">باحث</option>
                              </select>
                          </div>
                      </div>
                      
                      <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label col-md-3">القوائم <span class="required">
                                * </span>
                                </label>
                                <div class="col-md-4">
                                    <select class="form-control select2me" id="drpUsertype" name="drpUsertype">
                                        <option value="">اختر...</option>
                                        <option value="pending">الرئيسية</option>
                                        <option value="closed" selected="selected">الموظفين</option>
                                        <option value="closed">المستخدمين</option>
                                        <option value="closed">الأعضاء</option>
                                        <option value="closed">الاستبانة</option>
                                        <option value="closed">مواعيد البحث الميداني</option>
                                        <option value="closed">ثوابت النظام</option>
                                        <option value="closed">الرسائل</option>
                                        <option value="closed">التقارير</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <!--/span-->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label col-md-3">الصـفحـات <span class="required">
                                * </span>
                                </label>
                                <div class="col-md-4">
                                   <div class="checkbox-list" data-error-container="#form_2_services_error">
                                      <label>
                                      <input type="checkbox" value="1" name="service"/> عرض الموظفين </label>
                                      <label>
                                      <input type="checkbox" value="2" name="service"/> اضافة الموظفين </label>
                                  </div>
                                  <div id="form_2_services_error">
                                  </div>
                                </div>
                            </div>
                        </div>
                        <!--/span-->
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