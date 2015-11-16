<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<div class="row">
    <div class="col-md-12">
         <div class="portlet box blue-madison">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-pencil-square-o"></i>إستمارة بيانات حالة "كبار السن"
                </div>
                <div class="tools">
                    <a href="javascript:;" class="collapse">
                    </a>
                    <a href="#portlet-config" data-toggle="modal" class="config">
                    </a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="row">
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <ul class="nav nav-tabs tabs-left">
                            <li class="active">
                                <a href="#tab_6_0" data-toggle="tab">
                                بيـانات الزيارة </a>
                            </li>
                            <li>
                                <a href="#tab_6_1" data-toggle="tab">
                                بيـانات العضو </a>
                            </li>
                            <li>
                                <a href="#tab_6_2" data-toggle="tab">
                                بيانات اسرة العضو </a>
                            </li>
                           <li>
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
                            <li>
                                <a href="#tab_6_12" data-toggle="tab">
                                توصيات الادارة</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-9 col-sm-9 col-xs-9">
                        <div class="tab-content">
                        <!-- Visit Info -->
                        	<div class="tab-pane active" id="tab_6_0">
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
                                        <label class="control-label col-md-3">رقم الملف<span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-4">
                                           <input type="text" id="txtFileid" name="txtFileid" data-required="1" class="form-control"/>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">تـاريخ دراسـة الحـالة <span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-4">
                                          <div class="input-group date date-picker" data-date-format="dd-mm-yyyy">
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
                                            <select class="form-control select2me" id="drpResearcher" name="drpResearcher">
                                                <option value="">اختر...</option>
                                                <option value="pending">محمد أحمد</option>
                                                <option value="closed">عمر حسن</option>
                                            </select>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">اسـم المرافق الأول <span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-4">
                                            <select class="form-control select2me" id="drpResearcherass1" name="drpResearcherass1">
                                                <option value="">اختر...</option>
                                                <option value="pending">محمد أحمد</option>
                                                <option value="closed">عمر حسن</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-md-3">اسـم المرافق الثاني <span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-4">
                                            <select class="form-control select2me" id="drpResearcherass2" name="drpResearcherass2">
                                                <option value="">اختر...</option>
                                                <option value="pending">محمد أحمد</option>
                                                <option value="closed">عمر حسن</option>
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
                            </div>
                            <!-- End Visit Info-->
                            <!-- Elder Info-->
                            <div class="tab-pane" id="tab_6_1">
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
                                        <label class="control-label col-md-3">الاسم الأول <span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-4">
                                            <input type="text" id="txtFname" name="txtFname" data-required="1" class="form-control"/>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">اسم الأب <span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-4">
                                            <input type="text" id="txtSname" name="txtSname" data-required="1" class="form-control"/>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">اسم الجد <span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-4">
                                            <input type="text" id="txtThname" name="txtThname" data-required="1" class="form-control"/>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">اسم العائلة <span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-4">
                                            <input type="text" id="txtThname" name="txtThname" data-required="1" class="form-control"/>
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
                            </div>
                            <!-- End of Elder Info-->
                            <!-- Family Members-->
                            <div class="tab-pane fade" id="tab_6_2">
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
                                            <input type="text" id="txtMemberId" name="txtMemberId" data-required="1" class="form-control"/>
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
                                            <select class="form-control select2me" id="drpRelationship" name="drpRelationship">
                                                <option value="">اختر...</option>
                                                <option value="pending">أب</option>
                                                <option value="closed">أم</option>
                                                <option value="closed">زوج</option>
                                                <option value="closed">زوجة</option>
                                                <option value="closed">ابن</option>
                                                <option value="closed">ابنة</option>
                                                <option value="closed">حفيد</option>
                                                 <option value="closed">حفيدة</option>
                                            </select>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">الحـالة الاجتمـاعية&nbsp;&nbsp;&nbsp;
                                        </label>
                                        <div class="col-md-4">
                                            <select class="form-control select2me" id="drpMemStatus" name="drpMemStatus">
                                                <option value="">اختر...</option>
                                                <option value="pending">أعزب</option>
                                                <option value="closed">مطلق</option>
                                                <option value="closed">أرمل</option>
                                                <option value="closed">متزوج</option>
                                            </select>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">تـاريخ الميـلاد</label>
                                        <div class="col-md-4">
                                            <div class="input-group date date-picker" data-date-format="dd-mm-yyyy">
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
                                            <select class="form-control select2me" id="drpMemEdulevel" name="drpMemEdulevel">
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
                                        <label class="control-label col-md-3">الحـالة الصحيـة&nbsp;&nbsp;&nbsp;
                                        </label>
                                        <div class="col-md-4">
                                            <select class="form-control select2me" id="drpHealth" name="drpHealth">
                                                <option value="">اختر...</option>
                                                <option value="pending">سليم</option>
                                                <option value="closed">مريض</option>
                                                <option value="closed">كبار سن</option>
                                                <option value="closed">انتفاضة اقصى</option>
                                                <option value="closed">عسكري</option>                             
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
                            </div>
                            <!-- End of Family Members-->
                            <!-- Health Status-->
                            <div class="tab-pane fade" id="tab_6_3">
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
                            <!-- End of Health Status-->
                            <div class="tab-pane fade" id="tab_6_4">
                              <fieldset><legend>ملخص الدخل</legend>
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
                              </form>
                              <!-- END FORM-->
                              </fieldset>
                              <fieldset><legend>تفاصيل الدخل</legend>
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
                                        <label class="control-label col-md-3">مصدر الدخل <span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-4">
                                            <select class="form-control select2me" id="drpPreviousjob" name="drpPreviousjob">
                                                <option value="">اختر...</option>
                                                <option value="pending">عمل خاص</option>
                                                <option value="closed">راتب تقاعد</option>
                                                <option value="closed">وكالة الشئون الإجتماعية الحكومية</option>
                                                <option value="closed">وكالة الغوث لتشغيل اللاجئين</option>
                                                <option value="closed">جمعيات خيرية أهلية / دولية</option>
                                                <option value="closed">أملاك وعقارات مدرة للدخل</option>
                                                <option value="closed">مساعدات شهرية / أسرى</option>
                                                <option value="closed">مساعدات شهرية / جرحى</option>
                                                <option value="closed">مساعدات شهرية / شهيد</option>
                                                <option value="closed">مساعدات كفالات أيتام</option>
                                                <option value="closed">إعالة من الأبناء/ الأقارب</option>
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
                              </form><br/>
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
                            </div>
                            <div class="tab-pane fade" id="tab_6_5">
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
                                          <label class="control-label col-md-3">الوضع العام <span class="required">
                                           * </span>
                                           </label>
                                          <div class="col-md-4">
                                              <select class="form-control select2me" id="drpPreviousjob" name="drpPreviousjob">
                                                <option value="">اختر...</option>
                                                <option value="pending">ممتاز</option>
                                                <option value="closed">جيد</option>
                                                <option value="closed">متوسط</option>
                                                <option value="closed">غير صالح للسكن</option>
                                            </select>
                                          </div>
                                      </div>
                                      
                                      <div class="form-group">
                                          <label class="control-label col-md-3">نوع السكن <span class="required">
                                           * </span>
                                           </label>
                                          <div class="col-md-4">
                                              <select class="form-control select2me" id="drpPreviousjob" name="drpPreviousjob">
                                                <option value="">اختر...</option>
                                                <option value="pending">ملك</option>
                                                <option value="closed">إيجار</option>
                                                <option value="closed">مع الأقرباء</option>
                                                <option value="closed">أرض حكومية</option>
                                            </select>
                                          </div>
                                      </div>
                                      
                                      <div class="form-group">
                                          <label class="control-label col-md-3">نوع السقف <span class="required">
                                           * </span>
                                           </label>
                                          <div class="col-md-4">
                                              <select class="form-control select2me" id="drpPreviousjob" name="drpPreviousjob">
                                                <option value="">اختر...</option>
                                                <option value="pending">باطون</option>
                                                <option value="closed">اسبست/ صفيح</option>
                                                <option value="closed">غير ذلك  ( مع التوضيح)</option>
                                            </select>
                                          </div>
                                      </div>
                                      
                                      <div class="form-group">
                                          <label class="control-label col-md-3">مستوى الأثاث <span class="required">
                                           * </span>
                                           </label>
                                          <div class="col-md-4">
                                              <select class="form-control select2me" id="drpPreviousjob" name="drpPreviousjob">
                                                <option value="">اختر...</option>
                                                <option value="pending">ممتاز</option>
                                                <option value="closed">جيد</option>
                                                <option value="closed">قديم</option>
                                                <option value="closed">ينقص الكثير من الضروريات </option>
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
                            <!-- Elder Room-->
                            <div class="tab-pane fade" id="tab_6_6">
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
                                          <label class="control-label col-md-3">وصف حالة المسن في الأسرة <span class="required">
                                           * </span>
                                           </label>
                                          <div class="col-md-4">
                                              <select class="form-control select2me" id="drpRoomtype" name="drpRoomtype">
                                                <option value="">اختر...</option>
                                                <option value="pending">غرفة مستقلة</option>
                                                <option value="closed">غرفة مع الابناء</option>
                                                <option value="closed">مع العائلة بدون مكان مخصص</option>
                                                <option value="closed">مكان منفصل</option>
                                            </select>
                                          </div>
                                      </div>
                                      
                                      <div class="form-group">
                                          <label class="control-label col-md-3">وصف ملابس وأغطية المسن <span class="required">
                                           * </span>
                                           </label>
                                          <div class="col-md-4">
                                              <select class="form-control select2me" id="drpClothes" name="drpClothes">
                                                <option value="">اختر...</option>
                                                <option value="pending">ممتازة</option>
                                                <option value="closed">جيدة</option>
                                                <option value="closed">متواضعة</option>
                                                <option value="closed">قديمة – مهلهلة</option>
                                            </select>
                                            </select>
                                          </div>
                                      </div>
                                      
                                      <div class="form-group">
                                          <label class="control-label col-md-3">تهيوية الغرفة <span class="required">
                                           * </span>
                                           </label>
                                          <div class="col-md-4">
                                              <select class="form-control select2me" id="drpVentilation" name="drpVentilation">
                                                <option value="">اختر...</option>
                                                <option value="pending">جيدة</option>
                                                <option value="closed">غير جيدة</option>
                                            </select>
                                          </div>
                                      </div>
                                      
                                      <div class="form-group">
                                          <label class="control-label col-md-3">اضاءة الغرفة <span class="required">
                                           * </span>
                                           </label>
                                          <div class="col-md-4">
                                              <select class="form-control select2me" id="drpLighting" name="drpLighting">
                                                <option value="">اختر...</option>
                                                <option value="pending">مضيئة</option>
                                                <option value="closed">مظلمة</option>
                                            </select>
                                          </div>
                                      </div>
                                      
                                      <div class="form-group">
                                          <label class="control-label col-md-3">يوجد خزانة ملابس <span class="required">
                                           * </span>
                                           </label>
                                          <div class="col-md-4">
                                              <select class="form-control select2me" id="drpCloset" name="drpCloset">
                                                <option value="">اختر...</option>
                                                <option value="pending">نعم</option>
                                                <option value="closed">لا</option>
                                            </select>
                                          </div>
                                      </div>
                                      
                                      <div class="form-group">
                                          <label class="control-label col-md-3">يوجد سرير وفرشة مناسبة <span class="required">
                                           * </span>
                                           </label>
                                          <div class="col-md-4">
                                              <select class="form-control select2me" id="drpBed" name="drpBed">
                                                <option value="">اختر...</option>
                                                <option value="pending">نعم</option>
                                                <option value="closed">لا</option>
                                            </select>
                                          </div>
                                      </div>
                                      
                                      <div class="form-group">
                                          <label class="control-label col-md-3">يوجد مكان مخصص للأدوية <span class="required">
                                           * </span>
                                           </label>
                                          <div class="col-md-4">
                                              <select class="form-control select2me" id="drpCupboard" name="drpCupboard">
                                                <option value="">اختر...</option>
                                                <option value="pending">نعم</option>
                                                <option value="closed">لا</option>
                                            </select>
                                          </div>
                                      </div>
                                      
                                      <div class="form-group">
                                          <label class="control-label col-md-3">بحاجة للصيانة <span class="required">
                                           * </span>
                                           </label>
                                          <div class="col-md-4">
                                              <select class="form-control select2me" id="drpMaintenance" name="drpMaintenance">
                                                <option value="">اختر...</option>
                                                <option value="pending">نعم</option>
                                                <option value="closed">لا</option>
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
                                                <option value="pending">نعم</option>
                                                <option value="closed">لا</option>
                                            </select>
                                          </div>
                                      </div>
                                      
                                      <div class="form-group">
                                          <label class="control-label col-md-3">وصف الحمام / دورة المياه <span class="required">
                                           * </span>
                                           </label>
                                          <div class="col-md-4">
                                              <select class="form-control select2me" id="drpBathroom" name="drpBathroom">
                                                <option value="">اختر...</option>
                                                <option value="pending">ممتاز</option>
                                                <option value="closed">جيد</option>
                                                <option value="closed">غير مناسب</option>
                                                <option value="closed">بحاجة للصيانة</option>
                                                <option value="closed">بحاجة للترميم</option>
                                            </select>
                                          </div>
                                      </div>
                                      
                                      <div class="form-group">
                                          <label class="control-label col-md-3">حالة النظافة للمسن نفسه  <span class="required">
                                           * </span>
                                           </label>
                                          <div class="col-md-4">
                                              <select class="form-control select2me" id="drpHigiene" name="drpHigiene">
                                                <option value="">اختر...</option>
                                                <option value="pending">ممتازة</option>
                                                <option value="closed">جيدة</option>
                                                <option value="closed">يفتقر للنظافة</option>
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
                            <!-- End of Elder Room-->
                            <!-- Elder Medication-->
                            <div class="tab-pane fade" id="tab_6_7">
                              <fieldset><legend>توفر العلاج</legend>
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
                                              <select class="form-control select2me" id="drpBathroom" name="drpBathroom">
                                                <option value="">اختر...</option>
                                                <option value="pending">متوفر بانتظام</option>
                                                <option value="closed">متقطع </option>
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
                                  </div>
                              </form><br/>
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
                              </fieldset>
                              <fieldset><legend>الاحتياجات العلاجية</legend>
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
                                          <label class="control-label col-md-3">بحاجة الى  </label>
                                          <div class="col-md-4">
                                              <select class="form-control select2me" id="drpMedtype" name="drpMedtype">
                                                <option value="">اختر...</option>
                                                <option value="pending">جراحة</option>
                                                <option value="closed">أدوية</option>
                                                <option value="closed">علاج</option>
                                                <option value="closed">متابعة خاصة لا يمكن للأسرة توفيرها</option>
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
                              </form><br/>
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
                              </fieldset>
                            </div>
                            <!-- End of Medication-->
                            <div class="tab-pane fade" id="tab_6_8">
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
                                          <label class="control-label col-md-3">احترام متبادل <span class="required">
                                           * </span>
                                           </label>
                                          <div class="col-md-4">
                                              <select class="form-control select2me" id="drpRespect" name="drpRespect">
                                                <option value="">اختر...</option>
                                                <option value="pending">نعم</option>
                                                <option value="closed">لا</option>
                                            </select>
                                          </div>
                                      </div>
                                      
                                       <div class="form-group">
                                          <label class="control-label col-md-3">منبوذ <span class="required">
                                           * </span>
                                           </label>
                                          <div class="col-md-4">
                                              <select class="form-control select2me" id="drpPariah" name="drpPariah">
                                                <option value="">اختر...</option>
                                                <option value="pending">نعم</option>
                                                <option value="closed">لا</option>
                                            </select>
                                          </div>
                                      </div>
                                      
                                      <div class="form-group">
                                          <label class="control-label col-md-3">اهتمام <span class="required">
                                           * </span>
                                           </label>
                                          <div class="col-md-4">
                                              <select class="form-control select2me" id="drpPariah" name="drpPariah">
                                                <option value="">اختر...</option>
                                                <option value="pending">نعم</option>
                                                <option value="closed">لا</option>
                                            </select>
                                          </div>
                                      </div>
                                      
                                      <div class="form-group">
                                          <label class="control-label col-md-3">توفير الاحتياجات <span class="required">
                                           * </span>
                                           </label>
                                          <div class="col-md-4">
                                              <select class="form-control select2me" id="drpNeeds" name="drpNeeds">
                                                <option value="">اختر...</option>
                                                <option value="pending">نعم</option>
                                                <option value="closed">لا</option>
                                            </select>
                                          </div>
                                      </div>
                                      
                                      <div class="form-group">
                                          <label class="control-label col-md-3">الدعم النفسي <span class="required">
                                           * </span>
                                           </label>
                                          <div class="col-md-4">
                                              <select class="form-control select2me" id="drpPsycosupport" name="drpPsycosupport">
                                                <option value="">اختر...</option>
                                                <option value="pending">نعم</option>
                                                <option value="closed">لا</option>
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
                            <div class="tab-pane fade" id="tab_6_9">
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
                                        <label class="control-label col-md-3">علاقة المسن بالأسرة والمجتمع المحلي <span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-4">
                                            <select class="form-control select2me" id="drpPreviousjob" name="drpPreviousjob">
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
                              </form><br/>
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
                            </div>
                            <div class="tab-pane fade" id="tab_6_10">
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
                                        <label class="control-label col-md-3">حالة أسرة المسن الاجتماعية والنفسية  <span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-4">
                                            <select class="form-control select2me" id="drpPreviousjob" name="drpPreviousjob">
                                                <option value="">اختر...</option>
                                                <option value="pending">منعزلة</option>
                                                <option value="closed">مشاركة</option>
                                                <option value="closed">عدوانية</option>
                                                <option value="closed">متفائلة</option>
                                                <option value="closed">منغلقة</option>
                                                <option value="closed">منفتحة</option>
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
                              </form><br/>
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
                            </div>
                            <!-- End of Family Psycho-->
                            <!-- Life Improvement-->
                            <div class="tab-pane fade" id="tab_6_11">
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
                                        <label class="control-label col-md-3">قدرة المسن على العمل  <span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-4">
                                            <select class="form-control select2me" id="drpPreviousjob" name="drpPreviousjob">
                                                <option value="">اختر...</option>
                                                <option value="pending">قادر</option>
                                                <option value="closed">غير قادر</option>
                                            </select>
                                        </div>
                                    </div>
                                    
                 					<div class="form-group">
                                        <label class="control-label col-md-3">طبيعة العمل التي يمكنه/ها القيام به  &nbsp;&nbsp;&nbsp </label>
                                        <div class="col-md-4">
                                            <input type="text" id="txtReason" name="txtReason" class="form-control"/>
                                        </div>
                                    </div>
                                  
                                  <div class="form-group">
                                        <label class="control-label col-md-3">في حالة عدم القدرة على العمل – إمكانية تشغيل  <span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-4">
                                            <select class="form-control select2me" id="drpPreviousjob" name="drpPreviousjob">
                                                <option value="">اختر...</option>
                                                <option value="pending">محمد علي</option>
                                                <option value="closed">هناء حسين</option>
                                            </select>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">طبيعة العمل التي يمكنه/ها القيام به  &nbsp;&nbsp;&nbsp </label>
                                        <div class="col-md-4">
                                            <input type="text" id="txtReason" name="txtReason" class="form-control"/>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">هل يوجد حاجة للتدريب  <span class="required">
                                        * </span>
                                        </label>
                                        <div class="col-md-4">

                                            <select class="form-control select2me" id="drpPreviousjob" name="drpPreviousjob">
                                                <option value="">اختر...</option>
                                                <option value="pending">نعم</option>
                                                <option value="closed">لا</option>
                                            </select>
                                        </div>
                                    </div>
                                    
                                     <div class="form-group">
                                        <label class="control-label col-md-3">حدد نوع التدريب &nbsp;&nbsp;&nbsp </label>
                                        <div class="col-md-4">
                                            <input type="text" id="txtReason" name="txtReason" class="form-control"/>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">إمكانية عمل مشروع صغير مدر للدخل  &nbsp;&nbsp;&nbsp 
                                        </label>
                                        <div class="col-md-4">
                                            <select class="form-control select2me" id="drpPreviousjob" name="drpPreviousjob">
                                                <option value="">اختر...</option>
                                                <option value="pending">نعم</option>
                                                <option value="closed">لا</option>
                                            </select>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">حدد نوع المشروع &nbsp;&nbsp;&nbsp </label>
                                        <div class="col-md-4">
                                            <input type="text" id="txtReason" name="txtReason" class="form-control"/>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">التكلفة المتوقعة لتنفيذ المشروع &nbsp;&nbsp;&nbsp </label>
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
                                  </div>
                              </form><br/>
                               <!-- END FORM-->
                            </div>
                            <!-- End of Life Improvement-->
                            <div class="tab-pane fade" id="tab_6_12">
                              <fieldset><legend>مســاعدات</legend>
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
                                        <label class="control-label col-md-3">مساعدة مادية &nbsp;&nbsp;&nbsp;                                        </label>
                                        <div class="col-md-4">
                                            <select class="form-control select2me" id="drpPreviousjob" name="drpPreviousjob">
                                                <option value="">اختر...</option>
                                                <option value="pending">دورية</option>
                                                <option value="closed">لمرة واحدة</option>
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
                                            <select class="form-control select2me" id="drpPreviousjob" name="drpPreviousjob">
                                                <option value="">اختر...</option>
                                                <option value="pending">أغذية</option>
                                                <option value="closed">غذاء خاص</option>
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
                              </form>
                              </fieldset>
                              <fieldset><legend>مساعدات طبية</legend>
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
                                        <label class="control-label col-md-3">مساعدة طبية عينية &nbsp;&nbsp;&nbsp;                                        </label>
                                        <div class="col-md-4">
                                            <select class="form-control select2me" id="drpPreviousjob" name="drpPreviousjob">
                                                <option value="">اختر...</option>
                                                <option value="pending">كرسي متحرك</option>
                                                <option value="closed">سماعة أذن</option>
                                                <option value="closed">نظارة</option>
                                                <option value="closed">جهاز ضغط</option>
                                                <option value="closed">جهاز سكر</option>
                                                <option value="closed">عكاز</option>
                                                <option value="closed">ووكر</option>
                                                <option value="closed">أدوية</option>
                                                <option value="closed">جراحة</option>
                                                <option value="closed">فحوصات وتحاليل منتظمة</option>
                                                <option value="closed">علاج طبيعي</option>
                                                <option value="closed">متابعة صحية ميدانية</option>
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
                              </form><br/>
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
                              </fieldset>
                              <fieldset><legend>السـكـن</legend>
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
                                        <label class="control-label col-md-3">تأهيل سكن وتحسين سبل عيش المسن &nbsp;&nbsp;&nbsp;                                        </label>
                                        <div class="col-md-4">
                                            <select class="form-control select2me" id="drpPreviousjob" name="drpPreviousjob">
                                                <option value="">اختر...</option>
                                                <option value="pending">ترميم غرفة المسن</option>
                                                <option value="closed">ترميم حمام / دورة مياه</option>
                                                <option value="closed">أثاث البيت الخشبي</option>
                                                <option value="closed">أجهزة كهربائية</option>
                                                <option value="closed">ملابس</option>
                                                <option value="closed">أغطية</option>
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
                              </form><br/>
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
                              </fieldset>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!---->
    </div>
</div>
<!-- END PAGE CONTENT-->