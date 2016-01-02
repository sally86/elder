<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<div class="row">
	<div class="col-md-12">
      <!-- Begin: life time stats -->
      <div class="portlet">
          <div class="portlet-title">
              <div class="caption">
                  <i class="fa fa-briefcase"></i>تقرير البيانات الشخصية للأعضاء
              </div>
          </div>
          <div class="portlet-body">
              <div class="table-container">
                  <div class="table-actions-wrapper">
                      <span>
                      </span>
                      <button class="btn btn-sm yellow table-group-action-submit"><i class="fa fa-check"></i> طباعة</button>
                  </div>
                  <table class="table table-striped table-bordered table-hover" id="Elderinforpt_ajax">
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
                           العمر
                      </th>
                      <th>
                           الحالة الاجتماعية
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
                           المحـــافـظــة
                      </th>
                      <th>
                          المدينة 
                      </th>
                      <th>
                           الحي
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
                      <div class="margin-bottom-5">
						  <input type="text" class="form-control form-filter input-sm" id="txtFromAge" name="txtFromAge" 
                          placeholder="من">
                      </div>
                      	  <input type="text" class="form-control form-filter input-sm" id="txtToAge" name="txtToAge" 
                          placeholder="إلى">
                      </td>
                      <td>
                          <select class="form-control form-filter input-sm" id="drpStatus" name="drpStatus">
                            <option value="">اختر...</option>
                            <?php
							  foreach($elder_status as $row)
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
                         <select class="form-control form-filter input-sm" id="drpGovernorate" name="drpGovernorate" onchange="reports_governorate_change();">
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
                         <select class="form-control form-filter input-sm" id="drpRegion" name="drpRegion" onchange="reports_region_change();">
                            <option value="">اختر...</option>
                           
                        </select>
                      </td>
                      <td>
                          
                          <select class="form-control form-filter input-sm" id="drpAddress" name="drpAddress">
                            <option value="">اختر...</option>
                           
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