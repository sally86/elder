<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<div class="row">
    <div class="col-md-12">
      <!-- BEGIN VALIDATION STATES-->
      <div class="portlet box blue-madison">
          <div class="portlet-title">
              <div class="caption">
                  <i class="fa fa-folder-open"></i>بيـانـات المـلـف
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
                          <label class="control-label col-md-3">تـصنيف المـلـف&nbsp;&nbsp;&nbsp;
                          </label>
                          <div class="col-md-4">
                              <select class="form-control select2me" id="drpFilestatus" name="drpFilestatus">
                                  <option value="">اختر...</option>
                                  <option value="pending">فعال</option>
                              	  <option value="closed">ملغي</option>
                              	  <option value="closed">مغلق</option>
                              </select>
                          </div>
                      </div>
                      
                      <div class="form-group">
                          <label class="control-label col-md-3">حالة الملف <span class="required">
                          * </span>
                          </label>
                          <div class="col-md-4">
                              <select class="form-control select2me" id="drpFilestatus" name="drpFilestatus">
                                  <option value="">اختر...</option>
                                  <option value="pending">فعال</option>
                              	  <option value="closed">مفتوح</option>
                              	  <option value="closed">مغلق</option>
                              </select>
                          </div>
                      </div>
                      
                      <div class="form-group">
                          <label class="control-label col-md-3">تـاريخ الاغـلاق</label>
                          <div class="col-md-4">
                              <div class="input-group date date-picker" data-date-format="dd-mm-yyyy">
                                  <input type="text" class="form-control" readonly id="dpDob" name="dpDob">
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
                              <select class="form-control select2me" id="drpFilestatus" name="drpFilestatus">
                                  <option value="">اختر...</option>
                                  <option value="pending">فعال</option>
                              	  <option value="closed">مفتوح</option>
                              	  <option value="closed">مغلق</option>
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
                  <i class="fa fa-folder-open"></i>بيـانـات العـضــو الشـخـصيــة
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
                          <label class="control-label col-md-3">تـصنيف المـلـف&nbsp;&nbsp;&nbsp;
                          </label>
                          <div class="col-md-4">
                              <select class="form-control select2me" id="drpFilestatus" name="drpFilestatus">
                                  <option value="">اختر...</option>
                                  <option value="pending">فعال</option>
                              	  <option value="closed">ملغي</option>
                              	  <option value="closed">مغلق</option>
                              </select>
                          </div>
                      </div>
                      
                      <div class="form-group">
                          <label class="control-label col-md-3">رقم الهوية <span class="required">
                          * </span>
                          </label>
                          <div class="col-md-4">
                              <input type="text" id="txtElderId" name="txtElderId" data-required="1" class="form-control"/>
                          </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="control-label col-md-3">الاســـم <span class="required">
                        * </span>
                        </label>
                        <div class="col-md-2">
                            <input type="text" id="txtFname" name="txtFname" data-required="1" class="form-control input-small" placeholder="الاسم الاول"/>
                        </div>
                        <div class="col-md-2">
                            <input type="text" id="txtSname" name="txtSname" data-required="1" class="form-control input-small" placeholder="اسم الاب"/>
                        </div>
                        <div class="col-md-2">
                            <input type="text" id="txtThname" name="txtThname" data-required="1" class="form-control input-small" placeholder="اسم الجد"/>
                        </div>
                        <div class="col-md-2">
                            <input type="text" id="txtThname" name="txtThname" data-required="1" class="form-control input-small" placeholder="اسم العائلة"/>
                        </div>
                      </div>
                      
                      <div class="form-group">
                          <label class="control-label col-md-3">تـاريخ الميـلاد</label>
                          <div class="col-md-4">
                              <div class="input-group date date-picker" data-date-format="dd-mm-yyyy">
                                  <input type="text" class="form-control" readonly id="dpDob" name="dpDob">
                                  <span class="input-group-btn">
                                  <button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
                                  </span>
                              </div>
                              <!-- /input-group -->
                          </div>
                      </div>
                      
                      <div class="form-group">
                          <label class="control-label col-md-3">النوع الطبيعي&nbsp;&nbsp;&nbsp;
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
                          <label class="control-label col-md-3">الحـالة الاجتمـاعية&nbsp;&nbsp;&nbsp;
                          </label>
                          <div class="col-md-4">
                              <select class="form-control select2me" id="drpUsertype" name="drpUsertype">
                                  <option value="">اختر...</option>
                                  <option value="pending">أعزب</option>
                              	  <option value="closed">مطلق</option>
                              	  <option value="closed">أرمل</option>
                                  <option value="closed">متزوج</option>
                              </select>
                          </div>
                      </div>
                      
                      <div class="form-group">
                          <label class="control-label col-md-3">العنوان : المحـافظة&nbsp;&nbsp;&nbsp;
                          </label>
                          <div class="col-md-4">
                              <select class="form-control select2me" id="drpGovernorate" name="drpGovernorate">
                                  <option value="">اختر...</option>
                                  <option value="pending">الشمال</option>
                              	  <option value="closed">غزة</option>
                              	  <option value="closed">الوسطى</option>
                                  <option value="closed">خانيونس</option>
                                  <option value="closed">رفح</option>
                              </select>
                          </div>
                      </div>
                      
                      <div class="form-group">
                          <label class="control-label col-md-3">المنطقـة&nbsp;&nbsp;&nbsp;
                          </label>
                          <div class="col-md-4">
                              <input type="text" id="txtRegion" name="txtRegion" data-required="1" class="form-control"/>
                          </div>
                      </div>
                      
                      <div class="form-group">
                          <label class="control-label col-md-3">وصف العنوان بالكامل&nbsp;&nbsp;&nbsp;
                          </label>
                          <div class="col-md-4">
                          	  <textarea name="txtFulladdress" cols="70" rows="2" class="form-control"></textarea>
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
                          <label class="control-label col-md-3">رقم الجوال (1)&nbsp;&nbsp;&nbsp;
                          </label>
                          <div class="col-md-4">
                              <input type="text" id="txtMobile1" name="txtMobile1" class="form-control"/>
                          </div>
                      </div>
                      
                      <div class="form-group">
                          <label class="control-label col-md-3">رقم الجوال (2)&nbsp;&nbsp;&nbsp;
                          </label>
                          <div class="col-md-4">
                              <input type="text" id="txtMobile2" name="txtMobile2" class="form-control"/>
                          </div>
                      </div>
                      
                       <div class="form-group">
                          <label class="control-label col-md-3">المؤهل العلمي&nbsp;&nbsp;&nbsp;
                          </label>
                          <div class="col-md-4">
                              <select class="form-control select2me" id="drpEducationlevel" name="drpEducationlevel">
                                  <option value="">اختر...</option>
                                  <option value="pending">أمي</option>
                              	  <option value="closed">ابتدائي</option>
                              	  <option value="closed">اعدادي</option>
                                  <option value="closed">ثانوي</option>
                                  <option value="closed">دبلوم</option>
                                  <option value="closed">بكالوريوس</option>
                                  <option value="closed">ليسانس</option>
                                  <option value="closed">ماجستير</option>
                                  <option value="closed">دراسات عليا</option>
                              </select>
                          </div>
                      </div>
                      
                      <div class="form-group">
                          <label class="control-label col-md-3">التخصص&nbsp;&nbsp;&nbsp;
                          </label>
                          <div class="col-md-4">
                              <select class="form-control select2me" id="drpSpecialization" name="drpSpecialization">
                                  <option value="">اختر...</option>
                                  <option value="pending">ادارة أعمال</option>
                              	  <option value="closed">محاسبة</option>
                              	  <option value="closed">تعليم</option>
                                  <option value="closed">التجارة</option>
                                  <option value="closed">الصحة</option>
                                  <option value="closed">الدعم النفسي</option>
                                  <option value="closed">العمل المجتمعي</option>
                                  <option value="closed">بحث وتخطيط</option>
                                  <option value="closed">بناء مؤسسات</option>
                                  <option value="closed">زراعة</option>
                                  <option value="closed">جقوق</option>
                                  <option value="closed">هندسة</option>
                                  <option value="closed">تكنولوجيا معلومات</option>
                              </select>
                          </div>
                      </div>
                      
                      <div class="form-group">
                          <label class="control-label col-md-3">العمل الحالي&nbsp;&nbsp;&nbsp;
                          </label>
                          <div class="col-md-4">
                              <select class="form-control select2me" id="drpCurrentjob" name="drpCurrentjob">
                                  <option value="">اختر...</option>
                                  <option value="pending">بدون</option>
                              	  <option value="closed">متقاعد</option>
                              	  <option value="closed">قطاع خاص</option>
                              </select>
                          </div>
                      </div>
                      
                      <div class="form-group">
                          <label class="control-label col-md-3">العمل السابق&nbsp;&nbsp;&nbsp;
                          </label>
                          <div class="col-md-4">
                              <select class="form-control select2me" id="drpPreviousjob" name="drpPreviousjob">
                                  <option value="">اختر...</option>
                                  <option value="pending">مزارع</option>
                              	  <option value="closed">حكومي</option>
                              	  <option value="closed">وكالة</option>
                                  <option value="closed">خاص</option>
                                  <option value="closed">صناعة</option>
                                  <option value="closed">حرفة</option>
                                  <option value="closed">فني صيانة</option>
                                  <option value="closed">شرطة</option>
                                  <option value="closed">أجهزة أمنية</option>
                              </select>
                          </div>
                      </div>
                      
                      <div class="form-group">
                          <label class="control-label col-md-3">نوع التأمين الصحي&nbsp;&nbsp;&nbsp;
                          </label>
                          <div class="col-md-4">
                              <select class="form-control select2me" id="drpInsurence" name="drpInsurence">
                                  <option value="">اختر...</option>
                                  <option value="pending">موظف حكومة</option>
                              	  <option value="closed">عمال</option>
                              	  <option value="closed">كبار سن</option>
                                  <option value="closed">انتفاضة اقصى</option>
                                  <option value="closed">عسكري</option>                             
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
                    <i class="fa fa-gift"></i>الأوراق الثبـــوتية للمسـن
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
              <form action="#" class="form-horizontal">
                <div class="form-body">
                  <div class="row">
                	<div class="col-md-offset-1 col-md-10">
                      <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                          <th>
                            <select class="form-control select2me" id="drpInsurence" name="drpInsurence">
                                <option value="">اختر نوع المستند ...</option>
                                <option value="pending">هوية</option>
                                <option value="closed">شهادة ميلاد</option>
                                <option value="closed">جواز سفر</option>                          
                             </select>                                       
                            </th>
                            <th>
                              <div class="fileinput fileinput-new" data-provides="fileinput">
                                <div class="input-group input-large">
                                  <div class="form-control uneditable-input" data-trigger="fileinput">
                                      <i class="fa fa-file fileinput-exists"></i>&nbsp; <span class="fileinput-filename">
                                      </span>
                                  </div>
                                  <span class="input-group-addon btn default btn-file">
                                  <span class="fileinput-new">
                                  اختر الملف </span>
                                  <span class="fileinput-exists">
                                  تعديل </span>
                                  <input type="file" name="...">
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
                           <tbody>
                            <tr>
                                <td>Amiral</td>
                                <td>متوفر</td>
                                <td>&nbsp;</td>
                             </tr>
                             <tr>
                                <td>Lipanthyl</td>
                                <td>متقطع</td>
                                <td>&nbsp;</td>
                             </tr>
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