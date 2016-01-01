<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<div class="row">
	<div class="col-md-12">
      <!-- Begin: life time stats -->
      <div class="portlet">
          <div class="portlet-title">
              <div class="caption">
                  <i class="fa fa-briefcase"></i>تقرير الحالة الصحية للأعضاء
              </div>
          </div>
          <div class="portlet-body">
              <div class="table-container">
                  <div class="table-actions-wrapper">
                      <span>
                      </span>
                      <button class="btn btn-sm yellow table-group-action-submit"><i class="fa fa-check"></i> طباعة</button>
                  </div>
                  <table class="table table-striped table-bordered table-hover" id="Elderhealthrpt_ajax">
                  <thead>
                  <tr role="row" class="heading">
                      <th width="2%">
                          <input type="checkbox" class="group-checkable">
                      </th>
                      <th>
                           رقـم الملف
                      </th>
                      <th>
                           رقم الهوية
                      </th>
                      <th>
                           اســم العضو
                      </th>
                      <th>
                           النوع الطبيعي
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
                      
                      <th width="40%">
                           المـــرض
                      </th>
                      <th width="40%">
                           العــــلاج
                      </th>
                      <th>
                           المحـــافـظــة
                      </th>
                      <th>&nbsp;
                           
                      </th>
                  </tr>
                  <tr id="trNoprint" role="row" class="filter" style="white-space: nowrap;">
                      <td>
                      </td>
                      <td>
                          <input type="text" class="form-control form-filter input-sm" id="txtFileid" name="txtFileid">
                      </td>
                      <td>
                          <input type="text" class="form-control form-filter input-sm" id="txtElderid" name="txtElderid">
                      </td>
                      <td>
                          <input type="text" class="form-control form-filter input-sm" id="txtElderName" name="txtElderName">
                      </td>
                      <td>
                          <select class="form-control form-filter input-sm" id="drpSex" name="drpSex">
                            <option value="">اختر...</option>
                            <?php
							  foreach($elder_sex as $row)
							  {
                      			echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
							  }
							?>
                        </select>
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
                          <select class="form-control form-filter input-sm" id="drpDisease" name="drpDisease">
                            <option value="">اختر...</option>
                            <?php
							  foreach($elder_elderdisease as $row)
							  {
                      			echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
							  }
							  ?>
                        </select>
                      </td>
                      <td>
                      	<div class="margin-bottom-5">
                          <input type="text" class="form-control form-filter input-sm" id="txtMedication" name="txtMedication"
                          placeholder="اسم الدواء">
                        </div>
                        <div class="margin-bottom-5">
                          <select id="drpMedicationAvailable" name="drpMedicationAvailable" class="form-control form-filter input-sm">
                              <option value="">حالة الدواء</option>
                              <?php
                                foreach($elder_medicationavailable as $row)
                                {
                                  echo '<option value="'.$row->sub_constant_id.'">'
                                  .$row->sub_constant_name.'</option>';
                                }
                               ?>
                          </select>
                        </div>
                          <input type="text" class="form-control form-filter input-sm" id="txtUnavailablersn" name="txtUnavailablersn"
                          placeholder="سبب الانقطاع">
                      </td>
                      <td>
                         <select class="form-control form-filter input-sm" id="drpGovernorate" name="drpGovernorate">
                            <option value="">اختر...</option>
                            <?php
							  foreach($elder_governorate as $row)
							  {
                      			echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
							  }
							  ?>
                        </select>
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