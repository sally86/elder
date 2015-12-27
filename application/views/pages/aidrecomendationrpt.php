<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<div class="row">
	<div class="col-md-12">
      <!-- Begin: life time stats -->
      <div class="portlet">
          <div class="portlet-title">
              <div class="caption">
                  <i class="fa fa-briefcase"></i>تقرير توصيات الادارة
              </div>
          </div>
          <div class="portlet-body">
              <div class="table-container">
                  <div class="table-actions-wrapper">
                      <span>
                      </span>
                      <button class="btn btn-sm yellow table-group-action-submit"><i class="fa fa-check"></i> طباعة</button>
                  </div>
                  <table class="table table-striped table-bordered table-hover" id="Aidrecomendationrpt_ajax">
                  <thead>
                  <tr role="row" class="heading">
                      <th width="2%">
                          <input type="checkbox" class="group-checkable">
                      </th>
                      <th>
                           رقـم الملف
                      </th>
                      <th>
                           اســم العضو
                      </th>
                      <th>
                           الهاتف
                      </th>
                      <th>
                           جوال 1
                      </th>
                      <th>
                           جوال 2
                      </th>
                      <th>
                           نوع المساعدة المادية  
                      </th>
                      <th>
                           قيمة المساعدة المادية 
                      </th>
                      <th>
                          نوع المساعدة الطبية
                      </th>
                      <th>
                          تأهيل السكن 
                      </th>
                      <th>
                          ايجار بيت 
                      </th>
                      <th>
                          مستلزمات سكن أخرى 
                      </th>
                      <th>
                          تغذية المسن 
                      </th>
                      <th>
                          نوع الغذاء
                      </th>
                      <th>
                           الدعم النفسي
                      </th>
                      <th>
                           الدعم الإجتماعي 
                      </th>
                      <th>
                           الترفيه
                      </th>
                      <th>&nbsp;
                           
                      </th>
                  </tr>
                  <tr id="trNoprint" role="row" class="filter">
                      <td>
                      </td>
                      <td>
                          <input type="text" class="form-control form-filter input-sm" id="txtFileid" name="txtFileid">
                      </td>
                      <td>
                          <input type="text" class="form-control form-filter input-sm" id="txtElderName" name="txtElderName">
                      </td>
                       <td>
                          <input type="text" class="form-control form-filter input-sm" id="txtPhone" name="txtPhone">
                      </td>
                      <td>
                          <input type="text" class="form-control form-filter input-sm" id="txtMobile1" name="txtMobile1">
                      </td>
                      <td>
                         <input type="text" class="form-control form-filter input-sm" id="txtMobile2" name="txtMobile2">
                      </td>
                      <td>
                      	 <select class="form-control form-filter input-sm" id="drpCashType" name="drpCashType">
                            <option value="">اختر...</option>
                            <?php
							  foreach($elder_CashAidType as $row)
							  {
                      			echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
							  }
							  ?>
                          </select>
                      </td>
                      <td>
                         <input type="text" class="form-control form-filter input-sm" id="txtCash" name="txtCash">
                      </td>
                      <td>
                          <select class="form-control form-filter input-sm" id="drpMedicalaid" name="drpMedicalaid">
                            <option value="">اختر...</option>
                            <?php
							  foreach($elder_MedicalAid as $row)
							  {
                      			echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
							  }
							  ?>
                        </select>
                      </td>
                      <td>
                          <select class="form-control form-filter input-sm" id="drpHomeimprovment" name="drpHomeimprovment">
                            <option value="">اختر...</option>
                            <?php
							  foreach($elder_HomeImprovRecomend as $row)
							  {
                      			echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
							  }
							  ?>
                        </select>
                      </td>
                      <td>
                          <input type="text" class="form-control form-filter input-sm" id="txtRent" name="txtRent">
                      </td>
                      <td>
                          <input type="text" class="form-control form-filter input-sm" id="txtOtheraids" name="txtOtheraids">
                      </td>
                      <td>
                      	 <select class="form-control form-filter input-sm" id="drpNutritiontype" name="drpNutritiontype">
                            <option value="">اختر...</option>
                            <?php
							  foreach($elder_NutritionType as $row)
							  {
                      			echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
							  }
							  ?>
                          </select>
                      </td>
                      <td>
                          <input type="text" class="form-control form-filter input-sm" id="txtNutritiondet" name="txtNutritiondet">
                      </td>
                      <td>
                         <input type="text" class="form-control form-filter input-sm" id="txtPsychosupport" name="txtPsychosupport">
                      </td>
                      <td>
                         <input type="text" class="form-control form-filter input-sm" id="txtSocialsupport" name="txtSocialsupport">
                      </td>
                      <td>
                         <input type="text" class="form-control form-filter input-sm" id="txtEntertainment" name="txtEntertainment">
                      </td>
                      
                      <td>
                         <button class="btn btn-sm yellow filter-submit margin-bottom"><i class="fa fa-search"></i> </button>
                         <button class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i> </button>
                      </td>
                  </tr>
                  </thead>
                  <tbody>
                  
                  </tbody>
                  </table>
              </div>
          </div>
      </div>
      <!-- End: life time stats -->
  </div>
</div>
<!-- END PAGE CONTENT-->