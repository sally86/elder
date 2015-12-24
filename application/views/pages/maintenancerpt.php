<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<div class="row">
	<div class="col-md-12">
      <!-- Begin: life time stats -->
      <div class="portlet">
          <div class="portlet-title">
              <div class="caption">
                  <i class="fa fa-briefcase"></i>تقرير صيانة سكن كبير السن
              </div>
          </div>
          <div class="portlet-body">
              <div class="table-container">
                  <div class="table-actions-wrapper">
                      <span>
                      </span>
                      <button class="btn btn-sm yellow table-group-action-submit"><i class="fa fa-check"></i> طباعة</button>
                  </div>
                  <table class="table table-striped table-bordered table-hover" id="Elderhomemaintenancerpt_ajax">
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
                           بحاجة الى صيانة الغرفة
                      </th>
                      <th>
                           نوع الصيانة
                      </th>
                      <th>
                          وصف دورة المياه
                      </th>
                      <th>
                          نوع الصيانة
                      </th>
                      <th>
                           المحـــافـظــة
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
                      	 <select class="form-control form-filter input-sm" id="drpRoommaintenance" name="drpRoommaintenance">
                            <option value="">اختر...</option>
                            <?php
							  foreach($elder_choice as $row)
							  {
                      			echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
							  }
							  ?>
                          </select>
                      </td>
                      <td>
                          <input type="text" class="form-control form-filter input-sm" id="txtRoommaintenancedet" name="txtRoommaintenancedet">
                      </td>
                      <td>
                         <select class="form-control form-filter input-sm" id="drpBathroomstatus" name="drpBathroomstatus">
                            <option value="">اختر...</option>
                            <?php
							  foreach($elder_bathroom as $row)
							  {
                      			echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
							  }
							  ?>
                          </select>
                      </td>
                      <td>
                          <input type="text" class="form-control form-filter input-sm" id="txtBathroommaintenancedet" name="txtBathroommaintenancedet">
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